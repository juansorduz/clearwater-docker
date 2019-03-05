#!/bin/bash
password=${1:-0}
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
cd
cd clearwater-docker
kubectl create configmap env-vars --from-literal=ZONE=default.svc.cluster.local
#kubectl apply -f kubernetes3
#sleep 330
#urcassandrapod=$(kubectl get pods | grep urcassandra | cut -d ' ' -f1)
#kubectl exec $urcassandrapod /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh 500
cd
cd metrics-server/
#kubectl create -f deploy/1.8+/
