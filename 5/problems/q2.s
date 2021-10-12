main:                                       # int main(void)
                                            # $t0 => i
    li $t0, 0                               # int i = 0;

main_do_start:
    addi $t0, $t0, 1                        # i++;

    li $v0, 1
    move $a0, $t0  
    syscall                                 # printf("%d", i);

    li $v0, 11
    li $a0, 10
    syscall                                 # printf("\n");
    
    bge $t0, 10, main_do_end                # if (i >= 10) goto main_do_end;

    j main_do_start                         # goto main_do_start;
main_do_end:

    li $v0, 0
    jr $ra                                  # return 0;