main:                                   # int main(void)
                                        # x => $t0
    
    li $t0, 24                          # int x = 24;
loop:
    bge $t0, 42, end                    # if (x >= 42) goto end;

    li $v0, 1
    move $a0, $t0
    syscall                             # printf("%d", y);

    li $v0, 11
    li $a0, '\n'
    syscall                             # printf("%c", '\n');

    add $t0, $t0, 3                     # x = x + 3;
    
    j loop                              # goto loop;

end:
    jr $ra                              # return 0;
