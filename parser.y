%{
#include <stdio.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%token LPAREN RPAREN LBRACE RBRACE ALPHA

%start definition

%%
name: ALPHA
	;

definition:
	name LPAREN RPAREN LBRACE RBRACE
	;

%%

int main() {
    yyin = stdin; // Read from standard input
    if (yyparse() == 0) {
        printf("Parsing finished.\n");
    } else {
        printf("Parsing failed.\n");
    }
    return 0;
}
