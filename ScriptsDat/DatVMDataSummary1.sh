#!/bin/bash
cps=${1:-10}
duration=${2:-120}
NumberTest=${3:-2}
DelayCallAnswer=${4:-60}
DelayBeforeACK=${5:-15}

#Logic to obtain average of each component
#NumTest=1
#NumberTest=33
Duration=1
testMainfolder=~/ClearwaterTestResults/Kubernetes4
testfolder=~/ClearwaterTestResults/Kubernetes4/$cps$duration

#Deleting old files
for i in VM1LocalVMCPUdata VM2LocalVMCPUdata VM3LocalVMCPUdata VM4LocalVMCPUdata VM5LocalVMCPUdata VM6LocalVMCPUdata VM7LocalVMCPUdata; do
   [ -e $testfolder/Summary$i$cps ] && rm $testfolder/Summary$i$cps
done

for i in VM1LocalVMRAMdata VM2LocalVMRAMdata VM3LocalVMRAMdata VM4LocalVMRAMdata VM5LocalVMRAMdata VM6LocalVMRAMdata VM7LocalVMRAMdata; do
   [ -e $testfolder/Summary$i$cps ] && rm $testfolder/Summary$i$cps
done
[ -e $testfolder/SummaryVMTOTALLocalVMCPUdata$cps ] && rm $testfolder/SummaryVMTOTALLocalVMCPUdata$cps
[ -e $testfolder/SummaryVMTOTALLocalVMRAMdata$cps ] && rm $testfolder/SummaryVMTOTALLocalVMRAMdata$cps
#exit 0

NumTest=1
#NumberTest=2
while [ $NumTest -lt $NumberTest ]; do
  #Calculating CPU and RAM
  echo Resumen VM numero $NumTest, cps $cps
  #############################################################################
  #CPU AND RAM
  #############################################################################
  TOTALCPU=0
  TOTALRAM=0
  for i in VM1LocalVMCPUdata VM2LocalVMCPUdata VM3LocalVMCPUdata VM4LocalVMCPUdata VM5LocalVMCPUdata VM6LocalVMCPUdata VM7LocalVMCPUdata; do
    #echo $testfolder
    [ -e $testfolder/$NumTest/$i.txt ] && rm $testfolder/$NumTest/$i.txt
    [ -e $testfolder/$NumTest/$i ] && rm $testfolder/$NumTest/$i
    tail -n +20 "$testfolder/$NumTest/$i.csv" > "$testfolder/$NumTest/$i"
    #tail -n +20 "$testfolder/$NumTest/$i.csv" > "$testfolder/$NumTest/$i.txt"
    #head -n +20 "$testfolder/$NumTest/$i.txt" > "$testfolder/$NumTest/$i"
    SumCPU=0
    PromCPU=0
    NumData=0
    while IFS=" " read -r CPU remainder
    do
      #CPU=${echo $CPU | bc}
      #echo  $datetime $cpu $ram
      SumCPU=`echo $SumCPU + $CPU | bc`
      #echo $SumCPU
      let NumData=NumData+1
    done < "$testfolder/$NumTest/$i"
    #echo  $NumData

    if [ $NumData = '0' ];
    then
      echo CPS $cps Prueba $NumTest con falla, no se considerara en los promedios generales.
    else
        PromCPU=$(echo "scale=3; $SumCPU/$NumData" | bc -l)
        echo $PromCPU >> $testfolder/Summary$i$cps
        TOTALCPU=`echo $TOTALCPU + $PromCPU | bc`
    fi
  done
  echo $TOTALCPU >> $testfolder/SummaryVMTOTALLocalVMCPUdata$cps

  for i in VM1LocalVMRAMdata VM2LocalVMRAMdata VM3LocalVMRAMdata VM4LocalVMRAMdata VM5LocalVMRAMdata VM6LocalVMRAMdata VM7LocalVMRAMdata; do
    #echo $testfolder
    [ -e $testfolder/$NumTest/$i.txt ] && rm $testfolder/$NumTest/$i.txt
    [ -e $testfolder/$NumTest/$i ] && rm $testfolder/$NumTest/$i
    tail -n +20 "$testfolder/$NumTest/$i.csv" > "$testfolder/$NumTest/$i"
    #tail -n +20 "$testfolder/$NumTest/$i.csv" > "$testfolder/$NumTest/$i.txt"
    #head -n +20 "$testfolder/$NumTest/$i.txt" > "$testfolder/$NumTest/$i"
    SumRAM=0
    PromRAM=0
    NumData=0
    while IFS=" " read -r RAM remainder
    do
      #RAM=${echo $RAM | bc}
      #echo  $datetime $RAM $ram
      SumRAM=`echo $SumRAM + $RAM | bc`
      #echo $SumRAM
      let NumData=NumData+1
    done < "$testfolder/$NumTest/$i"
    #echo  $NumData

    if [ $NumData = '0' ];
    then
      echo CPS $cps Prueba $NumTest con falla, no se considerara en los promedios generales.
    else
        PromRAM=$(echo "scale=3; $SumRAM/$NumData" | bc -l)
        echo $PromRAM >> $testfolder/Summary$i$cps
        TOTALRAM=`echo $TOTALRAM + $PromRAM | bc`
    fi
  done
  echo $TOTALRAM >> $testfolder/SummaryVMTOTALLocalVMRAMdata$cps

  let NumTest=NumTest+1
