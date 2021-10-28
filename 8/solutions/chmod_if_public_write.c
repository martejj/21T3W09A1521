#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/stat.h>

int main(int argc, char *argv[]) {
    struct stat s;

    if (argc != 2) {
        printf("Incorrect number of arguments");
        printf("Usage: %s [filename]", argv[0]);
    }

    if (stat(argv[1], &s) != 0) {
        perror(argv[1]);
        return 1;
    }

    mode_t mode = s.st_mode;

    if (!(mode & S_IWOTH)) {
        printf("Not publicly writable");
        return 0;
    }

    mode_t new_mode = mode & ~S_IWOTH;

    if (chmod(argv[1], new_mode) != 0) {
        perror(argv[1]);
        return 1;
    } 
    
    return 0;
}