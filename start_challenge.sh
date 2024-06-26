#!/bin/bash

# Ensure the Docker service is running
if ! pgrep -x "dockerd" > /dev/null; then
    echo "Docker daemon is not running. Starting Docker service..."
    sudo dockerd > /dev/null 2>&1 &
    sleep 10
    if ! docker info > /dev/null 2>&1; then
        echo "Failed to start Docker service."
        exit 1
    fi
    echo "Docker service started successfully."
fi

# List available challenges
echo "Available challenges:"
challenges=($(ls challenges))
select challenge in "${challenges[@]}"; do
    if [[ -n $challenge ]]; then
        # Build the Docker image for the selected challenge
        echo "Building Docker image for $challenge..."
        docker build -t ${challenge}_image challenges/$challenge
        if [ $? -ne 0 ]; then
            echo "Failed to build Docker image for $challenge."
            exit 1
        fi
        echo "Docker image for $challenge built successfully."

        # Assign a port based on the challenge
        case $challenge in
            challenge1)
                port=2222
                ;;
            challenge2)
                port=2223
                ;;
            challenge3)
                port=2224
                ;;
            challenge4)
                port=2225
                ;;
            *)
                echo "No port assigned for $challenge. Exiting."
                exit 1
                ;;
        esac

        # Run the Docker container
        echo "Starting Docker container for $challenge on port $port..."
        docker run --privileged -d --rm --name ${challenge}_container -p $port:22 ${challenge}_image
        if [ $? -ne 0 ]; then
            echo "Failed to start Docker container for $challenge."
            exit 1
        fi

        # Start monitoring SSH connections
        # ./monitor-ssh.sh ${challenge}_container &

        echo -e "\nDocker container for $challenge started successfully. \nConnect via SSH using: ssh ctfuser@localhost -p $port"

        exit 0
    else
        echo "Invalid selection. Please try again."
    fi
done