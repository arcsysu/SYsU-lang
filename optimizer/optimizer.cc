#include "optimizer-plugin.hh"
#include <llvm/IRReader/IRReader.h>
#include <llvm/Passes/PassBuilder.h>
#include <llvm/Support/CommandLine.h>
#include <llvm/Support/SourceMgr.h>
#include <llvm/Support/raw_ostream.h>

namespace {
llvm::cl::OptionCategory CallCounterCategory{"call counter options"};

llvm::cl::opt<std::string> InputModule{llvm::cl::Positional,
                                       llvm::cl::desc{"<Module to analyze>"},
                                       llvm::cl::value_desc{"bitcode filename"},
                                       llvm::cl::init(""),
                                       llvm::cl::Required,
                                       llvm::cl::cat{CallCounterCategory}};
} // namespace

int main(int argc, char **argv) {
  // Hide all options apart from the ones specific to this tool
  llvm::cl::HideUnrelatedOptions(CallCounterCategory);

  llvm::cl::ParseCommandLineOptions(argc, argv,
                                    "Counts the number of static function "
                                    "calls in the input IR file\n");

  // Makes sure llvm_shutdown() is called (which cleans up LLVM objects)
  //  http://llvm.org/docs/ProgrammersManual.html#ending-execution-with-llvm-shutdown
  llvm::llvm_shutdown_obj SDO;

  // Parse the IR file passed on the command line.
  llvm::SMDiagnostic Err;
  llvm::LLVMContext Ctx;
  std::unique_ptr<llvm::Module> M =
      parseIRFile(InputModule.getValue(), Err, Ctx);

  if (!M) {
    llvm::errs() << "Error reading bitcode file: " << InputModule << "\n";
    Err.print(argv[0], llvm::errs());
    return -1;
  }

  // Create a module pass manager and add StaticCallCounterPrinter to it.
  llvm::ModulePassManager MPM;
  MPM.addPass(sysu::StaticCallCounterPrinter(llvm::errs()));

  // Create an analysis manager and register StaticCallCounter with it.
  llvm::ModuleAnalysisManager MAM;
  MAM.registerPass([&] { return sysu::StaticCallCounter(); });

  // Register all available module analysis passes defined in PassRegisty.def.
  // We only really need PassInstrumentationAnalysis (which is pulled by
  // default by PassBuilder), but to keep this concise, let PassBuilder do all
  // the _heavy-lifting_.
  llvm::PassBuilder PB;
  PB.registerModuleAnalyses(MAM);

  // Finally, run the passes registered with MPM
  MPM.run(*M, MAM);

  return 0;
}