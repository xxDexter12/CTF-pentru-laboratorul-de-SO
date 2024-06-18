FROM ubuntu:20.04

# Adaugă repository-urile necesare pentru Linux Mint
RUN apt-get update && \
    apt-get install -y wget gnupg && \
    wget http://packages.linuxmint.com/pool/main/m/mint-keyring/mint-keyring_2016.05.26_all.deb && \
    dpkg -i mint-keyring_2016.05.26_all.deb && \
    echo "deb http://packages.linuxmint.com ulyssa main upstream import backport" > /etc/apt/sources.list.d/mint.list && \
    apt-get update && \
    apt-get install -y mintsystem mint-meta-core

# Instalează OpenSSH server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd

# Crează un utilizator pentru SSH
RUN useradd -ms /bin/bash ctfuser
RUN echo 'ctfuser:ctfuser' | chpasswd

# Permite autentificarea prin root
RUN echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config
RUN echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config

# Adaugă toate challenge-urile
ADD ./challenge1 /home/ctfuser/challenge1
ADD ./challenge2 /home/ctfuser/challenge2
ADD ./start_challenge.sh /home/ctfuser/start_challenge.sh

RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge1
RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge2
RUN chown ctfuser:ctfuser /home/ctfuser/start_challenge.sh
RUN chmod +x /home/ctfuser/challenge1/start.sh
RUN chmod +x /home/ctfuser/challenge2/start.sh
RUN chmod +x /home/ctfuser/start_challenge.sh

# Expune portul SSH
EXPOSE 22

# Comanda de start pentru provocare
CMD ["/usr/sbin/sshd", "-D"]
