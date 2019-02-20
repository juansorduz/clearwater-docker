#!/bin/bash
sudo swapoff -a
sudo sed -i '/ swap / s/^/#/' /etc/fstab
sudo kubeadm reset
kubeadm init --pod-network-cidr=192.168.0.0/16
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
echo -e '[Service]\nEnvironment="KUBELET_EXTRA_ARGS=--resolv-conf=/run/systemd/resolve/resolv.conf"\n' | sudo tee /etc/systemd/system/kubelet.service.d/99-local.conf
sudo systemctl daemon-reload
sudo systemctl restart kubelet
corednsepod=$(kubectl get pods | grep coredns | cut -d ' ' -f1)
kubectl delete pod $coredns -n kube-system
kubectl taint nodes --all node-role.kubernetes.io/master-
