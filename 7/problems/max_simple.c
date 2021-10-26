#include <stdio.h>

int max(int a[], int length) {
    int first_element = *a;
    if (length != 1) goto max_length_ne_1;
        return first_element;
    max_length_ne_1:;
        int *arg0 = a + 1; // Should actually be 4
        int arg1 = length - 1;
        int max_so_far = max(arg0, arg1);
        if (first_element <= max_so_far) goto max_first_lte_max;
            max_so_far = first_element;
        max_first_lte_max:;
        return max_so_far;
}

int main(void) {
    int nums[] = {1, 4, 3, 5, 2};
    printf("%d\n", max(nums, 5));
    return 0;
}