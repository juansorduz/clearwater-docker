#!/bin/bash
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testfolder=~/ClearwaterTestResults/Summaries/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}

#Deleting old files
#for i in call-setup register-setup call-teardown; do
[ -e $testfolder/SUMMARYSCR2 ] && rm $testfolder/SUMMARYSCR2
#############################################################################
#SUCCESFULL CALL RATE TRANSFORMATION
#############################################################################
tail -n +2 "$testfolder/SUMMARYSCR" > "$testfolder/SUMMARYSCRTemp"
echo "#cpsGenerated cpsSuccesfull " >> $testfolder/SUMMARYSCR2
Scale=100
while IFS=" " read -r cps SCR VarSCR remainder
do
  #echo $cps $SCR $VarSCR
  cpsGenerated=$cps
  cpsSuccesfull=$(echo "scale=3; $cpsGenerated*$SCR" | bc -l)
  cpsSuccesfull=$(echo "scale=0; $cpsSuccesfull/$Scale" | bc -l)
  echo $cpsGenerated $cpsSuccesfull >> $testfolder/SUMMARYSCR2

done < "$testfolder/SUMMARYSCRTemp"
