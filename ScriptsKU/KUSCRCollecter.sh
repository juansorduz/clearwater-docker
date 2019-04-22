testfolder=~/ClearwaterTestResults/Kubernetes3
NumTest=1

for i in `seq 15`; do
rm -r ~/ClearwaterTestResults/Kubernetes3/*
./ScriptsKU/KUMonitor_independent.sh 25 30 10.244.4.14 2 sipptest-8548ccd744-pzw72 &
./ScriptsKU/KUMonitor_independent.sh 30 30 10.244.3.14 2 sipptest-8548ccd744-8ctdr &
./ScriptsKU/KUMonitor_independent.sh 15 30 10.244.1.17 2 sipptest-8548ccd744-mmpqs &
./ScriptsKU/KUMonitor_independent.sh 20 30 10.244.2.15 2 sipptest-8548ccd744-hnxhf &
./ScriptsKU/KUMonitor_independent.sh 10 30 10.244.6.7 2 sipptest-8548ccd744-r5vrt &
sum=0
sleep 5
mkdir ~/ClearwaterTestResults/100
while [ "$sum" -lt '10' ]; do
  echo hola
  sum=0
  source $testfolder/2530/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/3030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/1530/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/2030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/1030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  echo sum=$sum
done
for j in 2530 3030 1530 2030 1030 ; do
CallGenerate=$(grep -F "OutGoing call created" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
SuccesfullCall=$(grep -F "Successful call" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
FailedCall=$(grep -F "Failed call" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
Scale=100
CallGenerate=${CallGenerate::-1}
SuccesfullCall=${SuccesfullCall::-1}
FailedCall=${FailedCall::-1}
SuccesfullCallRate=$(echo "scale=3; $SuccesfullCall*$Scale" | bc -l)
SuccesfullCallRate=$(echo "scale=2; $SuccesfullCallRate/$CallGenerate" | bc -l)
mkdir ~/ClearwaterTestResults/100/$j
echo $SuccesfullCallRate >> ~/ClearwaterTestResults/100/$j/PromediosSCPS$i
echo Call Generate:$CallGenerate SuccesfullCall:$SuccesfullCall FailedCall $FailedCall SCR:$SuccesfullCallRate
done
done
