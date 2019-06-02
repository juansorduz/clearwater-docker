#!/bin/bash
#CONTADOR=0
password=${1:-secret}

source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM

echo RESETEANDO DESPLIEGUE

. ~/clearwater-docker/ScriptsDat2/DatDelete1.sh
. ~/clearwater-docker/ScriptsDat2/DatStart1.sh 50000 $password

kubectl scale deployment sipptest --replicas=$NumSipp
kubectl scale deployment bono --replicas=$NumBono
kubectl scale deployment ursprout --replicas=$NumURS
kubectl scale deployment mscsprout --replicas=$NumMSCS
kubectl scale deployment urhomestead --replicas=$NumURH
kubectl scale deployment mschomestead --replicas=$NumMSCH
sleep 30
#sleep 5

#Logic to create users in sipppods
echo Creating users in sipppods
NumSipptest=$(kubectl get pods | grep sipptest | wc -l)
SipptestPods=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#SipptestIPs=$(kubectl get pods -o wide | grep sipptest | cut -d ' ' -f34)
base=2010000010
IncrementUser=1
count=9990
TotalUsers=49990
UsersPerSipp=$(echo "scale=0; $TotalUsers/$NumSipptest" | bc -l)
for i in $(seq 1 $NumSipptest); do
LocalSipptestPod=$(echo $SipptestPods | cut -d ' ' -f$i);
echo SipptestPod $LocalSipptestPod;
base=2010000010
for j in $(seq 1 $NumSipptest); do
cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator-template1 ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j

sed -i '9s@.*@base=2010000010@' ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j
sed -i "9s@2010000010@$base@" ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j

sed -i '10s@.*@count=9990@' ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j
sed -i "10s@9990@$UsersPerSipp@" ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j

sed -i '14s@.*@NumGroupUser=0@' ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j
sed -i "14s@0@$j@" ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j

kubectl cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$j
kubectl exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$j

base=`echo $base + $UsersPerSipp | bc`
base=`echo $base + $IncrementUser | bc`
done

done
