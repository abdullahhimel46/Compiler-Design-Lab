%{
#include "parser.tab.h"
#include <stdlib.h>   
%}

%%

[0-9]+(\.[0-9]+)? { yylval.fnum = atof(yytext); return NUMBER; }
"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
"/"         { return DIV; }
"("         { return LPAREN; }
")"         { return RPAREN; }
[ \t]+      { /* skip whitespace */ }
\n          { return EOL; }
.           { /* ignore any other character */ }

%%

int yywrap(void) { return 1; }