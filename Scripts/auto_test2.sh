#!/bin/bash
cps=${1:-10}
time=${2:-10}
IPBonoAPI=${3:-0}
PortBonoAPI=${4:-0}
filecsv=${5:-0}

#docker cp ~/PruebaBono/CSVs/x$file sipptest:/usr/share/clearwater/sip-stress/users.csv.1
#sipptest=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
sipptest=sipptest
if [ "$filecsv" -eq '1' ]
  then
    docker cp ~/clearwater-docker/Scripts/users.csv $sipptest:/usr/share/clearwater/sip-stress/users.csv.1
fi
#kubectl cp ~/PruebaBono/CSVs/xaa $sipptest:/usr/share/clearwater/sip-stress/users.csv.1
docker cp ~/clearwater-docker/Scripts/sip-stress2 $sipptest:/usr/share/clearwater/bin/sip-stress
docker cp ~/clearwater-docker/Scripts/sip-stress2.xml $sipptest:/usr/share/clearwater/sip-stress/sip-stress.xml
docker exec $sipptest ./usr/share/clearwater/bin/sip-stress > ~/ClearwaterTestResults/Containers3/$cps$time/logsSIPpTest.txt
#docker exec $sipptest ./usr/share/clearwater/bin/sip-stress
