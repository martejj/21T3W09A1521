#include <stdio.h>

main:                                               # int main(void) {
                                                    # t0, t1, t2 => i, input_value, output_value
    li $t0, 0                                       # int i = 0;

main_scan_start:
    bge $t0, 10, main_scan_end                      # if (i >= 10) goto main_scan_end;

    # int input_value; 

    li $v0, 5           
    syscall                                         # scanf("%d", &input_value);

    li $t1, 4                                       # $t1 = 4
    mul $t1, $t1, $t0                               # $t1 = 4*i
    la $t2, numbers
    add $t1, $t1, $t2                               # $t1 = 4*i + numbers
    
    sw $v0, ($t1)                                   # *(numbers + 4*i) = input_value;

    addi $t0, $t0, 1                                # i++;
    j main_scan_start                               # goto main_scan_start;
main_scan_end:

    li $t0, 0                                       # i = 0;
main_print_start:
    bge $t0, 10, main_print_end                     # if (i >= 10) goto main_print_end;

    li $t1, 4                                       # $t1 = 4
    mul $t1, $t1, $t0                               # $t1 = 4*i
    la $t2, numbers
    add $t1, $t1, $t2                               # $t1 = 4*i + numbers

    lw $a0, ($t1)                                   # int output_value = *(numbers + 4*i);
    li $v0, 1                                       
    syscall                                         # printf("%d", output_value);

    li $v0, 11
    li $a0, 10
    syscall                                         # printf("%c", '\n');

    addi $t0, $t0, 1                                # i++;

    j main_print_start                              # goto main_print_start;
main_print_end:

    li $v0, 0
    jr $ra                                          # return 0;

.data
numbers: .word 0 0 0 0 0 0 0 0 0 0                      # int numbers[10] = {0};