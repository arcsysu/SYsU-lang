%union {}
%token <syntax_id> T_NUMERIC_CONSTANT T_IDENTIFIER
%token T_INT T_RETURN T_SEMI T_L_PAREN T_R_PAREN T_L_BRACE T_R_BRACE
%{
#include <iostream>
#include <llvm/Support/JSON.h>
#include <llvm/Support/raw_ostream.h>
#include <string>

llvm::json::Array stak;

yytoken_kind_t yylex() {
  std::string t;
  std::getline(std::cin, t);
  do {
    int b = t.find('\'') + 1, e = t.rfind('\'');
    std::string s = t.substr(b, e - b);
    t.erase(t.find(' '));
    if (t == "numeric_constant") {
      stak.push_back(
          llvm::json::Object{{"kind", "IntegerLiteral"}, {"value", s}});
      return T_NUMERIC_CONSTANT;
    }
    if (t == "identifier") {
      stak.push_back(llvm::json::Object{{"value", s}});
      return T_IDENTIFIER;
    }
  } while (0);

  if (t == "int") {
    return T_INT;
  }
  if (t == "return") {
    return T_RETURN;
  }
  if (t == "semi") {
    return T_SEMI;
  }
  if (t == "l_paren") {
    return T_L_PAREN;
  }
  if (t == "r_paren") {
    return T_R_PAREN;
  }
  if (t == "l_brace") {
    return T_L_BRACE;
  }
  if (t == "r_brace") {
    return T_R_BRACE;
  }
  return YYEOF;
}

int yyparse();

int main() {
  yyparse();
  llvm::outs() << llvm::formatv("{0:2}", stak.back()) << "\n";
}

#define yyerror std::printf
%}
%start CompUnit
%%

CompUnit : FuncDef {
      auto inner = stak.back();
      stak.pop_back();
      stak.push_back(llvm::json::Object{{"kind", "TranslationUnitDecl"},
                                        {"inner", llvm::json::Array{inner}}});
    };

FuncDef : FuncType Ident T_L_PAREN T_R_PAREN Block {
      auto inner = stak.back();
      stak.pop_back();
      auto name = stak.back().getAsObject();
      assert(name != nullptr);
      assert(name->get("value") != nullptr);
      stak.pop_back();
      stak.push_back(llvm::json::Object{{"kind", "FunctionDecl"},
                                        {"name", *(name->get("value"))},
                                        {"inner", llvm::json::Array{inner}}});
    };

FuncType : T_INT {}

Ident : T_IDENTIFIER {};

Block: T_L_BRACE T_R_BRACE {}
    | T_L_BRACE BlockItem T_R_BRACE {}
    ;

BlockItem : Stmt {
      auto inner = stak.back();
      stak.pop_back();
      stak.push_back(llvm::json::Object{{"kind", "CompoundStmt"},
                                        {"inner", llvm::json::Array{inner}}});
    };

Stmt : T_RETURN Exp T_SEMI {
      auto inner = stak.back();
      stak.pop_back();
      stak.push_back(llvm::json::Object{{"kind", "ReturnStmt"},
                                        {"inner", llvm::json::Array{inner}}});
    };

Exp : T_NUMERIC_CONSTANT {}
    ;

%%