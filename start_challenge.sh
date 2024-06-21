#!/bin/bash

# Verificare dacă utilizatorul curent are privilegii de root
if [ "$(id -u)" != "0" ]; then
    echo "This script requires root privileges to run Docker commands."
    exit 1
fi

# Verificare dacă serviciul Docker este activat
service docker status >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Docker daemon is not running. Starting Docker service..."
    service docker start
    if [ $? -ne 0 ]; then
        echo "Failed to start Docker service."
        exit 1
    fi
    echo "Docker service started successfully."
fi

echo "Select a challenge to start:"
challenges=($(ls /home/ctfuser/challenges))
select challenge in "${challenges[@]}"; do
    if [[ -n $challenge ]]; then
        echo "Starting $challenge..."
        sudo docker run -d --rm --name "${challenge}_container" \
            -v /home/ctfuser/challenges/$challenge:/home/ctfuser/challenge \
            --entrypoint /bin/bash linux_mint_ctf_${challenge} \
            -c "/home/ctfuser/challenge/start.sh"

        exit
    else
        echo "Invalid selection, please try again."
    fi
done
