#!/bin/bash
users=${1:-0}
duration=${2:-0}
cd
cd clearwater-docker
kubectl create configmap env-vars --from-literal=ZONE=default.svc.cluster.local
kubectl apply -f kubernetes2
#sleep 120
cassandrapod=$(kubectl get pods | grep cassandra | cut -d ' ' -f1)
#kubectl exec $cassandrapod /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh 1000
