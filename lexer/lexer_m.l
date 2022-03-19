%{
// CAUTION: lexer.l will be built as a C++ code.
#include <cstdio>
#include <string>
#include <cctype>
#include <sstream>
// YY_USER_ACTION always runs in the front of yylex() 
#define YY_USER_ACTION                                                         \
  do {                                                                         \
    yycolumn += yyleng;                                                        \
  } while (0);

std::string yyloc("<stdin>");
int yyrow = 1, yycolumn = 1, yycolpre = 1;

enum TOKEN_TYPE{
  YYEOF=0,
  YYPP=128,
  YYINT,
  YYRETURN,
  YYNUM,
  YYIDENT,
  YYUNKNOWN
};

const char * TOKEN_NAME[]={
  [YYINT]="int",
  [YYRETURN]="return",
  ['(']="l_paren",
  [')']="r_paren",
  ['{']="l_brace",
  ['}']="r_brace",
  [';']="semi",
  [YYNUM]="numeric_constant",
  [YYIDENT]="identifier",
  [YYEOF]="eof",
  [YYUNKNOWN]="unknown"
};

%}

%option noyywrap


%%

#.* {
  // It is supposed to be a line as  
  // # yyrow "yyloc" strange_number?

  std::stringstream ss(yytext);
  char ch; ss >> ch;
  ss >> yyrow; yyrow-=1;
  std::string s;
  std::getline(ss, s);
  auto l = s.find("\""), r = s.rfind("\"");
  yyloc = s.substr(l + 1, r - l - 1);
  return YYPP; 
}

\n {
  ++yyrow;
  yycolpre = yycolumn;
  yycolumn = 1;
  return '\n';
}

[\f\r\t\v ] {
  return ' ';
}

int {
  return YYINT;
}

return {
  return YYRETURN;
}

\( {
  return '(';
}

\) {
  return ')';
}

\{ {
  return '{';
}

\} {
  return '}';
}

; {
  return ';';
}

[0-9]+ {
  return YYNUM;
}

[a-zA-Z_][a-zA-Z_0-9]* {
  return YYIDENT;
}

<<EOF>> {
  return YYEOF;
}

. {
  return YYUNKNOWN;
}

%%

void yyprint(int token){
  switch(token){
    case YYEOF :
      yycolumn=yycolpre;
      yyrow--;
      break;

    case '\n': 
    case ' ' :
    case YYPP: 
      return;

    default: 
      ; 
  }

  std::fprintf(
    yyout, 
    "%s '%s'\t\tLoc=<%s:%d:%d>\n", 
    TOKEN_NAME[token],
    yytext,
    yyloc.c_str(),
    yyrow,
    yycolumn-yyleng 
  );
}

int main() {
  // yyout = stderr; // to be same with clang -cc1 -dump-tokens
  int token=0;
  do {
    token=yylex();
    yyprint(token);
  } while (token != YYEOF);
  return 0;
}

