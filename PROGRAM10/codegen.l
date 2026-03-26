%{
#include "y.tab.h"
#include<stdio.h>
#include<stdlib.h>
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }

[a-zA-Z]    { yylval = yytext[0]; return ID; }

[ \t]       ;

\n          return 0;

.           return yytext[0];
%%

int yywrap()
{
    return 1;
}