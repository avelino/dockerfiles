#Developer tools

apt-get update && apt-get -y \
    install git sudo python python-dev build-essential vim-nox htop

#LSPs

##GO

#Required to use go get with git source
apt-get update && apt-get install -y git

export GO_VERSION=1.9.4
export GOPATH=/usr/local/go-packages
export GO_ROOT=/usr/local/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:${GOPATH}/bin

curl -sS https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz | tar -C /usr/local -xzf -
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/zmb3/gogetdoc
go get -u -v golang.org/x/lint/golint
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v github.com/cweill/gotests/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/josharian/impl
go get -u -v github.com/haya14busa/goplay/cmd/goplay
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct

#Java
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get update && apt-get -y install openjdk-8-jdk


#C/C++
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
# public LLVM PPA, development version of LLVM
echo "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial main" > /etc/apt/sources.list.d/llvm.list
apt-get update && apt-get install -y clang-tools-9
ln -s /usr/bin/clangd-9 /usr/bin/clangd

#Python 2
apt-get update && apt-get install -y python python-pip && \
    pip install python-language-server;

#PHP
apt-get -y install php curl php-cli php-mbstring unzip
# https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
# https://linuxconfig.org/how-to-install-php-composer-on-debian-linux
curl -s -o composer-setup.php https://getcomposer.org/installer \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && rm composer-setup.php

#Ruby
apt-get -y install ruby ruby-dev zlib1g-dev
gem install solargraph