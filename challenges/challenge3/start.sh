#!/bin/bash

# 1. Crearea directorului ascuns și a fișierului flag.txt
mkdir -p ~/.init
echo "flag{Y0u_f0und_th3_sc1p7}" > ~/.init/flag.txt

# 2. Crearea codului C pentru procesul care consumă CPU și face XOR
cat << 'EOF' > /tmp/_cron.c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define KEY "atm_anul1_2025_000_mta"

void consume_cpu() {
    while (1) {
        // Consuma CPU (while loop)
    }
}

char* xor_encrypt(const char* flag, const char* key) {
    size_t flag_len = strlen(flag);
    size_t key_len = strlen(key);
    char* encrypted = (char*)malloc(flag_len + 1);

    for (size_t i = 0; i < flag_len; ++i) {
        encrypted[i] = flag[i] ^ key[i % key_len];
    }
    encrypted[flag_len] = '\0';
    return encrypted;
}

int main() {
    // Citirea flag-ului
    FILE *flag_file = fopen("/home/$(whoami)/.init/flag.txt", "r");
    if (flag_file == NULL) {
        fprintf(stderr, "Eroare la deschiderea fișierului flag.txt\n");
        return 1;
    }

    char flag[256];
    fgets(flag, sizeof(flag), flag_file);
    fclose(flag_file);

    // XOR encrypt
    char* encrypted = xor_encrypt(flag, KEY);

    // Scrierea flag-ului criptat înapoi în fișier
    flag_file = fopen("/home/$(whoami)/.init/flag.txt", "w");
    if (flag_file == NULL) {
        fprintf(stderr, "Eroare la deschiderea fișierului flag.txt pentru scriere\n");
        return 1;
    }
    fprintf(flag_file, "%s\n", encrypted);
    fclose(flag_file);

    // Setarea permisiunilor fișierului pentru a fi citit de oricine
    chmod("/home/$(whoami)/.init/flag.txt", 0644);

    free(encrypted);

    // Consuma CPU
    consume_cpu();

    return 0;
}
EOF

# 3. Compilarea codului C
gcc /tmp/_cron.c -o /tmp/_cron

# 4. Ascunderea executabilului și a codului sursă
sudo mv /tmp/_cron /usr/local/bin/
sudo mv /tmp/_cron.c /usr/local/src/
sudo chmod 755 /usr/local/src/_cron.c
sudo chown root:root /usr/local/bin/_cron
sudo chmod 4755 /usr/local/bin/_cron

# 5. Pornirea procesului _cron sub root
sudo /usr/local/bin/_cron &

echo "Setup complet."
