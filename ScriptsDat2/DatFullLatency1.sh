#!/bin/bash
#CONTADOR=0
option=${1:-1}

#echo 60 60
#exit 0

echo A CONTINUACION SE ANALIZA LA LATENCIA GENERAL PARA DISTINTOS DESPLIEGUES DE KUBERNETES
echo PRUEBAS DE NIVEL 0
echo PRUEBA DE DESPLIEGUE CON b1u1s1
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBAS DE NIVEL 1
echo PRUEBA DE DESPLIEGUE CON b2u1s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBA DE DESPLIEGUE CON b1u2s1
echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBA DE DESPLIEGUE CON b1u1s2
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBAS DE NIVEL 2

echo PRUEBA DE DESPLIEGUE CON b3u1s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBA DE DESPLIEGUE CON b2u2s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBA DE DESPLIEGUE CON b2u1s2
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBAS DE NIVEL 3

echo PRUEBA DE DESPLIEGUE CON b3u2s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBA DE DESPLIEGUE CON b3u1s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

echo PRUEBA DE DESPLIEGUE CON b3u2s2
echo -e "NumSipp=3\nNumBono=3\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option
#
# echo PRUEBAS DE NIVEL 4
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option
#
# echo PRUEBA DE DESPLIEGUE CON b4u2s1
# echo -e "NumSipp=4\nNumBono=4\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option
#
# echo PRUEBA DE DESPLIEGUE CON b4u1s2
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option
#
# echo PRUEBA DE DESPLIEGUE CON b5u1s1
# echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/DatLatencyAnalyzis.sh $option

#exit 0
