%{
#include<stdio.h>
#include<stdlib.h>

int reg = 0;

void yyerror(const char *s);
int yylex();

int newReg() {
    return reg++;
}
%}

%union {
    int num;
}

%token <num> NUMBER ID
%type <num> expr

%left '+' '-'
%left '*' '/'

%%

input:
      | input line
      ;

line:
      '\n'
    | expr '\n'
      {
        printf("\nCode Generation Completed\n");
      }
    ;

expr:
      NUMBER
      {
        int r = newReg();
        printf("MOV R%d, %d\n", r, $1);
        $$ = r;
      }

    | ID
      {
        int r = newReg();
        printf("MOV R%d, %c\n", r, $1);
        $$ = r;
      }

    | expr '+' expr
      {
        printf("ADD R%d, R%d\n", $1, $3);
        $$ = $1;
      }

    | expr '-' expr
      {
        printf("SUB R%d, R%d\n", $1, $3);
        $$ = $1;
      }

    | expr '*' expr
      {
        printf("MUL R%d, R%d\n", $1, $3);
        $$ = $1;
      }

    | expr '/' expr
      {
        printf("DIV R%d, R%d\n", $1, $3);
        $$ = $1;
      }

    | '(' expr ')'
      {
        $$ = $2;
      }
    ;

%%

void yyerror(const char *s)
{
    printf("Error: %s\n", s);
}

int main()
{
    printf("Enter Expression:\n");
    yyparse();
    return 0;
}