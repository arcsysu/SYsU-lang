%{
#include "parser.hh"
#include <llvm/Support/JSON.h>
#include <llvm/Support/MemoryBuffer.h>
#include <llvm/Support/raw_ostream.h>
#define yyerror(x)                                                             \
  do {                                                                         \
    llvm::errs() << (x);                                                       \
  } while (0)

namespace {
auto llvmin = llvm::MemoryBuffer::getFileOrSTDIN("-");
auto input = llvmin.get() -> getBuffer();

auto end = input.end(), it = input.begin();
auto wk_getline(char endline = '\n') {
  auto beg = it;
  while (it != end && *it != endline)
    ++it;
  auto len = it - beg;
  if (it != end && *it == endline)
    ++it;
  return llvm::StringRef(beg, len);
}

llvm::json::Array stak;
} // namespace

auto yylex() {
  auto tk = wk_getline();
  auto b = tk.find("'") + 1, e = tk.rfind("'");
  auto s = tk.substr(b, e - b), t = tk.substr(0, tk.find(" "));
  if (t == "numeric_constant") {
    stak.push_back(
        llvm::json::Object{{"kind", "IntegerLiteral"}, {"value", s}});
    return T_NUMERIC_CONSTANT;
  }
  if (t == "identifier") {
    stak.push_back(llvm::json::Object{{"value", s}});
    return T_IDENTIFIER;
  }
  if (t == "int")
    return T_INT;
  if (t == "return")
    return T_RETURN;
  if (t == "semi")
    return T_SEMI;
  if (t == "l_paren")
    return T_L_PAREN;
  if (t == "r_paren")
    return T_R_PAREN;
  if (t == "l_brace")
    return T_L_BRACE;
  if (t == "r_brace")
    return T_R_BRACE;
  return YYEOF;
}

int main() {
  yyparse();
  llvm::outs() << llvm::formatv("{0:2}", stak.back()) << "\n";
}
%}
%token T_NUMERIC_CONSTANT
%token T_IDENTIFIER
%token T_INT
%token T_RETURN
%token T_SEMI
%token T_L_PAREN
%token T_R_PAREN
%token T_L_BRACE
%token T_R_BRACE
%start CompUnit
%%

CompUnit: FuncDef {
  auto inner = stak.back();
  stak.pop_back();
  stak.push_back(llvm::json::Object{{"kind", "TranslationUnitDecl"},
                                    {"inner", llvm::json::Array{inner}}});
}

FuncDef: FuncType Ident T_L_PAREN T_R_PAREN Block {
  auto inner = stak.back();
  stak.pop_back();
  auto name = stak.back().getAsObject();
  assert(name != nullptr);
  assert(name->get("value") != nullptr);
  stak.pop_back();
  stak.push_back(llvm::json::Object{{"kind", "FunctionDecl"},
                                    {"name", *(name->get("value"))},
                                    {"inner", llvm::json::Array{inner}}});
}

FuncType: T_INT {}

Ident: T_IDENTIFIER {}

Block: T_L_BRACE T_R_BRACE {}

Block: T_L_BRACE BlockItem T_R_BRACE {}

BlockItem: Stmt {
  auto inner = stak.back();
  stak.pop_back();
  stak.push_back(llvm::json::Object{{"kind", "CompoundStmt"},
                                    {"inner", llvm::json::Array{inner}}});
}

Stmt: T_RETURN Exp T_SEMI {
  auto inner = stak.back();
  stak.pop_back();
  stak.push_back(llvm::json::Object{{"kind", "ReturnStmt"},
                                    {"inner", llvm::json::Array{inner}}});
}

Exp: T_NUMERIC_CONSTANT {}

%%