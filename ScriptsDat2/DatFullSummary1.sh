#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
NumberTest=${4:-2}

# source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM
# rm -r ~/ClearwaterTestResults/Kubernetes5
# sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "rm -r ~/ClearwaterTestResults/Kubernetes5"
# sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "rm -r ~/ClearwaterTestResults/Kubernetes5"
# sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "rm -r ~/ClearwaterTestResults/Kubernetes5"
# sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "rm -r ~/ClearwaterTestResults/Kubernetes5"
# sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "rm -r ~/ClearwaterTestResults/Kubernetes5"
# sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "rm -r ~/ClearwaterTestResults/Kubernetes5"
# sshpass -p $password ssh -t -o StrictHostKeyChecking=no master@$AddressVM0 "rm -r ~/ClearwaterTestResults/Kubernetes5"

#A CONTINUACION SE EJECUTAN DIFERENTES PRUEBAS CON DESPLIEGUES DIFERENTES
echo PRUEBA DE DESPLIEGUE CON 1 BONO
#echo Duration $Duration password $password option $option NumberTest $NumberTest
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON 2 BONO
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON 3 BONO
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON 4 BONO
echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON 5 BONO
echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE 1 BONO 2 URSPROUT 2 MSCSPROUT
echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE 1 BONO 3 URSPROUT 3 MSCSPROUT
echo -e "NumSipp=1\nNumBono=1\nNumURS=3\nNumMSCS=3\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE 2 BONO 2 URSPROUT 2 MSCSPROUT
echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE 3 BONO 3 URSPROUT 3 MSCSPROUT
echo -e "NumSipp=3\nNumBono=3\nNumURS=3\nNumMSCS=3\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE 5 BONO 1 URSPROUT 1 MSCSPROUT
echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE 5 BONO 3 URSPROUT 3 MSCSPROUT
echo -e "NumSipp=5\nNumBono=5\nNumURS=3\nNumMSCS=3\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

echo PRUEBA DE DESPLIEGUE 5 BONO 5 URSPROUT 5 MSCSPROUT
echo -e "NumSipp=5\nNumBono=5\nNumURS=5\nNumMSCS=5\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $Duration $NumberTest

exit 0
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  20 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  30 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  40 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  50 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  60 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  70 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  80 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  90 $Duration $password $option $NumberTest
#sleep 30
#echo Sleeping zZzZzZ
. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  100 $Duration $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  120 $Duration $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  150 $Duration $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  200 $Duration $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  250 $Duration $password $option $NumberTest

. ~/clearwater-docker/ScriptsDat/DatMonitor1.sh  300 $Duration $password $option $NumberTest
