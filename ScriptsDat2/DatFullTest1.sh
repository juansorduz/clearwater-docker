#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
password=${2:-secret}
option=${3:-3}
NumberTest=${4:-2}
duration=$Duration
#echo $duration $Duration
#exit 0

echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM
. ~/clearwater-docker/ScriptsDat2/DatRefreshDeployment.sh $password

echo A CONTINUACION SE EJECUTAN DIFERENTES PRUEBAS CON DESPLIEGUES DIFERENTES
echo PRUEBAS DE NIVEL 0
echo PRUEBA DE DESPLIEGUE CON b1u1s1
START=$(date +%s.%N)
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest
END=$(date +%s.%N)
LATENCY=$(echo "$END - $START" | bc)
echo Latency Monitor, Summary and Promedy $LATENCY > ~/LatencyComplete.txt

echo PRUEBAS DE NIVEL 1
echo PRUEBA DE DESPLIEGUE CON b2u1s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON b1u2s1
echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON b1u1s2
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBAS DE NIVEL 2

echo PRUEBA DE DESPLIEGUE CON b3u1s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON b2u2s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON b2u1s2
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBAS DE NIVEL 3

echo PRUEBA DE DESPLIEGUE CON b3u2s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON b3u1s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

echo PRUEBA DE DESPLIEGUE CON b3u2s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

# echo PRUEBAS DE NIVEL 4
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b4u2s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s2
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b5u1s1
# echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $option $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh $duration $NumberTest
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh $duration $NumberTest

#exit 0
