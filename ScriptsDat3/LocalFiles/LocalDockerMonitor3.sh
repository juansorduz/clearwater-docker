#!/bin/bash
cps=${1:-10}
duration=${2:-10}
NumTest=${3:-1}
NumBono=${4:-1}
NumURS=${5:-1}
NumMSCS=${6:-1}
NumURH=${7:-1}
NumMSCH=${8:-1}

mkdir -p ~/ClearwaterTestResults/VM1/$cps$duration/$NumTest
testfolder=~/ClearwaterTestResults/VM1/$cps$duration/$NumTest

echo EJECUTANDO SCRIPT MONITOR VM $USER

rm -f $testfolder/Tiempos.csv
rm -f $testfolder/contenedores.csv
rm -f $testfolder/VMCPU.csv
rm -f $testfolder/VMRAM.csv

#Start time and metrics recollector script
echo "Initial time: $(date +"%T")" > $testfolder/Tiempos.csv
docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) > $testfolder/contenedores.csv
top -b -n 1 | awk 'NR>7 { sum += $9; } END { print sum; }' > $testfolder/VMCPU.csv
top -b -n 1 | awk 'NR>7 { sum += $10; } END { print sum; }' > $testfolder/VMRAM.csv

source $testfolder/Variables.txt

while [ "$stateTest" -eq '1' ]; do
     now=$(date +"%T")
     #echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
     docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemPerc}}" $(docker ps -q) >> $testfolder/contenedores.csv
     top -b -n 1 | awk 'NR>7 { sum += $9; } END { print sum; }' >> $testfolder/VMCPU.csv
     top -b -n 1 | awk 'NR>7 { sum += $10; } END { print sum; }' >> $testfolder/VMRAM.csv
     source $testfolder/Variables.txt
     if [ "$stateTest" -eq '2' ]
     then
        echo Finalizo prueba scriptLocal
     fi
 done
