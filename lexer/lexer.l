%{
#include <stdio.h>
#define YYEOF (0)
int yylex();
int main() {
  do {
  } while (yylex() != YYEOF);
}
int yycolno = 1, yycolumn = 1, yyrow = 1;
#define YY_USER_ACTION                                                         \
  do {                                                                         \
    yycolno = yycolumn;                                                        \
    yycolumn += yyleng;                                                        \
    if (yyrow != yylineno) {                                                   \
      yyrow = yylineno;                                                        \
      yycolumn = 1;                                                            \
    }                                                                          \
  } while (0);
%}
%option noyywrap yylineno
%%

#.* {
  --yyrow;
  --yylineno;
}

int {
  fprintf(stderr, "int '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

return {
  fprintf(stderr, "return '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

\( {
  fprintf(stderr, "l_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

\) {
  fprintf(stderr, "r_paren '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

\{ {
  fprintf(stderr, "l_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

\} {
  fprintf(stderr, "r_brace '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

; {
  fprintf(stderr, "semi '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

[0-9]+ {
  fprintf(stderr, "numeric_constant '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

[a-zA-Z_][a-zA-Z_0-9]* {
  fprintf(stderr, "identifier '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

<<EOF>> {
  fprintf(stderr, "eof ''\t\tLoc=<<stdin>:%d:%d>\n", yylineno - 1, yycolno);
  return YYEOF;
}

[\f\n\r\t\v ] {}

. {
  fprintf(stderr, "unknown '%s'\t\tLoc=<<stdin>:%d:%d>\n", yytext, yylineno, yycolno);
  return ~YYEOF;
}

%%