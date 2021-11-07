# Tutorial 9 notes

Today we will cover:
* Misc File operations 
* Assignment 2
* MyExperience

<br>

---

## Assignment 2 is released, what are we doing in it and what have we learnt from assignment 1?

<details>

Youre writing a file archiver (similar to zip on windows or tar on linux).

https://cgi.cse.unsw.edu.au/~cs1521/21T3/assignments/ass2/index.html

<summary>Answer</summary>

</details>

<br>

---

## Q1 - Explain the output of print_bytes below:

```sh
    $ echo hello Andrew >hi.txt
    $ echo Good bye Andrew >bye.txt
    $ 1521 chicken -c a.egg hi.txt bye.txt
    Adding: hi.txt
    Adding: bye.txt
    $ print_bytes a.egg
    byte    0:  99 0x63 'c'
    byte    1:  56 0x38 '8'
    byte    2:  45 0x2d '-'
    byte    3: 114 0x72 'r'
    byte    4: 119 0x77 'w'
    byte    5:  45 0x2d '-'
    byte    6: 114 0x72 'r'
    byte    7:  45 0x2d '-'
    byte    8:  45 0x2d '-'
    byte    9: 114 0x72 'r'
    byte   10:  45 0x2d '-'
    byte   11:  45 0x2d '-'
    byte   12:   6 0x06
    byte   13:   0 0x00
    byte   14: 104 0x68 'h'
    byte   15: 105 0x69 'i'
    byte   16:  46 0x2e '.'
    byte   17: 116 0x74 't'
    byte   18: 120 0x78 'x'
    byte   19: 116 0x74 't'
    byte   20:  13 0x0d
    byte   21:   0 0x00
    byte   22:   0 0x00
    byte   23:   0 0x00
    byte   24:   0 0x00
    byte   25:   0 0x00
    byte   26: 104 0x68 'h'
    byte   27: 101 0x65 'e'
    byte   28: 108 0x6c 'l'
    byte   29: 108 0x6c 'l'
    byte   30: 111 0x6f 'o'
    byte   31:  32 0x20 ' '
    byte   32:  65 0x41 'A'
    byte   33: 110 0x6e 'n'
    byte   34: 100 0x64 'd'
    byte   35: 114 0x72 'r'
    byte   36: 101 0x65 'e'
    byte   37: 119 0x77 'w'
    byte   38:  10 0x0a
    byte   39: 161 0xa1
    byte   40:  99 0x63 'c'
    byte   41:  56 0x38 '8'
    byte   42:  45 0x2d '-'
    byte   43: 114 0x72 'r'
    byte   44: 119 0x77 'w'
    byte   45:  45 0x2d '-'
    byte   46: 114 0x72 'r'
    byte   47:  45 0x2d '-'
    byte   48:  45 0x2d '-'
    byte   49: 114 0x72 'r'
    byte   50:  45 0x2d '-'
    byte   51:  45 0x2d '-'
    byte   52:   7 0x07
    byte   53:   0 0x00
    byte   54:  98 0x62 'b'
    byte   55: 121 0x79 'y'
    byte   56: 101 0x65 'e'
    byte   57:  46 0x2e '.'
    byte   58: 116 0x74 't'
    byte   59: 120 0x78 'x'
    byte   60: 116 0x74 't'
    byte   61:  16 0x10
    byte   62:   0 0x00
    byte   63:   0 0x00
    byte   64:   0 0x00
    byte   65:   0 0x00
    byte   66:   0 0x00
    byte   67:  71 0x47 'G'
    byte   68: 111 0x6f 'o'
    byte   69: 111 0x6f 'o'
    byte   70: 100 0x64 'd'
    byte   71:  32 0x20 ' '
    byte   72:  98 0x62 'b'
    byte   73: 121 0x79 'y'
    byte   74: 101 0x65 'e'
    byte   75:  32 0x20 ' '
    byte   76:  65 0x41 'A'
    byte   77: 110 0x6e 'n'
    byte   78: 100 0x64 'd'
    byte   79: 114 0x72 'r'
    byte   80: 101 0x65 'e'
    byte   81: 119 0x77 'w'
    byte   82:  10 0x0a
    byte   83: 221 0xdd
```

<br>

---

## Q2 - This is the initial code for the assignment. Discuss how you compile this code, how these function are called and what values the function arguments might take?

<details>

See `starter_code.c`.

<summary>Answer</summary>

</details>

<br>

---

## Im confused, what is a hash function?

<details>

Its best thought of as a 'summary' function - it tries to uniquely summarise the file in a set number of bits. In the case for this assignment its hash size is 8 bits (256 unique descriptors for files, which isnt very much! Cryptographic hash functions like SHA256 used in bitcoin use 256 bit hashes ~ 1*10^77 unique values). 

The hash function in this assignment is provided in chicken_hash.c and is a function of the current byte and the hash of the previous byte.

**Not needed** for this assignment but if you want in more depth explanations computerpile has good explanations.

https://www.youtube.com/watch?v=DMtFhACPnTY&ab_channel=Computerphile

3Blue1Brown also has some good videos on their usage in bitcoin.

https://www.youtube.com/watch?v=bBC-nXj3Ng4&ab_channel=3Blue1Brown

https://www.youtube.com/watch?v=S9JGmA5_unY&ab_channel=3Blue1Brown

<summary>Answer</summary>

</details>

<br>

---

## Q8 - `print_file_bits.c`

Write a C program, print_file_bits.c, which given as a command line arguments the name of a file contain 32-bit hexadecimal numbers, one per line, prints the low (least significant) bytes of each number as a signed decimal number (-128..127).

<br>

---

## Q9 - Discuss `compile.c`

<br>

---