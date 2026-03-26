%{
#include "y.tab.h"
%}

%%
"if"        return IF;
"else"      return ELSE;
"while"     return WHILE;

"("         return '(';
")"         return ')';
"{"         return '{';
"}"         return '}';

[a-zA-Z][a-zA-Z0-9]*    return ID;
[0-9]+                  return NUM;

"=="|"<"|">"            return RELOP;

[ \t\n]    ;

.          return yytext[0];
%%

int yywrap()
{
    return 1;
}