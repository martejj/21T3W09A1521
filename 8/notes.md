# Tutorial 8 notes

Today we will cover:
* Not MIPS!
* File I/O

<br>

---

## Q2 - We say that the Unix filesystem is tree-structured, with the directory called / as the root of the tree, e.g.,

### a - What is the full pathname of COMP1521's web directory?

<details>
COMP1521's web directory is /home/cs1521/web
<summary>Answer</summary>
</details>

<br>

### b - Which directory is ~jas/../..?

<details>
~jas is shorthand for /home/jas, so ~jas/../.. is the root directory (/)
<summary>Answer</summary>
</details>

<br>

### c - Links to the children of a given directory are stored as entries in the directory structure. Where is the link to the parent directory stored?

<details>
The link to the parent directory is also stored as an entry in the directory structure, called ..
<summary>Answer</summary>
</details>

<br>

### d - What kind of filesystem object is cat?

<details>
cat is a regular file, which happens to contain executable machine code.
<summary>Answer</summary>
</details>

<br>

### e - What kind of filesystem object is home?

<details>
home is a directory.
<summary>Answer</summary>
</details>

<br>

### f - What kind of filesystem object is tty0?

<details>
tty0 is a character special file, a file that represents a device which can read and write a byte-stream, which is typically interpreted as characters.
<summary>Answer</summary>
</details>

<br>

### g - What kind of filesystem object is a symbolic link? What value does it contain?

<details>
A symbolic link is a special kind of file that simply contains the name of another file.
<summary>Answer</summary>
</details>

<br>

### h - Symbolic links change the filesystem from a tree structure to a graph structure. How do they do this?

<details>
Symbolic links produce a graph because they allow arbitrary links between filesystem objects. Without symlinks, the only "connections" in the filesystem are parent/child links, which produce a tree.
<summary>Answer</summary>
</details>

<br>

---

## Q3 - The stat() and lstat() functions both take an argument which is a pointer to a struct stat object, and fill it with the meta-data for a named file.

On Linux, a struct stat contains the following fields (among others, which have omitted for simplicity):

```c
    struct stat {
        ino_t st_ino;         /* inode number */
        mode_t st_mode;       /* protection */
        uid_t st_uid;         /* user ID of owner */
        gid_t st_gid;         /* group ID of owner */
        off_t st_size;        /* total size, in bytes */
        blksize_t st_blksize; /* blocksize for filesystem I/O */
        blkcnt_t st_blocks;   /* number of 512B blocks allocated */
        time_t st_atime;      /* time of last access */
        time_t st_mtime;      /* time of last modification */
        time_t st_ctime;      /* time of last status change */
    };
```

---

## Q4 - Consider the following (edited) output from the command ls -l ~cs1521:

```sh
    drwxr-x--- 11 cs1521 cs1521 4096 Aug 27 11:59 17s2.work
    drwxr-xr-x  2 cs1521 cs1521 4096 Aug 20 13:20 bin
    -rw-r-----  1 cs1521 cs1521   38 Jul 20 14:28 give.spec
    drwxr-xr-x  3 cs1521 cs1521 4096 Aug 20 13:20 lib
    drwxr-x--x  3 cs1521 cs1521 4096 Jul 20 10:58 public_html
    drwxr-xr-x 12 cs1521 cs1521 4096 Aug 13 17:31 spim
    drwxr-x---  2 cs1521 cs1521 4096 Sep  4 15:18 tmp
    lrwxrwxrwx  1 cs1521 cs1521   11 Jul 16 18:33 web -> public_html
```

### a - Who can access the 17s2.work directory?

<details>
The user cs1521, and any member of the cs1521 group can cd into the 17s2.work directory and list the directory contents. The user cs1521 can also create new entries in 17s2.work.
<summary>Answer</summary>
</details>

<br>

### b - What operations can a typical user perform on the public_html directory?

<details>
Assume that typical user means someone who is not a member of the cs1521 group. Such a user can cd into the directory, but they cannot list the contents of the directory. If they know the name of a file in the directory, they can also open that file (assuming they have read permission on the file).
<summary>Answer</summary>
</details>

<br>

### c - What is the file web?

<details>
The file web is a symbolic link (or symlink). It effectively makes web an alternative name for the public_html directory.
<summary>Answer</summary>
</details>

<br>

### d - What is the difference between stat("web", &info) and lstat("web", &info)? (where info is an object of type (struct stat))

<details>
The function call stat("web", &info) follows the symlink, and places meta-data about the public_html directory in the info struct.

The function call lstat("web", &info) places meta-data about the symlink itself into the info struct.
<summary>Answer</summary>
</details>

<br>

## Q5 - chmod_if_public_write.c

Write a C program, chmod_if_public_write.c, which is given 1+ command-line arguments which are the pathnames of files or directories
If the file or directory is publically-writeable, it should change it to be not publically-writeable, leaving other permissions unchanged.

It also should print a line to stdout as in the example below.

