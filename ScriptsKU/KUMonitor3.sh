#!/bin/bash
#CONTADOR=0

cps=${1:-10}
duration=${2:-120}
ip=${3:-127.0.0.1}

#Requests the cps, duration and approximate time
#echo Numer of CPS?
#read cps
#echo tests duration?
#read duration

#echo approximate Time?
#read aproxTime

#Principal Script to mak3 32 t3sts
NumTest=1
NumberTest=2
while [ $NumTest -lt $NumberTest ]; do
export NumTest

echo cps: $cps, usuarios: $usrs, tiempo: $time, max_pause: $max_pause
#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration
testfolder=~/ClearwaterTestResults/Kubernetes3/$cps$duration
export testfolder

#Creating file if does not exist
touch $testfolder/Variables.txt
echo stateTest=1 > $testfolder/Variables.txt

#before start the test, capture packets if are needy
#mkdir -p $testfolder/wireshark
#tshark -i any -w $testfolder/wireshark/packets.pcap -q &
#wait a second for tshark started
sleep 1

#Execute test script on background
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
       echo $now
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
 done
#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
