# Program 10: Code Generation using YACC

## Aim

To generate simple assembly-like code for arithmetic expressions using YACC.

## Description

This program converts arithmetic expressions into assembly instructions using:

* LEX for tokenizing
* YACC for parsing and code generation

Each operand is stored in registers and operations are performed using instructions like MOV, ADD, SUB, MUL, DIV.

## Sample Input

a + b * 2

## Sample Output

MOV R0, a
MOV R1, b
MOV R2, 2
MUL R1, R2
ADD R0, R1

## Tools Used

* Flex (LEX)
* YACC
* GCC
