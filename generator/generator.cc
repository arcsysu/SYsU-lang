#include <iostream>
#include <llvm/IR/IRBuilder.h>
#include <llvm/IR/LLVMContext.h>
#include <llvm/IR/Module.h>
#include <llvm/IR/Type.h>
#include <llvm/IR/Verifier.h>
#include <llvm/Support/JSON.h>
#include <llvm/Support/raw_ostream.h>

static llvm::LLVMContext TheContext;
static llvm::IRBuilder<> Builder(TheContext);
static auto TheModule = std::make_unique<llvm::Module>("-", TheContext);

static llvm::Function *buildFunctionDecl(const llvm::json::Object *O) {
  // First, check for an existing function from a previous declaration.
  auto TheName = O->get("name")->getAsString();
  llvm::Function *TheFunction = TheModule->getFunction(*TheName);

  if (!TheFunction)
    TheFunction = llvm::Function::Create(
        llvm::FunctionType::get(llvm::Type::getInt32Ty(TheContext), {}, false),
        llvm::Function::ExternalLinkage, *TheName, TheModule.get());

  if (!TheFunction)
    return nullptr;

  // Create a new basic block to start insertion into.
  auto BB = llvm::BasicBlock::Create(TheContext, "entry", TheFunction);
  Builder.SetInsertPoint(BB);

  if (auto RetVal = llvm::ConstantInt::get(
          TheContext, /* i32 3(decimal) */ llvm::APInt(32, "3", 10))) {
    // Finish off the function.
    Builder.CreateRet(RetVal);

    // Validate the generated code, checking for consistency.
    llvm::verifyFunction(*TheFunction);

    return TheFunction;
  }

  // Error reading body, remove function.
  TheFunction->eraseFromParent();
  return nullptr;
}

static void buildTranslationUnitDecl(const llvm::json::Object *O) {
  if (O == nullptr)
    return;
  if (auto kind = O->get("kind")->getAsString()) {
    assert(*kind == "TranslationUnitDecl");
  } else {
    assert(0);
  }
  if (auto inner = O->getArray("inner"))
    for (const auto &it : *inner)
      if (auto P = it.getAsObject())
        if (auto kind = P->get("kind")->getAsString()) {
          if (*kind == "FunctionDecl")
            buildFunctionDecl(P);
        }
}

int main() {
  auto json =
      llvm::json::parse(std::string(std::istreambuf_iterator<char>(std::cin),
                                    std::istreambuf_iterator<char>()));
  buildTranslationUnitDecl(json->getAsObject());
  TheModule->print(llvm::outs(), nullptr);
}