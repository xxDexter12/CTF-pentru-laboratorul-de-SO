#!/bin/bash

echo "Please select a challenge to start:"
echo "1) Challenge 1"
echo "2) Challenge 2"
read -p "Enter the number of the challenge: " challenge_number

case $challenge_number in
    1)
        echo "Starting Challenge 1"
        /home/ctfuser/challenge1/start.sh
        ;;
    2)
        echo "Starting Challenge 2"
        /home/ctfuser/challenge2/start.sh
        ;;
    *)
        echo "Invalid selection"
        ;;
esac
