%{
#include <stdio.h>
#define YYEOF (0)
int yylex();
int main() {
  yyout = stderr;
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
  fprintf(yyout, "int '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

return {
  fprintf(yyout, "return '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\( {
  fprintf(yyout, "l_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\) {
  fprintf(yyout, "r_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\{ {
  fprintf(yyout, "l_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

\} {
  fprintf(yyout, "r_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

; {
  fprintf(yyout, "semi '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

[0-9]+ {
  fprintf(yyout, "numeric_constant '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext,
          yyrow, yycolumn - yyleng);
  return ~YYEOF;
}

[a-zA-Z_][a-zA-Z_0-9]* {
  fprintf(yyout, "identifier '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

<<EOF>> {
  fprintf(yyout, "eof ''\t\tLoc=<<stdin>:%d:%d>\n",
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
  fprintf(yyout, "unknown '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
          yycolumn - yyleng);
  return ~YYEOF;
}

%%