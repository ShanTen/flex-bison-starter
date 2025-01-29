%{

#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);

%}

%start program

%%
program: /* empty */
%%

int main(void) {
    yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}