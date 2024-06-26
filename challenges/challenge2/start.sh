#!/bin/bash
echo "WAIT A SECOND"
FLAG="synt{3Te3c_!f_4_c0j3eshy_g00y_s0e_g3kg_f34epuvat_@aq_z4a!chy@g!0a_!a_Ha!k-y!x3_flfg3zf}"
FLAG_INDEX=0
FLAG_LENGTH=${#FLAG}
cd /home/ctfuser/challenge
# Creează 10 directoare imbricate
for i in {1..5}; do
    mkdir -p "dir_$i"
    cd "dir_$i"
    
    # Creează 20 de fișiere în fiecare director
    for j in {1..20}; do
        FILE_NAME="file_$j.txt"
        touch "$FILE_NAME"
        
        # Generează numere și adaugă litere din flag
        for k in {1..5000}; do
            if (( k % 4 == 0 )); then
                if (( RANDOM % 2 == 1 )); then
                    echo -n "$k${FLAG:FLAG_INDEX:1} " >> "$FILE_NAME"
                    FLAG_INDEX=$(( (FLAG_INDEX + 1) % FLAG_LENGTH ))
                else
                    echo -n "$k " >> "$FILE_NAME"
                fi
            else
                echo -n "$k " >> "$FILE_NAME"
            fi
        done
        echo "" >> "$FILE_NAME"
    done
done
cd /home/ctfuser
rm -f /home/ctfuser/challenge/Dockerfile
echo "Setup completed"

rm -f /home/ctfuser/challenge/start.sh 
