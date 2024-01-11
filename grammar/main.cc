#include "CBaseListener.h"
#include "CBaseVisitor.h"
#include "CLexer.h"
#include "CListener.h"
#include "CParser.h"
#include "CVisitor.h"
#include <antlr4-runtime.h>
#include <llvm/Support/JSON.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/raw_ostream.h>

int main(int argc, char **argv) {
  auto llvmin = llvm::MemoryBuffer::getFileOrSTDIN("-");
  auto inputbuffer = llvmin.get()->getBuffer();
  antlr4::ANTLRInputStream input(inputbuffer.begin(), inputbuffer.size());
  sysu_grammar::CLexer lexer(&input);
  antlr4::CommonTokenStream tokens(&lexer);
  tokens.fill();
  sysu_grammar::CParser parser(&tokens);
  llvm::outs() << parser.compilationUnit()->toStringTree(&parser) << "\n";
}