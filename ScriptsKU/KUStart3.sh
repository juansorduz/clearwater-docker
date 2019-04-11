#!/bin/bash
usuarios=${1:-1000}
kubectl label nodes worker1 Tnode=notsipp
kubectl label nodes worker2 Tnode=notsipp
kubectl label nodes worker3 Tnode=notsipp
kubectl label nodes worker4 Tnode=notsipp
kubectl label nodes worker5 Tnode=notsipp
kubectl label nodes worker6 Tnode=notsipp
kubectl label nodes worker7 Tnode=sipp

echo Copying files to local VMs
echo AdressVM1: $AddressVM1
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker1@$AddressVM1:~/
echo AdressVM2: $AddressVM2
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker2@$AddressVM2:~/
echo AdressVM3: $AddressVM3
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker3@$AddressVM3:~/
echo AdressVM4: $AddressVM4
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker4@$AddressVM4:~/
echo AdressVM5: $AddressVM5
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker5@$AddressVM5:~/
echo AdressVM6: $AddressVM6
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker6@$AddressVM6:~/
echo AdressVM7: $AddressVM7
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker7@$AddressVM7:~/

sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor2.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor2.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor2.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor2.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor2.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor2.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor2.sh worker7@$AddressVM7:~/

sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/ControlLocalDockerMonitor2.sh worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/ControlLocalDockerMonitor2.sh worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/ControlLocalDockerMonitor2.sh worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/ControlLocalDockerMonitor2.sh worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/ControlLocalDockerMonitor2.sh worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/ControlLocalDockerMonitor2.sh worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/ControlLocalDockerMonitor2.sh worker7@$AddressVM7:~/

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
kubectl exec $sipptestpod /usr/share/clearwater/infrastructure/scripts/sip-stress
