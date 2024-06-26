FROM ubuntu:20.04

# Set non-interactive frontend for debconf and timezone
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Bucharest

# Install necessary utilities
RUN apt-get update && \
    apt-get install -y openssh-server sudo gcc make python3 python3-pip zip

# Create and configure ctfuser
RUN useradd -ms /bin/bash ctfuser && \
    echo 'ctfuser:ctfuser' | chpasswd && \
    usermod -aG sudo ctfuser

# Allow ctfuser to use sudo without password
RUN echo "ctfuser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Configure SSH server
RUN mkdir /var/run/sshd && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config

# Add challenge files
ADD . /home/ctfuser/challenge

# Add start.sh script and update .bashrc
RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge && \
    chmod +x /home/ctfuser/challenge/start.sh && \
    echo "source /home/ctfuser/challenge/start.sh" >> /home/ctfuser/.bashrc

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]