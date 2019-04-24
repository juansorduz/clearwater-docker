#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
ip=${2:-127.0.0.1}
password=${3:-secret}
option=${4:-3}
NumberTest=${5:-2}

rm -r ~/ClearwaterTestResults/Kubernetes4

source ~/clearwater-docker/ScriptsDat/LocalFiles/AddressVM
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker7@$AddressVM7 "rm -r ~/ClearwaterTestResults/Kubernetes4"

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  10 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  20 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  30 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  40 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  50 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  60 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  70 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  80 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  90 $Duration $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  100 $Duration $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  120 $Duration $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  150 $Duration $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  200 $Duration $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  250 $Duration $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  300 $Duration $ip $password $option $NumberTest
