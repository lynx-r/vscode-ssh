# build stage
FROM node:latest

ENV HOME=/root

# Add Docker's official GPG key:
RUN apt-get update
RUN apt-get install ca-certificates curl
RUN install -m 0755 -d /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
RUN chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update
RUN apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

RUN apt-get -y install vim speedtest-cli

RUN apt-get -y install openssh-server

RUN mkdir -p /var/run/sshd

# (Optional) Configure SSH: Disable password authentication and enable root login (for testing, use with caution)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# (Optional) Copy SSH public key for authorized_keys (recommended for secure access)
# COPY dockhost-vscode.pub $HOME/.ssh/authorized_keys
# RUN chmod 600 $HOME/.ssh/authorized_keys

EXPOSE 22 
# Start the SSH daemon
CMD ["/usr/sbin/sshd", "-D"]
