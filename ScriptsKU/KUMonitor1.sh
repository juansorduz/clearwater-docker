#!/bin/bash
users=${1:-0}
duration=${2:-0}
NumberTest=${3:-2}

echo "CPM $users Duration $duration"

#Principal Script to mak3 32 t3sts
NumTest=1
#NumberTest=33
while [ $NumTest -lt $NumberTest ]; do
export NumTest

#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/Kubernetes1/$users$duration/$users$duration$NumTest
testfolder=~/ClearwaterTestResults/Kubernetes1/$users$duration/$users$duration$NumTest
export testfolder

#Creating file if does not exist
touch $testfolder/Variables.txt
echo stateTest=1 > $testfolder/Variables.txt

#before start the test, capture packets if are needy
#mkdir -p $testfolder/wireshark
#tshark -i any -w $testfolder/wireshark/packets.pcap -q &
#wait a second for tshark started
sleep 1

          #pods=$(kubectl get pods)
          #astairepod=$(kubectl get pods | grep astaire | cut -d ' ' -f1)
          #bonopod=$(kubectl get pods | grep bono | cut -d ' ' -f1)
          #cassandrapod=$(kubectl get pods | grep cassandra | cut -d ' ' -f1)
          #chronospod=$(kubectl get pods | grep chronos | cut -d ' ' -f1)
          #ellispod=$(kubectl get pods | grep ellis | cut -d ' ' -f1)
          #homerpod=$(kubectl get pods | grep homer | cut -d ' ' -f1)
          #homesteadpod3=$(kubectl get pods | grep homestead- | cut -d ' ' -f1)
          #homesteadpod2=($homesteadpod3)
          #homestead=${homesteadpod2[0]}
          #homesteadprovpod=$(kubectl get pods | grep homestead-prov | cut -d ' ' -f1)
          #ralfpod=$(kubectl get pods | grep ralf | cut -d ' ' -f1)
          #sipptestpod=$(kubectl get pods | grep sipptest | cut -d ' ' -f1)
          #sproutpod=$(kubectl get pods | grep sprout | cut -d ' ' -f1)

. ~/clearwater-docker/ScriptsKU/KUTestSippStart1.sh $users $duration &

echo "Initial time: $(date +"%T")" >> $testfolder/Tiempos.csv
#This script monitor CPU and m3mory until Subscript finish and chang3 variable into file
source $testfolder/Variables.txt
#while [ $CONTADOR -lt $TimeContainer ]; do
while [ "$stateTest" -eq '1' ]; do
     now=$(date +"%T")
     echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) >> $testfolder/data.csv
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
  for i in astaire_astaire cassandra_cassandra chronos_chronos bono_bono homer_homer homestead_homestead homestead-prov_homestead-prov ralf_ralf sprout_sprout sipptest_sipptest; do

  cat $testfolder/data.csv | grep $i >> $testfolder/$i.csv;
 #
  done
  let NumTest=NumTest+1
  done
#when the script finish, kill tshark process to stop packet capture
 #pkill tshark
