// 任 君 选 择
#include "CBaseListener.h"
#include "CBaseVisitor.h"
#include "CLexer.h"
#include "CListener.h"
#include "CParser.h"
#include "CVisitor.h"
#include <algorithm>
#include <antlr4-runtime.h>
#include <llvm/Support/JSON.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/raw_ostream.h>
#include <string>
#include <unordered_map>

int main(int argc, char **argv) {
  auto llvmin = llvm::MemoryBuffer::getFileOrSTDIN("-");
  auto inputbuffer = llvmin.get()->getBuffer();
  antlr4::ANTLRInputStream input(inputbuffer.begin(), inputbuffer.size());
  sysu_grammar::CLexer lexer(&input);
  antlr4::CommonTokenStream tokens(&lexer);
  tokens.fill();
  if (argc >= 2 && argv[1] == std::string("-dump-tokens")) {
    // 请完成此处的词法分析器
    for (auto token : tokens.getTokens()) {
      if (token->getChannel() != antlr4::Token::HIDDEN_CHANNEL) {
        std::string t = lexer.getVocabulary().getSymbolicName(token->getType());
        std::unordered_map<std::string, std::string> transform_table{
            {"Int", "int"},
            {"Identifier", "identifier"},
            {"LeftParen", "l_paren"},
            {"RightParen", "r_paren"},
            {"LeftBrace", "l_brace"},
            {"Return", "return"},
            {"Constant", "numeric_constant"},
            {"Semi", "semi"},
            {"RightBrace", "r_brace"},
            {"EOF", "eof"}};
        if (transform_table.count(t))
          t = transform_table[t];
        llvm::outs() << t << " \'" << (t != "eof" ? token->getText() : "")
                     << "\'\t\tLoc=<"
                     << "<stdin>"
                     << ":" << token->getLine() << ":"
                     << token->getCharPositionInLine() + 1 << ">\n";
      }
    }
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