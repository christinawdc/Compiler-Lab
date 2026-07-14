#include <stdio.h>
#include <string.h>
#include <ctype.h>

int main() {
    char s[256], b[30];
    char *k[] = {"auto", "break", "case", "char", "const", "continue", "default", "do",
        "double", "else", "enum", "extern", "float", "for", "goto", "if",
        "int", "long", "register", "return", "short", "signed", "sizeof", "static",
        "struct", "switch", "typedef", "union", "unsigned", "void", "volatile", "while"};
    int num_keywords = sizeof(k) / sizeof(k[0]);
    int i = 0, j, x;

    printf("Enter input:\n");
    fgets(s, sizeof(s), stdin);

    while (s[i]) {
        // 1. Handle Identifiers and Keywords (allowing underscores)
        if (isalpha(s[i]) || s[i] == '_') {
            j = 0;
            while (isalnum(s[i]) || s[i] == '_') {
                b[j++] = s[i++];
            }
            b[j] = '\0';
            x = 0;
            for (j = 0; j < num_keywords; j++) {
                if (strcmp(b, k[j]) == 0) x = 1;
            }
            printf("%-10s : %s\n", b, x ? "Keyword" : "Identifier");
        }
        // 2. Handle Numeric Constants 
        else if (isdigit(s[i])) {
            j = 0;
            // Capture digits and decimal points
            while (isdigit(s[i]) || s[i] == '.') {
                b[j++] = s[i++];
            }
            b[j] = '\0';
            printf("%-10s : Constant\n", b);
        }
        // 3. Handle Operators
        else if (strchr("+-*/=%", s[i])) {
            printf("%-10c : Operator\n", s[i]);
            i++;
        }
        // 4. Skip spaces, tabs, and unrecognized characters
        else {
            i++;
        }
    }
    return 0;
}
