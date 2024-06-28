#!/bin/bash

FLAG="flag{Us3r_M4nagEment}"
START_UID=1010

create_users() {
    local uid=$START_UID
    for (( i=0; i<${#FLAG}; i++ )); do
        char="${FLAG:$i:1}"
        username="user_$char"
        sudo useradd -m -u $uid -s /bin/bash "$username" >/dev/null 2>&1
        echo "$username:$username" | sudo chpasswd >/dev/null 2>&1
        ((uid++))
    done
}

create_users

rm -f /home/ctfuser/challenge/Dockerfile
rm -f /home/ctfuser/challenge/verificare_flag.c
rm -f /home/ctfuser/challenge/start.sh

echo "Setup completed"
