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
    // 请续写此处的词法分析器
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
#ifndef SYSU_GRAMMAR_USE_LISTENER // 任 君 选 择
  struct Visitor : sysu_grammar::CBaseVisitor {
    antlrcpp::Any visitCompilationUnit(
        sysu_grammar::CParser::CompilationUnitContext *ctx) override {
      return visit(ctx->translationUnit());
    }
    antlrcpp::Any visitTranslationUnit(
        sysu_grammar::CParser::TranslationUnitContext *ctx) override {
      llvm::json::Value ret = llvm::json::Object{
          {"kind", "TranslationUnitDecl"}, {"inner", llvm::json::Array{}}};
      for (auto child : ctx->externalDeclaration()) {
        ret.getAsObject()->get("inner")->getAsArray()->push_back(
            visit(child).as<llvm::json::Value>());
      }
      return ret;
    }
    // 请续写 visitExternalDeclaration 及之后的遍历逻辑，将 ParseTree 转换为
    // json 格式的 AbstractSyntaxTree，简而言之就是把树拍扁
    antlrcpp::Any visitExternalDeclaration(
        sysu_grammar::CParser::ExternalDeclarationContext *ctx) override {
      return llvm::json::Value(llvm::json::Object{
          {"kind", "FunctionDecl"},
          {"name", "main"},
          {"inner",
           llvm::json::Array{llvm::json::Object{
               {"kind", "CompoundStmt"},
               {"inner",
                llvm::json::Array{llvm::json::Object{
                    {"kind", "ReturnStmt"},
                    {"inner", llvm::json::Array{llvm::json::Object{
                                  {"kind", "IntegerLiteral"}, {"value", "3"}}}},
                }}},
           }}}});
    }
  };
  llvm::outs()
      << Visitor().visit(parser.compilationUnit()).as<llvm::json::Value>()
      << "\n";
#else
  struct Listener : sysu_grammar::CBaseListener {
    llvm::json::Array stak;
    void exitTranslationUnit(
        sysu_grammar::CParser::TranslationUnitContext *ctx) override {
      llvm::json::Value ret = llvm::json::Object{
          {"kind", "TranslationUnitDecl"}, {"inner", llvm::json::Array{}}};
      ret.getAsObject()->get("inner")->getAsArray()->reserve(
          ctx->externalDeclaration().size());
      for (const auto &child : ctx->externalDeclaration()) {
        ret.getAsObject()->get("inner")->getAsArray()->push_back(stak.back());
        stak.pop_back();
      }
      std::reverse(ret.getAsObject()->get("inner")->getAsArray()->begin(),
                   ret.getAsObject()->get("inner")->getAsArray()->end());
      stak.push_back(ret);
    }
    // 请续写 exitExternalDeclaration 及之后的遍历逻辑，将 ParseTree 转换为
    // json 格式的 AbstractSyntaxTree，简而言之就是把树拍扁
    void exitExternalDeclaration(
        sysu_grammar::CParser::ExternalDeclarationContext *ctx) override {
      stak.push_back(llvm::json::Object{
          {"kind", "FunctionDecl"},
          {"name", "main"},
          {"inner",
           llvm::json::Array{llvm::json::Object{
               {"kind", "CompoundStmt"},
               {"inner",
                llvm::json::Array{llvm::json::Object{
                    {"kind", "ReturnStmt"},
                    {"inner", llvm::json::Array{llvm::json::Object{
                                  {"kind", "IntegerLiteral"}, {"value", "3"}}}},
                }}},
           }}}});
    }
  } listener;
  antlr4::tree::ParseTreeWalker::DEFAULT.walk(&listener,
                                              parser.compilationUnit());
  llvm::outs() << listener.stak.back() << "\n";
#endif
}