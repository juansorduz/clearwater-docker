#!/bin/bash
usuarios=${1:-1000}
kubectl label nodes worker1 Tnode=notsipp
kubectl label nodes worker2 Tnode=notsipp
kubectl label nodes worker3 Tnode=notsipp
kubectl label nodes worker4 Tnode=notsipp
kubectl label nodes worker5 Tnode=notsipp
kubectl label nodes worker6 Tnode=notsipp
kubectl label nodes worker7 Tnode=sipp

# cd
# cd metrics-server/
# kubectl apply -f deploy/1.8+/
# cd
cd clearwater-docker
kubectl create configmap env-vars --from-literal=ZONE=default.svc.cluster.local
kubectl apply -f kubernetes4
sleep 300
urcassandrapod=$(kubectl get pods | grep urcassandra | cut -d ' ' -f1)
kubectl exec $urcassandrapod /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh $usuarios
sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
kubectl exec $sipptestpod /usr/share/clearwater/infrastructure/scripts/sip-stress
