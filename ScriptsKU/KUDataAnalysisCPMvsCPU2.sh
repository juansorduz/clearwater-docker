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
  [ -e $testfolder/PromediosCPU$i$CPM ] && rm $testfolder/PromediosCPU$i$CPM
done
while [ $NumTest -lt $NumberTest ]; do
  for i in cassandra_cassandra homestead_homestead icscf_icscf scscf_scscf; do
    tail -n +5 "$testfolder/$CPM$Duration$NumTest/$i.csv" > "$testfolder/$CPM$Duration$NumTest/$i"
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

    #romRAM=$(echo "scale=3; $SumRAM/$NumData" | bc -l)
    if [ $NumData = '0' ];
    then
      echo CPM $CPM Prueba $NumTest con falla, no se considerara en los promedios generales.
    else
        PromCPU=$(echo "scale=3; $SumCPU/$NumData" | bc -l)
        echo $PromCPU >> $testfolder/PromediosCPU$i$CPM
    fi
  done
let NumTest=NumTest+1
done
done
#Logic to obtain average of average and variance of each component into a single file
let NumberTest=NumberTest-1
echo $NumberTest
echo "#CPM RUSprout VarRUSprout MSCSprout VarMSCSprout Homestead VarHomestead Cassandra VarCassandra" > $testMainfolder/FinalResultCPU

for CPM in 200 500 1000 2000 5000; do
testfolder=~/ClearwaterTestResults/Kubernetes2/$CPM$Duration
DatosCPUURSprout=$(<$testfolder/PromediosCPUicscf_icscf$CPM)
DatosCPUMSCSprout=$(<$testfolder/PromediosCPUscscf_scscf$CPM)
DatosCPUHomestead=$(<$testfolder/PromediosCPUhomestead_homestead$CPM)
DatosCPUCassandra=$(<$testfolder/PromediosCPUcassandra_cassandra$CPM)

AverageCPUURSprout=0
VarCPUURSprout=0
AverageCPUMSCSprout=0
VarCPUMSCSprout=0
AverageCPUHomestead=0
VarCPUHomestead=0
AverageCPUCassandra=0
VarCPUCassandra=0

NumProms=0
echo [CPM] $CPM
#for i in ${DatosCPUURSprout[@]}; do ( AverageSprout=`echo $AverageSprout + $i | bc` ); done

NumProms=$(wc -l < $testfolder/PromediosCPUicscf_icscf$CPM)
for i in ${DatosCPUURSprout[@]}; do  AverageCPUURSprout=$(echo "$AverageCPUURSprout + $i" | bc -l) ; done
AverageCPUURSprout=$(echo "scale=3;$AverageCPUURSprout/$NumProms" | bc -l)
for i in ${DatosCPUURSprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUURSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUURSprout=$(echo "$VarCPUURSprout + $DiferenceVar" | bc -l) ; done
VarCPUURSprout=$(echo "scale=3;$VarCPUURSprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUscscf_scscf$CPM)
for i in ${DatosCPUMSCSprout[@]}; do  AverageCPUMSCSprout=$(echo "$AverageCPUMSCSprout + $i" | bc -l) ; done
AverageCPUMSCSprout=$(echo "scale=3;$AverageCPUMSCSprout/$NumProms" | bc -l)
for i in ${DatosCPUMSCSprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUMSCSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUMSCSprout=$(echo "$VarCPUMSCSprout + $DiferenceVar" | bc -l) ; done
VarCPUMSCSprout=$(echo "scale=3;$VarCPUMSCSprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUhomestead_homestead$CPM)
for i in ${DatosCPUHomestead[@]}; do  AverageCPUHomestead=$(echo "$AverageCPUHomestead + $i" | bc -l) ; done
AverageCPUHomestead=$(echo "scale=3;$AverageCPUHomestead/$NumProms" | bc -l)
for i in ${DatosCPUHomestead[@]}; do DiferenceVar=$(echo "$i - $AverageCPUHomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUHomestead=$(echo "$VarCPUHomestead + $DiferenceVar" | bc -l) ; done
VarCPUHomestead=$(echo "scale=3;$VarCPUHomestead/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUcassandra_cassandra$CPM)
for i in ${DatosCPUCassandra[@]}; do  AverageCPUCassandra=$(echo "$AverageCPUCassandra + $i" | bc -l) ; done
AverageCPUCassandra=$(echo "scale=3;$AverageCPUCassandra/$NumProms" | bc -l)
for i in ${DatosCPUCassandra[@]}; do DiferenceVar=$(echo "$i - $AverageCPUCassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUCassandra=$(echo "$VarCPUCassandra + $DiferenceVar" | bc -l) ; done
VarCPUCassandra=$(echo "scale=3;$VarCPUCassandra/$NumProms" | bc -l)

echo AverageURSprout: $AverageCPUURSprout VareURSprout: $VarCPUURSprout NumProms: $NumProms
echo AverageMSCSprout: $AverageCPUMSCSprout VarMSCSprout: $VarCPUMSCSprout NumProms: $NumProms
echo AverageMSCHomestead: $AverageCPUHomestead VarHomestead: $VarCPUHomestead NumProms: $NumProms
echo AverageMSCCassandra: $AverageCPUCassandra VarCassandra: $VarCPUCassandra NumProms: $NumProms

echo "$CPM $AverageCPUURSprout $VarCPUURSprout $AverageCPUMSCSprout $VarCPUMSCSprout $AverageCPUHomestead $VarCPUHomestead $AverageCPUCassandra $VarCPUCassandra" >> $testMainfolder/FinalResultCPU

done
