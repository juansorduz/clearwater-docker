#!/bin/bash
usuarios=${1:-1000}
password=${2:-secret}
kubectl label nodes worker1 Tnode=notsipp
kubectl label nodes worker2 Tnode=notsipp
kubectl label nodes worker3 Tnode=notsipp
kubectl label nodes worker4 Tnode=notsipp
kubectl label nodes worker5 Tnode=notsipp
kubectl label nodes worker6 Tnode=notsipp
kubectl label nodes worker7 Tnode=sipp

source ~/clearwater-docker/ScriptsDat/LocalFiles/AddressVM
echo Copying files to local VMs
echo Copying Data Control monitor files
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/DataTest.txt worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/DataTest.txt worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/DataTest.txt worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/DataTest.txt worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/DataTest.txt worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/DataTest.txt worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/DataTest.txt worker7@$AddressVM7:~/

echo Copying Control monitor files
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/ControlLocalDockerMonitor.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/ControlLocalDockerMonitor.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/ControlLocalDockerMonitor.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/ControlLocalDockerMonitor.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/ControlLocalDockerMonitor.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/ControlLocalDockerMonitor.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/ControlLocalDockerMonitor.sh worker7@$AddressVM7:~/

echo Copying Type1 monitor file

sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor1.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor1.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor1.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor1.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor1.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor1.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor1.sh worker7@$AddressVM7:~/

echo Copying Type2 monitor file
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor2.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor2.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor2.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor2.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor2.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor2.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor2.sh worker7@$AddressVM7:~/

echo Copying Type3 monitor file
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor3.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor3.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor3.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor3.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor3.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor3.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/ScriptsDat/LocalFiles/LocalDockerMonitor3.sh worker7@$AddressVM7:~/

cd
cd metrics-server/
kubectl apply -f deploy/1.8+/
cd
cd clearwater-docker
kubectl create configmap env-vars --from-literal=ZONE=default.svc.cluster.local
kubectl apply -f kubernetes3
sleep 300
urcassandrapod=$(kubectl get pods | grep urcassandra | cut -d ' ' -f1)
kubectl exec $urcassandrapod /usr/share/clearwater/crest-prov/src/metaswitch/crest/tools/stress_provision.sh $usuarios
sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
cp ~/clearwater-docker/ScriptsDat/TrafficGenerator/sip-stress-usergenerator-template ~/clearwater-docker/ScriptsDat/TrafficGenerator/sip-stress-usergenerator
kubectl cp ~/clearwater-docker/ScriptsDat/TrafficGenerator/sip-stress-usergenerator $sipptestpod:/usr/share/clearwater/infrastructure/scripts/sip-stress
kubectl exec $sipptestpod /usr/share/clearwater/infrastructure/scripts/sip-stress
