# main_container/Dockerfile

FROM ubuntu:20.04

# Add necessary repositories for Linux Mint
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget http://packages.linuxmint.com/pool/main/m/mint-keyring/mint-keyring_2016.05.26_all.deb && \
    dpkg -i mint-keyring_2016.05.26_all.deb && \
    echo "deb http://packages.linuxmint.com ulyssa main upstream import backport" > /etc/apt/sources.list.d/mint.list && \
    apt-get update && \
    apt-get install -y mintsystem mint-meta-core

# Install OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Create a user for SSH
RUN useradd -ms /bin/bash ctfuser
RUN echo 'ctfuser:ctfuser' | chpasswd

# Allow root authentication
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config

# Add start_challenge script and challenges directory
ADD ./start_challenge.sh /home/ctfuser/start_challenge.sh
ADD ./challenges /home/ctfuser/challenges

RUN chown -R ctfuser:ctfuser /home/ctfuser/challenges
RUN chown ctfuser:ctfuser /home/ctfuser/start_challenge.sh
RUN chmod +x /home/ctfuser/start_challenge.sh

RUN echo "source /home/ctfuser/start_challenge.sh" >> /home/ctfuser/.bashrc

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]