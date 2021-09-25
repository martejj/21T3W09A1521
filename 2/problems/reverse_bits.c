#include <stdio.h>
#include <assert.h>

typedef unsigned int Word; // size = 32 bits

Word reverseBits(Word w) {
    Word result = 0;
    int i = 0;
    while (i < 32) {

        int isOn = w & (1 << i);
        // w & 1 => isOn will be 0 if the bit is off or !0 if the bit is on.

        // 0 => false
        // 0! => true
        if (isOn) {
            result = result | (1 << (31 - i));
            // set => |
            // get => &
        }

        i++;
    }

    return result;
}

// testing
int main(void) {
    Word w1 = 0x01234567;
    // 0000 => 0000 = 0
    // 0001 => 1000 = 8
    // 0010 => 0100 = 4
    // 0011 => 1100 = C
    // 0100 => 0010 = 2
    // 0101 => 1010 = A
    // 0110 => 0110 = 6
    // 0111 => 1110 = E
    assert(reverseBits(w1) == 0xE6A2C480);
    puts("All tests passed!");
    return 0;
}