#!/bin/bash

directory=~/clearwater-docker/Scripts/Latency
sipptest=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
kubectl cp $directory/sip-stress-registry-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
kubectl cp $directory/sip-stress-call-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
kubectl cp $directory/sip-stress-bye-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
kubectl cp $directory/users_test_latency.csv $sipptest:/usr/share/clearwater/sip-stress/
kubectl cp $directory/Agent_Latency.sh $sipptest:/usr/share/clearwater/sip-stress/
echo REGISTRY
START=$(date +%s.%N)
kubectl exec -ti $sipptest ./usr/share/clearwater/sip-stress/Agent_Latency.sh registry
END=$(date +%s.%N)
REGISTRY=$(echo "$END - $START" | bc)
echo Call
START=$(date +%s.%N)
kubectl exec -ti $sipptest ./usr/share/clearwater/sip-stress/Agent_Latency.sh call
END=$(date +%s.%N)
CALL_LENGHT=$(echo "$END - $START" | bc)
echo bye
START=$(date +%s.%N)
kubectl exec -ti $sipptest ./usr/share/clearwater/sip-stress/Agent_Latency.sh bye
END=$(date +%s.%N)
BYE_LENGHT=$(echo "$END - $START" | bc)

echo Registro: $REGISTRY CALL_LENGHT: $CALL_LENGHT BYE_LENGHT: $BYE_LENGHT
