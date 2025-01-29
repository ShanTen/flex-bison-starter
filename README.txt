%{
    /* C/C++ code to include in the generated file */
    #include <stdio.h>
%}

/* Definitions section: Regular expressions and definitions */

numbers [0-9]+  

%%

/* Rules section: Pattern-action pairs */
/* current token is stored in `yytext` */

{numbers}             { printf("number\n"); }
.                   { printf("not number\n"); }

%%

/* User code section: Additional C/C++ code */

int main() {
    yylex();  // Start scanning
    return 0;
}

int yywrap() {
    return 1;  // Indicate end of input
}