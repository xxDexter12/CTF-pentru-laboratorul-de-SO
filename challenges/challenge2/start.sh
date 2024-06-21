#!/bin/bash

FLAG="NpNQrzvN_GruaVPN_ZVYvgneN"
FLAG_INDEX=0
FLAG_LENGTH=${#FLAG}

# Creează 10 directoare imbricate
for i in {1..10}; do
    mkdir -p "dir_$i"
    cd "dir_$i"
    
    # Creează 100 de fișiere în fiecare director
    for j in {1..100}; do
        FILE_NAME="file_$j.txt"
        touch "$FILE_NAME"
        
        # Generează numere și adaugă litere din flag
        for k in {1..5000}; do
            if (( k % 4 == 0 )); then
                if (( RANDOM % 2 == 0 )); then
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
    
    cd ..
done

echo "Directoare și fișiere create cu succes."
