#define DEBUG_TYPE "TailDupl"
// Follow the seed and Extend Hot trace until an End statement is reached
// or a Block is encountered that is already in the hottrace vector.
// while visiting each basic block check if the visited block has more than one predecessors

// After the Loop, Things produced are:
// ->>>Hot trace is Generated
// STACK::merge_blocks-  elements on the trace eligible for tail duplication and

// Next Step: For Each element in the Stack One Tail Duplication is performed
// For each basic block, clone th basic block
// Set the predecessor and terminator of each blocks to complete the chain
// Lastly perform Operand Remapping before proceeding with the next block in the tail Stacks

#include "llvm/Pass.h"
#include "llvm/Module.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/Support/CFG.h"
#include "llvm/ADT/Statistic.h"
#include <stack>
#include "ProgramAnalysis.h"

using namespace llvm;

namespace  liberty {

  class TailDuplication : public ModulePass {
    public:

      static char ID; // Pass identification
      TailDuplication() : ModulePass(ID) {}
      virtual bool runOnModule(Module &M);
      void perfTailDupl(Function *f);
      void printAnalysis();
      virtual void getAnalysisUsage(AnalysisUsage &AU) const  {
//          AU.addRequiredID(DemoteRegisterToMemoryID);
          AU.addRequired<ProgramAnalysis>();
      }

    private:
        ProfileInfo *PI;
        ProgramAnalysis *PA;
        BasicBlock* NextBlock;
        SmallVector<std::pair<const BasicBlock*,const BasicBlock*>,16 > BackEdges;
        int HotTraceCounter, MergeCounter;

        std::vector<std::pair<Function*, int> > HotTraceLink;
        std::vector<std::pair<Function *, int> > MergeBlockLink;
};


