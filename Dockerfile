FROM ubuntu:20.04

# Instalare utilitare necesare pentru instalarea Docker
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Adaugă cheia GPG oficială Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# Adaugă repository-ul Docker pentru Ubuntu 20.04
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Instalează Docker CE
RUN apt-get update && \
    apt-get install -y docker-ce

# Creează utilizatorul pentru SSH și îl adaugă la grupul Docker
RUN useradd -ms /bin/bash ctfuser
RUN echo 'ctfuser:ctfuser' | chpasswd
RUN usermod -aG docker ctfuser

# Instalează OpenSSH server și configurează autentificarea
RUN apt-get install -y openssh-server && \
    mkdir /var/run/sshd && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config

# Adaugă scriptul start_challenge și directorul challenges
ADD ./start_challenge.sh /home/ctfuser/start_challenge.sh
ADD ./challenges /home/ctfuser/challenges

# Setează permisiunile pentru utilizatorul ctfuser
RUN chown -R ctfuser:ctfuser /home/ctfuser/challenges
RUN chown ctfuser:ctfuser /home/ctfuser/start_challenge.sh
RUN chmod +x /home/ctfuser/start_challenge.sh

# Adaugă comanda pentru a porni serviciul SSH la startup
RUN echo "source /home/ctfuser/start_challenge.sh" >> /home/ctfuser/.bashrc

# Expose SSH port
EXPOSE 22

# Instalează sudo și permite utilizatorului ctfuser să ruleze comenzi sudo fără parolă
RUN apt-get install -y sudo && \
    echo "ctfuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Pornirea serviciului SSH
CMD ["/usr/sbin/sshd", "-D"]
