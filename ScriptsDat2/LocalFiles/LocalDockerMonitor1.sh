#!/bin/bash
cps=${1:-10}
duration=${2:-10}
NumTest=${3:-1}

mkdir -p ~/ClearwaterTestResults/Kubernetes4/$cps$duration/$NumTest
testfolder=~/ClearwaterTestResults/Kubernetes4/$cps$duration/$NumTest

echo EJECUTANDO SCRIPT MONITOR VM $USER

rm -f $testfolder/Tiempos.csv
rm -f $testfolder/contenedores.csv

#Start time and metrics recollector script
echo "Initial time: $(date +"%T")" > $testfolder/Tiempos.csv
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) > $testfolder/contenedores.csv

source $testfolder/Variables.txt

while [ "$stateTest" -eq '1' ]; do
     now=$(date +"%T")
     #echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) >> $testfolder/contenedores.csv

     source $testfolder/Variables.txt
     if [ "$stateTest" -eq '2' ]
     then
        echo Finalizo prueba scriptLocal
     fi
 done