done


# exit 0
#
# #Logic to obtain average of average and variance of each component into a single file
# let NumberTest=NumberTest-1
# echo $NumberTest
# echo "#CPM Sprout VarSprout Homestead VarHomestead Cassandra VarCassandra" > $testMainfolder/FinalResultCPU
#
# for CPM in 200 500 1000 2000 5000; do
# testfolder=~/ClearwaterTestResults/Kubernetes1/$cps$duration
# DatosCPUURSprout=$(<$testfolder/PromediosCPUsprout_sprout$cps)
# #DatosCPUMSCSprout=$(<$testfolder/Promediossprout$cps)
# DatosCPUHomestead=$(<$testfolder/PromediosCPUhomestead_homestead$cps)
# DatosCPUCassandra=$(<$testfolder/PromediosCPUcassandra_cassandra$cps)
#
# AverageCPUURSprout=0
# VarCPUURSprout=0
# #AverageCPUMSCSprout=0
# #VarCPUMSCSprout=0
# AverageCPUHomestead=0
# VarCPUHomestead=0
# AverageCPUCassandra=0
# VarCPUCassandra=0
#
# DiferenceVar=0
# NumProms=0
# echo [CPM] $cps
# #for i in ${DatosCPUURSprout[@]}; do ( AverageSprout=`echo $AverageSprout + $i | bc` ); done
# NumProms=$(wc -l < $testfolder/PromediosCPUsprout_sprout$cps)
# for i in ${DatosCPUURSprout[@]}; do  AverageCPUURSprout=$(echo "$AverageCPUURSprout + $i" | bc -l) ; done
# AverageCPUURSprout=$(echo "scale=3;$AverageCPUURSprout/$NumProms" | bc -l)
# for i in ${DatosCPUURSprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUURSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUURSprout=$(echo "$VarCPUURSprout + $DiferenceVar" | bc -l) ; done
# VarCPUURSprout=$(echo "scale=3;$VarCPUURSprout/$NumProms" | bc -l)
#
# #for i in ${DatosCPUMSCSprout[@]}; do  AverageCPUMSCSprout=$(echo "$AverageCPUMSCSprout + $i" | bc -l) ; done
# #AverageCPUMSCSprout=$(echo "scale=3;$AverageCPUMSCSprout/$NumberTest" | bc -l)
# #for i in ${DatosCPUMSCSprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUMSCSprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUMSCSprout=$(echo "$VarCPUMSCSprout + $DiferenceVar" | bc -l) ; done
# #VarCPUMSCSprout=$(echo "scale=3;$VarCPUMSCSprout/$NumberTest" | bc -l)
# NumProms=$(wc -l < $testfolder/PromediosCPUhomestead_homestead$cps)
# for i in ${DatosCPUHomestead[@]}; do  AverageCPUHomestead=$(echo "$AverageCPUHomestead + $i" | bc -l) ; done
# AverageCPUHomestead=$(echo "scale=3;$AverageCPUHomestead/$NumProms" | bc -l)
# for i in ${DatosCPUHomestead[@]}; do DiferenceVar=$(echo "$i - $AverageCPUHomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUHomestead=$(echo "$VarCPUHomestead + $DiferenceVar" | bc -l) ; done
# VarCPUHomestead=$(echo "scale=3;$VarCPUHomestead/$NumProms" | bc -l)
#
# NumProms=$(wc -l < $testfolder/PromediosCPUcassandra_cassandra$cps)
# for i in ${DatosCPUCassandra[@]}; do  AverageCPUCassandra=$(echo "$AverageCPUCassandra + $i" | bc -l) ; done
# AverageCPUCassandra=$(echo "scale=3;$AverageCPUCassandra/$NumProms" | bc -l)
# for i in ${DatosCPUCassandra[@]}; do DiferenceVar=$(echo "$i - $AverageCPUCassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUCassandra=$(echo "$VarCPUCassandra + $DiferenceVar" | bc -l) ; done
# VarCPUCassandra=$(echo "scale=3;$VarCPUCassandra/$NumProms" | bc -l)
#
# echo AverageURSprout: $AverageCPUURSprout VareURSprout: $VarCPUURSprout NumProms: $NumProms
# #echo AverageMSCSprout: $AverageCPUMSCSprout VarMSCSprout: $VarCPUMSCSprout NumProms: NumProms
# echo AverageMSCHomestead: $AverageCPUHomestead VarHomestead: $VarCPUHomestead NumProms: $NumProms
# echo AverageMSCCassandra: $AverageCPUCassandra VarCassandra: $VarCPUCassandra NumProms: $NumProms
#
# echo "$cps $AverageCPUURSprout $VarCPUURSprout $AverageCPUHomestead $VarCPUHomestead $AverageCPUCassandra $VarCPUCassandra" >> $testMainfolder/FinalResultCPU
#
# done
