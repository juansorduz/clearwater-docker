#!/bin/bash
option=${1:-2}

source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testfolderdeployment=$Maintestfolder/
testMainfolder=~/ClearwaterTestResults/Summaries/VM

#Deleting old files
[ -e $testMainfolder/SUMMARYLATENCYCDF ] && rm $testMainfolder/SUMMARYLATENCYCDF


#exit 0
cd $testfolderdeployment

#SE GENERA UN ARCHIVO GENERAL CON TODA LA INFORMACION DEL DESPLIEGUE
if [ "$option" -eq '1' ]
then
  cat 1/RecollectionLatency.csv > FullRecollectionLatency.csv
fi
if [ "$option" -eq '2' ]
then
  cat 1/RecollectionLatencycall-setup.csv  > FullRecollectionLatency.csv
fi
if [ "$option" -eq '3' ]
then
  cat */RecollectionLatency.csv > FullRecollectionLatency.csv
fi
if [ "$option" -eq '4' ]
then
  cat */RecollectionLatencycall-setup.csv > FullRecollectionLatency.csv
fi

#CHANGE FORMAT FILE
#tail -n +33 FullRecollectionLatency.csv > FullRecollectionLatency.csv
sed -i 's/\./,/g' FullRecollectionLatency.csv

sed -i 's/;/ /g' FullRecollectionLatency.csv

awk '{$1=$3=""; print $0}' FullRecollectionLatency.csv > FullRecollectionLatency2.csv

sort -k1,1n FullRecollectionLatency2.csv > $testMainfolder/SUMMARYLATENCYCDF
