#!/bin/bash
cps=${1:-10}
duration=${2:-10}
NumTest=${3:-1}

mkdir -p ~/ClearwaterTestResults/Kubernetes4/$cps$duration/$NumTest
testfolder=~/ClearwaterTestResults/Kubernetes4/$cps$duration/$NumTest

echo EJECUTANDO SCRIPT MONITOR VM $USER

rm -f $testfolder/Tiempos.csv
rm -f $testfolder/VMCPU.csv
rm -f $testfolder/VMRAM.csv

#Start time and metrics recollector script
echo "Initial time: $(date +"%T")" > $testfolder/Tiempos.csv
top -b -n 1 | awk 'NR>7 { sum += $9; } END { print sum; }' > $testfolder/VMCPU.csv
top -b -n 1 | awk 'NR>7 { sum += $10; } END { print sum; }' > $testfolder/VMRAM.csv

source $testfolder/Variables.txt

while [ "$stateTest" -eq '1' ]; do
     now=$(date +"%T")
     #echo $now
     echo -e "Tiempo $now" >> $testfolder/Tiempos.csv
     top -b -n 1 | awk 'NR>7 { sum += $9; } END { print sum; }' >> $testfolder/VMCPU.csv
     top -b -n 1 | awk 'NR>7 { sum += $10; } END { print sum; }' >> $testfolder/VMRAM.csv

     source $testfolder/Variables.txt
     if [ "$stateTest" -eq '2' ]
     then
        echo Finalizo prueba scriptLocal
     fi
 done
