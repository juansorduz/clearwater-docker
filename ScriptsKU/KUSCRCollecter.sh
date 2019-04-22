testfolder=~/ClearwaterTestResults/Kubernetes3
NumTest=1

for i in `seq 15`; do
rm -r ~/ClearwaterTestResults/Kubernetes3/*
./ScriptsKU/KUMonitor_independent.sh 110 30 10.244.4.14 2 sipptest-8548ccd744-pzw72 &
./ScriptsKU/KUMonitor_independent.sh 50 30 10.244.3.14 2 sipptest-8548ccd744-8ctdr &
./ScriptsKU/KUMonitor_independent.sh 40 30 10.244.1.17 2 sipptest-8548ccd744-mmpqs &
./ScriptsKU/KUMonitor_independent.sh 20 30 10.244.2.15 2 sipptest-8548ccd744-hnxhf &
./ScriptsKU/KUMonitor_independent.sh 30 30 10.244.6.7 2 sipptest-8548ccd744-r5vrt &
sum=0
sleep 5
mkdir ~/ClearwaterTestResults/200
while [ "$sum" -lt '10' ]; do
  echo hola
  sum=0
  source $testfolder/11030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/2030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/3030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/4030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/5030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  echo sum=$sum
done
for j in 11030 5030 4030 2030 3030 ; do
CallGenerate=$(grep -F "OutGoing call created" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
SuccesfullCall=$(grep -F "Successful call" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
FailedCall=$(grep -F "Failed call" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
Scale=100
CallGenerate=${CallGenerate::-1}
SuccesfullCall=${SuccesfullCall::-1}
FailedCall=${FailedCall::-1}
SuccesfullCallRate=$(echo "scale=3; $SuccesfullCall*$Scale" | bc -l)
SuccesfullCallRate=$(echo "scale=2; $SuccesfullCallRate/$CallGenerate" | bc -l)
mkdir ~/ClearwaterTestResults/250/$j
echo $SuccesfullCallRate >> ~/ClearwaterTestResults/250/$j/PromediosSCPS$i
echo Call Generate:$CallGenerate SuccesfullCall:$SuccesfullCall FailedCall $FailedCall SCR:$SuccesfullCallRate
done
done
