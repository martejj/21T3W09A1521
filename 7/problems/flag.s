main:                                       # main(void) {
                                            # $t0, $t1 => row, col
    li $t0, 0                               # int row = 0;

main_outer_start:
    bge $t0, 6, main_outer_end              # if (row >= 6)  goto main_outer_end;

    li $t1, 0                               # int col = 0;
main_inner_start:
    bge $t1, 12, main_inner_end             # if (col >= 12) goto main_inner_end;

    li $t2, 12                              # $t2 = 12
    mul $t2, $t2, $t0                       # $t2 = 12*row
    la $t3, flag     
    add $t2, $t2, $t3                       # $t2 = flag + 12*row
    add $t2, $t2, $t1                       # char *address = col + flag + 12*row;

    li $v0, 11
    lb $a0, ($t2)
    syscall                                 # printf ("%c", *address);

    addi $t1, $t1, 1                        # col++;

    j main_inner_start                      # goto main_inner_start;

main_inner_end:

    li $v0, 11
    li $a0, 10
    syscall                                 # printf ("%c" '\n');

    addi $t0, $t0, 1                        # row++;

    j main_outer_start                      # goto main_outer_start;

main_outer_end:
    jr $ra                                  # return 0;

.data
flag:
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.' '.'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'
    .byte '#' '#' '#' '#' '#' '.' '.' '#' '#' '#' '#' '#'