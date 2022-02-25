%{
#include <cstdio>
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
  std::fprintf(yyout, "int '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

return {
  std::fprintf(yyout, "return '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

\( {
  std::fprintf(yyout, "l_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

\) {
  std::fprintf(yyout, "r_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

\{ {
  std::fprintf(yyout, "l_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

\} {
  std::fprintf(yyout, "r_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

; {
  std::fprintf(yyout, "semi '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

[0-9]+ {
  std::fprintf(yyout, "numeric_constant '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext,
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}

[a-zA-Z_][a-zA-Z_0-9]* {
  std::fprintf(yyout, "identifier '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

<<EOF>> {
  std::fprintf(yyout, "eof ''\t\tLoc=<<stdin>:%d:%d>\n",
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
  std::fprintf(yyout, "unknown '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yyrow,
               yycolumn - yyleng);
  return ~YYEOF;
}

%%