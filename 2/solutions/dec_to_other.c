#include <stdio.h>

int main(void) {
    
    int num; // decimal? hex? octal? binary?
    scanf("%d", &num);
    printf("%d is: %o, %x", num, num, num);
    
    return 0;
    
}