%{
    /* C/C++ code to include in the generated file */
    #include <stdio.h>
    #include <string.h>
    #include <stdlib.h>
    #include "parser.tab.h"

    typedef enum { false, true } bool;

    void handlePermComb(char * yytext, bool isCombination)
    {
        if(isCombination == true)
            printf("Found nCr: %s\n", yytext); 
        else
            printf("Found nPr: %s\n", yytext); 
    }
%}

/* Definitions section: Regular expressions and definitions */

DIGIT           [0-9]+
PLUS             "+"
MINUS             "-"
TIMES             "*"
DIVIDE             "/"
/* COMB            [0-9]+[Cc][0-9]+
PERM            [0-9 | ((.+))]+[Pp][0-9 | ((.+))]+ */
COMB            [c | C]
PERM            [p | P]
PARAN_OPEN      "("
PARAN_CLOSE     ")"
%%

{PLUS}          { return PLUS; }
{MINUS}         { return MINUS; }
{TIMES}         { return TIMES; }
{DIVIDE}        { return DIVIDE; }
{COMB}          { return COMB; }
{PERM}          { return PERM; }
{PARAN_OPEN}    { return PARAN_OPEN; }
{PARAN_CLOSE}   { return PARAN_CLOSE; }
{DIGIT}+        { return DIGIT; }
[ \t\n]         { /* Ignore whitespace */ }
.               { printf("Idk what that is chat\n"); }

%%

/* User code section: Additional C/C++ code */

int not_main() {
    printf("Start typing!\n");
    yylex();  // Start scanning
    return 0;
}

int yywrap() {
    return 1;  // Indicate end of input
}