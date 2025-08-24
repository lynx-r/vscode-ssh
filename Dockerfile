# build stage
FROM ubuntu:latest

ENV HOME /root

RUN apt-get update

RUN apt-get -y install openssh-server
RUN mkdir -p /var/run/sshd

# (Optional) Configure SSH: Disable password authentication and enable root login (for testing, use with caution)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# (Optional) Copy SSH public key for authorized_keys (recommended for secure access)
COPY dockhost-vscode.pub $HOME/.ssh/authorized_keys
# RUN chmod 600 $HOME/.ssh/authorized_keys

EXPOSE 22 
# Start the SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
