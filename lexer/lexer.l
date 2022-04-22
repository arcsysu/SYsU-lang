%{
#include <cctype>
#include <cstdio>
#include <string>
#define YYEOF 0
int yylex();
int main() {
  do {
  } while (yylex() != YYEOF);
}
std::string yyloc = "<stdin>";
int yyrow = 1, yycolumn = 1, yycolpre = 1;
#define YY_USER_ACTION                                                         \
  do {                                                                         \
    yycolumn += yyleng;                                                        \
  } while (0);
%}
%option noyywrap
%%
#.* {
  std::string s(yytext);
  auto l = s.find("\""), r = s.rfind("\"");
  yyloc = s.substr(l + 1, r - l - 1);
  for (int i = 0; i < s.size(); ++i)
    if (std::isdigit(s[i])) {
      for (yyrow = 0; i < s.size() && std::isdigit(s[i]); ++i)
        yyrow = yyrow * 10 + s[i] - '0';
      --yyrow;
      break;
    }
}
\n {
  ++yyrow;
  yycolpre = yycolumn;
  yycolumn = 1;
}
[\f\r\t\v ] {}
int {
  std::fprintf(yyout, "int '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
return {
  std::fprintf(yyout, "return '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
\( {
  std::fprintf(yyout, "l_paren '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
\) {
  std::fprintf(yyout, "r_paren '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
\{ {
  std::fprintf(yyout, "l_brace '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
\} {
  std::fprintf(yyout, "r_brace '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
; {
  std::fprintf(yyout, "semi '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
[0-9]+ {
  std::fprintf(yyout, "numeric_constant '%s'\t\tLoc=<%s:%d:%d>\n", yytext,
               yyloc.c_str(), yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
[a-zA-Z_][a-zA-Z_0-9]* {
  std::fprintf(yyout, "identifier '%s'\t\tLoc=<%s:%d:%d>\n", yytext,
               yyloc.c_str(), yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
<<EOF>> {
  std::fprintf(yyout, "eof ''\t\tLoc=<%s:%d:%d>\n", yyloc.c_str(), yyrow - 1,
               yycolpre - yyleng);
  return YYEOF;
}
. {
  std::fprintf(yyout, "unknown '%s'\t\tLoc=<%s:%d:%d>\n", yytext, yyloc.c_str(),
               yyrow, yycolumn - yyleng);
  return ~YYEOF;
}
%%