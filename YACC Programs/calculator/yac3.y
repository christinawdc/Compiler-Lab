%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
int yyerror(const char *s);
%}

%token DIGIT ID NL
%left '+' '-'
%left '*' '/'

%%
stmt: exp NL {
    printf("Value=%d\n", $1);
    exit(0);
};

exp: exp '+' exp { $$ = $1 + $3; }
   | exp '-' exp { $$ = $1 - $3; }
   | exp '*' exp { $$ = $1 * $3; }
   | exp '/' exp { 
       if ($3 == 0) {
           printf("Error: Division by zero\n");
           exit(1);
       }
       $$ = $1 / $3; 
     }
   | '(' exp ')' { $$ = $2; }
   | ID          { $$ = $1; }
   | DIGIT       { $$ = $1; }
   ;
%%

int main() {
    printf("Enter the expression:\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("Invalid Expression\n");
    exit(1);
}
