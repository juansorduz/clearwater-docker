#!/bin/bash
usuarios=${1:-1000}
password=${2:-secret}
option=${3:-1}

kubectl label nodes master Tnode=notsipp
kubectl label nodes worker1 Tnode=notsipp
kubectl label nodes worker2 Tnode=notsipp
kubectl label nodes worker3 Tnode=notsipp
kubectl label nodes worker4 Tnode=notsipp
kubectl label nodes worker5 Tnode=notsipp
kubectl label nodes worker6 Tnode=sipp
#kubectl label nodes worker7 Tnode=sipp

source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM
echo Copying files to local VMs
echo Copying Data Control monitor files
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/DataTest.txt worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/DataTest.txt worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/DataTest.txt worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/DataTest.txt worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/DataTest.txt worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/DataTest.txt worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/DataTest.txt master@$AddressVM0:~/

echo Copying Control monitor files
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/ControlLocalDockerMonitor1.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/ControlLocalDockerMonitor1.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/ControlLocalDockerMonitor1.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/ControlLocalDockerMonitor1.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/ControlLocalDockerMonitor1.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/ControlLocalDockerMonitor1.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/ControlLocalDockerMonitor1.sh master@$AddressVM0:~/

echo Copying Type1 monitor file

sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor1.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor1.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor1.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor1.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor1.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor1.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor1.sh master@$AddressVM0:~/

echo Copying Type2 monitor file
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor2.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor2.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor2.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor2.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor2.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor2.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor2.sh master@$AddressVM0:~/

echo Copying Type3 monitor file
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor3.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor3.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor3.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor3.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor3.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor3.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat2/LocalFiles/LocalDockerMonitor3.sh master@$AddressVM0:~/

if [ "$option" -eq '10' ]
then
  cd
  cd metrics-server/
  kubectl apply -f deploy/1.8+/
fi

cd
cd clearwater-docker
kubectl create configmap env-vars --from-literal=ZONE=default.svc.cluster.local
kubectl apply -f kubernetes3
sleep 300
urcassandrapod=$(kubectl get pods | grep urcassandra | cut -d ' ' -f1)
kubectl exec $urcassandrapod /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh $usuarios

#Logic for delete old ScriptsDat2
for i in $(seq 1 5); do
  rm -f ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$i
done

#Logic to create users in sipppods
NumSipptest=$(kubectl get pods | grep sipptest | wc -l)
SipptestPods=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#SipptestIPs=$(kubectl get pods -o wide | grep sipptest | cut -d ' ' -f34)
for i in $(seq 1 $NumSipptest); do
#echo $i;
LocalSipptestPod=$(echo $SipptestPods | cut -d ' ' -f$i);
#LocalSipptestIP=$(echo $SipptestIPs | cut -d ' ' -f$i);
echo SipptestPod $LocalSipptestPod;
#echo SipptestIP $LocalSipptestIP;
cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator-template$i ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$i
kubectl cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$i $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$i
kubectl exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$i
# for j in $(seq 1 5); do
#   cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator-template$j ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j
#   kubectl cp ~/clearwater-docker/ScriptsDat2/TrafficGenerator/sip-stress-usergenerator$j $LocalSipptestPod:/usr/share/clearwater/infrastructure/scripts/sip-stress$j
#   kubectl exec $LocalSipptestPod /usr/share/clearwater/infrastructure/scripts/sip-stress$j
# done
done
