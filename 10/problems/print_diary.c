#include <stdio.h>
#include <stdlib.h>

#define MAX_LENGTH 1000

int main(void) {

    char *home_directory = getenv("HOME");

    if (home_directory == NULL) {
        printf("Hey your home isnt right mate\n");
        return 1;
    }

    char diary_pathname[MAX_LENGTH];

    snprintf(diary_pathname, MAX_LENGTH, "%s/.diary", home_directory);
    
    FILE *f = fopen(diary_pathname, "r");

    if (f == NULL) {
        perror(diary_pathname);
        return 1;
    }

    int ch;

    while ((ch = fgetc(f)) != EOF) {
        putchar(ch);
    }

    fclose(f);

}