#!/bin/bash
cps=${1:-20}
duration=${2:-120}
NumberTest=${3:-2}
DelayCallAnswer=${4:-60}
DelayBeforeACK=${5:-15}

#Logic to obtain average of each component
#NumTest=1
#NumberTest=33
Duration=1
testMainfolder=~/ClearwaterTestResults/Kubernetes4
testfolder=~/ClearwaterTestResults/Kubernetes4/$cps$duration

echo CPS: $cps Duration: $duration
#Deleting old files
if [ $cps = '10' ];
then
  echo Deleting old scripts
  [ -e $testMainfolder/SUMMARYLATENCY ] && rm $testMainfolder/SUMMARYLATENCY
  [ -e $testMainfolder/SUMMARYSCR ] && rm $testMainfolder/SUMMARYSCR
  echo "#cps Latency VarLatency" >> $testMainfolder/SUMMARYLATENCY
  echo "#cps SuccessfullCallRate VarSuccessfullCallRate" >> $testMainfolder/SUMMARYSCR

fi

DiferenceVar=0
NumProms=0

#############################################################################
#LATENCY
#############################################################################
echo Calculatin Latency
DatosLatency=$(<$testfolder/PromediosLatency$cps)
AverageLatency=0
VarLatency=0
NumProms=$(wc -l < $testfolder/PromediosLatency$cps)
for i in ${DatosLatency[@]}; do  AverageLatency=$(echo "$AverageLatency + $i" | bc -l) ; done
AverageLatency=$(echo "scale=3;$AverageLatency/$NumProms" | bc -l)
for i in ${DatosLatency[@]}; do DiferenceVar=$(echo "$i - $AverageLatency" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarLatency=$(echo "$VarLatency + $DiferenceVar" | bc -l) ; done
VarLatency=$(echo "scale=3;$VarLatency/$NumProms" | bc -l)
echo "$cps $AverageLatency $VarLatency" >> $testMainfolder/SUMMARYLATENCY


#############################################################################
#SUCCESFULL CALL RATE
#############################################################################
echo Calculatin SCR
DatosSCPS=$(<$testfolder/PromediosSCPS$cps)
AverageSCPS=0
VarSCPS=0
NumProms=$(wc -l < $testfolder/PromediosSCPS$cps)
for i in ${DatosSCPS[@]}; do  AverageSCPS=$(echo "$AverageSCPS + $i" | bc -l) ; done
AverageSCPS=$(echo "scale=3;$AverageSCPS/$NumProms" | bc -l)
for i in ${DatosSCPS[@]}; do DiferenceVar=$(echo "$i - $AverageSCPS" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarSCPS=$(echo "$VarSCPS + $DiferenceVar" | bc -l) ; done
VarSCPS=$(echo "scale=3;$VarSCPS/$NumProms" | bc -l)
echo "$cps $AverageSCPS $VarSCPS" >> $testMainfolder/SUMMARYSCR
