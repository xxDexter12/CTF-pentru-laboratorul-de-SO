# CTF-pentru-laboratorul-de-SO

# 18.06.2024 creare docker

# 19.06.2024 creare challange

.
├── main_container
│   ├── Dockerfile
│   └── start_challenge.sh
└── challenges
    ├── challenge1
    │   ├── Dockerfile
    │   └── start.sh
    └── challenge2
        ├── Dockerfile
        └── start.sh

docker build -t linux_mint_ctf main_container/
docker build -t linux_mint_ctf_challenge1 .
docker build -t linux_mint_ctf_challenge2 .
python manage_containers.py
curl -X POST -H "Content-Type: application/json" -d '{"port": 2222}' http://localhost:5000/start_container
ssh ctfuser@localhost -p 2222
docker ps -q --filter "name=challenge*" | xargs docker stop
ssh-keygen -f "/home/bogdan/.ssh/known_hosts" -R "[localhost]:2222"

