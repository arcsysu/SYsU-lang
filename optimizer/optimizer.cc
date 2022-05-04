#include "optimizer.hh"

#include <llvm/Passes/PassBuilder.h>

llvm::PreservedAnalyses
sysu::StaticCallCounterPrinter::run(llvm::Module &M,
                                    llvm::ModuleAnalysisManager &MAM) {

  auto DirectCalls = MAM.getResult<sysu::StaticCallCounter>(M);

  OS << "=================================================\n";
  OS << "sysu-optimizer: static analysis results\n";
  OS << "=================================================\n";
  const char *str1 = "NAME", *str2 = "#N DIRECT CALLS";
  OS << llvm::format("%-20s %-10s\n", str1, str2);
  OS << "-------------------------------------------------\n";

  for (auto &CallCount : DirectCalls) {
    OS << llvm::format("%-20s %-10lu\n",
                       CallCount.first->getName().str().c_str(),
                       CallCount.second);
  }

  OS << "-------------------------------------------------\n\n";
  return llvm::PreservedAnalyses::all();
}

sysu::StaticCallCounter::Result
sysu::StaticCallCounter::run(llvm::Module &M, llvm::ModuleAnalysisManager &) {
  llvm::MapVector<const llvm::Function *, unsigned> Res;

  for (auto &Func : M) {
    for (auto &BB : Func) {
      for (auto &Ins : BB) {

        // If this is a call instruction then CB will be not null.
        auto *CB = llvm::dyn_cast<llvm::CallBase>(&Ins);
        if (nullptr == CB) {
          continue;
        }

        // If CB is a direct function call then DirectInvoc will be not null.
        auto DirectInvoc = CB->getCalledFunction();
        if (nullptr == DirectInvoc) {
          continue;
        }

        // We have a direct function call - update the count for the function
        // being called.
        auto CallCount = Res.find(DirectInvoc);
        if (Res.end() == CallCount) {
          CallCount = Res.insert({DirectInvoc, 0}).first;
        }
        ++CallCount->second;
      }
    }
  }

  return Res;
}

llvm::AnalysisKey sysu::StaticCallCounter::Key;

extern "C" {
llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "sysu-optimizer-pass", LLVM_VERSION_STRING,
          [](llvm::PassBuilder &PB) {
            // #1 REGISTRATION FOR "opt -passes=sysu-optimizer-pass"
            PB.registerPipelineParsingCallback(
                [&](llvm::StringRef Name, llvm::ModulePassManager &MPM,
                    llvm::ArrayRef<llvm::PassBuilder::PipelineElement>) {
                  if (Name == "sysu-optimizer-pass") {
                    MPM.addPass(sysu::StaticCallCounterPrinter(llvm::errs()));
                    return true;
                  }
                  return false;
                });
            // #2 REGISTRATION FOR
            // "MAM.getResult<sysu::StaticCallCounter>(Module)"
            PB.registerAnalysisRegistrationCallback(
                [](llvm::ModuleAnalysisManager &MAM) {
                  MAM.registerPass([&] { return sysu::StaticCallCounter(); });
                });
          }};
}
}