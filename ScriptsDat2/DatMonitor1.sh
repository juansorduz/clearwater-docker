#!/bin/bash
#CONTADOR=0

cps=${1:-10}
duration=${2:-120}
password=${3:-secret}
option=${4:-3}
NumberTest=${5:-2}


#Looking for VMs ip
source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM

#Loading test characteristics
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics

#Principal Script to mak3 32 t3sts
NumTest=1
#In this test the number of bonos is the same of sipppods
#NumBonos=$(kubectl get pods | grep sipptest | wc -l)
#echo NumBonos= $NumBonos
#NumberTest=33
while [ $NumTest -lt $NumberTest ]; do
export NumTest

echo time $(date +"%T") NumTest:$NumTest, cps: $cps, duration: $duration
#Create tests folder if not exits
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest
mkdir -p $testfolder
#testfolder=~/ClearwaterTestResults/Kubernetes5/b$NumBono/$cps$duration/$NumTest
export testfolder

#Creating control file if does not exist
[ -e $testfolder/Variables.txt ] && rm $testfolder/Variables.txt
touch $testfolder/Variables.txt
#echo stateTest=1\ncps=$cps\nduration=$duration\nNumTest=NumTest  > $testfolder/Variables.txt
echo -e "stateTest=1"  > $testfolder/Variables.txt
#echo -e "stateMonitor=3\ncps=$cps\nduration=$duration\nNumTest=$NumTest\nNumBono=$NumBono\nNumURS=$NumURS\nNumMSCS=$NumMSCS\nNumURH=$NumURH\nNumMSCH=$NumMSCH"  > $testfolder/DataTest.txt

if [ "$option" -eq '1' ]
then
  echo -e "stateMonitor=1\ncps=$cps\nduration=$duration\nNumTest=$NumTest\nNumBono=$NumBono\nNumURS=$NumURS\nNumMSCS=$NumMSCS\nNumURH=$NumURH\nNumMSCH=$NumMSCH"  > $testfolder/DataTest.txt
  echo Monitoring dockers
fi

#Execute VM monitor script
if [ "$option" -eq '2' ]
then
  echo -e "stateMonitor=2\ncps=$cps\nduration=$duration\nNumTest=$NumTest\nNumBono=$NumBono\nNumURS=$NumURS\nNumMSCS=$NumMSCS\nNumURH=$NumURH\nNumMSCH=$NumMSCH"  > $testfolder/DataTest.txt
  echo Monitoring VMs
fi

#Execute docker and VM monitor script
if [ "$option" -eq '3' ]
then
  echo -e "stateMonitor=3\ncps=$cps\nduration=$duration\nNumTest=$NumTest\nNumBono=$NumBono\nNumURS=$NumURS\nNumMSCS=$NumMSCS\nNumURH=$NumURH\nNumMSCH=$NumMSCH"  > $testfolder/DataTest.txt
  echo Monitoring dockers and VMs
fi

#exit 0

################################################################################
#Send control file for local monitor
################################################################################
#Read VM ips
echo Creating repository in local VMs
#echo AdressVM1: $AddressVM1
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no master@$AddressVM0 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest"
sleep 2

echo Copying control file in local VMs
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt

echo Copying file with test information in all workers
cp $testfolder/DataTest.txt ~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt master@$AddressVM0:~/

#exit 0

################################################################################
#Deleting old files
################################################################################

rm -f $testfolder/VM1LocalVMdata.csv
rm -f $testfolder/VM2LocalVMdata.csv
rm -f $testfolder/VM3LocalVMdata.csv
rm -f $testfolder/VM4LocalVMdata.csv
rm -f $testfolder/VM5LocalVMdata.csv
rm -f $testfolder/VM6LocalVMdata.csv
rm -f $testfolder/VM0LocalVMdata.csv

################################################################################
#Execute test script and delay script on background
################################################################################
#Logic to select all microservice instances
#NumSipptest=$(kubectl get pods | grep sipptest | wc -l)
#SipptestPods=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#SipptestIPs=$(kubectl get pods -o wide | grep sipptest | cut -d ' ' -f34)
CPSperSippPod=$(echo "scale=0; $cps/$NumSipp" | bc -l)
#echo $CPSperSippPod
for i in $(seq 1 $NumSipp); do
echo Prueba de carga No.$i;
#LocalSipptestPod=$(echo $SipptestPods | cut -d ' ' -f$i);
#LocalSipptestIP=$(echo $SipptestIPs | cut -d ' ' -f$i);
. ~/clearwater-docker/ScriptsDat2/TrafficGenerator/tester_kubernetes1.sh $CPSperSippPod $duration $i &
. ~/clearwater-docker/ScriptsDat2/Latency/Tester_Latency1.sh $i &
done




