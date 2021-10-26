# int sum4(int a, int b, int c, int d);
# int sum2(int x, int y);

main:                                   # int main(void) {

    addi $sp, -4
    sw $ra, 0($sp)

    li $a0, 11
    li $a1, 13
    li $a2, 17
    li $a3, 19
    jal sum4                            # int z = sum4(11, 13, 17, 19);
    
    move $a0, $v0                       
    li $v0, 1                           
    syscall                             # printf("%d", z);
    
    li $v0, 11
    li $a0, 10
    syscall                             # printf("%c", '\n');

    lw $ra, 0($sp)
    addi $sp, 4

    jr $ra                              # return 0;

sum4:                                   # int sum4(int a, int b, int c, int d) {
                                        # a0, a1, a2, a3 => a, b, c, d

    addi $sp, -16
    sw $s0, 12($sp)                     # e
    sw $a2, 8($sp)                      # c
    sw $a3, 4($sp)                      # d
    sw $ra, 0($sp)

    jal sum2                            # int e = sum2(a, b);

    move $s0, $v0

    lw $a0, 8($sp)                      # Get c
    lw $a1, 4($sp)                      # Get d

    jal sum2                            # int f = sum2(c, d);

    
    move $a0, $s0
    move $a1, $v0
    jal sum2
    lw $ra, 0($sp)
    lw $s0, 12($sp)
    addi $sp, 16                        # return sum2(e, f);

    jr $ra

sum2:                                   # int sum2(int x, int y) {
                                        # $a0, $a1 => x, y
                                        # put into $v0 x + y
    li $a2, 0
    li $a3, 0
    li $t0, 0
    add $v0, $a0, $a1
    jr $ra                              # return x + y;
