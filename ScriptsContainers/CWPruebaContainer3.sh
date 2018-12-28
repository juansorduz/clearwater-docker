#!/bin/bash
#CONTADOR=0

#Requests the users, duration and approximate time
echo Numer of users?
read users
echo tests duration?
read duration
echo approximate Time?
read aproxTime
#echo numero de users: $users, duration: $duration

#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/Containers3/$users$duration
testfolder=~/ClearwaterTestResults/Containers3/$users$duration

#before start the test, capture packets if are needy
mkdir -p $testfolder/wireshark
#tshark -i any -w $testfolder/wireshark/packets.pcap -q &
#wait a second for tshark started
sleep 1

#Execute test script on background
. ~/clearwater-docker/ScriptsContainers/CWPrueba3.sh $users $duration &

#saves initial time
echo "Initial time: $(date +"%T")" >> $testfolder/Tiempos.csv

#calculate aproximate time
CONTADOR=0
TimeSeg=30
TimeContainer=$((30*$aproxTime))
echo Approximate Time $aproxTime
echo Time seg $TimeSeg
echo Time container $TimeContainer

#Monitoring more or less the test time, every measure take two or three seconds, regarding the test time calculate the seconds needy to Monitoring
#the traffic before and after the test
while [ $CONTADOR -lt $TimeContainer ]; do
     now=$(date +"%T")
     echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) >> $testfolder/contenedores.csv
     let CONTADOR=CONTADOR+1
 done

#Regarding containers and their instances distribute the logs in eachone.
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest chronos_2 chronos_3; do
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout scscf.sprout sipptest; do
 for i in astaire cassandra chronos bono homer homestead ralf sprout s_p_r_o_u_t_3 sipptest; do
   # if [ "$i" -eq 'sprout' ]; then
   #   cat $testfolder/contenedores.csv | grep $i >> $testfolder/icscf_sprout.csv;
   # elif [ "$i" -eq 'scscf.sprout' ]; then
   #   cat $testfolder/contenedores.csv | grep $i >> $testfolder/scscf_sprout.csv;
   # else
   #   cat $testfolder/contenedores.csv | grep $i >> $testfolder/$i.csv;
   # fi
   # case "$1" in
   #   sprout)
   #   cat $testfolder/contenedores.csv | grep $i >> $testfolder/icscf_sprout.csv;
   #   ;;
   #
   #   scscf.sprout)
   #   cat $testfolder/contenedores.csv | grep $i >> $testfolder/scscf_sprout.csv;
   #   ;;
   #
   #   *)
    cat $testfolder/contenedores.csv | grep $i >> $testfolder/$i.csv;
   #   ;;
   # esac
 done

#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
