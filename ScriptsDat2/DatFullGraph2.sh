#!/bin/bash
#CONTADOR=0
i=${1:-120}
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
 for i in Nivel1 Nivel2 Nivel3 Nivel4 Nivel5; do
. ~/clearwater-docker/ScriptsDat2/Graphs/Niveles/${i}DatGraphDeploymentsCPSvsCPU1.sh $i
. ~/clearwater-docker/ScriptsDat2/Graphs/Niveles/${i}DatGraphDeploymentsCPSvsRAM1.sh $i
. ~/clearwater-docker/ScriptsDat2/Graphs/Niveles/${i}DatGraphDeploymentsCPSvsSCR1.sh $i
done
exit 0
for i in Nivel1 Nivel2 Nivel3 Nivel4; do
  cat ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphAllDeploymentsCPSvsCPU1.sh > ~/clearwater-docker/ScriptsDat2/Graphs/Niveles/${i}DatGraphDeploymentsCPSvsCPU1.sh
  cat ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphAllDeploymentsCPSvsRAM1.sh > ~/clearwater-docker/ScriptsDat2/Graphs/Niveles/${i}DatGraphDeploymentsCPSvsRAM1.sh
  cat ~/clearwater-docker/ScriptsDat2/Graphs/DatGraphAllDeploymentsCPSvsSCR1.sh > ~/clearwater-docker/ScriptsDat2/Graphs/Niveles/${i}DatGraphDeploymentsCPSvsSCR1.sh
done
