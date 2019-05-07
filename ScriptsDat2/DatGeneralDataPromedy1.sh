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
#testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/
testMainfolder=~/ClearwaterTestResults/Summaries/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
mkdir -p $testfolder
mkdir -p $testMainfolder

echo CPS: $cps Duration: $duration b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
#Deleting old files
if [ $cps = '25' ];
then
  echo Deleting old scripts
  #[ -e $testMainfolder/SUMMARYLATENCY ] && rm $testMainfolder/SUMMARYLATENCY
  [ -e $testMainfolder/SUMMARYSINGLELATENCY ] && rm $testMainfolder/SUMMARYSINGLELATENCY
  [ -e $testMainfolder/SUMMARYSCR ] && rm $testMainfolder/SUMMARYSCR
  #echo "#cps Delay VarLatency" >> $testMainfolder/SUMMARYLATENCY
  echo "#cps Latency VarLatency" >> $testMainfolder/SUMMARYSINGLELATENCY
  echo "#cps SuccessfullCallRate VarSuccessfullCallRate" >> $testMainfolder/SUMMARYSCR
  for j in regSetup CallSetup CallTeardown ; do
    [ -e $testMainfolder/SUMMARY$j ] && rm $testMainfolder/SUMMARY$j
    echo "cps AverageRange010 VarRange010 AverageRange1025 VarRange1025 AverageRange2550 VarRange2550 AverageRange50100 VarRange50100 AverageRange100150 VarRange100150 AverageRange150200 VarRange150200 AverageRange200300 VarRange200300 AverageRange300500 VarRange300500 AverageRange5001000 VarRange5001000 AverageRange100010000 VarRange100010000 AverageRange10000n VarRange10000n" > $testMainfolder/SUMMARY$j
  done

fi

DiferenceVar=0
NumProms=0

