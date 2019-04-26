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
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
mkdir -p $testfolder

echo CPS: $cps Duration: $duration
#Deleting old filesd
if [ $cps = '10' ];
then
  echo Deleting old scripts
  [ -e $testMainfolder/SUMMARYVMCPU ] && rm $testMainfolder/SUMMARYVMCPU
  [ -e $testMainfolder/SUMMARYVMRAM ] && rm $testMainfolder/SUMMARYVMRAM
  echo "#cps CPUVM1 VarVM1 CPUVM2 VarVM2 CPUVM3 VarVM3 CPUVM4 VarVM4 CPUVM5 VarVM5 CPUVM6 VarVM6 CPUVM7 VarVM7 CPUVMTOTAL VarVMTOTAL" >> $testMainfolder/SUMMARYVMCPU
  echo "#cps RAMVM1 VarVM1 RAMVM2 VarVM2 RAMVM3 VarVM3 RAMVM4 VarVM4 RAMVM5 VarVM5 RAMVM6 VarVM6 RAMVM7 VarVM7 RAMVMTOTAL VarVMTOTAL" >> $testMainfolder/SUMMARYVMRAM
fi

DiferenceVar=0
NumProms=0

#############################################################################
#CPU
#############################################################################
echo Calculating CPU
DatosCPUVM1=$(<$testfolder/SummaryVM1LocalVMCPUdata$cps)
DatosCPUVM2=$(<$testfolder/SummaryVM2LocalVMCPUdata$cps)
DatosCPUVM3=$(<$testfolder/SummaryVM3LocalVMCPUdata$cps)
DatosCPUVM4=$(<$testfolder/SummaryVM4LocalVMCPUdata$cps)
DatosCPUVM5=$(<$testfolder/SummaryVM5LocalVMCPUdata$cps)
DatosCPUVM6=$(<$testfolder/SummaryVM6LocalVMCPUdata$cps)
DatosCPUVM7=$(<$testfolder/SummaryVM7LocalVMCPUdata$cps)
DatosCPUVMTOTAL=$(<$testfolder/SummaryVMTOTALLocalVMCPUdata$cps)

AverageCPUVM1=0
AverageCPUVM2=0
AverageCPUVM3=0
AverageCPUVM4=0
AverageCPUVM5=0
AverageCPUVM6=0
AverageCPUVM7=0
AverageCPUVMTOTAL=0

VarCPUVM1=0
VarCPUVM2=0
VarCPUVM3=0
VarCPUVM4=0
VarCPUVM5=0
VarCPUVM6=0
VarCPUVM7=0
VarCPUVMTOTAL=0

