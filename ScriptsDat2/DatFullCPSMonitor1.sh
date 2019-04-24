#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
password=${2:-secret}
option=${3:-3}
NumberTest=${4:-2}



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
  echo Grupo de usuario $j
  cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator-template$j ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j
  kubectl cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$j
  kubectl exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$j
done
done

#echo Duration $Duration password $password option $option NumberTest $NumberTest

. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  10 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  20 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  30 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  40 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  50 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  60 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  70 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  80 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  90 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  100 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  120 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  150 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  200 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  250 $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatMonitor1.sh  300 $Duration $password $option $NumberTest
