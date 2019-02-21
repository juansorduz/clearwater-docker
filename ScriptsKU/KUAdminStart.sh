#!/bin/bash
echo gabrield20 | sudo -S swapoff -a
echo gabrield20 | sudo -S kubeadm reset -f
echo gabrield20 | sudo -S kubeadm init


mkdir -p $HOME/.kube
echo gabrield20 |sudo -S cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
echo gabrield20 |sudo -S chown $(id -u):$(id -g) $HOME/.kube/config

#sudo sed -i '/ swap / s/^/#/' /etc/fstab
#sudo kubeadm reset
#kubeadm init --pod-network-cidr=192.168.0.0/16
#kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
#kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
#echo -e '[Service]\nEnvironment="KUBELET_EXTRA_ARGS=--resolv-conf=/run/systemd/resolve/resolv.conf"\n' | sudo tee /etc/systemd/system/kubelet.service.d/99-local.conf
#sudo systemctl daemon-reload
#sudo systemctl restart kubelet
#corednsepod=$(kubectl get pods | grep coredns | cut -d ' ' -f1)
#kubectl delete pod $coredns -n kube-system
#kubectl taint nodes --all node-role.kubernetes.io/master-
