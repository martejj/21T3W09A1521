#include <stdio.h>
#include <stdlib.h>

#define MAX_LENGTH 1000

int main(void) {

    char *home = getenv("HOME");

    if (home == NULL) {
        return 1;
    }

    char diary[MAX_LENGTH];

    snprintf(diary, MAX_LENGTH, "%s/.diary", home);

    FILE *f = fopen(diary, "r");

    if (f == NULL) {
        perror(diary);
        return 1;
    }

    int ch;

    while ((ch = fgetc(f)) != EOF) {
        putchar(ch);
    }

    fclose(f);

    return 0;
}