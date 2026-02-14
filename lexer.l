%{
#include "parser.h"
#include <stdio.h>
%}

WHITESPACE	[\t\n\r ]
DIGIT		[0-9]
ALPHA		[a-zA-Z_\b]
%%

"("				{ return LPAREN; }
")"				{ return RPAREN; }
"{"				{ return LBRACE; }
"}"				{ return RBRACE; }
{ALPHA}+		{ printf("%s\n", yytext); return ALPHA;   }
{WHITESPACE}+	{ /* Ignore newlines */ }

%%
