# Tutorial 10 notes

Today we are covering:

* Environment Variables
* Virtual Memory
* Kahoot

<br>

---

## What are environment variables? Why are they used?

<details>

Environment variables are kind of like global variables for a OS. They store important information that programs may need, such as the current directory ($PWD), the home directory ($HOME), and the locations of executables ($PATH) (This isnt an extensive list). You can also set your own environment variables by running `VARIABLE_NAME=value` in the terminal, note this will not persist after your current terminal is closed - if you want one to persist then add it to the .bashrc file in your home directory.

<summary>Answer</summary>

</details>

<br>

---

## Q1 - Write a C program, `print_diary.c`, which prints the contents of the file `$HOME/.diary` to stdout

<br>

---

## What is paging?

<details>

It is in effect the act of copying something (generally a contiguous block of memory) to and from memory.

<summary>Answer</summary>

</details>

<br>

---

## What are some memory management layouts we could use in computer science?

<details>

Single proccess (Monoprogramming):
* Only allow the computer to run one thing at any given time. It can be done with or without paging. Pros: Quick, good if we only have one process to run. Cons: Cant handle more than 1 job or if done with paging, lots of waste on IO.

Multiprogramming:
* Split Memory into equal sized blocks, one per process. Lot of wasted space (AKA fragmentation).
* Split memory into variable (e.g. powers of two) blocks, one per process. Cons: potentially unpredictable requirements of processes. Potentially lots of spaces wasted.
* Use malloc-like process to get space (leads to heaps of issues, look up issues with malloc)

All have their use cases but modern multipurpose OS's use virtual memory.

(Sometimes they use inverted page tables too but look that up yourself)

<summary>Answer</summary>

</details>

<br>

---

## What is virtual memory?

Also, what is virtual vs. physical pages and addresses?

<br>

---

## Simulate the LRU page replacement strategy being implemented for 

Assume we have 6 virtual memory pages and 4 physical memory pages and are using a least-recently-used (LRU) replacement strategy.

What will happen if these virtualmemory pages were accessed?

`5 3 5 3 0 1 2 2 3 5`
