#!/bin/bash

FLAG="flag{User_M4nag3mEnt_1S_3ss3nti4l_f0r_syst3m_s3cur1ty}"
START_UID=1010

create_users() {
    local uid=$START_UID
    for (( i=0; i<${#FLAG}; i++ )); do
        char="${FLAG:$i:1}"
        username="user_$char"
        # Add user and suppress output
        sudo useradd -m -u $uid -s /bin/bash "$username" >/dev/null 2>&1
        echo "$username:$username" | sudo chpasswd >/dev/null 2>&1
        ((uid++))
    done
}

create_users

sudo service ssh start
echo "Setup completed"
exec /usr/sbin/sshd -D;
#rm -f /home/ctfuser/challenge/Dockerfile
#cd /home/ctfuser/challenge

#rm -f /home/ctfuser/challenge/verificare_flag.c

#rm -f /home/ctfuser/challenge/start.sh