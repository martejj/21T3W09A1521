## Week 7 Tutorial Notes

How is assignment 1 going?

Today we will be covering:
* Final MIPS tutorial
* Quick recap of 2D Arrays in MIPS
* structs in MIPS
* Functions in MIPS
* For more revision on 2D arrays I made a recording with another class under 'W09A (Wed) Week: 1-5,7-10 Harrison Steyn+Abiram Nadarajah / recording_6' on blackboard

<br>

## How is the assignment going?

---

<br>

## How would we simplify the following array operations?

<br>

```c
    int *numbers = {1, 2, 3, 4, 5, 6, 7};
    int a = numbers[i]; // Simplify this line
```

<details>

```c
    a = *(numbers + 4*i)
```

<summary>Answer</summary>

</details>

<br>

```c
    char *characters = {'a', 'b', 'c', 'd', 'e', 'f', 'g'};
    characters[i] = 'z'; // Simplify this line
```

<details>

```c
    *(characters + i) = 'z';
```

<summary>Answer</summary>

</details>

<br>

```c
    int numbers[5][10];
    int a = numbers[row][col]; // Simplify this line
```

<details>

```c
    int a = *(numbers + 4*(10*row + col));
```

<summary>Answer</summary>

</details>

<br>

```c
    char characters[10][5];
    characters[row][col] = 'a'; // Simplify this line
```

<details>

```c
    *(characters + 5*row + col) = 'a';
```

<summary>Answer</summary>

</details>

<br>

### Notice the pattern

<details>

```c

    // 1-D arrays:
    numbers[i] => *(numbers + element_size*i);
    
    // 2-D arrays: (Note: number of cols == row size - theyre the same concept)
    numbers[row][col] => *(numbers + element_size*(num_cols*row + col));

```

<summary>Answer</summary>

</details>

<br>

---

## Q2 -  Complete structs.c

<br>

---

## What is a stack and why is it important for us in MIPS?

<details>

Stacks are FILO data structures. They are useful as functions are also FILO, the first function to run (main) is always the last function to run.

<summary>Answer</summary>

</details>

---

## What do the opcodes jr and jal do and what is stored in ra?

<details>

`jr` stands for jump register, and it sets the pc to the address stored in the $ra (return address) register.

`jal` stands for jump and link. It is a pseudo code for the following:

```s
    la $ra, return_point
    j some_function
return_point:
```

<summary>Answer</summary>

</details>

---

## Q4 - sum.s

Simplify and then convert the following code into MIPS

```c
    #include <stdio.h>

    int sum4(int a, int b, int c, int d);
    int sum2(int x, int y);

    int main(void) {
        int z = sum4(11, 13, 17, 19);
        printf("%d\n", z);
        return 0;
    }

    int sum4(int a, int b, int c, int d) {
        int e = sum2(a, b);
        int f = sum2(c, d);
        return sum2(e, f);
    }

    int sum2(int x, int y) {
        return x + y;
    }
```

---

## Q3 - max.s

Simplify and then convert the following code into MIPS

```c
    int max(int a[], int length) {
        int first_element = a[0];
        if (length == 1) {
            return first_element;
        } else {
            // find max value in rest of array
            int max_so_far = max(&a[1], length - 1);
            if (first_element > max_so_far) {
                max_so_far = first_element;
            }
            return max_so_far;
        }
    }

    int main(void) {
        int nums[] = {1, 4, 3, 5, 2};
        printf("%d\n", max(nums, 5));
        return 0;
    }

```

## Q5 - more structs

What offsets do the values in the following structs have?

```c
    struct _coord {
        double x;
        double y;
    };
```
<br>

<details>
x is the first field, so has offset 0. Since x is 8 bytes long, y will have offset 8. The struct holds two 8-byte fields, both of which are correctly aligned, so no padding is required, and so the overall size of the struct is 16 bytes.
<summary>Answer</summary>
</details>

<br>

```c
    typedef struct _node Node;
    struct _node {
        int value;
        Node *next;
    };
```

<br>

<details>
value is the first field, so has offset 0. Since value is 4 bytes long, next will have offset 4. Since pointers are also 4 bytes long, and no padding is required, the overall size of the struct is 8 bytes.
<summary>Answer</summary>
</details>

<br>

```c
    struct _enrolment {
        int stu_id;         // e.g. 5012345
        char course[9]:     // e.g. "COMP1521"
        char term[5];       // e.g. "17s2"
        char grade[3];      // e.g. "HD"
        double mark;        // e.g. 87.3
    };
```

<br>

<details>
stu_id is the first field, so has offset 0. Since stu_id is 4 bytes long, course has offset 4. course is 9 bytes long, but since the following field only needs byte alignment, term has offset 13. Similarly, grade has offset 18. The mark field requires word alignment, and so it needs some padding to move the offset from 21 to 24. Taking into account that double values are stored in 8 bytes, the overall size of the struct is 32 bytes.
<summary>Answer</summary>
</details>

<br>

```c
    struct _queue {
        int nitems;     // # items currently in queue
        int head;       // index of oldest item added
        int tail;       // index of most recent item added
        int maxitems;   // size of array
        Item *items;    // malloc'd array of Items
    };
```

<br>

<details>
nitems is the first field, so has offset 0. head has offset 4, tail has offset 8, maxitems has offset 12, and items has offset 16. It doesn't matter what the size of an Item is, or how any Items there are, since they are stored outside the struct. Since the pointer is 4 bytes long, and all the values are word-aligned, the overall size of the struct is 20 bytes.
<summary>Answer</summary>
</details>

<br>