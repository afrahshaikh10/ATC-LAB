%{
#include<stdio.h>
#include<string.h>

int valid = 1;
int paren = 0;
%}

%%
[ \t]+              ;   /* ignore spaces */

[a-zA-Z0-9]+        ;   /* operands */

"("                 { paren++; }

")"                 { 
                        paren--; 
                        if(paren < 0) valid = 0;
                    }

"*"|"+"|"|"         ;   /* operators */

\n                  {
                        if(valid && paren == 0)
                            printf("Valid Regular Expression\n");
                        else
                            printf("Invalid Regular Expression\n");

                        valid = 1;
                        paren = 0;
                    }

.                   { valid = 0; }

%%

int main()
{
    printf("Enter Regular Expression:\n");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}