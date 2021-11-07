#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 1;
    } 

    char *pathname = argv[1];
    struct stat s;

    if (stat(pathname, &s) != 0) {
        perror(pathname);
        return 1;
    }

    mode_t mode = s.st_mode;

    // 000 000 000

    if (mode & S_IWOTH) {
        // File is publicly writable
        printf("Removing Public Write!\n");
        mode_t new_permissions = mode & ~S_IWOTH;

        if (chmod(pathname, new_permissions) != 0) {
            perror(pathname);
            exit(1);
        }
    } else {
        printf("Not Public Writable!\n");
    }

    return 0;
}