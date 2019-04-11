#!/bin/bash
cps=${1:-10}
duration=${2:-10}
NumTest=${3:-1}

mkdir -p ~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest
testfolder=~/ClearwaterTestResults/Kubernetes3/$cps$duration/$NumTest

echo time $(date +"%T") NumTest:$NumTest, cps: $cps, duration: $duration

#Creating control file if does not exist
# [ -e $testfolder/Variables.txt ] && rm $testfolder/Variables.txt
# touch $testfolder/Variables.txt
# echo stateTest=1 > $testfolder/Variables.txt

#Start time and metrics recollector script
echo "Initial time: $(date +"%T")" > $testfolder/Tiempos.csv
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) > $testfolder/contenedores.csv

sleep 1

source $testfolder/Variables.txt

while [ "$stateTest" -eq '1' ]; do
     now=$(date +"%T")
     #echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) >> $testfolder/contenedores.csv

     source $testfolder/Variables.txt
     if [ "$stateTest" -eq '2' ]
     then
        echo Finalizo prueba scriptPrincipal
     fi
 done
