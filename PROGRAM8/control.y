%{
#include<stdio.h>
#include<stdlib.h>

void yyerror(const char *s);
int yylex();
%}

%token IF ELSE WHILE ID NUM RELOP

%%

program:
        stmt
        ;

stmt:
        if_stmt
      | while_stmt
      | block
      ;

if_stmt:
        IF '(' condition ')' stmt
        {
            printf("Valid IF statement\n");
        }
      | IF '(' condition ')' stmt ELSE stmt
        {
            printf("Valid IF-ELSE statement\n");
        }
      ;

while_stmt:
        WHILE '(' condition ')' stmt
        {
            printf("Valid WHILE loop\n");
        }
      ;

block:
        '{' stmt '}'
      | ID ';'
      ;

condition:
        ID RELOP ID
      | ID RELOP NUM
      ;

%%

void yyerror(const char *s)
{
    printf("Invalid Statement\n");
}

int main()
{
    printf("Enter Control Statement:\n");
    yyparse();
    return 0;
}