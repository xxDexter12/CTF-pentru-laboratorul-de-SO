# CTF-pentru-laboratorul-de-SO

# 18.06.2024 creare docker

# 19.06.2024 creare challange

challenges
    ├── challenge1
    │   ├── Dockerfile
    │   └── start.sh
    └── challenge2
        ├── Dockerfile
        └── start.sh

docker ps -q --filter "name=challenge*" | xargs docker stop (pt conectare repetata la acelasi challenge)
ssh-keygen -f "/home/bogdan/.ssh/known_hosts" -R "[localhost]:2222"

