FROM ubuntu:20.04

# Install necessary utilities
RUN apt-get update && \
    apt-get install -y openssh-server sudo iproute2

# Create and configure ctfuser
RUN useradd -ms /bin/bash ctfuser && \
    echo 'ctfuser:ctfuser' | chpasswd && \
    usermod -aG sudo ctfuser

# Configure SSH server
RUN mkdir /var/run/sshd && \
    echo 'PasswordAuthentication yes' >> /etc/ssh/sshd_config && \
    echo 'PermitUserEnvironment yes' >> /etc/ssh/sshd_config

# Add challenge files
ADD . /home/ctfuser/challenge
RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge && \
    chmod +x /home/ctfuser/challenge/start.sh

# Add entrypoint script
ADD monitor-ssh.sh /usr/local/bin/monitor-ssh.sh
RUN chmod +x /usr/local/bin/monitor-ssh.sh
# Expose SSH port
EXPOSE 22

# Start SSH service with monitoring
CMD ["/usr/local/bin/monitor-ssh.sh"]