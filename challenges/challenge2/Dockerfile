# challenges/challenge1/Dockerfile

FROM ubuntu:20.04

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

# Add challenge files
ADD . /home/ctfuser/challenge

RUN chown -R ctfuser:ctfuser /home/ctfuser/challenge
RUN chmod +x /home/ctfuser/challenge/start.sh

# Remove the setup script after container starts
RUN echo "rm -rf /home/ctfuser/challenge/start.sh" >> /home/ctfuser/.bashrc

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]