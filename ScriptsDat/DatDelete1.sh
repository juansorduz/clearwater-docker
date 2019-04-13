#!/bin/bash
password=${1:-secret}
option=${2:-1}
source ~/clearwater-docker/ScriptsDat/LocalFiles/AddressVM

sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "rm -f ~/ControlLocalDockerMonitor2.sh ; rm -f ~/LocalDockerMonitor.sh ; rm -f ~/LocalDockerMonitor2.sh; rm -f ~/LocalDockerMonitor3.sh; rm -f ~/DataTest.txt; rm -f -r ~/ClearwaterTestResults"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "rm -f ~/ControlLocalDockerMonitor2.sh ; rm -f ~/LocalDockerMonitor.sh ; rm -f ~/LocalDockerMonitor2.sh; rm -f ~/LocalDockerMonitor3.sh; rm -f ~/DataTest.txt; rm -f -r ~/ClearwaterTestResults"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "rm -f ~/ControlLocalDockerMonitor2.sh ; rm -f ~/LocalDockerMonitor.sh ; rm -f ~/LocalDockerMonitor2.sh; rm -f ~/LocalDockerMonitor3.sh; rm -f ~/DataTest.txt; rm -f -r ~/ClearwaterTestResults"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "rm -f ~/ControlLocalDockerMonitor2.sh ; rm -f ~/LocalDockerMonitor.sh ; rm -f ~/LocalDockerMonitor2.sh; rm -f ~/LocalDockerMonitor3.sh; rm -f ~/DataTest.txt; rm -f -r ~/ClearwaterTestResults"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "rm -f ~/ControlLocalDockerMonitor2.sh ; rm -f ~/LocalDockerMonitor.sh ; rm -f ~/LocalDockerMonitor2.sh; rm -f ~/LocalDockerMonitor3.sh; rm -f ~/DataTest.txt; rm -f -r ~/ClearwaterTestResults"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "rm -f ~/ControlLocalDockerMonitor2.sh ; rm -f ~/LocalDockerMonitor.sh ; rm -f ~/LocalDockerMonitor2.sh; rm -f ~/LocalDockerMonitor3.sh; rm -f ~/DataTest.txt; rm -f -r ~/ClearwaterTestResults"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker7@$AddressVM7 "rm -f ~/ControlLocalDockerMonitor2.sh ; rm -f ~/LocalDockerMonitor.sh ; rm -f ~/LocalDockerMonitor2.sh; rm -f ~/LocalDockerMonitor3.sh; rm -f ~/DataTest.txt; rm -f -r ~/ClearwaterTestResults"

if [ "$option" -eq '1' ]
then
  kubectl delete services --all && kubectl delete deployment --all && kubectl delete pods --all
fi
