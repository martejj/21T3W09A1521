max:                                    # int max(int a[], int length) {
    addi $sp, -8
    sw $ra, 4($sp)
    sw $s0, 0($sp)                      # first_element

    lw $s0, ($a0)                       # int first_element = *a;

    bne $a1, 1, max_length_ne_1         # if (length != 1) goto max_length_ne_1;
    
    move $v0, $s0
    
    j max__epilogue                     # return first_element;

max_length_ne_1:
    addi $a0, 4                         # int *arg0 = a + 1; // Should actually be 4
    addi $a1, -1                        # int arg1 = length - 1;
    
    jal max                             # int max_so_far = max(arg0, arg1);
    
    ble $s0, $v0, max__epilogue         # if (first_element <= max_so_far) goto max_first_lte_max;
    
    move $v0, $s0                       # max_so_far = first_element;

max__epilogue:

    lw $ra, 4($sp)
    lw $s0, 0($sp)
    addi $sp, 8

    jr $ra                              # return max_so_far;

main:                                   # int main(void) {

    addi $sp, -4
    sw $ra, 0($sp)

    la $a0, nums
    li $a1, 5
    jal max                             # int m =  max(nums, 5);
    
    move $a0, $v0
    li $v0, 1
    syscall                             # printf("%d", m);
    
    li $v0, 11
    li $a0, 10                 
    syscall                             # printf("%c", '\n');

    lw $ra, 0($sp)
    addi $sp, 4
    
    li $v0, 0
    jr $ra                              # return 0;
.data 
nums: .word 9, 4, 0, 5, 2