################################################################################
#Start Loop to control VMs
################################################################################

source $testfolder/Variables.txt

SumTests=0
SumFinishTests=`echo $NumSipp + 1 | bc`
echo SumFinishTests $SumFinishTests
while [ "$SumTests" -lt "$SumFinishTests" ]; do

     SumTests=$(cat $testfolder/Variables.txt | wc -l)
     #SumTests=4
     #echo $SumTests
     if [ "$SumTests" -eq "$SumFinishTests" ]
     then
       echo -e "stateTest=2\nstateTest1=2\nstateTest2=2\nstateTest3=2"  > $testfolder/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/Variables.txt
       echo Finalizo prueba scriptPrincipal
     fi
 done

#exit 0
sleep 2
################################################################################
#Recover stats files of each VM
################################################################################

if [ "$option" -eq '1' ]
then
  echo Recovering docker data
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM1LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM2LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM3LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM4LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM5LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM6LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM0LocalDockerdata.csv
  cp $testfolder/contenedores.csv $testfolder/VM7LocalDockerdata.csv
  cat $testfolder/*LocalDockerdata.csv > $testfolder/AllDockerData.csv
  sleep 2
  echo Classifying docker data
  for i in astaire_astaire urcassandra_urcassandra msccassandra_msccassandra chronos_chronos bono_bono homer_homer urhomestead_urhomestead mschomestead_mschomestead homestead-prov_homestead-prov ralf_ralf ursprout_ursprout mscsprout_mscsprout sipptest_sipptest; do
     cat $testfolder/AllDockerData.csv | grep $i > $testfolder/Docker$i.csv;
  done
fi

#Execute VM monitor script
if [ "$option" -eq '2' ]
then
  echo Recovering VM data
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM1LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM2LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM3LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM4LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM5LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM6LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM0LocalVMCPUdata.csv
  cp $testfolder/VMCPU.csv $testfolder/VM7LocalVMCPUdata.csv
  cat $testfolder/*LocalVMCPUdata.csv > $testfolder/AllVMCPUData.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM1LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM2LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM3LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM4LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM5LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM6LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM0LocalVMRAMdata.csv
  cp $testfolder/VMRAM.csv $testfolder/VM7LocalVMRAMdata.csv
  cat $testfolder/*LocalVMRAMdata.csv > $testfolder/AllVMRAMData.csv
  sleep 2
  echo Classifying VM data
fi

#Execute docker and VM monitor script
if [ "$option" -eq '3' ]
then
  echo Recovering dockers and VM data
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM1LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM2LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM3LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM4LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM5LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM6LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/contenedores.csv $testfolder/VM0LocalDockerdata.csv
  cp $testfolder/contenedores.csv $testfolder/VM7LocalDockerdata.csv
  cat $testfolder/*LocalDockerdata.csv > $testfolder/AllDockerData.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM1LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM2LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM3LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM4LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM5LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM6LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM0LocalVMCPUdata.csv
  cp $testfolder/VMCPU.csv $testfolder/VM7LocalVMCPUdata.csv
  cat $testfolder/*LocalVMCPUdata.csv > $testfolder/AllVMCPUData.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM1LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM2LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM3LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM4LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM5LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM6LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM0LocalVMRAMdata.csv
  cp $testfolder/VMRAM.csv $testfolder/VM7LocalVMRAMdata.csv
  cat $testfolder/*LocalVMRAMdata.csv > $testfolder/AllVMRAMData.csv
  sleep 2
  echo Classifying dockers and VM data
  for i in astaire_astaire urcassandra_urcassandra msccassandra_msccassandra chronos_chronos bono_bono ellis_ellis homer_homer urhomestead_urhomestead mschomestead_mschomestead homestead-prov_homestead-prov ralf_ralf ursprout_ursprout mscsprout_mscsprout sipptest_sipptest; do
     cat $testfolder/AllDockerData.csv | grep $i > $testfolder/Docker$i.csv;
  done
fi

#exit 0
 let NumTest=NumTest+1
 #echo $NumTest
 echo cooling system for new test
 #sleep 30
 done
#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
