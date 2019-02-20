#!/bin/bash
#CONTADOR=0

#Requests the users, duration and approximate time
echo Numer of users?
read users
echo tests duration?
read duration
#echo approximate Time?
#read aproxTime

#Principal Script to mak3 32 t3sts
NumTest=1
NumberTest=33
while [ $NumTest -lt $NumberTest ]; do
export NumTest

#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/Containers2/$users$duration
testfolder=~/ClearwaterTestResults/Containers2/$users$duration

#Creating file if does not exist
touch $testfolder/Variables.txt
echo stateTest=1 > $testfolder/Variables.txt

#before start the test, capture packets if are needy
#mkdir -p $testfolder/wireshark
#tshark -i any -w $testfolder/wireshark/packets.pcap -q &
#wait a second for tshark started
sleep 1

#Execute test script on background
. ~/clearwater-docker/ScriptsContainers/CWPrueba1.sh $users $duration &

#saves initial time
echo "Initial time: $(date +"%T")" >> $testfolder/Tiempos.csv

#This script monitor CPU and m3mory until Subscript finish and chang3 variable into file
source $testfolder/Variables.txt
#while [ $CONTADOR -lt $TimeContainer ]; do
while [ "$stateTest" -eq '1' ]; do
     now=$(date +"%T")
     echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) >> $testfolder/contenedores.csv
     #let CONTADOR=CONTADOR+1
     #Ch3ch if variable chang3 from subscipt
     source $testfolder/Variables.txt
     if [ "$stateTest" -eq '2' ]
     then
        echo Finalizo prueba scriptPrincipal
     fi
 done

#Regarding containers and their instances distribute the logs in eachone.
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest chronos_2 chronos_3; do
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest; do
 #for i in astaire cassandra chronos bono homer homestead ralf sprout sipptest; do
for i in astaire cassandra chronos bono homer homestead ralf sprout sipptest; do
 cat $testfolder/contenedores.csv | grep $i >> $testfolder/$i.csv;
 done
 let NumTest=NumTest+1
 done
#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
