#include <stdio.h>

int main(void) {
    int x = 24;
    loop:
    if (x >= 42) goto end;
    printf("%d",x);
    printf("%c", '\n');
    x += 3;
    goto loop;
    end:
    return 0;
}