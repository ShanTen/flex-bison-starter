%{

#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);

%}

%token  DIGIT
%token  PLUS MINUS TIMES DIVIDE
%token  PARAN_OPEN PARAN_CLOSE
%token  COMB PERM

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