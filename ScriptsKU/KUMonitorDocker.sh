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
sshpass -p $password scp -r ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker1@$AddressVM1:~/
echo AdressVM2: $AddressVM2
sshpass -p $password scp -r ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker2@$AddressVM2:~/
echo AdressVM3: $AddressVM3
sshpass -p $password scp -r ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker3@$AddressVM3:~/
echo AdressVM4: $AddressVM4
sshpass -p $password scp -r ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker4@$AddressVM4:~/
echo AdressVM5: $AddressVM5
sshpass -p $password scp -r ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker5@$AddressVM5:~/
echo AdressVM6: $AddressVM6
sshpass -p $password scp -r ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker6@$AddressVM6:~/
echo AdressVM7: $AddressVM7
sshpass -p $password scp -r ~/clearwater-docker/Scripts/LocalDockerMonitor.sh worker7@$AddressVM7:~/


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
sshpass -p $password ssh -t worker1@$AddressVM1 "mkdir -p $testfolder"
sshpass -p $password ssh -t worker2@$AddressVM2 "mkdir -p $testfolder"
sshpass -p $password ssh -t worker3@$AddressVM3 "mkdir -p $testfolder"
sshpass -p $password ssh -t worker4@$AddressVM4 "mkdir -p $testfolder"
sshpass -p $password ssh -t worker5@$AddressVM5 "mkdir -p $testfolder"
sshpass -p $password ssh -t worker6@$AddressVM6 "mkdir -p $testfolder"
sshpass -p $password ssh -t worker7@$AddressVM7 "mkdir -p $testfolder"

echo Copying control file in local VMs
sshpass -p $password scp -r $testfolder/Variables.txt worker1@$AddressVM1:$testfolder/Variables.txt
sshpass -p $password scp -r $testfolder/Variables.txt worker2@$AddressVM2:$testfolder/Variables.txt
sshpass -p $password scp -r $testfolder/Variables.txt worker3@$AddressVM3:$testfolder/Variables.txt
sshpass -p $password scp -r $testfolder/Variables.txt worker4@$AddressVM4:$testfolder/Variables.txt
sshpass -p $password scp -r $testfolder/Variables.txt worker5@$AddressVM5:$testfolder/Variables.txt
sshpass -p $password scp -r $testfolder/Variables.txt worker6@$AddressVM6:$testfolder/Variables.txt
sshpass -p $password scp -r $testfolder/Variables.txt worker7@$AddressVM7:$testfolder/Variables.txt

exit 0
################################################################################
#Execute test script on background
################################################################################
. ~/clearwater-docker/Scripts/tester_kubernetes.sh $cps $duration $ip &




#saves initial time
echo "Initial time: $(date +"%T")" > $testfolder/Tiempos.csv
#docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) > $testfolder/data.csv
kubectl top pods > $testfolder/data.csv
#This script monitor CPU and m3mory until Subscript finish and chang3 variable into file
source $testfolder/Variables.txt
#variables to control number of samples per tests
NumberOfSample=0
NumberOfRateCaptureSample=100
#while [ $CONTADOR -lt $TimeContainer ]; do
while [ "$stateTest" -eq '1' ]; do
     now=$(date +"%T")
     #echo $now
     if [ $NumberOfRateCaptureSample -lt $NumberOfSample ]
     then
       #echo $NumberOfSample
       #echo $now
       echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
       kubectl top pods >> $testfolder/data.csv
       NumberOfSample=0
       #echo $NumberOfSample

     fi

     #let CONTADOR=CONTADOR+1
     #Ch3ch if variable chang3 from subscipt
     let NumberOfSample=NumberOfSample+1
     source $testfolder/Variables.txt
     if [ "$stateTest" -eq '2' ]
     then
        echo Finalizo prueba scriptPrincipal
     fi
 done

#Regarding containers and their instances distribute the logs in eachone.
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest chronos_2 chronos_3; do
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout scscf.sprout sipptest; do
 for i in astaire urcassandra msccassandra chronos bono ellis homestead-prov homer urhomestead mschomestead ralf ursprout mscsprout sipptest; do
    cat $testfolder/data.csv | grep $i > $testfolder/$i.csv;
 done
 let NumTest=NumTest+1
 echo Sleeping zZzZzZ
 sleep 30
 done
#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
