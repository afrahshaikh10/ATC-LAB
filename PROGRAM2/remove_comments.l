%{
#include<stdio.h>
%}

%%
"//".*                ;   // ignore single-line comments

"/*"([^*]|\*+[^*/])*\*+"/"   ;   // ignore multi-line comments

\"([^\\\n]|(\\.))*\"   { printf("%s", yytext); }   // keep strings

.|\n                  { printf("%s", yytext); }   // print rest

%%

int main()
{
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}