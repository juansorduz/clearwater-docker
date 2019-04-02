#!/bin/bash
cps=${1:-10}
duration=${2:-10}
IPBonoAPI=${3:-0}
PortBonoAPI=${4:-0}
filecsv=${5:-0}

echo Running auto_test script
#docker cp ~/PruebaBono/CSVs/x$file sipptest:/usr/share/clearwater/sip-stress/users.csv.1
sipptest=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
if [ "$filecsv" -eq '1' ]
  then
    docker cp ~/clearwater-docker/Scripts/users.csv $sipptest:/usr/share/clearwater/sip-stress/users.csv.1
fi
#kubectl cp ~/PruebaBono/CSVs/xaa $sipptest:/usr/share/clearwater/sip-stress/users.csv.1
kubectl cp ~/clearwater-docker/Scripts/sip-stress $sipptest:/usr/share/clearwater/bin/sip-stress
kubectl cp ~/clearwater-docker/Scripts/sip-stress.xml $sipptest:/usr/share/clearwater/sip-stress/sip-stress.xml
kubectl exec $sipptest chmod 777 /usr/share/clearwater/bin/sip-stress
kubectl exec $sipptest chmod 777 /usr/share/clearwater/sip-stress/sip-stress.xml
kubectl exec $sipptest chmod +x /usr/share/clearwater/bin/sip-stress
kubectl exec $sipptest chmod +x /usr/share/clearwater/sip-stress/sip-stress.xml
#kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress
#Deleting old Scripts
kubectl exec $sipptest sh -c '/var/log/clearwater-sipp/*'
echo Copy scripts inside sipp
#kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress
mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration
testfolder=~/ClearwaterTestResults/Kubernetes3/$cps$duration
touch $testfolder/logsSIPpTest.txt
kubectl exec $sipptest ./usr/share/clearwater/bin/sip-stress > $testfolder/logsSIPpTest.txt
