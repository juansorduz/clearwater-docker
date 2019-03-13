#!/bin/bash
ursprout=$(kubectl get pods | grep ursprout | cut -d ' ' -f1)
mscsprout=$(kubectl get pods | grep mscsprout | cut -d ' ' -f1)
urhomestead=$(kubectl get pods | grep urhomestead | cut -d ' ' -f1)
mschomestead=$(kubectl get pods | grep mschomestead | cut -d ' ' -f1)
urcassandra=$(kubectl get pods | grep urcassandra | cut -d ' ' -f1)
msccassandrat=$(kubectl get pods | grep msccassandra | cut -d ' ' -f1)
echo [INFO] IP_URSPROUT
kubectl exec $ursprout ifconfig
echo [INFO] IP_URHOMESTEAD
kubectl exec $urhomestead ifconfig
echo [INFO] IP_URCASSANDRA
kubectl exec $urcassandra ifconfig
echo [INFO] IP_MSCSPROUT
kubectl exec $mscsprout ifconfig
echo [INFO] IP_MSCHOMESTEAD
kubectl exec $mschomestead ifconfig
echo [INFO] IP_MSCCASSANDRA
kubectl exec $msccassandra ifconfig
