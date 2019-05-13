#!/bin/bash
#CONTADOR=0
Duration=${1:-120}
password=${2:-secret}
optionMonitor=${3:-2}
NumberTest=${4:-2}

source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM

echo A CONTINUACION SE EJECUTAN DIFERENTES PRUEBAS CON DESPLIEGUES DIFERENTES
# echo PRUEBA DE DESPLIEGUE CON b1u1s1
# START=$(date +%s.%N)
# echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
# END=$(date +%s.%N)
# LATENCY=$(echo "$END - $START" | bc)
# echo Latency $LATENCY > ~/LatencyCompleteMonitortxt

#exit 0

# echo PRUEBAS DE NIVEL 1
# START=$(date +%s.%N)
# echo PRUEBA DE DESPLIEGUE CON b2u1s1
# echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
# END=$(date +%s.%N)
# LATENCY=$(echo "$END - $START" | bc)
# echo Latency $LATENCY > ~/LatencyCompleteMonitortxt

# echo PRUEBA DE DESPLIEGUE CON b1u2s1
# START=$(date +%s.%N)
# echo PRUEBA DE DESPLIEGUE CON b1u2s1
# echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
# END=$(date +%s.%N)
# LATENCY=$(echo "$END - $START" | bc)
# echo Latency $LATENCY > ~/LatencyCompleteMonitortxt
#
# echo PRUEBA DE DESPLIEGUE CON b1u1s2
# echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
#
#
#
# echo PRUEBAS DE NIVEL 2
#
# echo PRUEBA DE DESPLIEGUE CON b3u1s1
# echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b2u2s1
# echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b2u1s2
# echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest

echo PRUEBAS DE NIVEL 3

echo PRUEBA DE DESPLIEGUE CON b3u2s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest

echo PRUEBA DE DESPLIEGUE CON b3u1s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest

echo PRUEBA DE DESPLIEGUE CON b3u2s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest

# echo PRUEBAS DE NIVEL 4
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b4u2s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s2
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest
#
# echo PRUEBA DE DESPLIEGUE CON b5u1s1
# echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh $Duration $password $optionMonitor $NumberTest

#exit 0
