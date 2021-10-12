main:                                               # int main(void) {
                                                    # $t0 => i
    li $t0, 0                                       # int i = 0;

main_do:                                            # do {
    addi $t0, $t0, 1                                # i++;

    li $v0, 1
    move $a0, $t0
    syscall                                         # printf("%d", i);

    li $v0, 11
    li $a0, '\n'    
    syscall                                         # printf("\n");
    
    blt $t0, 10, main_do                            # } while (i < 10);

    li $v0, 0
    jr $ra                                          # return 0;
