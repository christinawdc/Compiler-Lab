%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%
[0-9]+  { 
            yylval = atoi(yytext); 
            return DIGIT; 
        }
[ \t]+  ; /* Ignore whitespace */
\n      { return NL; }
.       { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
