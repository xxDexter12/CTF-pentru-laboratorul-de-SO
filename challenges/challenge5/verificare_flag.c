#include <stdio.h>
#include <string.h>
#include <stdlib.h>


void decode_flag(const char *encoded_flag_hex, char *decoded_flag) {
    size_t len = strlen(encoded_flag_hex) / 2;
    for (size_t i = 0; i < len; i++) {
        char byte_str[3] = { encoded_flag_hex[2*i], encoded_flag_hex[2*i+1], '\0' };
        unsigned char byte = (unsigned char)strtol(byte_str, NULL, 16);
        decoded_flag[i] = byte ^ 0xAA;
    decoded_flag[len] = '\0';
}

int main(int argc, char *argv[]) {
    const char encoded_flag_hex[] = "ccc6cbcdd1e69ac4cdf5ecc69ecdf59ac4f5fa99d8c79bd9d99bc5c4d9f59ec4cef5f999c9dfd89bded3f5fad89ec9de9bc9cfd9f59ef5ebc9c29bcfdc9bc4cdf5f999c9dfd899f5f9d3d9fe99c7f5ebcec79bc49bd9ded89ede9bc5c4f5989a989fd7";
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