  bool TailDuplication :: runOnModule(Module &M)
    {
      //Code to set the Hot trace pointer for the Function ; MergeBlocks ; Function
        //printAnalysis();
        PA = &getAnalysis<ProgramAnalysis>();
        for (Module::iterator i = M.begin(), e = M.end(); i!=e; ++i )
        {
         if(i->isDeclaration())
          continue;
          //Code for Tail Duplication

         DEBUG(errs()<<"\n\n\n-Function Name: "<<((Function *)i)->getName());
          perfTailDupl((Function *)i);
        //-------------------------
        }
        //-F.dump();
        return false;
      }




void TailDuplication::perfTailDupl(Function *F)
  {
        std::vector<BasicBlock *> hot_trace;
        std::vector<BasicBlock *> merge_blocks;
        std::stack<BasicBlock*> merge_other_pred;
        std::stack<BasicBlock*> merge_hottrace_pred;

        //Copy the Hot trace and Merge Blocks for the function in the vectors

        int funcNumber = PA->getFuncNumber(F);

         hot_trace = PA->getHotTrace(funcNumber);
         merge_blocks = PA->getMergeBlock(funcNumber);

        if(hot_trace.size() == 0)
          {
            DEBUG(errs()<<"\n---No Hot Trace and Merge Blocks");
            return;
          }

         if(merge_blocks.size() == 0)
           {
             DEBUG(errs()<<"\n----No Merge Blocks Detected for the Function");
             return;
           }

        // Traverse every Basic blocks present in the merge block and call clone functions on it
        DEBUG(errs()<<"\n---Merge Blocks ---\n");
        for ( int i = 0; i<(int)merge_blocks.size(); i++)
          {
             DEBUG(errs()<<"\n---------->>Merge Block Count:  "<<i<<"Block Name:"<< merge_blocks.at(i)->getName());
                  BasicBlock *bbtoclone = merge_blocks.at(i);

                  //Detect if the block is a landing pad. If so it should be ignored for tail duplication
                  if(bbtoclone->isLandingPad())
                  {
                    DEBUG(errs()<<"\nBasic Block :"<<bbtoclone->getName()<<"Skipped as it is a Landing Pad");
                    continue;
                  }

                  for (pred_iterator PI = pred_begin(bbtoclone), E = pred_end(bbtoclone); PI != E; ++PI) //Traversing each predecessor
                    {
                      BasicBlock *temp = *PI;
                      //If the blocks are in hot trace do not push them in stack
                      if (std::find(hot_trace.begin(), hot_trace.end(),temp)==hot_trace.end())
                        merge_other_pred.push (temp);      //Storing corresponding parents of the basic block
                      else
                        merge_hottrace_pred.push(temp);
                    }

                  DEBUG(errs()<<"\nBasic Blocks for Tail Duplication "<<bbtoclone->getName());
                  ValueToValueMapTy VMap;
                  BasicBlock* clonedBB = CloneBasicBlock(bbtoclone, VMap, ".clone",*(&F));

                  //Second Loop Perform the ReMapping of Clonedinstructions
                  for (BasicBlock::iterator I = clonedBB->begin(); I != clonedBB->end(); ++I)
                    {
//                       RemapInstruction(I,VMap);


                      if (isa<PHINode>(I))
                        {
                          //Update PHI Node for BBClone
                          PHINode *PN = cast<PHINode>(I);
                          DEBUG(errs()<<"\n PHI Node Detected: "<< *I);
                          if ( PN->getBasicBlockIndex(merge_hottrace_pred.top()) != -1 )
                            {
                              PN->removeIncomingValue(merge_hottrace_pred.top());
                            }
                          DEBUG(errs()<<"\n PHI Node After changes: "<< *I);

                          //Insert the blocks that are predecessors based on Vmap value I think
                          for (pred_iterator PI = pred_begin(clonedBB), E = pred_end(clonedBB); PI != E; ++PI) //Traversing each predecessor
                            {
                              BasicBlock *BI=*PI;
                              DEBUG(errs()<<"\nCloned BB Predecessor Iterator Running:"<< BI->getName());
                              DEBUG(errs()<<"Index in PHI Node:"<<PN->getBasicBlockIndex(BI));
                            }
                        }
                      else
                        {
                          //Loop over all the operands of the instruction
                          for (unsigned op=0, E = I->getNumOperands(); op != E; ++op)
                          {
                            const Value *Op = I->getOperand(op);
                            //Get it out of the value map
                            Value *V = VMap[Op];
                            //DEBUG(errs()<<"\n\tOld Value:"<<*Op<<"New Value:"<<*V);
                            //If not in the value map, then its outside our trace so ignore
                            if(V != 0)
                              I->setOperand(op,V);
                          }
                        }
                    }//For Loop Basic Block iterator


                  // Replace the Operand in the terminator instruction of each predecessor block apart form the ones in
                  // hot trace so that the block points to the new cloned block. The way to do this is to traverse the terminator
                  // instruction and check which operands matches this

                  while(merge_other_pred.size()!=0)
                    {
                        BasicBlock *pred = merge_other_pred.top();
                        merge_other_pred.pop();
                        unsigned pos;

                   //Call removepredecessor on the block to be cloned for each of the other predecessor
                   // This done so that the phi nodes in the block are updated
                        bbtoclone->removePredecessor(pred);

                        DEBUG(errs()<<"\nPredecessor "<<pred->getName()<<" Removed from bbtoclone");
                        TerminatorInst *pred_term = pred->getTerminator();
                        DEBUG(errs()<<"\nTerminator Instruction Merge Predecessor blocks "<<*pred_term);
                        unsigned e = pred_term->getNumSuccessors();
                        for (pos = 0; pos<=e ; pos++)
                          {
                              DEBUG(errs()<<"\nOperand ["<<pos<<"]"<<pred_term->getOperand(pos)->getName());
                              if (pred_term->getOperand(pos) == bbtoclone)
                                {
                                  DEBUG(errs()<<"\nTerminator Operand Number : "<<pos);
                                  pred_term->setOperand(pos,clonedBB);
                                  break;
                                }
                          }

            //Left Include code to update the successors of the cloned block that are not in hot trace


                    }//While loop on merge_other_pred

// Call Remove Predecessor on the new cloned block to remove the blocks that are present in hot_trace.
//By doing so, each the new and the old block will have unique predecessors and the problem of PHI nodes will also get solved

                  for (pred_iterator PI = pred_begin(clonedBB), E = pred_end(clonedBB); PI != E; ++PI) //Traversing each predecessor
                    {
                      BasicBlock *BI=*PI;
                     DEBUG(errs()<<"\n Cloned BB: Predecessor Iterator Running"<< BI->getName());
                    }


                  for (pred_iterator PI = pred_begin(bbtoclone), E = pred_end(bbtoclone); PI != E; ++PI) //Traversing each predecessor
                    {
                      BasicBlock *BI=*PI;
                     DEBUG(errs()<<"\n bbtoclone: Predecessor Iterator Running"<< BI->getName());
                    }

          while(merge_hottrace_pred.size()!=0)
          {
            DEBUG(errs()<<"\n##@#@#$@#$");

                     DEBUG(errs()<<"Predecessor "<<merge_hottrace_pred.top()->getName()<<" Attempting Removal");
            clonedBB->removePredecessor(merge_hottrace_pred.top());
            merge_hottrace_pred.pop();
          }


          }//For Loop for all merge blocks in the vector
        DEBUG(errs()<<"\n----------------\n");

     }//Perform Tail Duplication function


char TailDuplication::ID = 0;
static RegisterPass<TailDuplication> X("taildupl","--Performs Tail Duplication",false,false);
}




