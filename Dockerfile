# build stage
FROM ubuntu

RUN apt-get update

RUN apt-get -y install openssh-server
RUN mkdir -p /var/run/sshd

# (Optional) Configure SSH: Disable password authentication and enable root login (for testing, use with caution)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

# (Optional) Copy SSH public key for authorized_keys (recommended for secure access)
# COPY ./your_public_key.pub /root/.ssh/authorized_keys
# RUN chmod 600 /root/.ssh/authorized_keys

EXPOSE 22 
# Start the SSH daemon
CMD ["/usr/sbin/sshd", "-D"]

# RUN apt-get -y install speedtest-cli

# RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash -

# RUN apt-get -y install nodejs

# RUN npm install -g yarn

# RUN apt-get -y install dbus-user-session

# RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz
# RUN tar -xf vscode_cli.tar.gz

# # RUN ./code tunnel service install
CMD ["/bin/bash"]
# ENTRYPOINT ["/usr/sbin/init"]
# RUN loginctl enable-linger $USER
