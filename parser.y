%{
#include <stdio.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
%}

%token HELLO_TOKEN SEMICOLON_TOKEN

%%
program:
    HELLO_TOKEN SEMICOLON_TOKEN { printf("Parsed 'hello;'\n"); }
    ;
%%

int main() {
    yyin = stdin; // Read from standard input
    if (yyparse() == 0) {
        printf("Parsing successful.\n");
    } else {
        printf("Parsing failed.\n");
    }
    return 0;
}
