#!/bin/bash
#users="$1"
#duration="$2"
#testfolder=~/ClearwaterTestResults/Kubernetes2/$users$duration

#Logic to obtain average of each component
#NumTest=1
#NumberTest=33
Duration=1
testMainfolder=~/ClearwaterTestResults/Kubernetes2
for CPM in 200 500 1000 2000 5000; do
testfolder=~/ClearwaterTestResults/Kubernetes2/$CPM$Duration
NumTest=1
NumberTest=33
for i in cassandra_cassandra homestead_homestead icscf_icscf scscf_scscf; do
  [ -e $testfolder/PromediosRAM$i$CPM ] && rm $testfolder/PromediosRAM$i$CPM
done
while [ $NumTest -lt $NumberTest ]; do
  for i in cassandra_cassandra homestead_homestead icscf_icscf scscf_scscf; do
    tail -n +5 "$testfolder/$CPM$Duration$NumTest/$i.csv" > "$testfolder/$CPM$Duration$NumTest/$i"
    SumCPU=0
    SumRAM=0
    PromCPU=0
    PromRAM=0
    NumData=0
    while IFS=" " read -r datetime CPU ram remainder
    do
      #cpu=${cpu::-1}
      ram=${ram::-1}
      #echo  $datetime $RAM $ram
      #SumCPU=`echo $SumCPU + $cpu | bc`
      SumRAM=`echo $SumRAM + $ram | bc`
      let NumData=NumData+1
    done < "$testfolder/$CPM$Duration$NumTest/$i"
    #echo  $NumData

    #romRAM=$(echo "scale=3; $SumRAM/$NumData" | bc -l)
    if [ $NumData = '0' ];
    then
      echo CPM $CPM Prueba $NumTest con falla, no se considerara en los promedios generales.
    else
        PromRAM=$(echo "scale=3; $SumRAM/$NumData" | bc -l)
        echo $PromRAM >> $testfolder/PromediosRAM$i$CPM
    fi
  done
let NumTest=NumTest+1
done
done
#Logic to obtain average of average and variance of each component into a single file
let NumberTest=NumberTest-1
echo $NumberTest
echo "#CPM RUSprout VarRUSprout MSCSprout VarMSCSprout Homestead VarHomestead Cassandra VarCassandra" > $testMainfolder/FinalResultRAM

for CPM in 200 500 1000 2000 5000; do
testfolder=~/ClearwaterTestResults/Kubernetes2/$CPM$Duration
DatosRAMURSprout=$(<$testfolder/PromediosRAMicscf_icscf$CPM)
DatosRAMMSCSprout=$(<$testfolder/PromediosRAMscscf_scscf$CPM)
DatosRAMHomestead=$(<$testfolder/PromediosRAMhomestead_homestead$CPM)
DatosRAMCassandra=$(<$testfolder/PromediosRAMcassandra_cassandra$CPM)

AverageRAMURSprout=0
VarRAMURSprout=0
AverageRAMMSCSprout=0
VarRAMMSCSprout=0
AverageRAMHomestead=0
VarRAMHomestead=0
AverageRAMCassandra=0
VarRAMCassandra=0

NumProms=0
echo [CPM] $CPM
#for i in ${DatosRAMURSprout[@]}; do ( AverageSprout=`echo $AverageSprout + $i | bc` ); done

NumProms=$(wc -l < $testfolder/PromediosRAMicscf_icscf$CPM)
for i in ${DatosRAMURSprout[@]}; do  AverageRAMURSprout=$(echo "$AverageRAMURSprout + $i" | bc -l) ; done
AverageRAMURSprout=$(echo "scale=3;$AverageRAMURSprout/$NumProms" | bc -l)
for i in ${DatosRAMURSprout[@]}; do DiferenceVar=$(echo "$i - $AverageRAMURSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMURSprout=$(echo "$VarRAMURSprout + $DiferenceVar" | bc -l) ; done
VarRAMURSprout=$(echo "scale=3;$VarRAMURSprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMscscf_scscf$CPM)
for i in ${DatosRAMMSCSprout[@]}; do  AverageRAMMSCSprout=$(echo "$AverageRAMMSCSprout + $i" | bc -l) ; done
AverageRAMMSCSprout=$(echo "scale=3;$AverageRAMMSCSprout/$NumProms" | bc -l)
for i in ${DatosRAMMSCSprout[@]}; do DiferenceVar=$(echo "$i - $AverageRAMMSCSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMMSCSprout=$(echo "$VarRAMMSCSprout + $DiferenceVar" | bc -l) ; done
VarRAMMSCSprout=$(echo "scale=3;$VarRAMMSCSprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMhomestead_homestead$CPM)
for i in ${DatosRAMHomestead[@]}; do  AverageRAMHomestead=$(echo "$AverageRAMHomestead + $i" | bc -l) ; done
AverageRAMHomestead=$(echo "scale=3;$AverageRAMHomestead/$NumProms" | bc -l)
for i in ${DatosRAMHomestead[@]}; do DiferenceVar=$(echo "$i - $AverageRAMHomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMHomestead=$(echo "$VarRAMHomestead + $DiferenceVar" | bc -l) ; done
VarRAMHomestead=$(echo "scale=3;$VarRAMHomestead/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMcassandra_cassandra$CPM)
for i in ${DatosRAMCassandra[@]}; do  AverageRAMCassandra=$(echo "$AverageRAMCassandra + $i" | bc -l) ; done
AverageRAMCassandra=$(echo "scale=3;$AverageRAMCassandra/$NumProms" | bc -l)
for i in ${DatosRAMCassandra[@]}; do DiferenceVar=$(echo "$i - $AverageRAMCassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMCassandra=$(echo "$VarRAMCassandra + $DiferenceVar" | bc -l) ; done
VarRAMCassandra=$(echo "scale=3;$VarRAMCassandra/$NumProms" | bc -l)

echo AverageURSprout: $AverageRAMURSprout
echo VareURSprout: $VarRAMURSprout
echo AverageMSCSprout: $AverageRAMMSCSprout
echo VarMSCSprout: $VarRAMMSCSprout
echo AverageMSCHomestead: $AverageRAMHomestead
echo VarHomestead: $VarRAMHomestead
echo AverageMSCCassandra: $AverageRAMCassandra
echo VarCassandra: $VarRAMCassandra

echo "$CPM $AverageRAMURSprout $VarRAMURSprout $AverageRAMMSCSprout $VarRAMMSCSprout $AverageRAMHomestead $VarRAMHomestead $AverageRAMCassandra $VarRAMCassandra" >> $testMainfolder/FinalResultRAM

done
