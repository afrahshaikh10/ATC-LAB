%{
#include<stdio.h>
%}

%%
"int"|"float"|"char"|"double"|"if"|"else"|"while"|"for"|"return"
    { printf("Keyword: %s\n", yytext); }

[0-9]+
    { printf("Number: %s\n", yytext); }

[a-zA-Z_][a-zA-Z0-9_]*
    { printf("Identifier: %s\n", yytext); }

"+"|"-"|"*"|"/"|"="|"=="|"<"|">"
    { printf("Operator: %s\n", yytext); }

[ \t\n]+   ;   // ignore spaces

.   { printf("Unknown: %s\n", yytext); }

%%

int main()
{
    printf("Enter input:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}