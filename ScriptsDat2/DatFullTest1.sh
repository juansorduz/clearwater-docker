#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
password=${2:-secret}
option=${3:-3}
NumberTest=${4:-2}

source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM
START=$(date +%s.%N)
echo PRUEBA COMPLETA
#echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullSummary1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullPromedy1.sh $Duration $password $option $NumberTest
END=$(date +%s.%N)
LATENCY=$(echo "$END - $START" | bc)
echo Latency $LATENCY > ~/LatencyCompleteDeployment.txt

exit 0

echo PRUEBA DE DESPLIEGUE CON b2u1s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
#exit 0

echo PRUEBA DE DESPLIEGUE CON b1u2s1
echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b1u1s2
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

exit 0

echo PRUEBA DE DESPLIEGUE CON b3u1s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b2u2s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b2u1s2
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b3u2s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b3u1s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b3u2s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

exit 0

echo PRUEBA DE DESPLIEGUE CON b4u1s1
echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b4u2s1
echo -e "NumSipp=4\nNumBono=4\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b4u1s2
echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

echo PRUEBA DE DESPLIEGUE CON b5u1s1
echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest

exit 0
