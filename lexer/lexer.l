%{
#include <stdio.h>
#define YYEOF (0)
int yylex();
int main() {
  do {
  } while (yylex() != YYEOF);
}
int yycolumn = 1, yycolpre = 1;
#define YY_USER_ACTION                                                         \
  do {                                                                         \
    yycolumn += yyleng;                                                        \
  } while (0);
%}
%option noyywrap
%%

int {
  fprintf(stderr, "int '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

return {
  fprintf(stderr, "return '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

\( {
  fprintf(stderr, "l_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

\) {
  fprintf(stderr, "r_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

\{ {
  fprintf(stderr, "l_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

\} {
  fprintf(stderr, "r_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

; {
  fprintf(stderr, "semi '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

[0-9]+ {
  fprintf(stderr, "numeric_constant '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext,
          yylineno, yycolumn - yyleng);
  return ~YYEOF;
}

[a-zA-Z_][a-zA-Z_0-9]* {
  fprintf(stderr, "identifier '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

<<EOF>> {
  fprintf(stderr, "eof ''\t\tLoc=<<stdin>:%d:%d>\n", yylineno - 1,
          yycolpre - yyleng);
  return YYEOF;
}

#.* {
  --yylineno;
}

\n {
  ++yylineno;
  yycolpre = yycolumn;
  yycolumn = 1;
}

[\f\n\r\t\v ] {}

. {
  fprintf(stderr, "unknown '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno,
          yycolumn - yyleng);
  return ~YYEOF;
}

%%