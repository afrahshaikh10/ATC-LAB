%{
#include<stdio.h>
#include<stdlib.h>

typedef struct node {
    int data;
    struct node *left, *right;
} node;

node* newNode(int val)
{
    node* temp = (node*)malloc(sizeof(node));
    temp->data = val;
    temp->left = temp->right = NULL;
    return temp;
}

void printTree(node* root)
{
    if(root != NULL)
    {
        printTree(root->left);
        if(root->data > 0)
            printf("%d ", root->data);
        else
            printf("%c ", -root->data);   // operators stored as negative
        printTree(root->right);
    }
}

void yyerror(const char *s);
int yylex();
%}

%union {
    int num;
    struct node* ptr;
}

%token <num> NUMBER
%type <ptr> exp

%left '+' '-'
%left '*' '/'

%%

input:
      | input line
      ;

line:
      '\n'
    | exp '\n'  { 
                    printf("Inorder Traversal of AST:\n");
                    printTree($1);
                    printf("\n");
                 }
    ;

exp:
      NUMBER            { $$ = newNode($1); }

    | exp '+' exp       { 
                            $$ = newNode(-'+');
                            $$->left = $1;
                            $$->right = $3;
                         }

    | exp '-' exp       {
                            $$ = newNode('-');
                            $$->left = $1;
                            $$->right = $3;
                        }

    | exp '*' exp       {
                            $$ = newNode(-'*');
                            $$->left = $1;
                            $$->right = $3;
                        }

    | exp '/' exp       {
                            $$ = newNode(-'/');
                            $$->left = $1;
                            $$->right = $3;
                        }

    | '(' exp ')'       { $$ = $2; }
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