
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
#include "llvm/Function.h"
#include "llvm/Analysis/ProfileInfo.h"
#include "llvm/Analysis/AliasAnalysis.h"
#include "llvm/Transforms/Utils/Cloning.h"
#include "llvm/Transforms/Utils/BasicBlockUtils.h"
#include "llvm/Support/CFG.h"
#include "llvm/ADT/Statistic.h"
#include <stack>
using namespace llvm;

namespace liberty {

  class ProgramAnalysis : public ModulePass {
    public:

      static char ID; // Pass identification
      ProgramAnalysis() : ModulePass(ID) {}
      virtual bool runOnModule(Module &M);
      bool AnalyseFunction(Function &F);
      std::vector<BasicBlock *> getHotTrace(int);
      std::vector<BasicBlock *> getMergeBlock(int);
      int getFuncNumber(Function *);
      void checkNumPredecessors(BasicBlock *);
      bool getNextBasicBlock(BasicBlock *);
      virtual void getAnalysisUsage(AnalysisUsage &AU) const  {
          AU.addRequired<ProfileInfo>();
          AU.setPreservesAll();
      }
      void testTrace();
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
//        int HOTTRACEBLOCKCOUNT,MERGEBLOCKCOUNT,FUNCTIONCOUNT;
};
}
