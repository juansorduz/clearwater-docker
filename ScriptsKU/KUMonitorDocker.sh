#!/bin/bash
#CONTADOR=0

cps=${1:-10}
duration=${2:-120}
ip=${3:-127.0.0.1}
password=${4:-secret}
NumberTest=${5:-2}


#Seding monitor files to local VMs
source ~/clearwater-docker/Scripts/AddressVM
echo Copying files to local VMs
echo AdressVM1: $AddressVM1
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker1@$AddressVM1:~/
echo AdressVM2: $AddressVM2
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker2@$AddressVM2:~/
echo AdressVM3: $AddressVM3
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker3@$AddressVM3:~/
echo AdressVM4: $AddressVM4
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker4@$AddressVM4:~/
echo AdressVM5: $AddressVM5
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker5@$AddressVM5:~/
echo AdressVM6: $AddressVM6
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker6@$AddressVM6:~/
echo AdressVM7: $AddressVM7
sshpass -p $password scp -r -o StrictHostKeyChecking=no ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker7@$AddressVM7:~/


#Principal Script to mak3 32 t3sts
NumTest=1
#NumberTest=33
while [ $NumTest -lt $NumberTest ]; do
export NumTest

echo time $(date +"%T") NumTest:$NumTest, cps: $cps, duration: $duration, ip: $ip
#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest
testfolder=~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest
export testfolder

#Creating control file if does not exist
[ -e $testfolder/Variables.txt ] && rm $testfolder/Variables.txt
touch $testfolder/Variables.txt
echo stateTest=1 > $testfolder/Variables.txt

sleep 1

################################################################################
#Send control file for local monitor
################################################################################
#Read VM ips
echo Creating repository in local VMs
#echo AdressVM1: $AddressVM1
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker1@$AddressVM1 "mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker2@$AddressVM2 "mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker3@$AddressVM3 "mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker4@$AddressVM4 "mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker5@$AddressVM5 "mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker6@$AddressVM6 "mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest"
sshpass -p $password ssh -t -o StrictHostKeyChecking=no worker7@$AddressVM7 "mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest"

echo Copying control file in local VMs
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker7@$AddressVM7:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt

sleep 2

#exit 0

################################################################################
#Execute monitor VM scripts on background
################################################################################
sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker1@$AddressVM1 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
sleep 1
sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker2@$AddressVM2 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
sleep 1
sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker3@$AddressVM3 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
sleep 1
sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker4@$AddressVM4 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
sleep 1
sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker5@$AddressVM5 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
sleep 1
sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker6@$AddressVM6 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
sleep 1
sshpass -p $password ssh -f -t -o StrictHostKeyChecking=no worker7@$AddressVM7 ". ~/LocalDockerMonitor.sh $cps $duration $NumTest"
sleep 4

################################################################################
#Deleting old files
################################################################################

rm -f $testfolder/VM1LocalVMdata.csv
rm -f $testfolder/VM2LocalVMdata.csv
rm -f $testfolder/VM3LocalVMdata.csv
rm -f $testfolder/VM4LocalVMdata.csv
rm -f $testfolder/VM5LocalVMdata.csv
rm -f $testfolder/VM6LocalVMdata.csv
rm -f $testfolder/VM7LocalVMdata.csv

################################################################################
#Execute test script on background
################################################################################
. ~/clearwater-docker/Scripts/tester_kubernetes.sh $cps $duration $ip & 2> /dev/null

################################################################################
#Start Loop to control VMs
################################################################################

source $testfolder/Variables.txt

while [ "$stateTest" -eq '1' ]; do

     source $testfolder/Variables.txt
     if [ "$stateTest" -eq '2' ]
     then
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
       sshpass -p $password scp -r -o StrictHostKeyChecking=no $testfolder/Variables.txt worker7@$AddressVM7:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/Variables.txt
       echo Finalizo prueba scriptPrincipal
     fi
 done

#exit 0
sleep 2
################################################################################
#Recover stats files of each VM
################################################################################

sshpass -p $password scp -r -o StrictHostKeyChecking=no worker1@$AddressVM1:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/contenedores.csv $testfolder/VM1LocalVMdata.csv
sshpass -p $password scp -r -o StrictHostKeyChecking=no worker2@$AddressVM2:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/contenedores.csv $testfolder/VM2LocalVMdata.csv
sshpass -p $password scp -r -o StrictHostKeyChecking=no worker3@$AddressVM3:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/contenedores.csv $testfolder/VM3LocalVMdata.csv
sshpass -p $password scp -r -o StrictHostKeyChecking=no worker4@$AddressVM4:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/contenedores.csv $testfolder/VM4LocalVMdata.csv
sshpass -p $password scp -r -o StrictHostKeyChecking=no worker5@$AddressVM5:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/contenedores.csv $testfolder/VM5LocalVMdata.csv
sshpass -p $password scp -r -o StrictHostKeyChecking=no worker6@$AddressVM6:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/contenedores.csv $testfolder/VM6LocalVMdata.csv
sshpass -p $password scp -r -o StrictHostKeyChecking=no worker7@$AddressVM7:~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest/contenedores.csv $testfolder/VM7LocalVMdata.csv
echo Finalizo recoleccion de archivos de monitorizacion

cat $testfolder/*LocalVMdata.csv > $testfolder/AllVMData.csv

#exit 0

#Regarding containers and their instances distribute the logs in eachone.
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest chronos_2 chronos_3; do
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout scscf.sprout sipptest; do
 #for i in astaire urcassandra msccassandra chronos bono ellis homestead-prov homer urhomestead mschomestead ralf ursprout mscsprout sipptest; do
 for i in astaire_astaire urcassandra_urcassandra msccassandra_msccassandra chronos_chronos bono_bono homer_homer urhomestead_urhomestead mschomestead_mschomestead homestead-prov_homestead-prov ralf_ralf ursprout_ursprout mscsprout_mscsprout sipptest_sipptest; do
    cat $testfolder/AllVMData.csv | grep $i > $testfolder/$i.csv;
 done
 let NumTest=NumTest+1
 echo Sleeping zZzZzZ
 #sleep 30
 done
#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
