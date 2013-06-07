// Follow the seed and Extend Hot trace until an End statement is reached
// or a Block is encountered that is already in the hottrace vector.
// while visiting each basic block check if the visited block has more than one predecessors

// After the Loop, Things produced are:
// ->>>Hot trace is Generated
// STACK::merge_blocks-  elements on the trace eligible for tail duplication and

        #define DEBUG_TYPE "letsee"
// Next Step: For Each element in the Stack One Tail Duplication is performed
// For each basic block, clone th basic block
// Set the predecessor and terminator of each blocks to complete the chain
// Lastly perform Operand Remapping before proceeding with the next block in the tail Stacks

#include "llvm/Pass.h"
#include "llvm/Function.h"
#include "llvm/Analysis/ProfileInfo.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Support/CFG.h"
#include "llvm/ADT/Statistic.h"
#include <stack>
using namespace llvm;

  STATISTIC(TailDuplicated,"No of Tail Duplication Instances");
  STATISTIC(BlocksDuplicated,"No of Total blocks duplicated");
namespace {

  class TailDuplication : public FunctionPass {
    public:

      static char ID; // Pass identification
      TailDuplication() : FunctionPass(ID) {}
      virtual void getAnalysisUsage(AnalysisUsage &AU) const  {
          //Might have to be changed
          AU.setPreservesAll();
          AU.addRequired<ProfileInfo>();
      }
      virtual bool runOnFunction(Function &f);
      void testTrace();
      void perfTailDupl(Function &f);
      void checkNumPredecessors(BasicBlock *);
      bool getNextBasicBlock(BasicBlock *);



    private:
        ProfileInfo *PI;
        BasicBlock* nxtBlck;
        std::vector<BasicBlock *> hot_trace;
        std::vector<BasicBlock *> merge_blocks;
        SmallVector<std::pair<const BasicBlock*,const BasicBlock*>,16 > BackEdges;

};


   bool TailDuplication :: runOnFunction (Function &F)
      {

        PI = &getAnalysis<ProfileInfo>();
        //Clear hottrace and merge_blocks
        hot_trace.clear();
        merge_blocks.clear();


        DEBUG(errs()<<"\n============================= Hot trace - Function : "<<  F.getName() <<" ===================================\n");
        DEBUG(errs()<<"BasicBlock \t       Execution Count                Predecessors\n");
        DEBUG(errs()<<"==============================================================================================");

        BasicBlock* bb=F.begin();//Setting the Seed.
        //Calculate the Loop Backedges and set them in BackEdges

        FindFunctionBackedges(F,BackEdges);

        while (true)//Come out of the Loop using break whenever a condition for termination is met and the hottrace is formed completely.
          {
            //Print out the name of the basic block, number of instructions, and the Execution count
            DEBUG(errs() << "\n==========Hot trace:" << bb->getName() << "---"<<(int)PI->getExecutionCount(bb)<<"--");
            for (pred_iterator PI = pred_begin(bb), E = pred_end(bb); PI != E; ++PI)
              {
                  //Traversing each predecessor
                  BasicBlock *Pred = *PI;
                  DEBUG(errs()<<" ;"<<Pred->getName());
              }
            //------------------
            //Check num predecessors.
            checkNumPredecessors(bb);
            //Next Basic Block in Hot trace.
            if (getNextBasicBlock(bb))
              {
                bb = nxtBlck;
               }
            else
              {
                DEBUG(errs()<<"\nProblem detected here");
                break;
              }
          }//while Loop

        //-------Testing Trace----------
        testTrace();
        //------------------------------

        //Code for Tail Duplication
        perfTailDupl(F);
        //-------------------------

        F.dump();
        return true;
      }

