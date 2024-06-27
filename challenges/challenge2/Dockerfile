FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y openssh-server sudo

RUN useradd -ms /bin/bash ctfuser && \
    echo 'ctfuser:ctfuser' | chpasswd

RUN mkdir /var/run/sshd && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config && \
    echo 'PermitRootLogin no' >> /etc/ssh/sshd_config


RUN sed -i 's/^session    optional     pam_motd.so/#session    optional     pam_motd.so/' /etc/pam.d/sshd && \
    chmod -x /etc/update-motd.d/*

ADD . /home/ctfuser/challenge

RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge && \
    chmod +x /home/ctfuser/challenge/start.sh && \
    echo "source /home/ctfuser/challenge/start.sh" >> /home/ctfuser/.bashrc

    RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge && \
    chmod +x /home/ctfuser/challenge/start.sh && \
    echo "source /home/ctfuser/challenge/start.sh" >> /home/ctfuser/.bashrc


    RUN chown root:root /home/ctfuser/challenge/verificare_flag && \
    chmod 4755 /home/ctfuser/challenge/verificare_flag


#RUN chown ctfuser:ctfuser /home/ctfuser/.bashrc

#RUN echo 'ctfuser ALL=(ALL) NOPASSWD: /usr/bin/ls' >> /etc/sudoers && \
 #   echo 'ctfuser ALL=(ALL) NOPASSWD: !/bin/su, !/usr/bin/su, !/usr/bin/sudo' >> /etc/sudoers && \
  #  echo 'ctfuser ALL=(ALL) NOPASSWD: !/usr/bin/cat /home/ctfuser/challenge/verificare_flag' >> /etc/sudoers && \
   # echo 'ctfuser ALL=(ALL) NOPASSWD: !/bin/cat /home/ctfuser/challenge/verificare_flag' >> /etc/sudoers


EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]