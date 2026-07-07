// Program in Lex to display the number of lines,spaces, words and characters in an input file.

%{
#include <stdio.h>
#include <stdlib.h>
int c = 0,s = 0,w = 0,l = 0; // Character, Space, Word, Line count
%}

%%
[a-zA-Z0-9]+    { w++; c += yyleng; } // Words
[ \t]           { s++; c++; }          // Spaces or tabs
\n              { l++; c++; }          // New Lines
.               { c++; }          // Other Characters
%%

int main() {
    char filename[100];
    printf("Enter the input file name: ");
    scanf("%s", filename);
    FILE *fp = fopen(filename, "r");  // Open the file in read mode
    if (!fp) {
        printf("Error: Cannot open file %s\n", filename);
        return 1;
    }

    yyin = fp; // Set the Lex input pointer to our file
    yylex(); // Start the lexical analysis
     fclose(fp); // Close the file pointer

    if (c > 0 && l == 0) {  //Count the last line if the file has text but no ending newline
        l = 1;
    }

    printf("\n--- File Statistics ---\n");
    printf("Lines      : %d\n", l);
    printf("Spaces     : %d\n", s);
    printf("Words      : %d\n", w);
    printf("Characters : %d\n", c);
    return 0;
}

int yywrap() {
    return 1;
}

