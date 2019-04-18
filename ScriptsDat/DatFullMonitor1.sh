#!/bin/bash
#CONTADOR=0
ip=${1:-127.0.0.1}
password=${2:-secret}
option=${3:-3}
NumberTest=${4:-2}

rm -r ~/ClearwaterTestResults/Kubernetes4

source ~/clearwater-docker/ScriptsDat/LocalFiles/AddressVM
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "rm -r ~/ClearwaterTestResults/Kubernetes4"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker7@$AddressVM7 "rm -r ~/ClearwaterTestResults/Kubernetes4"

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  10 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  20 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  30 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  40 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  50 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  60 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  70 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  80 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  90 120 $ip $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  100 120 $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  120 120 $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  150 120 $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  200 120 $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  250 120 $ip $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  300 120 $ip $password $option $NumberTest
