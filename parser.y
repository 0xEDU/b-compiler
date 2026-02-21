%{
#include <stdio.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

void println(char *str) {
    printf("%s\n", str);
}

%}

%union {
    char *str;
}

%token <str> NAME
%type <str> name

%token <str> DIGIT
%type <str> digit

%type <str> rvalue lvalue constant

%token RETURN

%start program

%%
digit:
	DIGIT { $$ = $1; }
	;

name:
	NAME { $$ = $1; }
    ;

constant:
	digit { $$ = $1; }
	;

lvalue:
	name { $$ = $1; }
	;

rvalue:
	lvalue { $$ = $1; }
	| constant { $$ = $1; }
	;

statement:
	RETURN rvalue ';' {
		printf("mov eax, %s\n", $2);
	}
	;

definition:
	name '(' ')' {
        printf(".globl %s\n", $1);
        printf("%s:\n", $1);
        printf(".long %s + 4\n", $1);
        println("enter 0, 0");
	} '{' statement '}' {
        println("leave");
        println("ret");
    }
    ;

program:
	/* no definitions is allowed */
   | program definition
   ;
%%

int main() {
    yyin = stdin; // Read from standard input
    println(".intel_syntax noprefix");
    println(".text");

    if (yyparse() != 0) {
        return 1;
    }

    return 0;
}
