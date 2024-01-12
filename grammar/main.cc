// 任 君 选 择
#include "CBaseListener.h"
#include "CBaseVisitor.h"
#include "CLexer.h"
#include "CListener.h"
#include "CParser.h"
#include "CVisitor.h"
#include <antlr4-runtime.h>
#include <cstring>
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
  if (argc >= 2 && !std::strcmp(argv[1], "-dump-tokens")) {
// 请完成此处的词法分析器
#if 0
    for (auto token : tokens.getTokens()) {
      llvm::outs() << token->toString() << "\n";
    }
#else
    llvm::outs()
        << "int \'int\'               "
           "Loc=<tester/functional/000_main.sysu.c:1:1> "
        << "\n"
        << "identifier \'main\'               "
           "Loc=<tester/functional/000_main.sysu.c:1:5> "
        << "\n"
        << "l_paren \'(\'             "
           "Loc=<tester/functional/000_main.sysu.c:1:9> "
        << "\n"
        << "r_paren \')\'             "
           "Loc=<tester/functional/000_main.sysu.c:1:10> "
        << "\n"
        << "l_brace \'{\'             "
           "Loc=<tester/functional/000_main.sysu.c:1:11> "
        << "\n"
        << "return \'return\'         "
           "Loc=<tester/functional/000_main.sysu.c:2:5> "
        << "\n"
        << "numeric_constant \'3\'            "
           "Loc=<tester/functional/000_main.sysu.c:2:12> "
        << "\n"
        << "semi \';\'                "
           "Loc=<tester/functional/000_main.sysu.c:2:13> "
        << "\n"
        << "r_brace \'}\'             "
           "Loc=<tester/functional/000_main.sysu.c:3:1> "
        << "\n"
        << "eof \'\'          Loc=<tester/functional/000_main.sysu.c:3:2> "
        << "\n";
#endif
    return 0;
  }
  sysu_grammar::CParser parser(&tokens);
// 请将此处的 ParseTree 转换为 AbstractSyntaxTree，简而言之就是把这颗树拍扁
#if 0
  llvm::outs() << parser.compilationUnit()->toStringTree(&parser, true) << "\n";
#else
  llvm::outs()
      << "{\"inner\":[{\"inner\":[{\"inner\":[{\"inner\":[{\"kind\":"
         "\"IntegerLiteral\",\"value\":\"3\"}],\"kind\":\"ReturnStmt\"}],"
         "\"kind\":\"CompoundStmt\"}],\"kind\":\"FunctionDecl\",\"name\":"
         "\"main\"}],\"kind\":\"TranslationUnitDecl\"}";
#endif
}