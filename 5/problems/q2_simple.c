#include <stdio.h>

int main(void) {
    int i = 0;

    main_do_start:
        i++;

        printf("%d", i);
        printf("\n");
    if (i >= 10) goto main_do_end;
    goto main_do_start;
    main_do_end:

    return 0;
}