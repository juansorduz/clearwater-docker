#!/bin/bash
passwordVM=ims0615

#Update VM
echo $passwordVM | sudo -S DEBIAN_FRONTEND=noninteractive apt-get -y update
##########################################################################################
#Installing docker
#Installing prerequisites
#echo $passwordVM | sudo -S DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https ca-certificates curl software-properties-common
#Adding key
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | echo $passwordVM | sudo -S apt-key add -
#Adding repository
#echo $passwordVM | sudo -S add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
#Installing docker CE
#echo $passwordVM | sudo -S DEBIAN_FRONTEND=noninteractive apt-get -y update
#echo $passwordVM | sudo groupadd docker
#echo $passwordVM | sudo -S apt-get install -y docker-ce
#echo $passwordVM | sudo gr#echo $passwordVM | sudo -S DEBIAN_FRONTEND=noninteractive apt-get -y update
#echo $passwordVM | sudo -S apt-get install -y docker-engine
#Adding User
#echo $passwordVM | sudo -S usermod -a -G docker $USER
##########################################################################################
#Installing docker method 2 uncomment
curl -fsSL get.docker.com -o get-docker.sh
echo $passwordVM | sudo -S chmod +x get-docker.sh
./get-docker.sh
echo $passwordVM | sudo -S groupadd docker
echo $passwordVM | sudo -S usermod -aG docker $USER
##########################################################################################
#Installing prerequisites for clearwater code
echo $passwordVM | sudo -S DEBIAN_FRONTEND=noninteractive apt-get -y update
#Sprout
echo $passwordVM | sudo -S apt-get install -y ntp build-essential autoconf scons pkg-config libtool libcloog-ppl1 gdb pstack git git-svn dpkg-dev devscripts dh-make python-setuptools python-virtualenv python-dev libcurl4-openssl-dev libmysqlclient-dev libgmp10 libgmp-dev libc-ares-dev ncurses-dev libxml2-dev libxslt1-dev libboost-all-dev libzmq3-dev valgrind libxml2-utils ruby libevent-dev libevent-pthreads-2.0-5 cmake flex bison libboost-filesystem-dev libsnmp-dev
#homestead
echo $passwordVM | sudo -S apt-get install -y git cmake make gcc g++ bison flex libsctp-dev libgnutls-dev libgcrypt-dev libidn11-dev ssl-cert debhelper fakeroot libpq-dev libmysqlclient-dev libxml2-dev swig python-dev libevent-dev libtool autoconf libboost-all-dev automake pkg-config libssl-dev libzmq3-dev libcurl4-openssl-dev debhelper devscripts libxml2-utils libsnmp-dev valgrind
#Ellis
echo $passwordVM | sudo -S apt-get install -y ntp build-essential autoconf scons pkg-config libtool libcloog-ppl1 dpkg-dev devscripts dh-make python-setuptools python-virtualenv python-dev libcurl4-openssl-dev libmysqlclient-dev libgmp10 libgmp-dev libc-ares-dev ncurses-dev libxml2-dev libxslt1-dev libzmq3-dev
#Chronos
echo $passwordVM | sudo -S apt-get install -y git debhelper devscripts build-essential libboost-program-options-dev libcurl4-openssl-dev libevent-dev libboost-regex-dev libboost-filesystem-dev libtool automake make cmake libzmq3-dev libsnmp-dev valgrind python-flask python-requests
#Crest
echo $passwordVM | sudo -S apt-get install -y python-pip python-dev build-essential libffi-dev
echo $passwordVM | sudo -S pip install -y virtualenv==13.1.0
echo $passwordVM | sudo -S apt-get install -y libcurl4-openssl-dev
echo $passwordVM | sudo -S apt-get install -y debhelper devscripts
echo $passwordVM | sudo -S apt-get install -y libxml2-dev libxslt-dev
echo $passwordVM | sudo -S apt-get install -y python-zmq
echo $passwordVM | sudo -S apt-get install -y cassandra=2.1.15 openjdk-7-jdk
##########################################################################################
#Copy Source code
mkdir -p ~/SourceCode
cd ~/SourceCode
git config --global url."https://github.com/".insteadOf git@github.com:
git clone --recursive git@github.com:juansorduz/sprout.git
git clone --recursive git@github.com:juansorduz/homestead.git
git clone --recursive git@github.com:juansorduz/ellis.git
git clone --recursive git@github.com:juansorduz/chronos.git
git clone --recursive git@github.com:juansorduz/crest.git
##########################################################################################
