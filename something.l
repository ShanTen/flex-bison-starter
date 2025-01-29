%{
    /* C/C++ code to include in the generated file */
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>

    void handleCombination(char * yytext)
    {
        printf("Found nCr: %s\n", yytext); 
    }
%}

/* Definitions section: Regular expressions and definitions */

DIGIT [0-9]+  
shantanu        shantanu|shan10
ADD             "+"
SUB             "-"
MUL             "*"
DIV             "/"
ASSIGN          ":="
COMB            [0-9]+[Cc][0-9]+
CLS             cls|clear|CLS|CLEAR
%%

{ADD}           { printf("Plus Operator\n"); }
{SUB}           { printf("Minus Operator\n"); }
{MUL}           { printf("Multiplication Operator\n"); }
{DIV}           { printf("Division Operator\n"); }
{ASSIGN}        { printf("Assignment Operator\n"); }
{COMB}          { handleCombination(yytext); }
{DIGIT}+        { printf("Number: %s\n", yytext); }
{CLS}           { printf("\033[2J\033[H"); }
{shantanu}      { printf("THATS YOU BRO\n");}   
[\t\s]          { /* Ignore whitespace */ }
.               { printf("Other shit\n"); }

%%

/* User code section: Additional C/C++ code */

int main() {
    printf("Start typing!\n");
    yylex();  // Start scanning
    return 0;
}

int yywrap() {
    return 1;  // Indicate end of input
}