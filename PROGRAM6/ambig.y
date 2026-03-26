%{
#include<stdio.h>
#include<stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token ID

%%

E : E '+' E
  | E '*' E
  | '(' E ')'
  | ID
  ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter expression:\n");
    yyparse();
    return 0;
}