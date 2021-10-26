#include <stdio.h>

char flag[6][12] = {
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'},
    {'#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'}
};

int main(void) {
    int row = 0;
    main_outer_start:
    if (row >= 6) goto main_outer_end;
        int col = 0;
        main_inner_start:
        if (col >= 12) goto main_inner_end;
            int *address = row*12 + col + flag;
            printf ("%c", *address);
            col++;
            goto main_inner_start;
        main_inner_end:
        printf ("\n");
        row++;
        goto main_outer_start;
    main_outer_end:
    return 0;
}