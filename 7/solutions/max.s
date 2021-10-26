max:                                        # int max(int a[], int length) {
                                            # $a0 => a
                                            # $a1 => length
                                            # $s0 => first_element
    addi $sp, -8
    sw $ra, 4($sp)
    sw $s0, 0($sp)
    
    lw $s0, ($a0)                           # int first_element = a[0];

    bne $a1, 1, max_outer_else              # if (length != 1) goto max_outer_else;
    
    lw $ra, 4($sp)
    lw $s0, 0($sp)
    addi $sp, 8

    jr $ra                                  # return first_element;

max_outer_else:
                                            # find max value in rest of array

    addi $a0, $a0, 4
    addi $a1, $a1, -1
    jal max                                 # int max_so_far = max(&a[1], length - 1);
                                            # $v0 => max_so_far

    ble $s0, $v0, max_inner_if_end          # if (first_element <= max_so_far) goto max_inner_if_end;

    move $v0, $s0                           # max_so_far = first_element;
max_inner_if_end:

    lw $ra, 4($sp)
    lw $s0, 0($sp)
    addi $sp, 8

    jr $ra                                  # return max_so_far;

main:                                       # int main(void) {
    
    addi $sp, -4
    sw $ra, 0($sp)

    la $a0, nums
    li $a1, 5

    jal max                                 # int number = max(nums, 5);
    
    move $a0, $v0
    li $v0, 1
    syscall                                 # printf("%d", number);
    
    li $a0, 10
    li $v0, 11
    syscall                                 # printf("%c", '\n');

    lw $ra, 0($sp)
    addi $sp, 4

    li $v0, 0
    jr $ra                                  # return 0;

    .data
nums: .word 1 11 5 10 2