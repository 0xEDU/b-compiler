%{
#include "parser.h"
#include <stdio.h>
%}

WHITESPACE	[\t\n\r ]
ALPHA		[a-zA-Z_]
ALNUM		[a-zA-Z_0-9]
%%

"("					{ return '('; }
")"					{ return ')'; }
"{"					{ return '{'; }
"}"					{ return '}'; }
{ALPHA}{ALNUM}+		{ yylval.str = strdup(yytext); return NAME; }
{WHITESPACE}+		{ /* Ignore newlines */ }

%%
