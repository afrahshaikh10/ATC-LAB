# Program 6: Check Grammar Ambiguity using YACC

## Aim

To check whether a given grammar is ambiguous using YACC.

## Description

This program uses an ambiguous grammar:
E → E + E | E * E | (E) | id

When processed by YACC, it produces shift/reduce conflicts, which indicate ambiguity.

## Key Concept

* If YACC reports conflicts → Grammar is ambiguous
* No conflicts → Grammar is unambiguous

## Sample Input

a+a*a

## Output

Shift/reduce conflicts are shown during compilation

## Tools Used

* LEX
* YACC
* GCC
