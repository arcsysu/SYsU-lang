%{
#include <stdio.h>
#define YYEOF (0)
int yylex();
int main() {
  do {
  } while (yylex() != YYEOF);
}
int yyrow = 1, yycolumn = 1, yycolpre = 1;
#define YY_USER_ACTION                                                         \
  do {                                                                         \
    yycolumn += yyleng;                                                        \
  } while (0);
%}
%option noyywrap
%%

int {
  fprintf(stderr, "int '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

return {
  fprintf(stderr, "return '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\( {
  fprintf(stderr, "l_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\) {
  fprintf(stderr, "r_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\{ {
  fprintf(stderr, "l_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\} {
  fprintf(stderr, "r_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

; {
  fprintf(stderr, "semi '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

[0-9]+ {
  fprintf(stderr, "numeric_constant '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext,
          yyrow, yycolumn - yyleng);
  return ~YYEOF;
}

[a-zA-Z_][a-zA-Z_0-9]* {
  fprintf(stderr, "identifier '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

<<EOF>> {
  fprintf(stderr, "eof ''\t\tLoc=<<stdin>:%d:%d>\n",
          yyrow > 1 ? yyrow - 1 : yyrow, yycolpre - yyleng);
  return YYEOF;
}

#.* {
  --yyrow;
}

\n {
  ++yyrow;
  yycolpre = yycolumn;
  yycolumn = 1;
}

[\f\r\t\v ] {}

. {
  fprintf(stderr, "unknown '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

%%