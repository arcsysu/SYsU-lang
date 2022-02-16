%{
#include <stdio.h>
#define YYEOF (0)
int yylex();
int main() {
  do {
  } while (yylex() != YYEOF);
}
int yycolno = 1;
%}
%option noyywrap yylineno
%%

int {
  fprintf(stderr, "int '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

return {
  fprintf(stderr, "return '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

\( {
  fprintf(stderr, "l_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

\) {
  fprintf(stderr, "r_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

\{ {
  fprintf(stderr, "l_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

\} {
  fprintf(stderr, "r_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

; {
  fprintf(stderr, "semi '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

[0-9]+ {
  fprintf(stderr, "numeric_constant '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

[a-zA-Z_][a-zA-Z_0-9]* {
  fprintf(stderr, "identifier '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

\ |\t {
  yycolno += yyleng;
}

#.* {
  yycolno += yyleng;
  --yylineno;
}

\n|\r {
  yycolno = 1;
}

<<EOF>> {
  fprintf(stderr, "eof ''\t\tLoc=<<stdin>:%d:%d>\n", yylineno, yycolno);
  yycolno += yyleng;
  return YYEOF;
}

. {
  fprintf(stderr, "unknown '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  yycolno += yyleng;
  return ~YYEOF;
}

%%