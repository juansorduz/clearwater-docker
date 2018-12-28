#!/bin/bash

#Requests the users, duration and approximate time
echo Numer of users?
read users
echo tests duration?
read duration
echo approximate Time?
read aproxTime
#echo numero de users: $users, duration: $duration

. ~/clearwater-docker/ScriptsVM/CWPrueba1.sh $users $duration -q &


#Create tests folder if not exits
mkdir -p ~/ClearwaterTestResults/VM/$users$duration
testfolder=~/ClearwaterTestResults/VM/$users$duration

#saves initial time
echo "Initial time: $(date +"%T")" >> $testfolder/Tiempos.csv

#calculate aproximate time
CONTADOR=0
TimeSeg=240
TimeVM=$((150*$aproxTime))
echo Approximate Time $aproxTime
echo Time seg $TimeSeg
echo Time vm $TimeVM

#Configurate components and metric
for j in Ellis Bono Sprout Homer Dime Vellum; do
VBoxManage metrics setup --period 1 --samples 1 "$j" CPU/Load,RAM/Usage
VBoxManage metrics setup --period 1 --samples 1 "$j" Guest/CPU/Load,Guest/RAM/Usage
VBoxManage metrics setup --period 1 --samples 1 "$j" Guest/CPU/Load/User
done

while [ $CONTADOR -lt $TimeVM ]; do

     now=$(date +"%T")
     echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv

     for i in Ellis Bono Sprout Homer Dime Vellum; do

     VBoxManage metrics query "$i" Guest/CPU/Load/User >> $testfolder/$i.csv
     done

     let CONTADOR=CONTADOR+1
 done
for h in Ellis Bono Sprout Homer Dime Vellum; do
sed '/Object/ d' $testfolder/$h.csv > $testfolder/$h.txt
sed '/--------------- ---------------------------------------- --------------------------------------------/ d' $testfolder/$h.txt > $testfolder/$h.csv
done
