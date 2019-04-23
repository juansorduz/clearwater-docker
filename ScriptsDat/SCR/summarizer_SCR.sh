testfolder=~/ClearwaterTestResults/
for k 
for j in 100 150 200 250 300 ; ; do
for i in `seq 14`; ; do
cat $testfolder/$k/$j/*/PromediosSCPS$i > $testfolder/$j/sumary_prueba$i.csv
done
done
