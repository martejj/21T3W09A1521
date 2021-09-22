#include <stdint.h>

#define READING   0x01
#define WRITING   0x02
#define AS_BYTES  0x04
#define AS_BLOCKS 0x08
#define LOCKED    0x10

int main(void) {

    // Mark the device as locked for reading bytes
    uint8_t device = (LOCKED | READING | AS_BYTES);

    // Mark the device as locked for writing blocks
    uint8_t device = (LOCKED | WRITING | AS_BLOCKS); // setting use |

    // Set the device as locked, leaving other flags unchanged

    // Determine if a device is locked 
    // getting use &
    uint8_t isLocked = (device & LOCKED);


    // Remove the lock on a device, leaving other flags unchanged

    // Switch a device to/from reading and writing, leaving other flags unchanged
}