#include <stdio.h>
#include <stdint.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>", argv[0]);
        return 1;
    }

    FILE *f = fopen(argv[1], "r");

    if (f == NULL) {
        perror(argv[1]);
        return 1;
    }

    uint32_t number;
    while (fscanf(f, "%x", &number) == 1) {
        int32_t low_8 = number & 0xff;
        if (low_8 & (1 << 7)) {
            low_8 = low_8 - 256;
        }
        printf("%d\n", low_8); 
    }
}