#!/bin/bash
usuarios=${1:-1000}
cd
cd metrics-server/
kubectl create -f deploy/1.8+/
cd
cd clearwater-docker
kubectl create configmap env-vars --from-literal=ZONE=default.svc.cluster.local
kubectl apply -f kubernetes3
sleep 350
urcassandrapod=$(kubectl get pods | grep urcassandra | cut -d ' ' -f1)
kubectl exec $urcassandrapod /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh $usuarios
sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
kubectl exec $sipptestpod /usr/share/clearwater/infrastructure/scripts/sip-stress