# #############################################################################
# #LATENCY
# #############################################################################
# echo Calculating Latency
# DatosLatency=$(<$testfolder/PromediosDelay$cps)
# AverageLatency=0
# VarLatency=0
# NumProms=$(wc -l < $testfolder/PromediosDelay$cps)
# for i in ${DatosLatency[@]}; do  AverageLatency=$(echo "$AverageLatency + $i" | bc -l) ; done
# AverageLatency=$(echo "scale=3;$AverageLatency/$NumProms" | bc -l)
# for i in ${DatosLatency[@]}; do DiferenceVar=$(echo "$i - $AverageLatency" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarLatency=$(echo "$VarLatency + $DiferenceVar" | bc -l) ; done
# VarLatency=$(echo "scale=3;$VarLatency/$NumProms" | bc -l)
# echo "$cps $AverageLatency $VarLatency" >> $testMainfolder/SUMMARYLATENCY

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
VarSingleLatency=$(echo "scale=3;sqrt($VarSingleLatency)" | bc -l)
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
VarSCPS=$(echo "scale=3;sqrt($VarSCPS)" | bc -l)
echo "$cps $AverageSCPS $VarSCPS" >> $testMainfolder/SUMMARYSCR
#############################################################################
#LATENCY2
#############################################################################
for j in regSetup CallSetup CallTeardown ; do
  echo Ranges Latency $j
  DatosRange010=$(<$testfolder/RangesLatency/Range010$j.csv)
  DatosRange1025=$(<$testfolder/RangesLatency/Range1025$j.csv)
  DatosRange2550=$(<$testfolder/RangesLatency/Range2550$j.csv)
  DatosRange50100=$(<$testfolder/RangesLatency/Range50100$j.csv)
  DatosRange100150=$(<$testfolder/RangesLatency/Range100150$j.csv)
  DatosRange150200=$(<$testfolder/RangesLatency/Range150200$j.csv)
  DatosRange200300=$(<$testfolder/RangesLatency/Range200300$j.csv)
  DatosRange300500=$(<$testfolder/RangesLatency/Range300500$j.csv)
  DatosRange5001000=$(<$testfolder/RangesLatency/Range5001000$j.csv)
  DatosRange100010000=$(<$testfolder/RangesLatency/Range100010000$j.csv)
  DatosRange10000n=$(<$testfolder/RangesLatency/Range10000n$j.csv)

  AverageRange010=0
  AverageRange1025=0
  AverageRange2550=0
  AverageRange50100=0
  AverageRange100150=0
  AverageRange150200=0
  AverageRange200300=0
  AverageRange300500=0
  AverageRange5001000=0
  AverageRange100010000=0
  AverageRange10000n=0

  VarRange010=0
  VarRange1025=0
  VarRange2550=0
  VarRange50100=0
  VarRange100150=0
  VarRange150200=0
  VarRange200300=0
  VarRange300500=0
  VarRange5001000=0
  VarRange100010000=0
  VarRange10000n=0

  NumProms=$(wc -l < $testfolder/RangesLatency/Range010$j.csv)
  for i in ${DatosRange010[@]}; do  AverageRange010=$(echo "$AverageRange010 + $i" | bc -l) ; done
  AverageRange010=$(echo "scale=3;$AverageRange010/$NumProms" | bc -l)
  for i in ${DatosRange010[@]}; do DiferenceVar=$(echo "$i - $AverageRange010" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange010=$(echo "$VarRange010 + $DiferenceVar" | bc -l) ; done
  VarRange010=$(echo "scale=3;$VarRange010/$NumProms" | bc -l)
  VarRange010=$(echo "scale=3;sqrt($VarRange010)" | bc -l)

  NumProms=$(wc -l < $testfolder//RangesLatency/Range1025$j.csv)
  for i in ${DatosRange1025[@]}; do  AverageRange1025=$(echo "$AverageRange1025 + $i" | bc -l) ; done
  AverageRange1025=$(echo "scale=3;$AverageRange1025/$NumProms" | bc -l)
  for i in ${DatosRange1025[@]}; do DiferenceVar=$(echo "$i - $AverageRange1025" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange1025=$(echo "$VarRange1025 + $DiferenceVar" | bc -l) ; done
  VarRange1025=$(echo "scale=3;$VarRange1025/$NumProms" | bc -l)
  VarRange1025=$(echo "scale=3;sqrt($VarRange1025)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range2550$j.csv)
  for i in ${DatosRange2550[@]}; do  AverageRange2550=$(echo "$AverageRange2550 + $i" | bc -l) ; done
  AverageRange2550=$(echo "scale=3;$AverageRange2550/$NumProms" | bc -l)
  for i in ${DatosRange2550[@]}; do DiferenceVar=$(echo "$i - $AverageRange2550" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange2550=$(echo "$VarRange2550 + $DiferenceVar" | bc -l) ; done
  VarRange2550=$(echo "scale=3;$VarRange2550/$NumProms" | bc -l)
  VarRange2550=$(echo "scale=3;sqrt($VarRange2550)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range50100$j.csv)
  for i in ${DatosRange50100[@]}; do  AverageRange50100=$(echo "$AverageRange50100 + $i" | bc -l) ; done
  AverageRange50100=$(echo "scale=3;$AverageRange50100/$NumProms" | bc -l)
  for i in ${DatosRange50100[@]}; do DiferenceVar=$(echo "$i - $AverageRange50100" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange50100=$(echo "$VarRange50100 + $DiferenceVar" | bc -l) ; done
  VarRange50100=$(echo "scale=3;$VarRange50100/$NumProms" | bc -l)
  VarRange50100=$(echo "scale=3;sqrt($VarRange50100)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range100150$j.csv)
  for i in ${DatosRange100150[@]}; do  AverageRange100150=$(echo "$AverageRange100150 + $i" | bc -l) ; done
  AverageRange100150=$(echo "scale=3;$AverageRange100150/$NumProms" | bc -l)
  for i in ${DatosRange100150[@]}; do DiferenceVar=$(echo "$i - $AverageRange100150" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange100150=$(echo "$VarRange100150 + $DiferenceVar" | bc -l) ; done
  VarRange100150=$(echo "scale=3;$VarRange100150/$NumProms" | bc -l)
  VarRange100150=$(echo "scale=3;sqrt($VarRange100150)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range150200$j.csv)
  for i in ${DatosRange150200[@]}; do  AverageRange150200=$(echo "$AverageRange150200 + $i" | bc -l) ; done
  AverageRange150200=$(echo "scale=3;$AverageRange150200/$NumProms" | bc -l)
  for i in ${DatosRange150200[@]}; do DiferenceVar=$(echo "$i - $AverageRange150200" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange150200=$(echo "$VarRange150200 + $DiferenceVar" | bc -l) ; done
  VarRange150200=$(echo "scale=3;$VarRange150200/$NumProms" | bc -l)
  VarRange150200=$(echo "scale=3;sqrt($VarRange150200)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range200300$j.csv)
  for i in ${DatosRange200300[@]}; do  AverageRange200300=$(echo "$AverageRange200300 + $i" | bc -l) ; done
  AverageRange200300=$(echo "scale=3;$AverageRange200300/$NumProms" | bc -l)
  for i in ${DatosRange200300[@]}; do DiferenceVar=$(echo "$i - $AverageRange200300" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange200300=$(echo "$VarRange200300 + $DiferenceVar" | bc -l) ; done
  VarRange200300=$(echo "scale=3;$VarRange200300/$NumProms" | bc -l)
  VarRange200300=$(echo "scale=3;sqrt($VarRange200300)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range300500$j.csv)
  for i in ${DatosRange300500[@]}; do  AverageRange300500=$(echo "$AverageRange300500 + $i" | bc -l) ; done
  AverageRange300500=$(echo "scale=3;$AverageRange300500/$NumProms" | bc -l)
  for i in ${DatosRange300500[@]}; do DiferenceVar=$(echo "$i - $AverageRange300500" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange300500=$(echo "$VarRange300500 + $DiferenceVar" | bc -l) ; done
  VarRange300500=$(echo "scale=3;$VarRange300500/$NumProms" | bc -l)
  VarRange300500=$(echo "scale=3;sqrt($VarRange300500)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range5001000$j.csv)
  for i in ${DatosRange5001000[@]}; do  AverageRange5001000=$(echo "$AverageRange5001000 + $i" | bc -l) ; done
  AverageRange5001000=$(echo "scale=3;$AverageRange5001000/$NumProms" | bc -l)
  for i in ${DatosRange5001000[@]}; do DiferenceVar=$(echo "$i - $AverageRange5001000" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange5001000=$(echo "$VarRange5001000 + $DiferenceVar" | bc -l) ; done
  VarRange5001000=$(echo "scale=3;$VarRange5001000/$NumProms" | bc -l)
  VarRange5001000=$(echo "scale=3;sqrt($VarRange5001000)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range100010000$j.csv)
  for i in ${DatosRange100010000[@]}; do  AverageRange100010000=$(echo "$AverageRange100010000 + $i" | bc -l) ; done
  AverageRange100010000=$(echo "scale=3;$AverageRange100010000/$NumProms" | bc -l)
  for i in ${DatosRange100010000[@]}; do DiferenceVar=$(echo "$i - $AverageRange100010000" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange100010000=$(echo "$VarRange100010000 + $DiferenceVar" | bc -l) ; done
  VarRange100010000=$(echo "scale=3;$VarRange100010000/$NumProms" | bc -l)
  VarRange100010000=$(echo "scale=3;sqrt($VarRange100010000)" | bc -l)

  NumProms=$(wc -l < $testfolder/RangesLatency/Range10000n$j.csv)
  for i in ${DatosRange10000n[@]}; do  AverageRange10000n=$(echo "$AverageRange10000n + $i" | bc -l) ; done
  AverageRange10000n=$(echo "scale=3;$AverageRange10000n/$NumProms" | bc -l)
  for i in ${DatosRange10000n[@]}; do DiferenceVar=$(echo "$i - $AverageRange10000n" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRange10000n=$(echo "$VarRange10000n + $DiferenceVar" | bc -l) ; done
  VarRange10000n=$(echo "scale=3;$VarRange10000n/$NumProms" | bc -l)
  VarRange10000n=$(echo "scale=3;sqrt($VarRange10000n)" | bc -l)

  echo "$cps $AverageRange010 $VarRange010 $AverageRange1025 $VarRange1025 $AverageRange2550 $VarRange2550 $AverageRange50100 $VarRange50100 $AverageRange100150 $VarRange100150 $AverageRange150200 $VarRange150200 $AverageRange200300 $VarRange200300 $AverageRange300500 $VarRange300500 $AverageRange5001000 $VarRange5001000 $AverageRange100010000 $VarRange100010000 $AverageRange10000n $VarRange10000n" >> $testMainfolder/SUMMARY$j

done
