# build stage
FROM ubuntu

RUN apt-get -y update
RUN apt-get -y install curl
RUN apt-get -y install dbus-user-session

RUN curl -Lk 'https://code.visualstudio.com/sha/download?build=stable&os=cli-alpine-x64' --output vscode_cli.tar.gz
RUN tar -xf vscode_cli.tar.gz

# RUN ./code tunnel service install
# CMD ["/bin/bash"]
ENTRYPOINT ["/usr/sbin/init"]
# RUN loginctl enable-linger $USER
