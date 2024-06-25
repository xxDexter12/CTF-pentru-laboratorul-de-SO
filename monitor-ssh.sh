#!/bin/bash

# Name of the Docker container to monitor
container_name="$1"

# Function to check active SSH connections
check_connections() {
    ss -tn state established '( sport = :22 )' > /dev/null 2>&1
    }

sleep 15
# Monitor SSH connections
while true; do
    sleep 10
    if ! check_connections; then
        echo "No active SSH connections. Stopping container $container_name..."
        docker stop "$container_name"
        exit 0
    fi
done