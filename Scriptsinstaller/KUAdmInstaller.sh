#!/bin/bash


####DOCKER####
password="$1"
usuario="$2"
cd ~/
curl -fsSL get.docker.com -o get-docker.sh  \
&& echo $password | sudo -S chmod +x get-docker.sh \
&& ./get-docker.sh \
&& echo $password | sudo -S usermod -aG docker $usuario \
&& echo $password | sudo -S apt-get update \
&& echo $password | sudo -S apt-get install -y apt-transport-https curl \
&& curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - \
&& echo 'deb https://apt.kubernetes.io/ kubernetes-xenial main' > /tmp/kubernetes.list \
&& echo $password | sudo cp /tmp/kubernetes.list /etc/apt/sources.list.d/ \
&& echo $password | sudo -S apt-get update \
&& echo $password | sudo -S apt-get install -y kubelet kubeadm kubectl \
&& echo $password | sudo -S apt-mark hold kubelet kubeadm kubectl