    void TailDuplication::testTrace()
      {
        //------------Hot Trace Formation complete ------
        DEBUG(errs()<<"\n---Hot trace ---\n");
        for ( int i = 0; i< (int)hot_trace.size(); i++)
        DEBUG(errs()<<">>  "<< hot_trace.at(i)->getName() << "  --");
        DEBUG(errs()<<"||");
        DEBUG(errs()<<"\n\n----------------");
        //-----
        }

    void TailDuplication::perfTailDupl(Function &F)
      {

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
                  BlocksDuplicated++;

                  //Second Loop Perform the ReMapping of Clonedinstructions
                  for (BasicBlock::iterator I = clonedBB->begin(); I != clonedBB->end(); ++I)
                    {
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
                              DEBUG(errs()<<"\n-----Cloned BB Predecessor Iterator Running:"<< BI->getName());
                              DEBUG(errs()<<"---Index in PHI Node:"<<PN->getBasicBlockIndex(BI));
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

/*                 for (pred_iterator PI = pred_begin(bbtoclone), E = pred_end(bbtoclone); PI != E; ++PI) //Traversing each predecessor
                    {
                      BasicBlock *BI=*PI;
                      DEBUG(errs()<<"\n Predecessor Iterator Running"<< BI->getName());
                    }
*/
                    //Call removepredecessor on the block to be cloned for each of the other predecessor
                   // This done so that the phi nodes in the block are updated
                        bbtoclone->removePredecessor(pred);

                       DEBUG(errs()<<"\n---`:Predecessor "<<pred->getName()<<" Removed from bbtoclone");
                        TerminatorInst *pred_term = pred->getTerminator();
                        DEBUG(errs()<<"\n-------Terminator Instruction Merge Predecessor blocks "<<*pred_term);
                        unsigned e = pred_term->getNumSuccessors();
                        for (pos = 0; pos<=e ; pos++)
                          {
                              DEBUG(errs()<<"\n----Operand ["<<pos<<"]"<<pred_term->getOperand(pos)->getName());
                              if (pred_term->getOperand(pos) == bbtoclone)
                                {
                                  DEBUG(errs()<<"\n----Terminator Operand Number : "<<pos);
                                  pred_term->setOperand(pos,clonedBB);
                                  break;
                                }
                          }

            //Left Include code to update the successors of the cloned block that are not in hot trace


                    }//While loop on merge_other_pred

    // Call Remove Predecessor on the new cloned block to remove the blocks that are present in hot_trace.
//By doing so, each the new and the old block will have unique predecessors and the problem of PHI nodes will also get solved

/*                  for (pred_iterator PI = pred_begin(clonedBB), E = pred_end(clonedBB); PI != E; ++PI) //Traversing each predecessor
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

*/

//Insert PHI nodes if the successor of the cloned block has more than one predecessor; modify if it already has a phi node in place
//Do this for each of teh successor of the Cloned block

   int i=0;
   DEBUG(errs()<<"\n--The total Number of successors for the cloned block are:" << (clonedBB->getTerminator()->getNumSuccessors()));
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
                         DEBUG(errs()<<"\n--------------------------------------------------------------------");
                         DEBUG(errs()<<"\n---> PHI Node Detected: "<< *I << "in Successor: "<<temp->getName());
                         DEBUG(errs()<<"\n--------------------------------------------------------------------");
                         //Code to insert those basic blocks that are not already present in the PHI CODE.
                         /// getNumIncomingValues - Return the number of incoming edges

                        for (int t=0;t< phi->getNumIncomingValues();t++)
                            {
                              DEBUG(errs()<<"\n####Incoming Value number:"<<*(phi->getIncomingValue(t)));
                            }
                           phi->addIncoming(phi->getIncomingValueForBlock(bbtoclone), clonedBB);

                         DEBUG(errs()<<"\n##########");
                         DEBUG(errs()<<"\n---> PHI Node After adding cloned block: "<< *I << "in Successor: "<<temp->getName());
                         DEBUG(errs()<<"\n--------------------------------------------------------------------");
                       }
                     else
                      {
                        // Code to Create new phi node and insert it in the beginneing of the code


        #define DEBUG_TYPE "letsee"
                        //
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

    void TailDuplication::checkNumPredecessors(BasicBlock * bb)// Check the number of Predecessors and if it is greater than one; return the pointer to the block. Set the Pointers in merge blocks.
      {
            // If Entry Block -- No Predecessor
            if (pred_begin(bb)==pred_end(bb))
              {
                  hot_trace.push_back(bb);
                  DEBUG(errs()<<"\n------- Entry Basic Block");
              }
            else if (bb->getSinglePredecessor() != NULL) // If it has single predecessor
              {
                  hot_trace.push_back(bb);
                  DEBUG(errs()<<"\n-- Only one Predecessor");
                  return;
              }
            else //More than one Predecessors -- Merge Block detected -- But check if the number of predecessors after back edges is greater than one
              {
                  DEBUG(errs()<<"\n--More than one Predecessors for "<< bb->getName());
                  int uniquePredecessor=0;
                  //Traverse each predecessors and calculate unique Predecessors by matching them with back edges
                  DEBUG(errs()<<"\n]]]]]]]]]] Predecessors :");
                  BasicBlock *temp;
                  for (pred_iterator pi = pred_begin(bb), e = pred_end(bb); pi != e; ++pi) //traversing each predecessor
                     {

                          uniquePredecessor++;
                          temp = *pi;
                          //Compare each predecessor with back edge
                          //SmallVector<std::pair<const BasicBlock*,const BasicBlock*>,32 > BackEdges;
                          for (unsigned i=0; i<BackEdges.size(); i++)
                            {

                              if (BackEdges[i].second == bb) // Check "to" block == merge block
                                {
                                  if (BackEdges[i].first == temp) // Check "from" condition == predecessor block
                                     {
                                        uniquePredecessor--;
                                        DEBUG(errs()<<"\n****Back Edges from:"<< BackEdges[i].first->getName()<<"\tto:"<<BackEdges[i].second->getName());
                                     }
                                }
                            }

                      }

                    if(uniquePredecessor > 1)
                      {
                          hot_trace.push_back(bb);
                          merge_blocks.push_back(bb);
                          TailDuplicated++;
                      }
                    else
                      {
                          DEBUG(errs()<<"\nThis is not a merge block");
                      }

              }//else more than one predecessor
      }//checkNumPredecessors function definition

    bool  TailDuplication::getNextBasicBlock(BasicBlock * bb) // Returns the next basic block from the numerous successors based on the number of executions
      {

                DEBUG(errs()<<"\nNext Basic Block:"<<bb->getName());
            int maxexecution=0;
            //Check if it has any successor or not:
            if((bb->getTerminator()->getNumSuccessors())==0)
              return false;

            for (succ_iterator SI = succ_begin(bb), E = succ_end(bb); SI != E; ++SI) //find the One from many successor for hot trace.
              {
                BasicBlock *temp= *SI;
                 if((int)PI->getExecutionCount(temp) > maxexecution)
                 {
                    maxexecution = (int)PI->getExecutionCount(temp);
                    nxtBlck = temp;
                    DEBUG(errs()<<"\nMax Execution count"<<maxexecution << "Basic Blck: \t \t" <<nxtBlck->getName());
                 }
              }

              //Check if the block is revisited block
//ERROR PRONE
             if (std::find(hot_trace.begin(), hot_trace.end(),nxtBlck)==hot_trace.end())
               {
                  DEBUG(errs()<<"\n--Node Selected is :");
                  return true;
               }
             else
               {
                 DEBUG(errs()<<">----->>>>>>>>>>>Block Revisited\n---------------------------------------------------------------");
                 return false;//Trace complete.
               }
      }

char TailDuplication::ID = 0;
static RegisterPass<TailDuplication> X("HKtaildupl","------Performs Tail Duplication for Super Block Scheduling ",false,false);
}
