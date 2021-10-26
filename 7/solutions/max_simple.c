int max(int a[], int length) {
    int first_element = a[0];

    if (length != 1) goto max_outer_else;
        return first_element;
    max_outer_else:
        // find max value in rest of array
        int max_so_far = max(&a[1], length - 1);

        if (first_element <= max_so_far) goto max_inner_if_end;
            max_so_far = first_element;
        max_inner_if_end:
        return max_so_far;
}

int main(void) {
    int nums[] = {1, 4, 3, 5, 2};
    int number = max(nums, 5);
    printf("%d\n", number);
    return 0;
}