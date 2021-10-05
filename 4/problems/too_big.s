# print the square of a number

main:                               # int main(void)
                                    # int x, y => $t0, $t1

    li $v0, 4
    la $a0, prompt
    syscall                             # printf("Enter a number: ");

    li $v0, 5
    syscall
    move $t0, $v0                       # scanf("%d", &x);

    ble $t0, 46340, else_condition      # if (x <= 46340) goto else_condition;

    li $v0, 4
    la $a0, error
    syscall                             # printf("square too big for 32 bits\n");
    
    j end                               # goto end;

else_condition:

    mul $t1, $t0, $t0                   # y = x * x;

    li $v0, 1
    move $a0, $t1
    syscall                             # printf("%d", y);

    li $v0, 11
    li $a0, '\n'
    syscall                             # printf("%c", '\n');

end:
    jr $ra                              # return 0;

    .data
prompt:
    .asciiz "Enter a number: "
error:
    .asciiz "square too big for 32 bits\n"