/*    void TailDuplication::perfTailDupl(Function &F)
      //{

        std::vector<BasicBlock *> hot_trace;
        std::vector<BasicBlock *> merge_blocks;
        std::stack<BasicBlock*> merge_other_pred;
        std::stack<BasicBlock*> merge_hottrace_pred;

        //Copy the Hot trace and Merge Blocks for the function in the vectors
         hot_trace = PA->getHotTrace(F);
         merge_blocks = PA->getMergeBlock(F);

        if(hot_trace.size() == 0)
          {
            DEBUG(errs()<<"\n\n\n---No Hot Trace and Merge Blocks");
            return;
          }

         if(merge_blocks.size() == 0)
           {
             DEBUG(errs()<<"\n-----No Merge Blocks Detected for the Function");
             return;
           }

        // Traverse every Basic blocks present in the merge block and call clone functions on it
        DEBUG(errs()<<"\n---Merge Blocks ---\n");
        for ( int i = 0; i<(int)merge_blocks.size(); i++)
          {
             DEBUG(errs()<<"\n---------->>Merge Block Count:  "<<i<<"Block Name:"<< merge_blocks.at(i)->getName());
                  BasicBlock *bbtoclone = merge_blocks.at(i);

                  //Detect if the block is a landing pad. If so it should be ignored for tail duplication
                  if(bbtoclone->isLandingPad())
                  {
                    DEBUG(errs()<<"\nBasic Block :"<<bbtoclone->getName()<<"Skipped as it is a Landing Pad");
                    continue;
                  }

                  for (pred_iterator PI = pred_begin(bbtoclone), E = pred_end(bbtoclone); PI != E; ++PI) //Traversing each predecessor
                    {
                      BasicBlock *temp = *PI;
                      //If the blocks are in hot trace do not push them in stack
                      if (std::find(hot_trace.begin(), hot_trace.end(),temp)==hot_trace.end())
                        merge_other_pred.push (temp);      //Storing corresponding parents of the basic block
                      else
                        merge_hottrace_pred.push(temp);
                    }

                  DEBUG(errs()<<"\nBasic Blocks for Tail Duplication "<<bbtoclone->getName());
                  ValueToValueMapTy VMap;
                  BasicBlock* clonedBB = CloneBasicBlock(bbtoclone, VMap, ".clone",&F);

                  //Second Loop Perform the ReMapping of Clonedinstructions
                  for (BasicBlock::iterator I = clonedBB->begin(); I != clonedBB->end(); ++I)
                    {
//                       RemapInstruction(I,VMap);


                      if (isa<PHINode>(I))
                        {
                          //Update PHI Node for BBClone
                          PHINode *PN = cast<PHINode>(I);
                          DEBUG(errs()<<"\n PHI Node Detected: "<< *I);
                          if ( PN->getBasicBlockIndex(merge_hottrace_pred.top()) != -1 )
                            {
                              PN->removeIncomingValue(merge_hottrace_pred.top());
                            }
                          DEBUG(errs()<<"\n PHI Node After changes: "<< *I);

                          //Insert the blocks that are predecessors based on Vmap value I think
                          for (pred_iterator PI = pred_begin(clonedBB), E = pred_end(clonedBB); PI != E; ++PI) //Traversing each predecessor
                            {
                              BasicBlock *BI=*PI;
                              DEBUG(errs()<<"\nCloned BB Predecessor Iterator Running:"<< BI->getName());
                              DEBUG(errs()<<"Index in PHI Node:"<<PN->getBasicBlockIndex(BI));
                            }
                        }
                      else
                        {
                          //Loop over all the operands of the instruction
                          for (unsigned op=0, E = I->getNumOperands(); op != E; ++op)
                          {
                            const Value *Op = I->getOperand(op);
                            //Get it out of the value map
                            Value *V = VMap[Op];
                            //DEBUG(errs()<<"\n\tOld Value:"<<*Op<<"New Value:"<<*V);
                            //If not in the value map, then its outside our trace so ignore
                            if(V != 0)
                              I->setOperand(op,V);
                          }
                        }
                    }//For Loop Basic Block iterator


                  // Replace the Operand in the terminator instruction of each predecessor block apart form the ones in
                  // hot trace so that the block points to the new cloned block. The way to do this is to traverse the terminator
                  // instruction and check which operands matches this

                  while(merge_other_pred.size()!=0)
                    {
                        BasicBlock *pred = merge_other_pred.top();
                        merge_other_pred.pop();
                        unsigned pos;

                   //Call removepredecessor on the block to be cloned for each of the other predecessor
                   // This done so that the phi nodes in the block are updated
                        bbtoclone->removePredecessor(pred);

                        DEBUG(errs()<<"\nPredecessor "<<pred->getName()<<" Removed from bbtoclone");
                        TerminatorInst *pred_term = pred->getTerminator();
                        DEBUG(errs()<<"\nTerminator Instruction Merge Predecessor blocks "<<*pred_term);
                        unsigned e = pred_term->getNumSuccessors();
                        for (pos = 0; pos<=e ; pos++)
                          {
                              DEBUG(errs()<<"\nOperand ["<<pos<<"]"<<pred_term->getOperand(pos)->getName());
                              if (pred_term->getOperand(pos) == bbtoclone)
                                {
                                  DEBUG(errs()<<"\nTerminator Operand Number : "<<pos);
                                  pred_term->setOperand(pos,clonedBB);
                                  break;
                                }
                          }

            //Left Include code to update the successors of the cloned block that are not in hot trace


                    }//While loop on merge_other_pred

// Call Remove Predecessor on the new cloned block to remove the blocks that are present in hot_trace.
//By doing so, each the new and the old block will have unique predecessors and the problem of PHI nodes will also get solved

                  for (pred_iterator PI = pred_begin(clonedBB), E = pred_end(clonedBB); PI != E; ++PI) //Traversing each predecessor
                    {
                      BasicBlock *BI=*PI;
                     DEBUG(errs()<<"\n Cloned BB: Predecessor Iterator Running"<< BI->getName());
                    }


                  for (pred_iterator PI = pred_begin(bbtoclone), E = pred_end(bbtoclone); PI != E; ++PI) //Traversing each predecessor
                    {
                      BasicBlock *BI=*PI;
                     DEBUG(errs()<<"\n bbtoclone: Predecessor Iterator Running"<< BI->getName());
                    }

          while(merge_hottrace_pred.size()!=0)
          {
            DEBUG(errs()<<"\n##@#@#$@#$");

                     DEBUG(errs()<<"Predecessor "<<merge_hottrace_pred.top()->getName()<<" Attempting Removal");
            clonedBB->removePredecessor(merge_hottrace_pred.top());
            merge_hottrace_pred.pop();
          }

Close multiple lines here

          }//For Loop for all merge blocks in the vector
        DEBUG(errs()<<"\n----------------\n");

     }//Perform Tail Duplication function
*/



