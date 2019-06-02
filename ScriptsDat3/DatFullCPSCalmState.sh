#!/bin/bash
#CONTADOR=0
duration=${1:-120}
password=${2:-secret}
optionMonitor=${3:-2}
NumberTest=${4:-2}



#Loading test characteristics
source ~/clearwater-docker/ScriptsDat3/TrafficGenerator/TestCharacteristics

#Updating deployment to test TestCharacteristics
# kubectl scale deployment sipptest --replicas=$NumSipp
# kubectl scale deployment bono --replicas=$NumBono
# kubectl scale deployment ursprout --replicas=$NumURS
# kubectl scale deployment mscsprout --replicas=$NumMSCS
# kubectl scale deployment urhomestead --replicas=$NumURH
# kubectl scale deployment mschomestead --replicas=$NumMSCH
# sleep 30
# #sleep 5
#
#Logic to create users in sipppods
echo Creating users in sipppods
NumSipptest=1
#SipptestPods=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#SipptestIPs=$(kubectl get pods -o wide | grep sipptest | cut -d ' ' -f34)
base=2010000010
IncrementUser=1
count=9990
TotalUsers=49990
UsersPerSipp=$(echo "scale=0; $TotalUsers/$NumSipptest" | bc -l)
LocalSipptestPod=sipptest
for i in $(seq 1 $NumSipptest); do
#echo $i;
#LocalSipptestPod=$(echo $SipptestPods | cut -d ' ' -f$i);

#LocalSipptestIP=$(echo $SipptestIPs | cut -d ' ' -f$i);
echo SipptestPod $LocalSipptestPod;
base=2010000010
#echo SipptestIP $LocalSipptestIP;
# cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator-template$i ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$i
# kubectl cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$i $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$i
# kubectl exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$i
for j in $(seq 1 $NumSipptest); do
cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator-template1 ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j

sed -i '9s@.*@base=2010000010@' ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j
sed -i "9s@2010000010@$base@" ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j

sed -i '10s@.*@count=9990@' ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j
sed -i "10s@9990@$UsersPerSipp@" ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j

sed -i '14s@.*@NumGroupUser=0@' ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j
sed -i "14s@0@$j@" ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j

docker cp ~/clearwater-docker/ScriptsDat3/TrafficGenerator/sip-stress-usergenerator$j $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$j
docker exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$j

#echo base $base
#echo Users per Sipp $UsersPerSipp

base=`echo $base + $UsersPerSipp | bc`
base=`echo $base + $IncrementUser | bc`
echo Finish user creation
done

done

echo Starting tests
#. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 10 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 25 $duration $password $optionMonitor $NumberTest
#. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 30 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 50 $duration $password $optionMonitor $NumberTest
#. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 50 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 75 $duration $password $optionMonitor $NumberTest
#. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 70 $duration $password $optionMonitor $NumberTest
#. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 80 $duration $password $optionMonitor $NumberTest
#. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 90 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 100 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 125 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 150 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 175 $duration $password $optionMonitor $NumberTest
. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 200 $duration $password $optionMonitor $NumberTest
# exit 0
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 225 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 250 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 275 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 300 $duration $password $optionMonitor $NumberTest
#
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 10 $duration $password $optionMonitor $NumberTest
# #. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 20 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 30 $duration $password $optionMonitor $NumberTest
# #. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 40 $duration $password $optionMonitor $NumberTest
# ·. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 50 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 60 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 70 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 80 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 90 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 100 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 120 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 150 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 180 $duration $password $optionMonitor $NumberTest
# #. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 210 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 240 $duration $password $optionMonitor $NumberTest
# #. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 270 $duration $password $optionMonitor $NumberTest
# #. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 200 $duration $password $optionMonitor $NumberTest
# #. ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 250 $duration $password $optionMonitor $NumberTest
# . ~/clearwater-docker/ScriptsDat3/DatMonitorCalmState.sh 300 $duration $password $option $NumberTest
#exit 0
