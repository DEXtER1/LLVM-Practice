#define DEBUG_TYPE "ProgAnalysis"
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
#include "ProgramAnalysis.h"
using namespace llvm;

  STATISTIC(FUNCTIONCOUNT,"Number of Functions");
  STATISTIC(MERGEBLOCKCOUNT,"Total No of Merge Blocks in Hot trace(includes all functions)");
  STATISTIC(HOTTRACEBLOCKCOUNT,"Total No of Blocks in Hot trace(includes all functions)");
namespace liberty {

  bool ProgramAnalysis :: runOnModule(Module &M)
    {
        PI = &getAnalysis<ProfileInfo>();
      //Code to set the Hot trace pointer for the Function ; MergeBlocks ; Function
        HOTTRACEBLOCKCOUNT = -1;
        MERGEBLOCKCOUNT = -1;
      for (Module::iterator i = M.begin(), e = M.end(); i!=e; ++i )
        {
         if(i->isDeclaration())
          continue;
         AnalyseFunction(*i);
         FUNCTIONCOUNT++;

         HOTTRACEBLOCKCOUNT += HotTraceCounter;
         HotTraceLink.push_back(std::make_pair(i, HOTTRACEBLOCKCOUNT));
         MERGEBLOCKCOUNT += MergeCounter;
         MergeBlockLink.push_back(std::make_pair(i, MERGEBLOCKCOUNT));

        }

        for(int i=0; i<HotTraceLink.size();i++)
          DEBUG(errs()<<"\n-Numbers"<<HotTraceLink.at(i).second);
        for(int i=0; i<MergeBlockLink.size();i++)
          DEBUG(errs()<<"\n+Merge Numbers"<<MergeBlockLink.at(i).second);
        printAnalysis();
      //Code to set the Hot trace pointer for the Function ; MergeBlocks ; Function End Pointers
      return false;
    }



   bool ProgramAnalysis :: AnalyseFunction(Function &F)
      {

        //Clear hottrace and merge_blocks

        HotTraceCounter = 0;
        MergeCounter = 0;
        DEBUG(errs()<<"\n==== Hot trace - Function : "<<  F.getName() <<" ====\n");
        DEBUG(errs()<<"BasicBlock \t    Execution Count        Predecessors\n");
        DEBUG(errs()<<"=========================================================");

        BasicBlock* bb=F.begin();

        //Calculate the Loop Backedges and set them in BackEdges
        FindFunctionBackedges(F,BackEdges);

        while (true)//Form the Hot trace.
          {
            DEBUG(errs() << "\n==========Hot trace:" << bb->getName() << "---"<<(int)PI->getExecutionCount(bb)<<"--");
            for (pred_iterator PI = pred_begin(bb), E = pred_end(bb); PI != E; ++PI)
              {
                  BasicBlock *Pred = *PI;
                  DEBUG(errs()<<" ;"<<Pred->getName());
              }
            checkNumPredecessors(bb);
            if (getNextBasicBlock(bb))
              {
                bb = NextBlock;
              }
            else
              {
                break;
              }
          }//while Loop

        //------- print Trace----------
        //testTrace();
        //------------------------------

        //F.dump();
        return true;
      }

