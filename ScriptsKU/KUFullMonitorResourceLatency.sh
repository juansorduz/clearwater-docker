#!/bin/bash
#CONTADOR=0
ip=${1:-127.0.0.1}
NumberTest=${2:-2}

rm -r ~/ClearwaterTestResults/Kubernetes3

. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 10 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 20 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 30 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 40 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 50 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 60 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 70 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 80 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 90 30 $ip $NumberTest
#sleep 30
echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsKU/KUMonitor3.sh 100 30 $ip $NumberTest
