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
source ~/clearwater-docker/ScriptsDat3/TrafficGenerator/TestCharacteristics
testfolder=$Maintestfolder/$cps$duration
mkdir -p $testfolder
mkdir -p $testfolder/RangesLatency

#Deleting old files
[ -e $testfolder/PromediosDelay$cps ] && rm $testfolder/PromediosDelay$cps
[ -e $testfolder/PromediosSingleLatency$cps ] && rm $testfolder/PromediosSingleLatency$cps
[ -e $testfolder/PromediosSCPS$cps ] && rm $testfolder/PromediosSCPS$cps
rm -rfv $testfolder/RangesLatency/* > /dev/null

#exit 0

NumTest=1
#NumberTest=2
while [ $NumTest -lt $NumberTest ]; do
  #Calculating CPU and RAM
  echo Resumen general numero $NumTest, cps $cps
  #############################################################################
  #LATENCY1
  #############################################################################
  cd $testfolder/$NumTest
  cat $testfolder/$NumTest/clearwater-sipp/*rtt.csv > $testfolder/$NumTest/RecollectionDelay.csv
  #latencyfile=$(ls | grep rtt)
  #tail -n +20 "RecollectionDelay.csv" > "$testfolder/$NumTest/delay.csv"
  tail -n +2 "RecollectionDelay.csv" > "$testfolder/$NumTest/delay.csv"
  SumLatency=0
  PromLatency=0
  NumDataLatency=0
  #echo $latencyfile
  #echo NumTest $NumTest PromLatency $PromLatency
  while IFS=";" read -r date responsetime timername remainder
  do
    #echo $responsetime
    SumLatency=`echo $SumLatency + $responsetime | bc`
    let NumDataLatency=NumDataLatency+1
  done < "$testfolder/$NumTest/delay.csv"

  if [ $NumDataLatency = '0' ];
  then
    echo CPS $cps Prueba Delay $NumTest con falla, no se considerara en los promedios generales de latencia.
  else
      PromLatency=$(echo "scale=3; $SumLatency/$NumDataLatency" | bc -l)
      #PromLatency=`echo $PromLatency - $DelayCallAnswer | bc`
      #PromLatency=`echo $PromLatency - $DelayBeforeACK | bc`
      echo $PromLatency >> $testfolder/PromediosDelay$cps
      echo Latency = $PromLatency
      #echo NumTest $NumTest PromLatency $PromLatency
  fi
  # #############################################################################
  # #SINGLE LATENCY
  # #############################################################################
  SumSingleLatency=0
  PromSingleLatency=0
  NumData=0

  [ -e $testfolder/$NumTest/SingleLatencyTest.csv ] && rm $testfolder/$NumTest/SingleLatencyTest.csv
  #cat $testfolder/$NumTest/SingleLatencyTest1.csv > $testfolder/$NumTest/SingleLatencyTest.csv

  for i in $(seq 1 $NumSipp); do
  cat $testfolder/$NumTest/SingleLatencyTest$i.csv >> $testfolder/$NumTest/SingleLatencyTest.csv
  done

  while IFS=" " read -r SingleLatency ERROR_LENGTH remainder
  do
    #CPU=${echo $CPU | bc}
    #echo  $datetime $cpu $ram
    if [ "$ERROR_LENGTH" -lt '300' ]
    then
      #echo Valor positivo $NumSipp $LATENCY
      SumSingleLatency=`echo $SumSingleLatency + $SingleLatency | bc`
      #echo $SumCPU
      let NumData=NumData+1

     else
       echo Valor negativoo $SingleLatency $ERROR_LENGTH
    fi

  done < "$testfolder/$NumTest/SingleLatencyTest.csv"
  #echo  $NumData


  if [ $NumData = '0' ];
  then
    echo CPS $cps Prueba Latencia $NumTest con falla, no se considerara en los promedios generales.
  else
      PromSingleLatency=$(echo "scale=3; $SumSingleLatency/$NumData" | bc -l)
      echo $PromSingleLatency >> $testfolder/PromediosSingleLatency$cps
      echo SingleLatency $PromSingleLatency
  fi

  #############################################################################
  #SUCCESFULL CALL RATE
  #############################################################################
  TotalCallGenerate=0
  TotalSuccessfullCallGenerate=0
  TotalFailedCallGenerate=0
  for i in $(seq 1 $NumSipp); do
    CallGenerate=$(grep -F "OutGoing call created" $testfolder/$NumTest/logsSIPpTest$i.txt | cut -d '|' -f3)
    SuccesfullCall=$(grep -F "Successful call" $testfolder/$NumTest/logsSIPpTest$i.txt | cut -d '|' -f3)
    FailedCall=$(grep -F "Failed call" $testfolder/$NumTest/logsSIPpTest$i.txt | cut -d '|' -f3)
    CallGenerate=${CallGenerate::-1}
    SuccesfullCall=${SuccesfullCall::-1}
    FailedCall=${FailedCall::-1}
    TotalCallGenerate=`echo $TotalCallGenerate + $CallGenerate | bc`
    TotalSuccessfullCallGenerate=`echo $TotalSuccessfullCallGenerate + $SuccesfullCall | bc`
    TotalFailedCallGenerate=`echo $TotalFailedCallGenerate + $FailedCall | bc`
  done
  Scale=100
  SuccesfullCallRate=$(echo "scale=3; $TotalSuccessfullCallGenerate*$Scale" | bc -l)
  SuccesfullCallRate=$(echo "scale=2; $SuccesfullCallRate/$TotalCallGenerate" | bc -l)
  echo $SuccesfullCallRate >> $testfolder/PromediosSCPS$cps
  echo Call Generate:$TotalCallGenerate SuccesfullCall:$TotalSuccessfullCallGenerate FailedCall $TotalFailedCallGenerate SCR:$SuccesfullCallRate

  #exit 0
  #############################################################################
  #LATENCY2
  #############################################################################
  cd $testfolder/$NumTest
  cat $testfolder/$NumTest/clearwater-sipp/*screen.log > $testfolder/$NumTest/RecollectionRangesDelay.csv
  cd $testfolder/$NumTest/clearwater-sipp
  Scale=100
  NameScreenLogs=$(ls | grep screen)
  NumScreenLogs=$(ls | grep screen | wc -l)
  echo $NameScreenLogs
  echo $NumScreenLogs
  #Start with source information clasification
  for i in $(seq 1 $NumScreenLogs); do
    #echo Hello
    SpecificLogFile=$(echo $NameScreenLogs | awk "{print $"$i"}")
    echo LogFile $1 $SpecificLogFile
    startLineRegSetup=$(grep -n "Average Response Time Repartition register-setup" $SpecificLogFile  | grep -Eo '^[^:]+')
    startLineCallAverage=$(grep -n "Average Call Length Repartition" $SpecificLogFile | grep -Eo '^[^:]+')
    startLineCallSetup=$(grep -n "Average Response Time Repartition call-setup" $SpecificLogFile  | grep -Eo '^[^:]+')
    startLineCallTeardown=$(grep -n "Average Response Time Repartition call-teardown" $SpecificLogFile  | grep -Eo '^[^:]+')
    FinalLine=$(cat $SpecificLogFile | wc -l)
    sed -n "$startLineRegSetup,$startLineCallAverage p" $SpecificLogFile > regSetup$i.csv
    sed -n "$startLineCallAverage,$startLineCallSetup p" $SpecificLogFile > CallAverage$i.csv
    sed -n "$startLineCallSetup,$startLineCallTeardown p" $SpecificLogFile > CallSetup$i.csv
    sed -n "$startLineCallTeardown,$FinalLine p" $SpecificLogFile > CallTeardown$i.csv
  done
  for j in regSetup CallSetup CallTeardown ; do
    #for i in regSetup CallAverage CallSetup CallTeardown ; do
    # AverageRange010=0
    # AverageRange1025=0
    # AverageRange2550=0
    # AverageRange50100=0
    # AverageRange100150=0
    # AverageRange150200=0
    # AverageRange200300=0
    # AverageRange300500=0
    # AverageRange5001000=0
    # AverageRange100010000=0
    # AverageRange10000n=0
    TotalRange010=0
    TotalRange1025=0
    TotalRange2550=0
    TotalRange50100=0
    TotalRange100150=0
    TotalRange150200=0
    TotalRange200300=0
    TotalRange300500=0
    TotalRange5001000=0
    TotalRange100010000=0
    TotalRange10000n=0
    Total=0
    #for i in regSetup CallSetup CallTeardown ; do
    for i in $(seq 1 $NumScreenLogs); do
      Range010=$(cat $j$i.csv | grep -n "0 ms <= n <        10 ms :" | awk '{print $10}')
      Range1025=$(cat $j$i.csv | grep -n "10 ms <= n <        25 ms :" | awk '{print $10}')
      Range2550=$(cat $j$i.csv | grep -n "25 ms <= n <        50 ms :" | awk '{print $10}')
      Range50100=$(cat $j$i.csv | grep -n "50 ms <= n <       100 ms :" | awk '{print $10}')
      Range100150=$(cat $j$i.csv | grep -n "100 ms <= n <       150 ms :" | awk '{print $10}')
      Range150200=$(cat $j$i.csv | grep -n "150 ms <= n <       200 ms :" | awk '{print $10}')
      Range200300=$(cat $j$i.csv | grep -n "200 ms <= n <       300 ms :" | awk '{print $10}')
      Range300500=$(cat $j$i.csv | grep -n "300 ms <= n <       500 ms :" | awk '{print $10}')
      Range5001000=$(cat $j$i.csv | grep -n "500 ms <= n <      1000 ms :" | awk '{print $10}')
      Range100010000=$(cat $j$i.csv | grep -n "1000 ms <= n <     10000 ms :" | awk '{print $10}')
      Range10000n=$(cat $j$i.csv | grep -n "n >=    10000 ms :" | awk '{print $7}')
      #echo $Range10000n
      TotalRange010=`echo $TotalRange010 + $Range010 | bc`
      TotalRange1025=`echo $TotalRange1025 + $Range1025 | bc`
      TotalRange2550=`echo $TotalRange2550 + $Range2550 | bc`
      TotalRange50100=`echo $TotalRange50100 + $Range50100 | bc`
      TotalRange100150=`echo $TotalRange100150 + $Range100150 | bc`
      TotalRange150200=`echo $TotalRange150200 + $Range150200 | bc`
      TotalRange200300=`echo $TotalRange200300 + $Range200300 | bc`
      TotalRange300500=`echo $TotalRange300500 + $Range300500 | bc`
      TotalRange5001000=`echo $TotalRange5001000 + $Range5001000 | bc`
      TotalRange100010000=`echo $TotalRange100010000 + $Range100010000 | bc`
      TotalRange10000n=`echo $TotalRange10000n + $Range10000n | bc`
      # echo $j TotalRange010 + $TotalRange010
      # echo $j TotalRange1025 + $TotalRange1025
      # echo $j TotalRange2550 + $TotalRange2550
      # echo $j TotalRange50100 + $TotalRange50100
      # echo $j TotalRange100150 + $TotalRange100150
      # echo $j TotalRange150200 + $TotalRange150200
      # echo $j TotalRange200300 + $TotalRange200300
      # echo $j TotalRange300500 + $TotalRange300500
      # echo $j TotalRange5001000 + $TotalRange5001000
      # echo $j TotalRange100010000 + $TotalRange100010000
      # echo $j TotalRange10000n + $TotalRange10000n
    done

    echo $TotalRange010 >> $testfolder/RangesLatency/Range010$j.csv
    echo $TotalRange1025 >> $testfolder/RangesLatency/Range1025$j.csv
    echo $TotalRange2550 >> $testfolder/RangesLatency/Range2550$j.csv
    echo $TotalRange50100 >> $testfolder/RangesLatency/Range50100$j.csv
    echo $TotalRange100150 >> $testfolder/RangesLatency/Range100150$j.csv
    echo $TotalRange150200 >> $testfolder/RangesLatency/Range150200$j.csv
    echo $TotalRange200300 >> $testfolder/RangesLatency/Range200300$j.csv
    echo $TotalRange300500 >> $testfolder/RangesLatency/Range300500$j.csv
    echo $TotalRange5001000 >> $testfolder/RangesLatency/Range5001000$j.csv
    echo $TotalRange100010000 >> $testfolder/RangesLatency/Range100010000$j.csv
    echo $TotalRange10000n >> $testfolder/RangesLatency/Range10000n$j.csv

    # Total=`echo $TotalRange010 + $TotalRange1025 + $TotalRange2550 + $TotalRange50100 + $TotalRange100150 + $TotalRange150200 + $TotalRange200300 + $TotalRange300500 + $TotalRange5001000 + $TotalRange100010000 + $TotalRange10000n | bc`
    # #echo $Total
    # #echo $Scale
    # TotalRange010=$(echo "scale=2; $TotalRange010*$Scale" | bc -l)
    # TotalRange1025=$(echo "scale=2; $TotalRange1025*$Scale" | bc -l)
    # TotalRange2550=$(echo "scale=2; $TotalRange2550*$Scale" | bc -l)
    # TotalRange50100=$(echo "scale=2; $TotalRange50100*$Scale" | bc -l)
    # TotalRange100150=$(echo "scale=2; $TotalRange100150*$Scale" | bc -l)
    # TotalRange150200=$(echo "scale=2; $TotalRange150200*$Scale" | bc -l)
    # TotalRange200300=$(echo "scale=2; $TotalRange200300*$Scale" | bc -l)
    # TotalRange300500=$(echo "scale=2; $TotalRange300500*$Scale" | bc -l)
    # TotalRange5001000=$(echo "scale=2; $TotalRange5001000*$Scale" | bc -l)
    # TotalRange100010000=$(echo "scale=2; $TotalRange100010000*$Scale" | bc -l)
    # TotalRange10000n=$(echo "scale=2; $TotalRange10000n*$Scale" | bc -l)
    #
    # echo "scale=2; $TotalRange010/$Total" | bc -l >> $testfolder/RangesLatency/Range010$j.csv
    # echo "scale=2; $TotalRange1025/$Total" | bc -l >> $testfolder/RangesLatency/Range1025$j.csv
    # echo "scale=2; $TotalRange2550/$Total" | bc -l >> $testfolder/RangesLatency/Range2550$j.csv
    # echo "scale=2; $TotalRange50100/$Total" | bc -l >> $testfolder/RangesLatency/Range50100$j.csv
    # echo "scale=2; $TotalRange100150/$Total" | bc -l >> $testfolder/RangesLatency/Range100150$j.csv
    # echo "scale=2; $TotalRange150200/$Total" | bc -l >> $testfolder/RangesLatency/Range150200$j.csv
    # echo "scale=2; $TotalRange200300/$Total" | bc -l >> $testfolder/RangesLatency/Range200300$j.csv
    # echo "scale=2; $TotalRange300500/$Total" | bc -l >> $testfolder/RangesLatency/Range300500$j.csv
    # echo "scale=2; $TotalRange5001000/$Total" | bc -l >> $testfolder/RangesLatency/Range5001000$j.csv
    # echo "scale=2; $TotalRange100010000/$Total" | bc -l >> $testfolder/RangesLatency/Range100010000$j.csv
    # echo "scale=2; $TotalRange10000n/$Total" | bc -l >> $testfolder/RangesLatency/Range10000n$j.csv
    # AverageRange010=$(echo "scale=2; $TotalRange010/$Total" | bc -l)
    # AverageRange1025=$(echo "scale=2; $TotalRange1025/$Total" | bc -l)
    # AverageRange2550=$(echo "scale=2; $TotalRange2550/$Total" | bc -l)
    # AverageRange50100=$(echo "scale=2; $TotalRange50100/$Total" | bc -l)
    # AverageRange100150=$(echo "scale=2; $TotalRange100150/$Total" | bc -l)
    # AverageRange150200=$(echo "scale=2; $TotalRange150200/$Total" | bc -l)
    # AverageRange200300=$(echo "scale=2; $TotalRange200300/$Total" | bc -l)
    # AverageRange300500=$(echo "scale=2; $TotalRange300500/$Total" | bc -l)
    # AverageRange5001000=$(echo "scale=2; $TotalRange5001000/$Total" | bc -l)
    # AverageRange100010000=$(echo "scale=2; $TotalRange100010000/$Total" | bc -l)
    # AverageRange10000n=$(echo "scale=2; $TotalRange10000n/$Total" | bc -l)
    #
    # echo Average= $AverageRange010
    # echo Average= $AverageRange1025
    # echo Average= $AverageRange2550
    # echo Average= $AverageRange50100
    # echo Average= $AverageRange100150
    # echo Average= $AverageRange150200
    # echo Average= $AverageRange200300
    # echo Average= $AverageRange300500
    # echo Average= $AverageRange5001000
    # echo Average= $AverageRange100010000
    # echo Average= $AverageRange10000n
  done

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
