#include <stdio.h>

int main(int argc, char *argv[]) {

    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    }

    char *pathname = argv[1];

    FILE *f = fopen(pathname, "w");

    if (f == NULL) {
        perror(pathname);
        return 1;
    }
    
    int ch;
    while ((ch = fgetc(stdin)) != EOF) {
        if (ch == '\n') {
            break;
        }
        fputc(ch, f);
    }

    return 0;

}