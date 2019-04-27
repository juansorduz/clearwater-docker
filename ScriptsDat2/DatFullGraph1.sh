#!/bin/bash
#CONTADOR=0
duration=${1:-120}
NumberTest=${2:-2}

echo duration $duration NumberTest $NumberTest
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
echo GRAFICA CON 1 BONO
#echo duration $duration password $password option $option NumberTest $NumberTest
# echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA CON 2 BONO
# echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA CON 3 BONO
# echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA CON 4 BONO
# echo -e "NumSipp=4\nNumBono=4\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA CON 5 BONO
# echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA 1 BONO 2 URSPROUT 2 MSCSPROUT
# echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA 1 BONO 3 URSPROUT 3 MSCSPROUT
# echo -e "NumSipp=1\nNumBono=1\nNumURS=3\nNumMSCS=3\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA 2 BONO 2 URSPROUT 2 MSCSPROUT
# echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA 3 BONO 3 URSPROUT 3 MSCSPROUT
# echo -e "NumSipp=3\nNumBono=3\nNumURS=3\nNumMSCS=3\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA 5 BONO 1 URSPROUT 1 MSCSPROUT
# echo -e "NumSipp=5\nNumBono=5\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA 5 BONO 3 URSPROUT 3 MSCSPROUT
# echo -e "NumSipp=5\nNumBono=5\nNumURS=3\nNumMSCS=3\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh
#
# echo GRAFICA 5 BONO 5 URSPROUT 5 MSCSPROUT
# echo -e "NumSipp=5\nNumBono=5\nNumURS=5\nNumMSCS=5\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
# . ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

echo PRUEBA DE DESPLIEGUE CON b1u1s1
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

echo PRUEBA DE DESPLIEGUE CON b2u1s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

echo PRUEBA DE DESPLIEGUE CON b1u2s1
echo -e "NumSipp=1\nNumBono=1\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

echo PRUEBA DE DESPLIEGUE CON b1u1s2
echo -e "NumSipp=1\nNumBono=1\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

echo PRUEBA DE DESPLIEGUE CON b3u1s1
echo -e "NumSipp=3\nNumBono=3\nNumURS=1\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

echo PRUEBA DE DESPLIEGUE CON b2u2s1
echo -e "NumSipp=2\nNumBono=2\nNumURS=2\nNumMSCS=1\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

echo PRUEBA DE DESPLIEGUE CON b2u1s2
echo -e "NumSipp=2\nNumBono=2\nNumURS=1\nNumMSCS=2\nNumURH=1\nNumMSCH=1\nMaintestfolder=~/ClearwaterTestResults/Kubernetes5" > ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSCR1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainCPSvsSingleLatency1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsCPU1.sh
. ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphMainVMCPSvsRAM1.sh

exit 0