    void ProgramAnalysis::checkNumPredecessors(BasicBlock * bb)
      {

        // Check the number of Predecessors and if it is greater than one
        // return the pointer to the block. Set the Pointers in merge blocks.
        // If Entry Block -- No Predecessor
        if (pred_begin(bb)==pred_end(bb))
          {
            HotTrace.push_back(bb);
            HotTraceCounter++;
            DEBUG(errs()<<"\nEntry Basic Block");
            return;
          }
        else if (bb->getSinglePredecessor() != NULL) // If it has single predecessor
          {
            HotTrace.push_back(bb);
            HotTraceCounter++;
            DEBUG(errs()<<"\nOnly one Predecessor");
            return;
          }
        else //More than one Predecessors -- Merge Block detected -- But check if the number of predecessors after back edges is greater than one
          {
            DEBUG(errs()<<"\nMore than one Predecessors for "<< bb->getName());
            int uniquePredecessor=0;
            //Traverse each predecessors and calculate unique Predecessors by matching them with back edges
            DEBUG(errs()<<"\nPredecessors :");
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
                            DEBUG(errs()<<"\nBack Edge detected from:"<< BackEdges[i].first->getName()<<"\tto:"<<BackEdges[i].second->getName());
                          }
                      }
                  }
               } //For Loop Pred iterator
            if (uniquePredecessor > 1)
              {
                HotTrace.push_back(bb);
                HotTraceCounter++;
                MergeBlocks.push_back(bb);
                MergeCounter++;

            DEBUG(errs()<<"\n\n-ALL-Merge Blocks--\n");
            DEBUG(errs()<<"-->"<<bb->getName());
              }
            else if(uniquePredecessor == 1)
              {
                DEBUG(errs()<<"\nThis is not a merge block");
                HotTrace.push_back(bb);
                HotTraceCounter++;
              }
            else//Zero unique predecessor
              {
                DEBUG(errs()<<"\n--Loop Finish for check numPredecessor");
              }

           }//else more than one predecessor
        }//checkNumPredecessors function definition

    bool ProgramAnalysis::getNextBasicBlock(BasicBlock *bb) // Returns the next basic block from the numerous successors based on the number of executions
      {
        DEBUG(errs()<<"\nSearching next Basic Block for -"<<bb->getName());
        int maxexecution=0;
        //Check if it has any successor or not:
        if ((bb->getTerminator()->getNumSuccessors())==0)
          return false;
        DEBUG(errs() << "Has more than one successor\n");
        for (succ_iterator SI = succ_begin(bb), E = succ_end(bb); SI != E; ++SI) //find the One from many successor for hot trace.
          {
            BasicBlock *temp= *SI;
            const double wt = PI->getEdgeWeight( std::make_pair(bb,temp) );
            int ec = (int)PI->getExecutionCount(temp);
            DEBUG(errs() << "\nSucc " << bb->getName() << " -> " << temp->getName() << " execution count :" << ec << '\n');

            DEBUG_WITH_TYPE("counts",errs()<<"\n\nExecution Count:"<< ec <<"Edge Weight"<<wt);
            if (ec > maxexecution)
              {
                //maxexecution = (int)PI->getEdgeWeight( std::make_pair(bb,temp) );
                maxexecution = ec;
                NextBlock = temp;
              }
           }
         if (maxexecution == 0)
           {
             DEBUG(errs()<<"\n---No Hot trace");
             return false;
           }
         // DEBUG(errs()<<"\nMax Execution count  "<<maxexecution << "  Basic Blck: \t \t" <<NextBlock->getName());
         //Check if the block is revisited block
         if (std::find(HotTrace.begin(), HotTrace.end(),NextBlock)==HotTrace.end())
           {
             DEBUG(errs()<<"\nNode Selected is :" << NextBlock->getName());
             return true;
           }
         else
           {
             DEBUG(errs()<<"\n-----------Block Revisited-----------");
             return false;//Trace complete.
           }
       }

    void ProgramAnalysis::testTrace()
      {
        //------------Hot Trace Formation complete ------
        DEBUG(errs()<<"\n---Hot trace ---\n");
        for ( int i = 0; i< (int)HotTrace.size(); i++)
          {
            DEBUG(errs()<<">>  "<< HotTrace.at(i)->getName() << "  --");
          }
        DEBUG(errs()<<"||");
        DEBUG(errs()<<"\n\n----------------");
        //-----
      }

    void ProgramAnalysis::printAnalysis()
      {
        DEBUG(errs()<<"\n---Program Analysis---\n");
        int bstart = 0, bend = 0, mstart = 0, mend = 0;
        DEBUG(errs()<<"\n+++Total number of Functions"<< (int)HotTraceLink.size());
        DEBUG(errs()<<"\n+++Total number of Functions"<< (int)MergeBlockLink.size());

        for ( int i = 0; i< (int)HotTraceLink.size(); i++)
          {
           DEBUG(errs()<<"\nFunction:"<< (HotTraceLink.at(i).first)->getName() << "--"<<i);
        DEBUG(errs()<<"\n+++Total number of Functions"<< (int)HotTraceLink.size());

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
 int ProgramAnalysis::getFuncNumber(Function *F)
  {
     int i;
     for(i=0;i<(int)HotTraceLink.size();i++)
      {
        if(HotTraceLink.at(i).first->getName() == F->getName() )
          break;
      }

      if(i!=(int) HotTraceLink.size())
      DEBUG(errs()<<"\n\nFunction is at "<< i<<"th Position");
      else
      DEBUG(errs()<<"\n\n------------Function unable to detect");
      return i;
  }

std::vector<BasicBlock *> ProgramAnalysis::getHotTrace(int end)
 {
    std::vector<BasicBlock *> hottrace;
//    int end=getFuncNumber(F);//Just returns the function number

//    if(HotTraceLink.at(end).second == -1)//IF -1 then no HotTrace at all
//      return hottrace;
//    else
//      {
      int hotend = HotTraceLink.at(end).second;
      DEBUG(errs()<<"\nHotend Value" <<hotend);
        if(hotend == 0)//Boundary case - Only one element in the hottrace
          {
            hottrace.push_back(HotTrace.at(hotend));
            DEBUG(errs()<<"\n---Hottrace--");
            int counter = hottrace.size();
            while(--counter != -1)
              DEBUG(errs()<<"==>"<<hottrace.at(counter)->getName());
            return hottrace;
          }

      int start = end-1;
      int hotstart = HotTraceLink.at(start).second;
      while (hotstart == -1)
          hotstart = HotTraceLink.at(--start).second;

      hotstart++;
      for(;hotstart<=hotend;hotstart++)
        hottrace.push_back(HotTrace.at(hotstart));

      DEBUG(errs()<<"\n---Hottrace--\n");
      int counter = 0;
      while(counter<hottrace.size())
        DEBUG(errs()<<"==>"<<hottrace.at(counter++)->getName());

      return hottrace;
  }

std::vector<BasicBlock *> ProgramAnalysis::getMergeBlock(int end)
 {
    std::vector<BasicBlock *> mergeblocks;
//    int end=getFuncNumber(F);//Just returns the function number
    int mergeend = MergeBlockLink.at(end).second;
    if(mergeend == -1)
      return mergeblocks;
    int mergestart = MergeBlockLink.at(end-1).second;
    if(mergeend == mergestart)
      return mergeblocks;
    else
      {
      mergestart++;
      for(;mergestart<=mergeend;mergestart++)
        mergeblocks.push_back(MergeBlocks.at(mergestart));

      DEBUG(errs()<<"\n\n---Merge Blocks--\n");
      int counter=0;
      while(counter < mergeblocks.size())
        DEBUG(errs()<<"==>"<<mergeblocks.at(counter++)->getName());

      return mergeblocks;
      }
  }

char ProgramAnalysis::ID = 0;
static RegisterPass<ProgramAnalysis> X("analysis","--Identify Merge Blocks and Hot trace for Tail Duplciation ",false,false);
}

