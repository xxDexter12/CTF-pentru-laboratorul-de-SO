#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void decode_flag(const char *encoded_flag_hex, char *decoded_flag) {
    size_t len = strlen(encoded_flag_hex) / 2;
    for (size_t i = 0; i < len; i++) {
        char byte_str[3] = { encoded_flag_hex[2*i], encoded_flag_hex[2*i+1], '\0' };
        unsigned char byte = (unsigned char)strtol(byte_str, NULL, 16);
        decoded_flag[i] = byte ^ 0xAA;
    }
    decoded_flag[len] = '\0';
}

int main(int argc, char *argv[]) {
    const char encoded_flag_hex[] = "ccc6cbcdd1ffd999d8f5e79ec4cbcdefc7cfc4ded7";
    char decoded_flag[sizeof(encoded_flag_hex) / 2 + 1];
    decode_flag(encoded_flag_hex, decoded_flag);

    if (argc != 2) {
        printf("Utilizare: %s <flag>\n", argv[0]);
        return 1;
    }

    if (strcmp(argv[1], decoded_flag) == 0) {
        printf("flag corect\n");
    } else {
        printf("flag incorect, mai incercati\n");
    }

    return 0;
}