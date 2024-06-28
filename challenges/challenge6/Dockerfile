FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Bucharest

RUN apt-get update && \
    apt-get install -y openssh-server sudo cron gcc make

RUN useradd -ms /bin/bash ctfuser && \
    echo 'ctfuser:ctfuser' | chpasswd

RUN mkdir /var/run/sshd && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config && \
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config && \
    echo "ClientAliveInterval 5" >> /etc/ssh/sshd_config && \
    echo "ClientAliveCountMax 0" >> /etc/ssh/sshd_config

RUN sed -i 's/^session    optional     pam_motd.so/#session    optional     pam_motd.so/' /etc/pam.d/sshd && \
    chmod -x /etc/update-motd.d/*

RUN echo 'ctfuser ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD . /home/ctfuser/challenge

RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge && \
    chmod +x /home/ctfuser/challenge/start.sh && \
    gcc /home/ctfuser/challenge/verificare_flag.c -o /home/ctfuser/challenge/verificare_flag && \
    chown root:root /home/ctfuser/challenge/verificare_flag && \
    chmod 4755 /home/ctfuser/challenge/verificare_flag

RUN /home/ctfuser/challenge/start.sh

RUN service ssh restart
EXPOSE 22

#ENTRYPOINT ["/home/ctfuser/challenge/start.sh"]
CMD ["/usr/sbin/sshd", "-D"]