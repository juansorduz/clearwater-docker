#!/bin/bash
password=${1:-0}
echo $password | sudo -S swapoff -a
echo $password | sudo -S kubeadm reset -f
rm -rf ~/.kube/
echo $password | sudo -S kubeadm init --pod-network-cidr=10.244.0.0/16
mkdir -p $HOME/.kube
echo $password | sudo -S cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
echo $password | sudo -S chown $(id -u):$(id -g) $HOME/.kube/config
#kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/rbac.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/canal/canal.yaml
sleep 5
