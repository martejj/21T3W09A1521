#include <stdio.h>

int main(void) {
    int x;
    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= 100) goto else_condition; // ble
    if (x >= 1000) goto else_condition; // bge
        printf("medium\n");
        goto end;
    else_condition;
        printf("small/big\n");
    end:
    
}
