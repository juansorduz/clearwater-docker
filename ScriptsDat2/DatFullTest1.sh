#!/bin/bash
#CONTADOR=0
password=${1:-secret}
optionMonitor=${2:-2}
NumberTest=${3:-2}

#echo 60 60
#exit 0

echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM
#. ~/clearwater-docker/ScriptsDat2/DatRefreshDeployment.sh $password

echo A CONTINUACION SE EJECUTAN DIFERENTES PRUEBAS CON DISTINTAS COMBINACIONES
echo PRUEBAS DE NIVEL 0
echo PRUEBA DE DESPLIEGUE CON b1u1s1
START=$(date +%s.%N)
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 3 33
. ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
. ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4

# echo PRUEBAS DE NIVEL 1
# echo PRUEBA DE DESPLIEGUE CON b2u1s1
# echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
#
# echo PRUEBA DE DESPLIEGUE CON b1u2s1
# echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b1u1s2
# echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBAS DE NIVEL 2
#
# echo PRUEBA DE DESPLIEGUE CON b3u1s1
# echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b2u2s1
# echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b2u1s2
# echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBAS DE NIVEL 3
#
# echo PRUEBA DE DESPLIEGUE CON b3u2s1
# echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b3u1s2
# echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b3u2s2
# echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBAS DE NIVEL 4
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b4u2s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s2
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4
#
# echo PRUEBA DE DESPLIEGUE CON b5u1s1
# echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSMonitor1.sh 60 $password 2 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSSummary1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatFullCPSPromedy1.sh 60 33
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh 4

END=$(date +%s.%N)
LATENCY=$(echo "$END - $START" | bc)
echo Latency Monitor, Summary and Promedy $LATENCY > ~/LatencyCompleteAllTest.txt

#exit 0
