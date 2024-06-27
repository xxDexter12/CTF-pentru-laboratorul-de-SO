#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Function to decode the encoded flag
void decode_flag(char *encoded_flag, char *decoded_flag) {
    int i;
    for (i = 0; encoded_flag[i] != '\0'; i++) {
        decoded_flag[i] = encoded_flag[i] ^ 0xAA; // XOR with 0xAA for obfuscation
    }
    decoded_flag[i] = '\0';
}

int main(int argc, char *argv[]) {
    char encoded_flag[] = {
        0xcc, 0xc6, 0xcb, 0xcd, 0xd1, 0xf3, 0x9a, 0xdf, 0xf5, 0xcc, 0x9a, 0xdf, 
        0xc4, 0xce, 0xf5, 0xde, 0xc2, 0x99, 0xf5, 0xd9, 0xc9, 0x9b, 0xda, 0x9d, 
        0xd7, 0x00 // Null terminator
    };
    char static_flag[sizeof(encoded_flag)];
    decode_flag(encoded_flag, static_flag);

    if (argc != 2) {
        printf("Utilizare: %s <flag>\n", argv[0]);
        return 1;
    }

    if (strcmp(argv[1], static_flag) == 0) {
        printf("flag corect\n");
    } else {
        printf("flag incorect, mai incercati\n");
    }

    return 0;
}