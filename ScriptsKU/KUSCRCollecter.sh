testfolder=~/ClearwaterTestResults/Kubernetes3
NumTest=1

for i in `seq 15`; do
rm -r ~/ClearwaterTestResults/Kubernetes3/*
./ScriptsKU/KUMonitor_independent.sh 65 30 10.244.6.15 2 sipptest-8548ccd744-6njbp &
./ScriptsKU/KUMonitor_independent.sh 70 30 10.244.4.29 2 sipptest-8548ccd744-d5zll &
./ScriptsKU/KUMonitor_independent.sh 55 30 10.244.2.29 2 sipptest-8548ccd744-hz984 &
./ScriptsKU/KUMonitor_independent.sh 60 30 10.244.5.8 2 sipptest-8548ccd744-j6l5k &
./ScriptsKU/KUMonitor_independent.sh 50 30 10.244.3.30 2 sipptest-8548ccd744-m75v4 &
sum=0
sleep 5
mkdir ~/ClearwaterTestResults/300
while [ "$sum" -lt '10' ]; do
  echo hola
  sum=0
  source $testfolder/6530/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/7030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/5530/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/6030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  source $testfolder/5030/1/Variables.txt
  sum=`echo $sum + $stateTest | bc`
  echo sum=$sum
done
for j in 6530 7030 5530 6030 5030 ; do
CallGenerate=$(grep -F "OutGoing call created" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
SuccesfullCall=$(grep -F "Successful call" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
FailedCall=$(grep -F "Failed call" $testfolder/$j/1/logsSIPpTest.txt | cut -d '|' -f3)
Scale=100
CallGenerate=${CallGenerate::-1}
SuccesfullCall=${SuccesfullCall::-1}
FailedCall=${FailedCall::-1}
SuccesfullCallRate=$(echo "scale=3; $SuccesfullCall*$Scale" | bc -l)
SuccesfullCallRate=$(echo "scale=2; $SuccesfullCallRate/$CallGenerate" | bc -l)
mkdir ~/ClearwaterTestResults/300/$j
echo $SuccesfullCallRate >> ~/ClearwaterTestResults/300/$j/PromediosSCPS$i
echo Call Generate:$CallGenerate SuccesfullCall:$SuccesfullCall FailedCall $FailedCall SCR:$SuccesfullCallRate
done
done
