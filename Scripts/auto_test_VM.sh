#!/bin/bash
cps=${1:-10}
duration=${2:-10}
NumTest=${3:-1}
IPBonoAPI=${4:-0}
PortBonoAPI=${5:-0}
filecsv=${6:-0}
password='nfv1234'
echo Running auto_test script
#docker cp ~/PruebaBono/CSVs/x$file sipptest:/usr/share/clearwater/sip-stress/users.csv.1
#sipptest=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
if [ "$filecsv" -eq '1' ]
  then
    sshpass -p $password scp ~/clearwater-docker/Scripts/users.csv worker@10.55.3.95:/usr/share/clearwater/sip-stress/users.csv.1
fi
#kubectl cp ~/PruebaBono/CSVs/xaa worker@10.55.3.95:/usr/share/clearwater/sip-stress/users.csv.1
sshpass -p $password scp ~/clearwater-docker/Scripts/sip-stress worker@10.55.3.95:/usr/share/clearwater/bin/sip-stress
sshpass -p $password scp ~/clearwater-docker/Scripts/sip-stress.xml worker@10.55.3.95:/usr/share/clearwater/sip-stress/sip-stress.xml
kubectl exec worker@10.55.3.95 chmod 777 /usr/share/clearwater/bin/sip-stress
kubectl exec worker@10.55.3.95 chmod 777 /usr/share/clearwater/sip-stress/sip-stress.xml
kubectl exec worker@10.55.3.95 chmod +x /usr/share/clearwater/bin/sip-stress
kubectl exec worker@10.55.3.95 chmod +x /usr/share/clearwater/sip-stress/sip-stress.xml
#kubectl exec worker@10.55.3.95 ./usr/share/clearwater/bin/sip-stress
#Deleting old Scripts
#kubectl exec worker@10.55.3.95 sh -c 'rm /var/log/clearwater-sipp/*'
echo Copy scripts inside sipp
#kubectl exec worker@10.55.3.95 ./usr/share/clearwater/bin/sip-stress
#mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest
#testfolder=~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest
kubectl exec worker@10.55.3.95 ./usr/share/clearwater/bin/sip-stress
