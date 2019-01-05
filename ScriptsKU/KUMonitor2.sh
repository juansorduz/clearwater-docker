#!/bin/bash
echo Numer of users?
read users
echo tests duration?
read duration
echo approximate Time?
read aproxTime

# pods=$(kubectl get pods)
# astairepod=$(kubectl get pods | grep astaire | cut -d ' ' -f1)
# bonopod=$(kubectl get pods | grep bono | cut -d ' ' -f1)
# cassandrapod=$(kubectl get pods | grep cassandra | cut -d ' ' -f1)
# chronospod=$(kubectl get pods | grep chronos | cut -d ' ' -f1)
# #ellispod=$(kubectl get pods | grep ellis | cut -d ' ' -f1)
# homerpod=$(kubectl get pods | grep homer | cut -d ' ' -f1)
# homesteadpod3=$(kubectl get pods | grep homestead- | cut -d ' ' -f1)
# homesteadpod2=($homesteadpod3)
# homestead=${homesteadpod2[0]}
# #homesteadprovpod=$(kubectl get pods | grep homestead-prov | cut -d ' ' -f1)
# ralfpod=$(kubectl get pods | grep ralf | cut -d ' ' -f1)
# sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
# icscfpod=$(kubectl get pods | grep sprout | cut -d ' ' -f1)
# scscfpod=$(kubectl get pods | grep sprout | cut -d ' ' -f1)
#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/Kubernetes2/$users$duration
testfolder=~/ClearwaterTestResults/Kubernetes2/$users$duration
aproxTime=$duration+30
if [ "$users" = "0" ]
then
    echo "Using default values"
fi

#before start the test, capture packets if are needy
#mkdir -p $testfolder/wireshark
#tshark -i any -w $testfolder/wireshark/packets.pcap -q &
#wait a second for tshark started
#sleep 1

. ~/clearwater-docker/ScriptsKU/KUTestSippStart2.sh $users $duration &

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
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) >> $testfolder/data.csv
     #kubectl top pod >> $testfolder/data.csv
     let CONTADOR=CONTADOR+1
 done

#Regarding containers and their instances distribute the logs in eachone.
 #for i in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest chronos_2 chronos_3; do
 for i in astaire_astaire cassandra_cassandra chronos_chronos bono_bono homer_homer homestead_homestead homestead-prov_homestead-prov ralf_ralf scscf_scscf icscf_icscf sipptest_sipptest; do

 cat $testfolder/data.csv | grep $i >> $testfolder/$i.csv;
#
 done

#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