```sh
    $ dcc chmod_if_public_write.c -o chmod_if_public_write
    $ ls -ld file_modes.c file_modes file_sizes.c file_sizes
    -rwxr-xrwx 1 z5555555 z5555555 116744 Nov  2 13:00 file_sizes
    -rw-r--r-- 1 z5555555 z5555555    604 Nov  2 12:58 file_sizes.c
    -rwxr-xr-x 1 z5555555 z5555555 222672 Nov  2 13:00 file_modes
    -rw-r--rw- 1 z5555555 z5555555   2934 Nov  2 12:59 file_modes.c
    $ ./file_modes file_modes file_modes.c file_sizes file_sizes.c
    removing public write from file_sizes
    file_sizes.c is not publically writable
    file_modes is not publically writable
    removing public write from file_modes.c
    $ ls -ld file_modes.c file_modes file_sizes.c file_sizes
    -rwxr-xr-x 1 z5555555 z5555555 116744 Nov  2 13:00 file_sizes
    -rw-r--r-- 1 z5555555 z5555555    604 Nov  2 12:58 file_sizes.c
    -rwxr-xr-x 1 z5555555 z5555555 222672 Nov  2 13:00 file_modes
    -rw-r--r-- 1 z5555555 z5555555   2934 Nov  2 12:59 file_modes.c
```

<br>

---

## Q7 - What does `fopen(3)` do? What are its parameters and return value?

<details>

`FILE *fopen(const char *pathname, const char *mode);`

<summary>Answer</summary>

</details>

<br>

---

## Q8 - What are some circumstances when `fopen(3)` returns `NULL`?

<details>

When something went wrong.

* If the file you tried to open for reading does not exist.
* If you try to open a file you do not have permission to access.
* If the "mode" string was invalid.
* If the system is out of memory.
* If you try to create a file and your quota of disk blocks or inodes has been exhausted.
* If the pathname was too long.

<summary>Answer</summary>

</details>

<br>

---

## Q9 - How do you print the specific reason that caused `fopen(3)` to return `NULL`?

<details>

Short story: `perror(char *path)`

The global variable errno is given a value that indicates what went wrong (see tutorial 1, question 8).

The library function strerror(3) turns known values of errno into strings, which you could just print out.

```c
    #include <errno.h>      // for `errno' values
    #include <string.h>     // for `strerror(3)`

    errno = ENOENT;
    char *error = strerror(errno);
    assert(strcmp(error, "No such file or directory") == 0);
```

Because this is such a common operation, there aren't many library functions that do this. perror(3) is the only standard way to do this:

```c
    #include <errno.h>      // for `errno' values
    #include <stdio.h>      // for `perror(3)'

    errno = ENOENT;
    perror("");             // prints "No such file or directory"
```

There are several nonstandard ways to do this; the most common is warn(3):

```c
    #include <err.h>        // for `err(3)', `warn(3)', etc.
    #include <errno.h>      // for `errno' values

    errno = ENOENT;
    warn(NULL);             // prints "<progname>: No such file or directory"
```

Often, though, you want to immediately end the program if one of these errors occurs: there is no single standard function to do this, but err(3) (related to warn(3)) is one very common option:

```c
    #include <err.h>        // for `err(3)', `warn(3)', etc.
    #include <errno.h>      // for `errno' values

    errno = ENOENT;
    err(1, NULL);           // prints "<progname>: No such file or directory"
                            // and terminates the program with exit code 1.
```

Similarly, the GNU C library provides error(3):

```c
    #include <error.h>      // for `error(3)', etc.
    #include <errno.h>      // for `errno' values

    error(1, ENOENT, NULL); // prints "<progname>: No such file or directory"
                            // and terminates the program with exit code 1.
```

<summary>Answer</summary>

</details>

---

<br>

## Q10-12 - Write programs to do each of the following:

They should take a file name as the first command line argument and if given an incorrect number of arguments, or if there was an error opening the file, it should print a suitable error message.

<br>

### `read_line.c` - Read a line from a file

<br>

### `write_line.c` - Write a line to a file

<br>

### `append_line.c` - Append a line to a file

<br>

---

## Q13 - Why should you not use `fgets(3)` or `fputs(3)` with binary data?

<details>

`fgets(3)` or `fputs(3)` work with C strings: arrays of bytes, terminated with a zero byte, `'\0'`.

Binary data may naturally contain zero bytes, and thus cannot be treated as a normal string, therefore functions that work on strings (including `fgets(3)` or `fputs(3)`) will not behave correctly.

<summary>Answer</summary>

</details>

<br>

---

## Q14 - What does the following `printf(3)` statement display?

```c
    printf ("%c%c%c%c%c%c", 72, 101, 0x6c, 108, 111, 0x0a);
```

<details>

`Hello!\n`

<summary>Answer</summary>

</details>

<br>

---

## Q15 - How many different values can `fgetc(3)` return?

<details>

<summary>Answer</summary>

257.

It returns one of 256 values (0…255) if it manages to read a byte, and a special value EOF if it can't.

Often, `<stdio.h>` will contain something like:

```c
    #define EOF (-1)
```

</details>

<br>

---

## Q16 - Why are the names of `fgetc(3)`, `fputc(3)`, `getc(3)`, `putc(3)`, `putchar(3)`, and `getchar(3)` misleading?

<details>

Programmers often think they are only for character I/O, but all of them just read or write a byte. `fgetb`, `fputb`, `getb`, `putb`, `putbyte`, and `getbyte` would have been better names.

<summary>Answer</summary>

</details>

<br>

---
