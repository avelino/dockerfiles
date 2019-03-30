FROM ubuntu:18.04

ENV DEBIAN_FRONTEND noninteractive

ENV CODER_VERSION 1.408-vsc1.32.0

ADD ./install.sh /opt/install.sh

RUN apt update -y && apt upgrade -y && apt install -y \
    wget \
    sudo \
    openssl \
	net-tools \
    locales && \
    locale-gen en_US.UTF-8 && \
    curl -s https://api.github.com/repos/codercom/code-server/releases/latest | grep "linux-x64.tar.gz" | cut -d '"' -f 4 | wget -O /tmp/coder.tar.gz -qi - && \
    tar -xvf /tmp/coder.tar.gz --wildcards "*/code-server" --strip-components=1 && \
    mv ./code-server /usr/local/bin/code-server && \
    rm /tmp/coder.tar.gz && \
    sh /opt/install.sh

## User account
RUN adduser --disabled-password --gecos '' coder && \
    adduser coder sudo && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers && \
    chmod g+rw /home/coder && \
    mkdir -p /home/coder/project && \
    chown -R coder:coder /home/coder;

ENV LANG en_US.UTF-8
ENV SHELL /bin/bash
# using "NODE_OPTIONS=..." to avoid out-of-memory problem in CI
ENV NODE_OPTIONS "--max_old_space_size=4096"

EXPOSE 8443
WORKDIR /home/coder/project

CMD ["code-server", "/home/coder/project", "--allow-http", "--no-auth"]
