%{
#include "parser.h"
#include <stdio.h>
%}

WHITESPACE		[\t\n\r ]
ALPHA			[a-zA-Z_]
ALPHA_DIGIT		[a-zA-Z_0-9]
DIGIT			[0-9]
%%

"("							{ return '('; }
")"							{ return ')'; }
"{"							{ return '{'; }
"}"							{ return '}'; }
";"							{ return ';'; }
"return"					{ return RETURN; }
{ALPHA}{ALPHA_DIGIT}*		{ yylval.str = strdup(yytext); return NAME; }
{DIGIT}+					{ yylval.str = strdup(yytext); return DIGIT; }
{WHITESPACE}+				{ /* Ignore newlines */ }

%%
