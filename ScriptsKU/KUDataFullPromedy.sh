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
testMainfolder=~/ClearwaterTestResults/Kubernetes3
testfolder=~/ClearwaterTestResults/Kubernetes3/$cps$duration

echo CPS: $cps Duration: $duration
#Deleting old files
if [ $cps = '10' ];
then
  echo Deleting old scripts
  [ -e $testMainfolder/SUMMARYCPU ] && rm $testMainfolder/SUMMARYCPU
  [ -e $testMainfolder/SUMMARYRAM ] && rm $testMainfolder/SUMMARYRAM
  [ -e $testMainfolder/SUMMARYLATENCY ] && rm $testMainfolder/SUMMARYLATENCY
  [ -e $testMainfolder/SUMMARYSCR ] && rm $testMainfolder/SUMMARYSCR
  echo "#cps CPUastaire Varastaire CPUurcassandra Varurcassandra CPUmsccassandra Varmsccassandra CPUchronos Varchronos CPUbono Varbono CPUellis Varellis CPUhomesteadprov Varhomesteadprov CPUhomer Varhomer CPUurhomestead Varurhomestead CPUmschomestead Varmschomestead CPUralf Varralf CPUursprout Varursprout CPUmscsprout Varmscsprout CPUsipptest Varsipptest" >> $testMainfolder/SUMMARYCPU
  echo "#cps RAMastaire Varastaire RAMurcassandra Varurcassandra RAMmsccassandra Varmsccassandra RAMchronos Varchronos RAMbono Varbono RAMellis Varellis RAMhomesteadprov Varhomesteadprov RAMhomer Varhomer RAMurhomestead Varurhomestead RAMmschomestead Varmschomestead RAMralf Varralf RAMursprout Varursprout RAMmscsprout Varmscsprout RAMsipptest Varsipptest" >> $testMainfolder/SUMMARYRAM
  echo "#cps Latency VarLatency" >> $testMainfolder/SUMMARYLATENCY
  echo "#cps SuccessfullCallRate VarSuccessfullCallRate" >> $testMainfolder/SUMMARYSCR

fi

DiferenceVar=0
NumProms=0

#############################################################################
#CPU
#############################################################################
echo Calculating CPU
DatosCPUastaire=$(<$testfolder/PromediosCPUastaire$cps)
DatosCPUurcassandra=$(<$testfolder/PromediosCPUurcassandra$cps)
DatosCPUmsccassandra=$(<$testfolder/PromediosCPUmsccassandra$cps)
DatosCPUchronos=$(<$testfolder/PromediosCPUchronos$cps)
DatosCPUbono=$(<$testfolder/PromediosCPUbono$cps)
DatosCPUellis=$(<$testfolder/PromediosCPUellis$cps)
DatosCPUhomesteadprov=$(<$testfolder/PromediosCPUhomestead-prov$cps)
DatosCPUhomer=$(<$testfolder/PromediosCPUhomer$cps)
DatosCPUurhomestead=$(<$testfolder/PromediosCPUurhomestead$cps)
DatosCPUmschomestead=$(<$testfolder/PromediosCPUmschomestead$cps)
DatosCPUralf=$(<$testfolder/PromediosCPUralf$cps)
DatosCPUursprout=$(<$testfolder/PromediosCPUursprout$cps)
DatosCPUmscsprout=$(<$testfolder/PromediosCPUmscsprout$cps)
DatosCPUsipptest=$(<$testfolder/PromediosCPUsipptest$cps)

AverageCPUastaire=0
AverageCPUurcassandra=0
AverageCPUmsccassandra=0
AverageCPUchronos=0
AverageCPUbono=0
AverageCPUellis=0
AverageCPUhomesteadprov=0
AverageCPUhomer=0
AverageCPUurhomestead=0
AverageCPUmschomestead=0
AverageCPUralf=0
AverageCPUursprout=0
AverageCPUmscsprout=0
AverageCPUsipptest=0