NumProms=$(wc -l < $testfolder/SummaryVM1LocalVMCPUdata$cps)
for i in ${DatosCPUVM1[@]}; do  AverageCPUVM1=$(echo "$AverageCPUVM1 + $i" | bc -l) ; done
AverageCPUVM1=$(echo "scale=3;$AverageCPUVM1/$NumProms" | bc -l)
for i in ${DatosCPUVM1[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVM1" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVM1=$(echo "$VarCPUVM1 + $DiferenceVar" | bc -l) ; done
VarCPUVM1=$(echo "scale=3;$VarCPUVM1/$NumProms" | bc -l)
VarCPUVM1=$(echo "scale=3;sqrt($VarCPUVM1)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM2LocalVMCPUdata$cps)
for i in ${DatosCPUVM2[@]}; do  AverageCPUVM2=$(echo "$AverageCPUVM2 + $i" | bc -l) ; done
AverageCPUVM2=$(echo "scale=3;$AverageCPUVM2/$NumProms" | bc -l)
for i in ${DatosCPUVM2[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVM2" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVM2=$(echo "$VarCPUVM2 + $DiferenceVar" | bc -l) ; done
VarCPUVM2=$(echo "scale=3;$VarCPUVM2/$NumProms" | bc -l)
VarCPUVM2=$(echo "scale=3;sqrt($VarCPUVM2)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM3LocalVMCPUdata$cps)
for i in ${DatosCPUVM3[@]}; do  AverageCPUVM3=$(echo "$AverageCPUVM3 + $i" | bc -l) ; done
AverageCPUVM3=$(echo "scale=3;$AverageCPUVM3/$NumProms" | bc -l)
for i in ${DatosCPUVM3[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVM3" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVM3=$(echo "$VarCPUVM3 + $DiferenceVar" | bc -l) ; done
VarCPUVM3=$(echo "scale=3;$VarCPUVM3/$NumProms" | bc -l)
VarCPUVM3=$(echo "scale=3;sqrt($VarCPUVM3)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM4LocalVMCPUdata$cps)
for i in ${DatosCPUVM4[@]}; do  AverageCPUVM4=$(echo "$AverageCPUVM4 + $i" | bc -l) ; done
AverageCPUVM4=$(echo "scale=3;$AverageCPUVM4/$NumProms" | bc -l)
for i in ${DatosCPUVM4[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVM4" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVM4=$(echo "$VarCPUVM4 + $DiferenceVar" | bc -l) ; done
VarCPUVM4=$(echo "scale=3;$VarCPUVM4/$NumProms" | bc -l)
VarCPUVM4=$(echo "scale=3;sqrt($VarCPUVM4)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM5LocalVMCPUdata$cps)
for i in ${DatosCPUVM5[@]}; do  AverageCPUVM5=$(echo "$AverageCPUVM5 + $i" | bc -l) ; done
AverageCPUVM5=$(echo "scale=3;$AverageCPUVM5/$NumProms" | bc -l)
for i in ${DatosCPUVM5[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVM5" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVM5=$(echo "$VarCPUVM5 + $DiferenceVar" | bc -l) ; done
VarCPUVM5=$(echo "scale=3;$VarCPUVM5/$NumProms" | bc -l)
VarCPUVM5=$(echo "scale=3;sqrt($VarCPUVM5)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM6LocalVMCPUdata$cps)
for i in ${DatosCPUVM6[@]}; do  AverageCPUVM6=$(echo "$AverageCPUVM6 + $i" | bc -l) ; done
AverageCPUVM6=$(echo "scale=3;$AverageCPUVM6/$NumProms" | bc -l)
for i in ${DatosCPUVM6[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVM6" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVM6=$(echo "$VarCPUVM6 + $DiferenceVar" | bc -l) ; done
VarCPUVM6=$(echo "scale=3;$VarCPUVM6/$NumProms" | bc -l)
VarCPUVM6=$(echo "scale=3;sqrt($VarCPUVM6)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM7LocalVMCPUdata$cps)
for i in ${DatosCPUVM7[@]}; do  AverageCPUVM7=$(echo "$AverageCPUVM7 + $i" | bc -l) ; done
AverageCPUVM7=$(echo "scale=3;$AverageCPUVM7/$NumProms" | bc -l)
for i in ${DatosCPUVM7[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVM7" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVM7=$(echo "$VarCPUVM7 + $DiferenceVar" | bc -l) ; done
VarCPUVM7=$(echo "scale=3;$VarCPUVM7/$NumProms" | bc -l)
VarCPUVM7=$(echo "scale=3;sqrt($VarCPUVM7)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVMTOTALLocalVMCPUdata$cps)
for i in ${DatosCPUVMTOTAL[@]}; do  AverageCPUVMTOTAL=$(echo "$AverageCPUVMTOTAL + $i" | bc -l) ; done
AverageCPUVMTOTAL=$(echo "scale=3;$AverageCPUVMTOTAL/$NumProms" | bc -l)
for i in ${DatosCPUVMTOTAL[@]}; do DiferenceVar=$(echo "$i - $AverageCPUVMTOTAL" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUVMTOTAL=$(echo "$VarCPUVMTOTAL + $DiferenceVar" | bc -l) ; done
VarCPUVMTOTAL=$(echo "scale=3;$VarCPUVMTOTAL/$NumProms" | bc -l)
VarCPUVMTOTAL=$(echo "scale=3;sqrt($VarCPUVMTOTAL)" | bc -l)

echo "$cps $AverageCPUVM1 $VarCPUVM1 $AverageCPUVM2 $VarCPUVM2 $AverageCPUVM3 $VarCPUVM3 $AverageCPUVM4 $VarCPUVM4 $AverageCPUVM5 $VarCPUVM5 $AverageCPUVM6 $VarCPUVM6 $AverageCPUVM7 $VarCPUVM7 $AverageCPUVMTOTAL $VarCPUVMTOTAL" >> $testMainfolder/SUMMARYVMCPU
#############################################################################
#RAM
#############################################################################
echo Calculating RAM
DatosRAMVM1=$(<$testfolder/SummaryVM1LocalVMRAMdata$cps)
DatosRAMVM2=$(<$testfolder/SummaryVM2LocalVMRAMdata$cps)
DatosRAMVM3=$(<$testfolder/SummaryVM3LocalVMRAMdata$cps)
DatosRAMVM4=$(<$testfolder/SummaryVM4LocalVMRAMdata$cps)
DatosRAMVM5=$(<$testfolder/SummaryVM5LocalVMRAMdata$cps)
DatosRAMVM6=$(<$testfolder/SummaryVM6LocalVMRAMdata$cps)
DatosRAMVM7=$(<$testfolder/SummaryVM7LocalVMRAMdata$cps)
DatosRAMVMTOTAL=$(<$testfolder/SummaryVMTOTALLocalVMRAMdata$cps)

AverageRAMVM1=0
AverageRAMVM2=0
AverageRAMVM3=0
AverageRAMVM4=0
AverageRAMVM5=0
AverageRAMVM6=0
AverageRAMVM7=0
AverageRAMVMTOTAL=0

VarRAMVM1=0
VarRAMVM2=0
VarRAMVM3=0
VarRAMVM4=0
VarRAMVM5=0
VarRAMVM6=0
VarRAMVM7=0
VarRAMVMTOTAL=0

NumProms=$(wc -l < $testfolder/SummaryVM1LocalVMRAMdata$cps)
for i in ${DatosRAMVM1[@]}; do  AverageRAMVM1=$(echo "$AverageRAMVM1 + $i" | bc -l) ; done
AverageRAMVM1=$(echo "scale=3;$AverageRAMVM1/$NumProms" | bc -l)
for i in ${DatosRAMVM1[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVM1" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVM1=$(echo "$VarRAMVM1 + $DiferenceVar" | bc -l) ; done
VarRAMVM1=$(echo "scale=3;$VarRAMVM1/$NumProms" | bc -l)
VarRAMVM1=$(echo "scale=3;sqrt($VarRAMVM1)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM2LocalVMRAMdata$cps)
for i in ${DatosRAMVM2[@]}; do  AverageRAMVM2=$(echo "$AverageRAMVM2 + $i" | bc -l) ; done
AverageRAMVM2=$(echo "scale=3;$AverageRAMVM2/$NumProms" | bc -l)
for i in ${DatosRAMVM2[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVM2" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVM2=$(echo "$VarRAMVM2 + $DiferenceVar" | bc -l) ; done
VarRAMVM2=$(echo "scale=3;$VarRAMVM2/$NumProms" | bc -l)
VarRAMVM2=$(echo "scale=3;sqrt($VarRAMVM2)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM3LocalVMRAMdata$cps)
for i in ${DatosRAMVM3[@]}; do  AverageRAMVM3=$(echo "$AverageRAMVM3 + $i" | bc -l) ; done
AverageRAMVM3=$(echo "scale=3;$AverageRAMVM3/$NumProms" | bc -l)
for i in ${DatosRAMVM3[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVM3" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVM3=$(echo "$VarRAMVM3 + $DiferenceVar" | bc -l) ; done
VarRAMVM3=$(echo "scale=3;$VarRAMVM3/$NumProms" | bc -l)
VarRAMVM3=$(echo "scale=3;sqrt($VarRAMVM3)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM4LocalVMRAMdata$cps)
for i in ${DatosRAMVM4[@]}; do  AverageRAMVM4=$(echo "$AverageRAMVM4 + $i" | bc -l) ; done
AverageRAMVM4=$(echo "scale=3;$AverageRAMVM4/$NumProms" | bc -l)
for i in ${DatosRAMVM4[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVM4" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVM4=$(echo "$VarRAMVM4 + $DiferenceVar" | bc -l) ; done
VarRAMVM4=$(echo "scale=3;$VarRAMVM4/$NumProms" | bc -l)
VarRAMVM4=$(echo "scale=3;sqrt($VarRAMVM4)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM5LocalVMRAMdata$cps)
for i in ${DatosRAMVM5[@]}; do  AverageRAMVM5=$(echo "$AverageRAMVM5 + $i" | bc -l) ; done
AverageRAMVM5=$(echo "scale=3;$AverageRAMVM5/$NumProms" | bc -l)
for i in ${DatosRAMVM5[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVM5" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVM5=$(echo "$VarRAMVM5 + $DiferenceVar" | bc -l) ; done
VarRAMVM5=$(echo "scale=3;$VarRAMVM5/$NumProms" | bc -l)
VarRAMVM5=$(echo "scale=3;sqrt($VarRAMVM5)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM6LocalVMRAMdata$cps)
for i in ${DatosRAMVM6[@]}; do  AverageRAMVM6=$(echo "$AverageRAMVM6 + $i" | bc -l) ; done
AverageRAMVM6=$(echo "scale=3;$AverageRAMVM6/$NumProms" | bc -l)
for i in ${DatosRAMVM6[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVM6" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVM6=$(echo "$VarRAMVM6 + $DiferenceVar" | bc -l) ; done
VarRAMVM6=$(echo "scale=3;$VarRAMVM6/$NumProms" | bc -l)
VarRAMVM6=$(echo "scale=3;sqrt($VarRAMVM6)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVM7LocalVMRAMdata$cps)
for i in ${DatosRAMVM7[@]}; do  AverageRAMVM7=$(echo "$AverageRAMVM7 + $i" | bc -l) ; done
AverageRAMVM7=$(echo "scale=3;$AverageRAMVM7/$NumProms" | bc -l)
for i in ${DatosRAMVM7[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVM7" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVM7=$(echo "$VarRAMVM7 + $DiferenceVar" | bc -l) ; done
VarRAMVM7=$(echo "scale=3;$VarRAMVM7/$NumProms" | bc -l)
VarRAMVM7=$(echo "scale=3;sqrt($VarRAMVM7)" | bc -l)

NumProms=$(wc -l < $testfolder/SummaryVMTOTALLocalVMRAMdata$cps)
for i in ${DatosRAMVMTOTAL[@]}; do  AverageRAMVMTOTAL=$(echo "$AverageRAMVMTOTAL + $i" | bc -l) ; done
AverageRAMVMTOTAL=$(echo "scale=3;$AverageRAMVMTOTAL/$NumProms" | bc -l)
for i in ${DatosRAMVMTOTAL[@]}; do DiferenceVar=$(echo "$i - $AverageRAMVMTOTAL" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMVMTOTAL=$(echo "$VarRAMVMTOTAL + $DiferenceVar" | bc -l) ; done
VarRAMVMTOTAL=$(echo "scale=3;$VarRAMVMTOTAL/$NumProms" | bc -l)
VarRAMVMTOTAL=$(echo "scale=3;sqrt($VarRAMVMTOTAL)" | bc -l)

echo "$cps $AverageRAMVM1 $VarRAMVM1 $AverageRAMVM2 $VarRAMVM2 $AverageRAMVM3 $VarRAMVM3 $AverageRAMVM4 $VarRAMVM4 $AverageRAMVM5 $VarRAMVM5 $AverageRAMVM6 $VarRAMVM6 $AverageRAMVM7 $VarRAMVM7 $AverageRAMVMTOTAL $VarRAMVMTOTAL" >> $testMainfolder/SUMMARYVMRAM
