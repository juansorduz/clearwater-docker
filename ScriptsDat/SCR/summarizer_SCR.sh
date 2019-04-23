testfolder=~/ClearwaterTestResults/
for k  in 5bono_original 5bono_original_2sprout 5bono_original_3sprout 5bono 5bono2ur_mscsprout 5bono3ur_mscsprout; do
for j in 100 150 200 250 300 ; do
for i in `seq 15`; do
cat $testfolder/$k/$j/*/PromediosSCPS$i > $testfolder/$k/$j/sumary_prueba$i.csv
done
done
done
