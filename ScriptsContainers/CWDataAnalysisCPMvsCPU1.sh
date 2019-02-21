#!/bin/bash
#users="$1"
#duration="$2"
#testfolder=~/ClearwaterTestResults/Containers1/$users$duration

#Logic to obtain average of each component
#NumTest=1
#NumberTest=33
Duration=1
testMainfolder=~/ClearwaterTestResults/Containers1
for CPM in 200 500 1000 2000 5000; do
testfolder=~/ClearwaterTestResults/Containers1/$CPM$Duration
NumTest=1
NumberTest=33
for i in cassandra homestead sprout; do
  [ -e $testfolder/PromediosCPU$i$CPM ] && rm $testfolder/PromediosCPU$i$CPM
done
while [ $NumTest -lt $NumberTest ]; do
  for i in cassandra homestead sprout; do
    tail -n +2 "$testfolder/$CPM$Duration$NumTest/$i.csv" > "$testfolder/$CPM$Duration$NumTest/$i"
    SumCPU=0
    SumRAM=0
    PromCPU=0
    PromRAM=0
    NumData=0
    while IFS=" " read -r datetime cpu ram remainder
    do
      cpu=${cpu::-1}
      ram=${ram::-1}
      #echo  $datetime $cpu $ram
      SumCPU=`echo $SumCPU + $cpu | bc`
      #SumRAM=`echo $SumRAM + $ram | bc`
      let NumData=NumData+1
    done < "$testfolder/$CPM$Duration$NumTest/$i"
    #echo  $NumData
    PromCPU=$(echo "scale=3; $SumCPU/$NumData" | bc -l)
    #romRAM=$(echo "scale=3; $SumRAM/$NumData" | bc -l)
    echo $PromCPU >> $testfolder/PromediosCPU$i$CPM
    #echo $PromRAM >> $testfolder/PromediosRAM$i$CPM
  done
let NumTest=NumTest+1
done
done
#Logic to obtain average of average and variance of each component into a single file
let NumberTest=NumberTest-1
echo $NumberTest
echo "#CPM Sprout VarSprout Homestead VarHomestead Cassandra VarCassandra" > $testMainfolder/FinalResultCPU

for CPM in 200 500 1000 2000 5000; do
testfolder=~/ClearwaterTestResults/Containers1/$CPM$Duration
DatosCPUURSprout=$(<$testfolder/PromediosCPUsprout$CPM)
#DatosCPUMSCSprout=$(<$testfolder/Promediossprout$CPM)
DatosCPUHomestead=$(<$testfolder/PromediosCPUhomestead$CPM)
DatosCPUCassandra=$(<$testfolder/PromediosCPUcassandra$CPM)

AverageCPUURSprout=0
VarCPUURSprout=0
#AverageCPUMSCSprout=0
#VarCPUMSCSprout=0
AverageCPUHomestead=0
VarCPUHomestead=0
AverageCPUCassandra=0
VarCPUCassandra=0

DiferenceVar=0

#for i in ${DatosCPUURSprout[@]}; do ( AverageSprout=`echo $AverageSprout + $i | bc` ); done
for i in ${DatosCPUURSprout[@]}; do  AverageCPUURSprout=$(echo "$AverageCPUURSprout + $i" | bc -l) ; done
AverageCPUURSprout=$(echo "scale=3;$AverageCPUURSprout/$NumberTest" | bc -l)
for i in ${DatosCPUURSprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUURSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUURSprout=$(echo "$VarCPUURSprout + $DiferenceVar" | bc -l) ; done
VarCPUURSprout=$(echo "scale=3;$VarCPUURSprout/$NumberTest" | bc -l)

#for i in ${DatosCPUMSCSprout[@]}; do  AverageCPUMSCSprout=$(echo "$AverageCPUMSCSprout + $i" | bc -l) ; done
#AverageCPUMSCSprout=$(echo "scale=3;$AverageCPUMSCSprout/$NumberTest" | bc -l)
#for i in ${DatosCPUMSCSprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUMSCSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUMSCSprout=$(echo "$VarCPUMSCSprout + $DiferenceVar" | bc -l) ; done
#VarCPUMSCSprout=$(echo "scale=3;$VarCPUMSCSprout/$NumberTest" | bc -l)

for i in ${DatosCPUHomestead[@]}; do  AverageCPUHomestead=$(echo "$AverageCPUHomestead + $i" | bc -l) ; done
AverageCPUHomestead=$(echo "scale=3;$AverageCPUHomestead/$NumberTest" | bc -l)
for i in ${DatosCPUHomestead[@]}; do DiferenceVar=$(echo "$i - $AverageCPUHomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUHomestead=$(echo "$VarCPUHomestead + $DiferenceVar" | bc -l) ; done
VarCPUHomestead=$(echo "scale=3;$VarCPUHomestead/$NumberTest" | bc -l)

for i in ${DatosCPUCassandra[@]}; do  AverageCPUCassandra=$(echo "$AverageCPUCassandra + $i" | bc -l) ; done
AverageCPUCassandra=$(echo "scale=3;$AverageCPUCassandra/$NumberTest" | bc -l)
for i in ${DatosCPUCassandra[@]}; do DiferenceVar=$(echo "$i - $AverageCPUCassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUCassandra=$(echo "$VarCPUCassandra + $DiferenceVar" | bc -l) ; done
VarCPUCassandra=$(echo "scale=3;$VarCPUCassandra/$NumberTest" | bc -l)

echo $AverageCPUURSprout
echo $VarCPUURSprout
#echo $AverageCPUMSCSprout
#echo $VarCPUURSprout
echo $AverageCPUHomestead
echo $VarCPUHomestead
echo $AverageCPUCassandra
echo $VarCPUCassandra

echo "$CPM $AverageCPUURSprout $VarCPUURSprout $AverageCPUHomestead $VarCPUHomestead $AverageCPUCassandra $VarCPUCassandra" >> $testMainfolder/FinalResultCPU

done
