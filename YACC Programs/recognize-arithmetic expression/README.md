# Valid Arithmetic Expression Recognizer using LEX and YACC

## AIM
To write a program using **LEX** and **YACC** to recognize a valid arithmetic expression that uses operators such as `+`, `-`, `*`, or `/`.

---

## ALGORITHM

### 1. Algorithm for Tokenization (LEX)
For each character/sequence in `yytext`:
1. **Digits**: If the character is in the range `0-9` (and subsequent characters are also in `0-9`), return the **`DIGIT`** token.
2. **Identifiers**: If the character is in the range `a-z` or `_`, optionally followed by characters in the range `a-z`, `0-9`, or `_`, return the **`ID`** token.
3. **Newline**: If the character equals `\n`, return the **`NL`** token.

---

### 2. Algorithm for Parser (YACC)
1. Declare **`DIGIT`**, **`ID`**, and **`NL`** as tokens.
2. Set **left associativity/precedence** for operators `+`, `-`, `*`, and `/`.
3. Define the production rules:
   - A valid statement (`stmt`) must be of the form:
     $$\text{stmt} \rightarrow \text{exp } \mathbf{NL}$$
   - An expression (`exp`) can be formed as:
     $$\text{exp} \rightarrow \text{exp} + \text{exp} \mid \text{exp} - \text{exp} \mid \text{exp} * \text{exp} \mid \text{exp} / \text{exp} \mid \mathbf{DIGIT} \mid \mathbf{ID}$$
4. Accept the arithmetic expression as input.
5. Parse the input using `yyparse()` to validate it against the production rules.
6. If the syntax matches the rules, print **"Valid Expression"**.
7. Otherwise, print **"Invalid Expression"**.

---

## COMPILATION & EXECUTION INSTRUCTIONS

1. Save the Lex code as **`lexc.l`**.
2. Save the Yacc/Bison code as **`yac.y`**.
3. Run the following commands in the terminal:

```bash
# Compile the Lex program
lex lexc.l

# Compile the Yacc program (-d creates y.tab.h header file)
yacc -d yac.y

# Compile generated C files using GCC (-lfl links against the Flex library)
gcc lex.yy.c y.tab.c -lfl

# Run the executable
./a.out
