# build stage
FROM ubuntu

RUN apt-get update

RUN apt-get -y install openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 80
CMD ["/usr/bin/supervisord"]

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
