#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
password=${2:-secret}
NumberTest=${3:-2}
option=${4:-3}


#Loading test characteristics
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics

#Updating deployment to test TestCharacteristics
kubectl scale deployment sipptest --replicas=$NumSipp
kubectl scale deployment bono --replicas=$NumBono
kubectl scale deployment ursprout --replicas=$NumURS
kubectl scale deployment mscsprout --replicas=$NumMSCS
kubectl scale deployment urhomestead --replicas=$NumURH
kubectl scale deployment mschomestead --replicas=$NumMSCH

#Logic to create users in sipppods
echo Creating users in sipppods
NumSipptest=$(kubectl get pods | grep sipptest | wc -l)
SipptestPods=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#SipptestIPs=$(kubectl get pods -o wide | grep sipptest | cut -d ' ' -f34)
for i in $(seq 1 $NumSipptest); do
#echo $i;
LocalSipptestPod=$(echo $SipptestPods | cut -d ' ' -f$i);
#LocalSipptestIP=$(echo $SipptestIPs | cut -d ' ' -f$i);
echo SipptestPod $LocalSipptestPod;
#echo SipptestIP $LocalSipptestIP;
# cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator-template$i ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$i
# kubectl cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$i $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$i
# kubectl exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$i
for j in $(seq 1 5); do
  cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator-template$j ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j
  kubectl cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$j
  kubectl exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$j
done
done

. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  10 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  20 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  30 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  40 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  50 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  60 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  70 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  80 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  90 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  100 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  120 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  150 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  200 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  250 $Duration $ip $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  300 $Duration $ip $password $option $NumberTest
