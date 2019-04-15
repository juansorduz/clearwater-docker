#!/bin/bash
prueba=${1:-registry}
/usr/share/clearwater/bin/sipp -i 10.244.1.55 -sf /usr/share/clearwater/sip-stress/sip-stress-$prueba-latency.xml 10.244.1.254:5060 -t tn -s default.svc.cluster.local -inf /usr/share/clearwater/sip-stress/users_test_latency.csv -users 1 -m 1 -default_behaviors all,-bye -max_socket 65000 -trace_stat -trace_rtt -trace_counts -trace_err -max_reconnect -1 -reconnect_sleep 0 -reconnect_close 0 -send_timeout 4000 -recv_timeout 12000 -nostdin
