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
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
mkdir -p $testfolder

echo CPS: $cps Duration: $duration b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
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
echo Calculating Latency
DatosLatency=$(<$testfolder/PromediosDelay$cps)
AverageLatency=0
VarLatency=0
NumProms=$(wc -l < $testfolder/PromediosDelay$cps)
for i in ${DatosLatency[@]}; do  AverageLatency=$(echo "$AverageLatency + $i" | bc -l) ; done
AverageLatency=$(echo "scale=3;$AverageLatency/$NumProms" | bc -l)
for i in ${DatosLatency[@]}; do DiferenceVar=$(echo "$i - $AverageLatency" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarLatency=$(echo "$VarLatency + $DiferenceVar" | bc -l) ; done
VarLatency=$(echo "scale=3;$VarLatency/$NumProms" | bc -l)
echo "$cps $AverageLatency $VarLatency" >> $testMainfolder/SUMMARYLATENCY

#############################################################################
#SINGLELATENCY
#############################################################################
echo Calculating SingleLatency
DatosSingleLatency=$(<$testfolder/PromediosSingleLatency$cps)
AverageSingleLatency=0
VarSingleLatency=0
NumProms=$(wc -l < $testfolder/PromediosSingleLatency$cps)
for i in ${DatosSingleLatency[@]}; do  AverageSingleLatency=$(echo "$AverageSingleLatency + $i" | bc -l) ; done
AverageSingleLatency=$(echo "scale=3;$AverageSingleLatency/$NumProms" | bc -l)
for i in ${DatosSingleLatency[@]}; do DiferenceVar=$(echo "$i - $AverageSingleLatency" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarSingleLatency=$(echo "$VarSingleLatency + $DiferenceVar" | bc -l) ; done
VarSingleLatency=$(echo "scale=3;$VarSingleLatency/$NumProms" | bc -l)
echo "$cps $AverageSingleLatency $VarSingleLatency" >> $testMainfolder/SUMMARYSINGLELATENCY

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
