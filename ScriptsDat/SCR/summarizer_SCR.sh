testfolder=~/ClearwaterTestResults$/5bono2ur_mscsprout
for i in 100 150 200 250 300; do 

cat $testfolder/*/$i > $testfolder/sumary_$i.csv
done
