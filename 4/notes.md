# Tutorial 4 notes

This week we will cover:
* MIPS
* MIPS
* More MIPS

--- 

## What is MIPS?

<details>

It is an assembly language which is a special purpose built programming language that is meant to be read by the CPU. But also, youre probably getting sick of this, in effect it is another way of reading binary (same with ASCII, Two's Complement, Floats, etc). In assembly languages the commands we write down are able to be directly converted into binary that a specifically designed CPU can read and execute. Most assembly languages are abstracted and have symbolic references (e.g. labels, register names) and pseudoinstructions.

<br>

<image src="images/mips_op.PNG"/>

<br>

These operations are all stored in the code section of the program memory

<br>

<image src="images/memory.png"/>

<br>

Somewhere there is code that reads this code and executes it in a loop like this

<image src="images/pc_pseudo.PNG"/>

<br>

<summary>Answer</summary>

</details>

---

## Q1 - What are registers? Which do we use and what to we use them for?

<details>

In effect registers are equivalent to named variables. They are memory spots located directly on the CPU, each one word in size (Note: A word is defined as the size of the memory bus on a CPU). They are numbered 0-31 but have pseudonames that we prefer to use thanks to spim.

Register | Names   
---------|----------
`$0`        | `$zero`     
`$1`        | `$at`     
`$2`,`$3`        | `$v0`, `$v1`     
`$4`, `$5` ,`$6` ,`$7`        | `$a0`, `$a1`, `$a2`, `$a3`
`$8`, `$9`, `$10`, `$11`, `$12`, `$13`, `$14`, `$15`        | `$t0`, `$t1`, `$t2`, `$t3`, `$t4`, `$t5`, `$t6`, `$t7`
`$16`, `$17`, `$18`, `$19`, `$20`, `$21` ,`$22`, `$23`        | `$s0`, `$s1`, `$s2`, `$s3`, `$s4`, `$s5`, `$s6`, `$s7`
`$24`, `$25`        | `$t8`, `$t9`     
`$26`, `$27`        | `$k0`, `$k1`     
`$28`        | `$gp`
`$29`        | `$sp`    
`$30`       | `$fp` or `$s8`   
`$31`       | `$ra`

<summary>Answer</details>

</details>

---

## Q2 - square.s

Convert the following to MIPS

```c
    // print the square of a number
    #include <stdio.h>

    int main(void) {
        int x, y;
        printf("Enter a number: ");
        scanf("%d", &x);
        y = x * x;
        printf("%d\n", y);
        return 0;
    }
```

---

## Q3a - Convert this statement into MIPS

```c

    if (1 < 2) {
        printf("IF");
    } else {
        printf("ELSE")
    }

```

<details>

Ugly:

```c

    blt 1, 2, if
    bge 1, 2, else
if:
    #printf("IF");
    j end
else:
    #printf("ELSE");
end:

```

Better:

```c

    bge 1, 2, else
    #printf("IF");
    j end
else:
    #printf("ELSE");
end:

```

<summary>Answer</details>

</details>

## Q3b - too_big.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    #include <stdio.h>

    int main(void) {
        int x, y;
        printf("Enter a number: ");
        scanf("%d", &x);

        if (x > 46340) {
            printf("square too big for 32 bits\n");
        } else {
            y = x * x;
            printf("%d\n", y);
        }

        return 0;
    }
```

---

## Q4 - small_medium_big.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    #include <stdio.h>

    int main(void) {
        int x;
        printf("Enter a number: ");
        scanf("%d", &x);

        if (x > 100 && x < 1000) {
            printf("medium\n");
        } else {
            printf("small/big\n");
        }
    }

```

---

## Q5a - Convert this statement into MIPS

```c
    int i = 0;
    while (i < 10) {
        i++;
    }
```

<details>

Ugly:

```c
    li $t0, 0
condition:
    blt $t0, 10, while
    j end
while:
    addi $t0, 1
    j condition
end:
```

Better:

```c
    li $t0, 0
while:
    bge $t0, 10, end
    addi $t0, 1
    j while
end:
```

<summary>Answer</details>

</details>

## Q5b - while.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    #include <stdio.h>

    int main(void) {
        for (int x = 24; x < 42; x += 3) {
            printf("%d\n",x);
        }
    }
```

---

## Q6 - triangle.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    // print a triangle
    #include <stdio.h>

    int main (void) {
        for (int i = 1; i <= 10; i++) {
            for (int j = 0; j < i; j++) {
                printf("*");
            }
            printf("\n");
        };
        return 0;
    }
```

---

## Q7 - factorial.s

Convert the following into simple C - use only simple if's and goto's.

Then convert it into MIPS.

```c
    // Simple factorial calculator  - without error checking

    #include <stdio.h>

    int main (void) {
        int n;
        printf("n  = ");
        scanf("%d", &n);

        int fac = 1;
        for (int i = 1; i <= n; i++) {
            fac *= i;
        }

        printf ("n! = %d\n", fac);
        return 0;
    }
```

---

## Does the following instruction work?

```sh

    li $t0, 0xF356A2                    # 0xF356A2 = 15,974,176

```

<details>

Even though the command takes up a space of 5 + 6 + 4*6 = 35 bits it still works.

This is as it is actually a pseudoinstruction that decomposes into the following two commands

```sh

    lui $at, 0x00F3
    ori $t0, $at, 0x56A2

```

### examples of pseduoinstructions are:

* abs
* blt
* bgt
* ble
* neg
* not
* bge
* li
* la
* move
* sge
* sgt

<summary>Answer</summary>

</details>