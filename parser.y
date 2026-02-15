%{
#include <stdio.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%union {
	char * str;
}

%token <str> NAME

%start definition

%%
name:
	NAME
	;

definition:
	name '(' ')' '{' '}' {
		// printf("got identifier: %s\n", $1);
	}
	;

%%

void println(char *str) {
	printf("%s\n", str);
}

int main() {
    yyin = stdin; // Read from standard input

    if (yyparse() != 0) {
		return 1;
    }

	println(".intel_syntax noprefix");
	println(".text");

	return 0;
}
