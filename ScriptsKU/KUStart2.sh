#!/bin/bash
password=${1:-0}
echo $password | sudo -S kubeadm reset -f
rm -rf ~/.kube/
echo $password | sudo -S kubeadm init --pod-network-cidr=192.168.0.0/16
mkdir -p $HOME/.kube
echo $password | sudo -S cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
echo $password | sudo -S chown $(id -u):$(id -g) $HOME/.kube/config
kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
kubectl apply -f https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
sleep 5
cd
cd clearwater-docker
kubectl create configmap env-vars --from-literal=ZONE=default.svc.cluster.local
kubectl apply -f kubernetes2
sleep 300
cassandrapod=$(kubectl get pods | grep cassandra | cut -d ' ' -f1)
kubectl exec $cassandrapod /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh 11000
