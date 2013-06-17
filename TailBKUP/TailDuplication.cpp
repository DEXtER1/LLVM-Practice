#define DEBUG_TYPE "HK"

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
#include "llvm/Analysis/ProfileInfo.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Support/CFG.h"
#include "llvm/ADT/Statistic.h"
#include <stack>
using namespace llvm;

  STATISTIC(FUNCTIONCOUNT,"Number of Functions");
  STATISTIC(MERGEBLOCKCOUNT,"Total No of Merge Blocks in Hot trace(includes all functions)");
  STATISTIC(HOTTRACEBLOCKCOUNT,"Total No of Blocks in Hot trace(includes all functions)");
namespace {

  class TailDuplication : public ModulePass {
    public:

      static char ID; // Pass identification
      TailDuplication() : ModulePass(ID) {}
      virtual bool runOnModule(Module &M);
//    void perfTailDupl(Function &f);
      void printAnalysis();

    private:
        ProfileInfo *PI;
        BasicBlock* NextBlock;
        std::vector<BasicBlock *> HotTrace;
        std::vector<BasicBlock *> MergeBlocks;
        SmallVector<std::pair<const BasicBlock*,const BasicBlock*>,16 > BackEdges;
        int HotTraceCounter, MergeCounter;

        std::vector<std::pair<Function*, int> > HotTraceLink;
        std::vector<std::pair<Function *, int> > MergeBlockLink;
};


  bool TailDuplication :: runOnModule(Module &M)
    {
      //Code to set the Hot trace pointer for the Function ; MergeBlocks ; Function
        printAnalysis();
        HOTTRACEBLOCKCOUNT = -1;
        MERGEBLOCKCOUNT = -1;
      for (Module::iterator i = M.begin(), e = M.end(); i!=e; ++i )
        {
         if(i->isDeclaration())
         DEBUG(errs()<<"\nFunction Name: "<<i->getName());
          continue;
         //Clear hottrace and merge_blocks
         //hot_trace.clear();
         //merge_blocks.clear();
         //Copy the Hot trace and Merge Blocks for the function in the vectors

         //Call PerfTailDuplication


        //Code for Tail Duplication
        //perfTailDupl(F);
        //-------------------------
        }
        //-F.dump();
        return false;
      }

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

char TailDuplication::ID = 0;
static RegisterPass<TailDuplication> X("taildupl","--Performs Tail Duplication",false,false);
}




/*    void TailDuplication::perfTailDupl(Function &F)
      //{

        // Traverse every Basic blocks present in the merge block and call clone functions on it
        DEBUG(errs()<<"\n---Merge Blocks ---\n");
        std::stack<BasicBlock*> merge_other_pred;
        std::stack<BasicBlock*> merge_hottrace_pred;
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

//Insert PHI nodes if the successor of the cloned block has more than one predecessor; modify if it already has a phi node in place
//Do this for each of teh successor of the Cloned block

   int i=0;
//   DEBUG(errs()<<"\n--The total Number of successors for the cloned block are:" << (clonedBB->getTerminator()->getNumSuccessors()));
      for (succ_iterator SI = succ_begin(clonedBB), E = succ_end(clonedBB); SI != E; ++SI) //find the One from many successor for hot trace.
              {
                BasicBlock *temp= *SI;
                ++i;
                //For each successor check the number of predecessor
                  int j=0;
                  for (BasicBlock::iterator I = temp->begin(); I !=temp->end(); ++I)
                     {
                     if (isa<PHINode>(I))
                       {
                         //Update PHI Node for BBClone.
                         PHINode *phi = cast<PHINode>(I);
//                         DEBUG(errs()<<"\n--------------------------------------------------------------------");
                         DEBUG(errs()<<"\n---> PHI Node Detected: "<< *I << "in Successor: "<<temp->getName());
//                         DEBUG(errs()<<"\n--------------------------------------------------------------------");
                         //Code to insert those basic blocks that are not already present in the PHI CODE.
                         /// getNumIncomingValues - Return the number of incoming edges
                         for (int t=0;t< phi->getNumIncomingValues();t++)
                            {
                              DEBUG(errs()<<"\nIncoming Value :"<<*(phi->getIncomingValue(t))<<"+++++++"<<*(phi->getIncomingValueForBlock(bbtoclone)));
                            }
                         Value *value1=phi->getIncomingValueForBlock(bbtoclone);
                         Value *value2=VMap[value1];
                         DEBUG(errs()<<"\n\nCloned block Value"<<value2);
                         if(value2!=0)
                            phi->addIncoming(value2, clonedBB);
                         else
                            phi->addIncoming(value1, clonedBB);
                         for (int t=0; t<phi->getNumIncomingValues(); t++)
                            {
                              DEBUG(errs()<<"\nIncoming Value number:"<<*(phi->getIncomingValue(t)));
                            }

                         DEBUG(errs()<<"\n---> PHI Node After adding cloned block: "<< *I << "in Successor: "<<temp->getName());

                       }
                     else
                      {
                        // Code to Create new phi node and insert it in the beginneing of the code
//                        DEBUG(errs()<<"Create new phi node and insert it in the beginning of the code");
                        //Under Construction
                        PHInode++;
                        continue;
                      }
                     }
                  for (pred_iterator pi = pred_begin(temp), e = pred_end(temp); pi != e; ++pi) //traversing each predecessor
                     {
                        BasicBlock *BB = *pi;
                        DEBUG(errs()<<"\n---> Successor No: "<< i <<"  "<< temp->getName() <<"-- Predecessor No:("<< ++j <<"): "<< BB->getName());
                     }

               }
          }//For Loop for all merge blocks in the vector
        DEBUG(errs()<<"\n----------------\n");

     }//Perform Tail Duplication function
*/