VarCPUastaire=0
VarCPUurcassandra=0
VarCPUmsccassandra=0
VarCPUchronos=0
VarCPUbono=0
VarCPUellis=0
VarCPUhomesteadprov=0
VarCPUhomer=0
VarCPUurhomestead=0
VarCPUmschomestead=0
VarCPUralf=0
VarCPUursprout=0
VarCPUmscsprout=0
VarCPUsipptest=0

NumProms=$(wc -l < $testfolder/PromediosCPUastaire$cps)
for i in ${DatosCPUastaire[@]}; do  AverageCPUastaire=$(echo "$AverageCPUastaire + $i" | bc -l) ; done
AverageCPUastaire=$(echo "scale=3;$AverageCPUastaire/$NumProms" | bc -l)
for i in ${DatosCPUastaire[@]}; do DiferenceVar=$(echo "$i - $AverageCPUastaire" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUastaire=$(echo "$VarCPUastaire + $DiferenceVar" | bc -l) ; done
VarCPUastaire=$(echo "scale=3;$VarCPUastaire/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUurcassandra$cps)
for i in ${DatosCPUurcassandra[@]}; do  AverageCPUurcassandra=$(echo "$AverageCPUurcassandra + $i" | bc -l) ; done
AverageCPUurcassandra=$(echo "scale=3;$AverageCPUurcassandra/$NumProms" | bc -l)
for i in ${DatosCPUurcassandra[@]}; do DiferenceVar=$(echo "$i - $AverageCPUurcassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUurcassandra=$(echo "$VarCPUurcassandra + $DiferenceVar" | bc -l) ; done
VarCPUurcassandra=$(echo "scale=3;$VarCPUurcassandra/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUmsccassandra$cps)
for i in ${DatosCPUmsccassandra[@]}; do  AverageCPUmsccassandra=$(echo "$AverageCPUmsccassandra + $i" | bc -l) ; done
AverageCPUmsccassandra=$(echo "scale=3;$AverageCPUmsccassandra/$NumProms" | bc -l)
for i in ${DatosCPUmsccassandra[@]}; do DiferenceVar=$(echo "$i - $AverageCPUmsccassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUmsccassandra=$(echo "$VarCPUmsccassandra + $DiferenceVar" | bc -l) ; done
VarCPUmsccassandra=$(echo "scale=3;$VarCPUmsccassandra/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUchronos$cps)
for i in ${DatosCPUchronos[@]}; do  AverageCPUchronos=$(echo "$AverageCPUchronos + $i" | bc -l) ; done
AverageCPUchronos=$(echo "scale=3;$AverageCPUchronos/$NumProms" | bc -l)
for i in ${DatosCPUchronos[@]}; do DiferenceVar=$(echo "$i - $AverageCPUchronos" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUchronos=$(echo "$VarCPUchronos + $DiferenceVar" | bc -l) ; done
VarCPUchronos=$(echo "scale=3;$VarCPUchronos/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUbono$cps)
for i in ${DatosCPUbono[@]}; do  AverageCPUbono=$(echo "$AverageCPUbono + $i" | bc -l) ; done
AverageCPUbono=$(echo "scale=3;$AverageCPUbono/$NumProms" | bc -l)
for i in ${DatosCPUbono[@]}; do DiferenceVar=$(echo "$i - $AverageCPUbono" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUbono=$(echo "$VarCPUbono + $DiferenceVar" | bc -l) ; done
VarCPUbono=$(echo "scale=3;$VarCPUbono/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUellis$cps)
for i in ${DatosCPUellis[@]}; do  AverageCPUellis=$(echo "$AverageCPUellis + $i" | bc -l) ; done
AverageCPUellis=$(echo "scale=3;$AverageCPUellis/$NumProms" | bc -l)
for i in ${DatosCPUellis[@]}; do DiferenceVar=$(echo "$i - $AverageCPUellis" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUellis=$(echo "$VarCPUellis + $DiferenceVar" | bc -l) ; done
VarCPUellis=$(echo "scale=3;$VarCPUellis/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUhomestead-prov$cps)
for i in ${DatosCPUhomesteadprov[@]}; do  AverageCPUhomesteadprov=$(echo "$AverageCPUhomesteadprov + $i" | bc -l) ; done
AverageCPUhomesteadprov=$(echo "scale=3;$AverageCPUhomesteadprov/$NumProms" | bc -l)
for i in ${DatosCPUhomesteadprov[@]}; do DiferenceVar=$(echo "$i - $AverageCPUhomesteadprov" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUhomesteadprov=$(echo "$VarCPUhomesteadprov + $DiferenceVar" | bc -l) ; done
VarCPUhomesteadprov=$(echo "scale=3;$VarCPUhomesteadprov/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUhomer$cps)
for i in ${DatosCPUhomer[@]}; do  AverageCPUhomer=$(echo "$AverageCPUhomer + $i" | bc -l) ; done
AverageCPUhomer=$(echo "scale=3;$AverageCPUhomer/$NumProms" | bc -l)
for i in ${DatosCPUhomer[@]}; do DiferenceVar=$(echo "$i - $AverageCPUhomer" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUhomer=$(echo "$VarCPUhomer + $DiferenceVar" | bc -l) ; done
VarCPUhomer=$(echo "scale=3;$VarCPUhomer/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUurhomestead$cps)
for i in ${DatosCPUurhomestead[@]}; do  AverageCPUurhomestead=$(echo "$AverageCPUurhomestead + $i" | bc -l) ; done
AverageCPUurhomestead=$(echo "scale=3;$AverageCPUurhomestead/$NumProms" | bc -l)
for i in ${DatosCPUurhomestead[@]}; do DiferenceVar=$(echo "$i - $AverageCPUurhomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUurhomestead=$(echo "$VarCPUurhomestead + $DiferenceVar" | bc -l) ; done
VarCPUurhomestead=$(echo "scale=3;$VarCPUurhomestead/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUmschomestead$cps)
for i in ${DatosCPUmschomestead[@]}; do  AverageCPUmschomestead=$(echo "$AverageCPUmschomestead + $i" | bc -l) ; done
AverageCPUmschomestead=$(echo "scale=3;$AverageCPUmschomestead/$NumProms" | bc -l)
for i in ${DatosCPUmschomestead[@]}; do DiferenceVar=$(echo "$i - $AverageCPUmschomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUmschomestead=$(echo "$VarCPUmschomestead + $DiferenceVar" | bc -l) ; done
VarCPUmschomestead=$(echo "scale=3;$VarCPUmschomestead/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUralf$cps)
for i in ${DatosCPUralf[@]}; do  AverageCPUralf=$(echo "$AverageCPUralf + $i" | bc -l) ; done
AverageCPUralf=$(echo "scale=3;$AverageCPUralf/$NumProms" | bc -l)
for i in ${DatosCPUralf[@]}; do DiferenceVar=$(echo "$i - $AverageCPUralf" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUralf=$(echo "$VarCPUralf + $DiferenceVar" | bc -l) ; done
VarCPUralf=$(echo "scale=3;$VarCPUralf/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUursprout$cps)
for i in ${DatosCPUursprout[@]}; do  AverageCPUursprout=$(echo "$AverageCPUursprout + $i" | bc -l) ; done
AverageCPUursprout=$(echo "scale=3;$AverageCPUursprout/$NumProms" | bc -l)
for i in ${DatosCPUursprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUursprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUursprout=$(echo "$VarCPUursprout + $DiferenceVar" | bc -l) ; done
VarCPUursprout=$(echo "scale=3;$VarCPUursprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUmscsprout$cps)
for i in ${DatosCPUmscsprout[@]}; do  AverageCPUmscsprout=$(echo "$AverageCPUmscsprout + $i" | bc -l) ; done
AverageCPUmscsprout=$(echo "scale=3;$AverageCPUmscsprout/$NumProms" | bc -l)
for i in ${DatosCPUmscsprout[@]}; do DiferenceVar=$(echo "$i - $AverageCPUmscsprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUmscsprout=$(echo "$VarCPUmscsprout + $DiferenceVar" | bc -l) ; done
VarCPUmscsprout=$(echo "scale=3;$VarCPUmscsprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosCPUsipptest$cps)
for i in ${DatosCPUsipptest[@]}; do  AverageCPUsipptest=$(echo "$AverageCPUsipptest + $i" | bc -l) ; done
AverageCPUsipptest=$(echo "scale=3;$AverageCPUsipptest/$NumProms" | bc -l)
for i in ${DatosCPUsipptest[@]}; do DiferenceVar=$(echo "$i - $AverageCPUsipptest" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarCPUsipptest=$(echo "$VarCPUsipptest + $DiferenceVar" | bc -l) ; done
VarCPUsipptest=$(echo "scale=3;$VarCPUsipptest/$NumProms" | bc -l)

echo "$cps $AverageCPUastaire $VarCPUastaire $AverageCPUurcassandra $VarCPUurcassandra $AverageCPUmsccassandra $VarCPUmsccassandra $AverageCPUchronos $VarCPUchronos $AverageCPUbono $VarCPUbono $AverageCPUellis $VarCPUellis $AverageCPUhomesteadprov $VarCPUhomesteadprov $AverageCPUhomer $VarCPUhomer $AverageCPUurhomestead $VarCPUurhomestead $AverageCPUmschomestead $VarCPUmschomestead $AverageCPUralf $VarCPUralf $AverageCPUursprout $VarCPUursprout $AverageCPUmscsprout $VarCPUmscsprout $AverageCPUsipptest $VarCPUsipptest" >> $testMainfolder/SUMMARYCPU
#############################################################################
#RAM
#############################################################################
echo Calculating RAM
DatosRAMastaire=$(<$testfolder/PromediosRAMastaire$cps)
DatosRAMurcassandra=$(<$testfolder/PromediosRAMurcassandra$cps)
DatosRAMmsccassandra=$(<$testfolder/PromediosRAMmsccassandra$cps)
DatosRAMchronos=$(<$testfolder/PromediosRAMchronos$cps)
DatosRAMbono=$(<$testfolder/PromediosRAMbono$cps)
DatosRAMellis=$(<$testfolder/PromediosRAMellis$cps)
DatosRAMhomesteadprov=$(<$testfolder/PromediosRAMhomestead-prov$cps)
DatosRAMhomer=$(<$testfolder/PromediosRAMhomer$cps)
DatosRAMurhomestead=$(<$testfolder/PromediosRAMurhomestead$cps)
DatosRAMmschomestead=$(<$testfolder/PromediosRAMmschomestead$cps)
DatosRAMralf=$(<$testfolder/PromediosRAMralf$cps)
DatosRAMursprout=$(<$testfolder/PromediosRAMursprout$cps)
DatosRAMmscsprout=$(<$testfolder/PromediosRAMmscsprout$cps)
DatosRAMsipptest=$(<$testfolder/PromediosRAMsipptest$cps)

AverageRAMastaire=0
AverageRAMurcassandra=0
AverageRAMmsccassandra=0
AverageRAMchronos=0
AverageRAMbono=0
AverageRAMellis=0
AverageRAMhomesteadprov=0
AverageRAMhomer=0
AverageRAMurhomestead=0
AverageRAMmschomestead=0
AverageRAMralf=0
AverageRAMursprout=0
AverageRAMmscsprout=0
AverageRAMsipptest=0

VarRAMastaire=0
VarRAMurcassandra=0
VarRAMmsccassandra=0
VarRAMchronos=0
VarRAMbono=0
VarRAMellis=0
VarRAMhomesteadprov=0
VarRAMhomer=0
VarRAMurhomestead=0
VarRAMmschomestead=0
VarRAMralf=0
VarRAMursprout=0
VarRAMmscsprout=0
VarRAMsipptest=0

NumProms=$(wc -l < $testfolder/PromediosRAMastaire$cps)
for i in ${DatosRAMastaire[@]}; do  AverageRAMastaire=$(echo "$AverageRAMastaire + $i" | bc -l) ; done
AverageRAMastaire=$(echo "scale=3;$AverageRAMastaire/$NumProms" | bc -l)
for i in ${DatosRAMastaire[@]}; do DiferenceVar=$(echo "$i - $AverageRAMastaire" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMastaire=$(echo "$VarRAMastaire + $DiferenceVar" | bc -l) ; done
VarRAMastaire=$(echo "scale=3;$VarRAMastaire/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMurcassandra$cps)
for i in ${DatosRAMurcassandra[@]}; do  AverageRAMurcassandra=$(echo "$AverageRAMurcassandra + $i" | bc -l) ; done
AverageRAMurcassandra=$(echo "scale=3;$AverageRAMurcassandra/$NumProms" | bc -l)
for i in ${DatosRAMurcassandra[@]}; do DiferenceVar=$(echo "$i - $AverageRAMurcassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMurcassandra=$(echo "$VarRAMurcassandra + $DiferenceVar" | bc -l) ; done
VarRAMurcassandra=$(echo "scale=3;$VarRAMurcassandra/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMmsccassandra$cps)
for i in ${DatosRAMmsccassandra[@]}; do  AverageRAMmsccassandra=$(echo "$AverageRAMmsccassandra + $i" | bc -l) ; done
AverageRAMmsccassandra=$(echo "scale=3;$AverageRAMmsccassandra/$NumProms" | bc -l)
for i in ${DatosRAMmsccassandra[@]}; do DiferenceVar=$(echo "$i - $AverageRAMmsccassandra" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMmsccassandra=$(echo "$VarRAMmsccassandra + $DiferenceVar" | bc -l) ; done
VarRAMmsccassandra=$(echo "scale=3;$VarRAMmsccassandra/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMchronos$cps)
for i in ${DatosRAMchronos[@]}; do  AverageRAMchronos=$(echo "$AverageRAMchronos + $i" | bc -l) ; done
AverageRAMchronos=$(echo "scale=3;$AverageRAMchronos/$NumProms" | bc -l)
for i in ${DatosRAMchronos[@]}; do DiferenceVar=$(echo "$i - $AverageRAMchronos" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMchronos=$(echo "$VarRAMchronos + $DiferenceVar" | bc -l) ; done
VarRAMchronos=$(echo "scale=3;$VarRAMchronos/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMbono$cps)
for i in ${DatosRAMbono[@]}; do  AverageRAMbono=$(echo "$AverageRAMbono + $i" | bc -l) ; done
AverageRAMbono=$(echo "scale=3;$AverageRAMbono/$NumProms" | bc -l)
for i in ${DatosRAMbono[@]}; do DiferenceVar=$(echo "$i - $AverageRAMbono" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMbono=$(echo "$VarRAMbono + $DiferenceVar" | bc -l) ; done
VarRAMbono=$(echo "scale=3;$VarRAMbono/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMellis$cps)
for i in ${DatosRAMellis[@]}; do  AverageRAMellis=$(echo "$AverageRAMellis + $i" | bc -l) ; done
AverageRAMellis=$(echo "scale=3;$AverageRAMellis/$NumProms" | bc -l)
for i in ${DatosRAMellis[@]}; do DiferenceVar=$(echo "$i - $AverageRAMellis" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMellis=$(echo "$VarRAMellis + $DiferenceVar" | bc -l) ; done
VarRAMellis=$(echo "scale=3;$VarRAMellis/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMhomestead-prov$cps)
for i in ${DatosRAMhomesteadprov[@]}; do  AverageRAMhomesteadprov=$(echo "$AverageRAMhomesteadprov + $i" | bc -l) ; done
AverageRAMhomesteadprov=$(echo "scale=3;$AverageRAMhomesteadprov/$NumProms" | bc -l)
for i in ${DatosRAMhomesteadprov[@]}; do DiferenceVar=$(echo "$i - $AverageRAMhomesteadprov" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMhomesteadprov=$(echo "$VarRAMhomesteadprov + $DiferenceVar" | bc -l) ; done
VarRAMhomesteadprov=$(echo "scale=3;$VarRAMhomesteadprov/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMhomer$cps)
for i in ${DatosRAMhomer[@]}; do  AverageRAMhomer=$(echo "$AverageRAMhomer + $i" | bc -l) ; done
AverageRAMhomer=$(echo "scale=3;$AverageRAMhomer/$NumProms" | bc -l)
for i in ${DatosRAMhomer[@]}; do DiferenceVar=$(echo "$i - $AverageRAMhomer" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMhomer=$(echo "$VarRAMhomer + $DiferenceVar" | bc -l) ; done
VarRAMhomer=$(echo "scale=3;$VarRAMhomer/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMurhomestead$cps)
for i in ${DatosRAMurhomestead[@]}; do  AverageRAMurhomestead=$(echo "$AverageRAMurhomestead + $i" | bc -l) ; done
AverageRAMurhomestead=$(echo "scale=3;$AverageRAMurhomestead/$NumProms" | bc -l)
for i in ${DatosRAMurhomestead[@]}; do DiferenceVar=$(echo "$i - $AverageRAMurhomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMurhomestead=$(echo "$VarRAMurhomestead + $DiferenceVar" | bc -l) ; done
VarRAMurhomestead=$(echo "scale=3;$VarRAMurhomestead/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMmschomestead$cps)
for i in ${DatosRAMmschomestead[@]}; do  AverageRAMmschomestead=$(echo "$AverageRAMmschomestead + $i" | bc -l) ; done
AverageRAMmschomestead=$(echo "scale=3;$AverageRAMmschomestead/$NumProms" | bc -l)
for i in ${DatosRAMmschomestead[@]}; do DiferenceVar=$(echo "$i - $AverageRAMmschomestead" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMmschomestead=$(echo "$VarRAMmschomestead + $DiferenceVar" | bc -l) ; done
VarRAMmschomestead=$(echo "scale=3;$VarRAMmschomestead/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMralf$cps)
for i in ${DatosRAMralf[@]}; do  AverageRAMralf=$(echo "$AverageRAMralf + $i" | bc -l) ; done
AverageRAMralf=$(echo "scale=3;$AverageRAMralf/$NumProms" | bc -l)
for i in ${DatosRAMralf[@]}; do DiferenceVar=$(echo "$i - $AverageRAMralf" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMralf=$(echo "$VarRAMralf + $DiferenceVar" | bc -l) ; done
VarRAMralf=$(echo "scale=3;$VarRAMralf/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMursprout$cps)
for i in ${DatosRAMursprout[@]}; do  AverageRAMursprout=$(echo "$AverageRAMursprout + $i" | bc -l) ; done
AverageRAMursprout=$(echo "scale=3;$AverageRAMursprout/$NumProms" | bc -l)
for i in ${DatosRAMursprout[@]}; do DiferenceVar=$(echo "$i - $AverageRAMursprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMursprout=$(echo "$VarRAMursprout + $DiferenceVar" | bc -l) ; done
VarRAMursprout=$(echo "scale=3;$VarRAMursprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMmscsprout$cps)
for i in ${DatosRAMmscsprout[@]}; do  AverageRAMmscsprout=$(echo "$AverageRAMmscsprout + $i" | bc -l) ; done
AverageRAMmscsprout=$(echo "scale=3;$AverageRAMmscsprout/$NumProms" | bc -l)
for i in ${DatosRAMmscsprout[@]}; do DiferenceVar=$(echo "$i - $AverageRAMmscsprout" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMmscsprout=$(echo "$VarRAMmscsprout + $DiferenceVar" | bc -l) ; done
VarRAMmscsprout=$(echo "scale=3;$VarRAMmscsprout/$NumProms" | bc -l)

NumProms=$(wc -l < $testfolder/PromediosRAMsipptest$cps)
for i in ${DatosRAMsipptest[@]}; do  AverageRAMsipptest=$(echo "$AverageRAMsipptest + $i" | bc -l) ; done
AverageRAMsipptest=$(echo "scale=3;$AverageRAMsipptest/$NumProms" | bc -l)
for i in ${DatosRAMsipptest[@]}; do DiferenceVar=$(echo "$i - $AverageRAMsipptest" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarRAMsipptest=$(echo "$VarRAMsipptest + $DiferenceVar" | bc -l) ; done
VarRAMsipptest=$(echo "scale=3;$VarRAMsipptest/$NumProms" | bc -l)

echo "$cps $AverageRAMastaire $VarRAMastaire $AverageRAMurcassandra $VarRAMurcassandra $AverageRAMmsccassandra $VarRAMmsccassandra $AverageRAMchronos $VarRAMchronos $AverageRAMbono $VarRAMbono $AverageRAMellis $VarRAMellis $AverageRAMhomesteadprov $VarRAMhomesteadprov $AverageRAMhomer $VarRAMhomer $AverageRAMurhomestead $VarRAMurhomestead $AverageRAMmschomestead $VarRAMmschomestead $AverageRAMralf $VarRAMralf $AverageRAMursprout $VarRAMursprout $AverageRAMmscsprout $VarRAMmscsprout $AverageRAMsipptest $VarRAMsipptest" >> $testMainfolder/SUMMARYRAM


#############################################################################
#LATENCY
#############################################################################
echo Calculatin Latency
DatosLatency=$(<$testfolder/PromediosLatency$cps)
AverageLatency=0
VarLatency=0
NumProms=$(wc -l < $testfolder/PromediosLatency$cps)
for i in ${DatosLatency[@]}; do  AverageLatency=$(echo "$AverageLatency + $i" | bc -l) ; done
AverageLatency=$(echo "scale=3;$AverageLatency/$NumProms" | bc -l)
for i in ${DatosLatency[@]}; do DiferenceVar=$(echo "$i - $AverageLatency" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarLatency=$(echo "$VarLatency + $DiferenceVar" | bc -l) ; done
VarLatency=$(echo "scale=3;$VarLatency/$NumProms" | bc -l)
echo "$cps $AveraLatency $VarLatency" >> $testMainfolder/SUMMARYLATENCY


#############################################################################
#SUCCESFULL CALL RATE
#############################################################################
echo Calculatin SCR
DatosSCPS=$(<$testfolder/PromediosSCPS$cps)
AverageSCPS=0
VarSCPS=0
NumProms=$(wc -l < $testfolder/PromediosSCPS$cps)
for i in ${DatosSCPS[@]}; do  AverageSCPS=$(echo "$AverageSCPS + $i" | bc -l) ; done
AverageSCPS=$(echo "scale=3;$AverageSCPS/$NumProms" | bc -l)
for i in ${DatosSCPS[@]}; do DiferenceVar=$(echo "$i - $AverageSCPS" | bc -l);DiferenceVar=$(echo "$DiferenceVar* $DiferenceVar" | bc -l); VarSCPS=$(echo "$VarSCPS + $DiferenceVar" | bc -l) ; done
VarSCPS=$(echo "scale=3;$VarSCPS/$NumProms" | bc -l)
echo "$cps $AverageSCPS $VarSCPS" >> $testMainfolder/SUMMARYSCR
