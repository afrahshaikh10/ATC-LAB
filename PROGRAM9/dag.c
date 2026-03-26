#include <stdio.h>
#include <string.h>

struct expr {
    char op[5], arg1[5], arg2[5], result[5];
};

int main() {
    int n, i, j, found;
    struct expr e[20];

    printf("Enter number of expressions: ");
    scanf("%d", &n);

    printf("Enter expressions (format: result = arg1 op arg2):\n");

    for(i = 0; i < n; i++) {
        scanf("%s = %s %s %s", e[i].result, e[i].arg1, e[i].op, e[i].arg2);
    }

    printf("\nOptimized Code:\n");

    for(i = 0; i < n; i++) {
        found = 0;

        for(j = 0; j < i; j++) {
            if(strcmp(e[i].arg1, e[j].arg1) == 0 &&
               strcmp(e[i].arg2, e[j].arg2) == 0 &&
               strcmp(e[i].op, e[j].op) == 0) {

                printf("%s = %s\n", e[i].result, e[j].result);
                found = 1;
                break;
            }
        }

        if(!found) {
            printf("%s = %s %s %s\n", e[i].result, e[i].arg1, e[i].op, e[i].arg2);
        }
    }

    return 0;
}