/*
    void TailDuplication::printAnalysis()
      {
        DEBUG(errs()<<"\n-TTT Tail Duplication--Program Analysis---\n");
        int bstart = 0, bend = 0, mstart = 0, mend = 0;

        for ( int i = 0; i< (int)HotTraceLink.size(); i++)
          {
           DEBUG(errs()<<"\nFunction:"<< (HotTraceLink.at(i).first)->getName() << "--");

           //Print Hottrace
          if (HotTraceLink.at(i).second == -1 )
             {
              DEBUG(errs()<<"\n--No Hot Trace--");

              DEBUG(errs()<<"\n\n--No Merge Blocks--\n");
              continue;
             }

          DEBUG(errs()<<"\n--Hot Trace--\n");
          for(bend=HotTraceLink.at(i).second; bstart <= bend; bstart++)
              DEBUG(errs()<<"-->"<<HotTrace.at(bstart)->getName());
//          bstart=bend;

          if (MergeBlockLink.at(i).second == -1)
             {
              DEBUG(errs()<<"\n\n-----No Merge Blocks--\n");
              continue;
             }
            //Print MergeBlocks
            DEBUG(errs()<<"\n\n--Merge Blocks--\n");
            for(mend=MergeBlockLink.at(i).second; mstart <= mend; mstart++)
              DEBUG(errs()<<"-->"<<MergeBlocks.at(mstart)->getName());
//            mstart=mend;

          }
        DEBUG(errs()<<"\n\n----------------");

      }
*/
