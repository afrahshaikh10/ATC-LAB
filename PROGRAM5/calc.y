%{
#include<stdio.h>
#include<stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token NUMBER

%left '+' '-'
%left '*' '/'

%%

input:
      | input line
      ;

line:
      '\n'
    | exp '\n'   { printf("Result = %d\n", $1); }
    ;

exp:
      NUMBER              { $$ = $1; }
    | exp '+' exp         { $$ = $1 + $3; }
    | exp '-' exp         { $$ = $1 - $3; }
    | exp '*' exp         { $$ = $1 * $3; }
    | exp '/' exp         { $$ = $1 / $3; }
    | '(' exp ')'         { $$ = $2; }
    ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter Arithmetic Expression:\n");
    yyparse();
    return 0;
}