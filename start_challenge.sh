#!/bin/bash

echo "Select a challenge to start:"
challenges=($(ls /home/ctfuser/challenges))
select challenge in "${challenges[@]}"; do
    if [[ -n $challenge ]]; then
        echo "Starting $challenge..."
        docker run -d --rm --name "${challenge}_container" \
            -v /home/ctfuser/challenges/$challenge:/home/ctfuser/challenge \
            --entrypoint /home/ctfuser/challenge/start.sh linux_mint_ctf_${challenge}
        exit
    else
        echo "Invalid selection, please try again."
    fi
done