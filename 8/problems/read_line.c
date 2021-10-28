#include <stdio.h>

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char *pathname = argv[1];

    FILE *f = fopen(pathname, "r");

    if (f == NULL) {
        perror(pathname);
        return 1;
    }
    int ch;
    while ((ch = fgetc(f)) != EOF) {
        if (ch == '\n') {
            break;
        }
        fputc(ch, stdout);
    }

    return 0;

}