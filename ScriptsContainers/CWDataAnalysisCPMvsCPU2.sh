#!/bin/bash
users="$1"
duration="$2"
testfolder=~/ClearwaterTestResults/Containers2/$users$duration

NumTest=1
NumberTest=2
while [ $NumTest -lt $NumberTest ]; do

  #sed -i '1i astaire           astaire           astaire' $testfolder/$NumTest/astaire.csv
  #sed -i '1i cassandra           cassandra           cassandra' $testfolder/$NumTest/cassandra.csv
  #sed -i '1i chronos           chronos           chronos' $testfolder/$NumTest/chronos.csv
  #sed -i '1i bono           bono           bono' $testfolder/$NumTest/bono.csv
  ##sed -i '1i ellis           ellis           ellis' $testfolder/ellis.csv
  #sed -i '1i homer           homer           homer' $testfolder/$NumTest/homer.csv
  #sed -i '1i homestead           homestead           homestead' $testfolder/$NumTest/homestead.csv
  ##sed -i '1i homestead-prov           homestead-prov           homestead-prov' $testfolder/homestead-prov.csv
  #sed -i '1i ralf           ralf           ralf' $testfolder/$NumTest/ralf.csv
  #sed -i '1i icscf.sprout          icscf.sprout           icscf.sprout' $testfolder/$NumTest/icscf.sprout.csv
  #sed -i '1i scscf.sprout          scscf.sprout           scscf.sprout' $testfolder/$NumTest/scscf.sprout.csv
  #sed -i '1i sipptest          sipptest           sipptest' $testfolder/$NumTest/sipptest.csv
  for i in cassandra homestead icscf.sprout scscf.sprout; do
    tail -n +2 "$testfolder/$users$duration$NumTest/$i.csv" > "$testfolder/$users$duration$NumTest/$i"
    SumCPU=0
    SumRAM=0
    PromCPU=0
    PromRAM=0
    NumData=0
    while IFS=" " read -r datetime cpu ram remainder
    do
      cpu=${cpu::-1}
      ram=${ram::-1}
      echo  $datetime $cpu $ram
      SumCPU=`echo $SumCPU + $cpu | bc`
      SumRAM=`echo $SumRAM + $ram | bc`
      let NumData=NumData+1
    done < "$testfolder/$users$duration$NumTest/$i"
    echo  $NumData
    PromCPU=`echo $SumCPU/$NumData | bc`
    PromRAM=`echo $SumRAM/$NumData | bc`
    echo PromCPU
    echo PromRAM
  done
let NumTest=NumTest+1
done
