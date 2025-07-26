%{
#include "parser.h"
#include <stdio.h>
%}

%%

"hello" { return HELLO_TOKEN; }
";"     { return SEMICOLON_TOKEN; }
.       { /* Ignore other characters */ }
\n      { /* Ignore newlines */ }

%%

int yywrap() {
    return 1;
}
