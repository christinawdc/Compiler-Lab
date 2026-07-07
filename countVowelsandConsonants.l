%{
#include <stdio.h>
#include <stdlib.h>
int vowels = 0, consonants=0;  
%}

%%
[aeiouAEIOU]                  { vow++; }
[a-zA-Z]                      { cons++; }
\n                            { return 0; } /* Stop parsing when the user presses Enter */
.                             { ; }  /* Ignore spaces, tabs, punctuation, and numbers */
%%

int main() {
    printf("Enter the String: ");
    yylex();
    printf("The total no. of Vowels: %d\n", vow);
    printf("The total no. of Consonants: %d\n", cons);
    return 0;
}

int yywrap() {
    return 1;
}
