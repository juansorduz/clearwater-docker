#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
password=${2:-secret}
NumberTest=${3:-2}
option=${4:-3}

source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM
rm -r ~/ClearwaterTestResults/Kubernetes5
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "rm -r ~/ClearwaterTestResults/Kubernetes5"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "rm -r ~/ClearwaterTestResults/Kubernetes5"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "rm -r ~/ClearwaterTestResults/Kubernetes5"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "rm -r ~/ClearwaterTestResults/Kubernetes5"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "rm -r ~/ClearwaterTestResults/Kubernetes5"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "rm -r ~/ClearwaterTestResults/Kubernetes5"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no master@$AddressVM0 "rm -r ~/ClearwaterTestResults/Kubernetes5"

#A CONTINUACION SE EJECUTAN DIFERENTES PRUEBAS CON DESPLIEGUES DIFERENTES
echo PRUEBA DE DESPLIEGUE CON 1 BONO
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON 2 BONO
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON 3 BONO
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON 4 BONO
echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON 5 BONO
echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

exit 0
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
