# Program 9: DAG Based Optimization of Basic Block

## Aim

To perform DAG-based optimization on a basic block using C.

## Description

This program identifies common subexpressions in a basic block and eliminates redundant computations using DAG concept.

## Optimization Performed

* Common Subexpression Elimination

## Sample Input

a = b + c
d = b + c
e = a + d

## Sample Output

a = b + c
d = a
e = a + d

## Tools Used

* C Language
* GCC
