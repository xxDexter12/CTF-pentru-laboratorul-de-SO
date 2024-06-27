#!/bin/bash

# Define the flag and start UID
FLAG="flag{Us3r_M4n4g3m3nt_1s_3ss3nti4l_f0r_syst3m_s3cur1ty}"
START_UID=1010

# Function to create users
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

# Create users
create_users

# Configure SSH to allow only 5 seconds of connection time
echo "ClientAliveInterval 10" | sudo tee -a /etc/ssh/sshd_config >/dev/null
echo "ClientAliveCountMax 0" | sudo tee -a /etc/ssh/sshd_config >/dev/null

# Restart SSH service to apply changes
sudo service ssh restart

rm -f /home/ctfuser/challenge/Dockerfile
cd /home/ctfuser/challenge

rm -f /home/ctfuser/challenge/verificare_flag.c
echo "Setup completed"
rm -f /home/ctfuser/challenge/start.sh