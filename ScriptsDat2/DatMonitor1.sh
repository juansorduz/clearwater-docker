#!/bin/bash
#CONTADOR=0

cps=${1:-10}
duration=${2:-120}
NumBonos=${3:-2}
password=${4:-secret}
option=${5:-3}
NumberTest=${6:-2}


#Looking for VMs ip
source ~/clearwater-docker/ScriptsDat2/LocalFiles/AddressVM

#Principal Script to mak3 32 t3sts
NumTest=1
#NumberTest=33
while [ $NumTest -lt $NumberTest ]; do
export NumTest

echo time $(date +"%T") NumTest:$NumTest, cps: $cps, duration: $duration
#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest
testfolder=~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest
export testfolder

#Creating control file if does not exist
[ -e $testfolder/Variables.txt ] && rm $testfolder/Variables.txt
touch $testfolder/Variables.txt
#echo stateTest=1\ncps=$cps\nduration=$duration\nNumTest=NumTest  > $testfolder/Variables.txt
echo -e "stateTest=1"  > $testfolder/Variables.txt

if [ "$option" -eq '1' ]
then
  echo -e "stateMonitor=1\ncps=$cps\nduration=$duration\nNumTest=$NumTest"  > $testfolder/DataTest.txt
  echo Monitoring dockers
fi

#Execute VM monitor script
if [ "$option" -eq '2' ]
then
  echo -e "stateMonitor=2\ncps=$cps\nduration=$duration\nNumTest=$NumTest"  > $testfolder/DataTest.txt
  echo Monitoring VMs
fi

#Execute docker and VM monitor script
if [ "$option" -eq '3' ]
then
  echo -e "stateMonitor=3\ncps=$cps\nduration=$duration\nNumTest=$NumTest"  > $testfolder/DataTest.txt
  echo Monitoring dockers and VMs
fi

#exit 0

################################################################################
#Send control file for local monitor
################################################################################
#Read VM ips
echo Creating repository in local VMs
#echo AdressVM1: $AddressVM1
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no master@$AddressVM7 "mkdir -p ~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest"
sleep 2

echo Copying control file in local VMs
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt

echo Copying file with test information
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker1@$AddressVM1:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker2@$AddressVM2:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker3@$AddressVM3:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker4@$AddressVM4:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker5@$AddressVM5:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt worker6@$AddressVM6:~/
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/DataTest.txt master@$AddressVM0:~/

#exit 0

sleep 2

#exit 0

################################################################################
#Execute monitor VM scripts on background
################################################################################
# sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker1@$AddressVM1 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
# sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker2@$AddressVM2 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
# sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker3@$AddressVM3 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
# sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker4@$AddressVM4 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
# sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker5@$AddressVM5 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
# sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker6@$AddressVM6 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
# sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no master@$AddressVM7 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"

#sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "nohup bash ~/LocalDockerMonitor.sh $cps $duration $NumTest &"
#sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "nohup bash ~/LocalDockerMonitor.sh $cps $duration $NumTest &"
#sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "nohup bash ~/LocalDockerMonitor.sh $cps $duration $NumTest &"
#sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "nohup bash ~/LocalDockerMonitor.sh $cps $duration $NumTest &"
#sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "nohup bash ~/LocalDockerMonitor.sh $cps $duration $NumTest &"
#sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "nohup bash ~/LocalDockerMonitor.sh $cps $duration $NumTest &"
#sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no master@$AddressVM7 "nohup bash ~/LocalDockerMonitor.sh $cps $duration $NumTest &"


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
#Execute test script on background
################################################################################
#Logic to select all microservice instances
NumSipptest=$(kubectl get pods | grep sipptest | wc -l)
SipptestPods=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
#SipptestIPs=$(kubectl get pods -o wide | grep sipptest | cut -d ' ' -f34)
CPSperSippPod=$(echo "scale=0; $cps/$NumSipptest" | bc -l)
#echo $CPSperSippPod
for i in $(seq 1 $NumSipptest); do
#echo $i;
#LocalSipptestPod=$(echo $SipptestPods | cut -d ' ' -f$i);
#LocalSipptestIP=$(echo $SipptestIPs | cut -d ' ' -f$i);
. ~/clearwater-docker/ScriptsDat2/TrafficGenerator/tester_kubernetes1.sh $CPSperSippPod $duration $i &
done

################################################################################
#Execute latency script on background
################################################################################
for i in $(seq 1 $NumSipptest); do
#echo $i;
#LocalSipptestPod=$(echo $SipptestPods | cut -d ' ' -f$i);
#LocalSipptestIP=$(echo $SipptestIPs | cut -d ' ' -f$i);
. ~/clearwater-docker/ScriptsDat2/Latency/Tester_Latency.sh $i &
done


################################################################################
#Start Loop to control VMs
################################################################################

source $testfolder/Variables.txt

while [ "$stateTest" -eq '1' ]; do

     source $testfolder/Variables.txt
     #echo $stateTest
     if [ "$stateTest" -eq '2' ]
     then
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/Variables.txt
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
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM1LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM2LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM3LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM4LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM5LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM6LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM0LocalDockerdata.csv
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
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM1LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM2LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM3LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM4LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM5LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM6LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM0LocalVMCPUdata.csv
  cat $testfolder/*LocalVMCPUdata.csv > $testfolder/AllVMCPUData.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM1LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM2LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM3LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM4LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM5LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM6LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM0LocalVMRAMdata.csv
  cat $testfolder/*LocalVMRAMdata.csv > $testfolder/AllVMRAMData.csv
  sleep 2
  echo Classifying VM data
fi

#Execute docker and VM monitor script
if [ "$option" -eq '3' ]
then
  echo Recovering dockers and VM data
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM1LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM2LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM3LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM4LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM5LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM6LocalDockerdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/contenedores.csv $testfolder/VM0LocalDockerdata.csv
  cat $testfolder/*LocalDockerdata.csv > $testfolder/AllDockerData.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM1LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM2LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM3LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM4LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM5LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM6LocalVMCPUdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMCPU.csv $testfolder/VM0LocalVMCPUdata.csv
  cat $testfolder/*LocalVMCPUdata.csv > $testfolder/AllVMCPUData.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM1LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM2LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM3LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM4LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM5LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM6LocalVMRAMdata.csv
  sshpass -p $password scp -r -o StrictHostKeyChecking=no master@$AddressVM0:~/ClearwaterTestResults/Kubernetes5/b$NumBonos/$cps$duration/$NumTest/VMRAM.csv $testfolder/VM0LocalVMRAMdata.csv
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
