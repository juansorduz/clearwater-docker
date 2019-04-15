#!/bin/bash
local_ip=${1:-127.0.0.0}
directory=~/clearwater-docker/Scripts/Latency
sipptest=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
kubectl cp $directory/sip-stress-registry-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
kubectl cp $directory/sip-stress-call-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
kubectl cp $directory/sip-stress-bye-latency.xml $sipptest:/usr/share/clearwater/sip-stress/
kubectl cp $directory/user_test_latency.sh $sipptest:/usr/share/clearwater/sip-stress/

START=$(date +%s.%N)
kubectl exec $sipptest "/usr/share/clearwater/bin/sipp -i $local_ip -sf /var/log/clearwater-sipp/sip-stress-registry-latency.xml bono:5060 -t tn -s default.svc.cluster.local -inf /usr/share/clearwater/sip-stress/user_test_latency.csv -users 1 -m 1 -default_behaviors all,-bye -max_socket 65000 -trace_stat -trace_rtt -trace_counts -trace_err -max_reconnect -1 -reconnect_sleep 0 -reconnect_close 0 -send_timeout 4000 -recv_timeout 12000 -nostdin"
END=$(date +%s.%N)
REGISTRY=$(echo "$END - $START" | bc)
START=$(date +%s.%N)
kubectl exec $sipptest "/usr/share/clearwater/bin/sipp -i $local_ip -sf /var/log/clearwater-sipp/sip-stress-call-latency.xml bono:5060 -t tn -s default.svc.cluster.local -inf /usr/share/clearwater/sip-stress/user_test_latency.csv -users 1 -m 1 -default_behaviors all,-bye -max_socket 65000 -trace_stat -trace_rtt -trace_counts -trace_err -max_reconnect -1 -reconnect_sleep 0 -reconnect_close 0 -send_timeout 4000 -recv_timeout 12000 -nostdin"
END=$(date +%s.%N)
CALL_LENGHT=$(echo "$END - $START" | bc)
START=$(date +%s.%N)
kubectl exec $sipptest "/usr/share/clearwater/bin/sipp -i $local_ip -sf /var/log/clearwater-sipp/sip-stress-end-latency.xml bono:5060 -t tn -s default.svc.cluster.local -inf /usr/share/clearwater/sip-stress/user_test_latency.csv -users 1 -m 1 -default_behaviors all,-bye -max_socket 65000 -trace_stat -trace_rtt -trace_counts -trace_err -max_reconnect -1 -reconnect_sleep 0 -reconnect_close 0 -send_timeout 4000 -recv_timeout 12000 -nostdin"
END=$(date +%s.%N)
BYE_LENGHT=$(echo "$END - $START" | bc)

echo Registro: $REGISTRY CALL_LENGHT: $CALL_LENGHT BYE_LENGHT: $BYE_LENGHT
