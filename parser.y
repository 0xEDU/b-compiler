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

void println(char *str) {
	printf("%s\n", str);
}

int main() {
    yyin = stdin; // Read from standard input

	println(".intel_syntax noprefix");
	println(".text");

    if (yyparse() != 0) {
		return 1;
    }
	return 0;
}
