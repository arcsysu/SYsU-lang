#include <llvm/IR/PassManager.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Passes/PassPlugin.h>
#include <llvm/Support/raw_ostream.h>

namespace {
struct HelloNewPMPass : public llvm::PassInfoMixin<HelloNewPMPass> {
  llvm::PreservedAnalyses run(llvm::Function &F,
                              llvm::FunctionAnalysisManager &FAM) {
    if (F.hasName())
      llvm::errs() << "Hello " << F.getName() << "\n";
    return llvm::PreservedAnalyses::all();
  }
};
} // end anonymous namespace

extern "C" {
llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvm::llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "HelloNewPMPass", "v0.1",
          [](llvm::PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](llvm::StringRef Name, llvm::FunctionPassManager &FPM,
                   llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "hello-new-pm-pass") {
                    FPM.addPass(HelloNewPMPass());
                    return true;
                  }
                  return false;
                });
          }};
}
}