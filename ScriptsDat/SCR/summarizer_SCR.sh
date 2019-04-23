testfolder=~/ClearwaterTestResults
for k  in 5bono_original 5bono_original_2sprout 5bono_original_3sprout 5bono 5bono2ur_mscsprout 5bono3ur_mscsprout; do
for j in 100 150 200 250 300 ; do
sum=0
res=0
DiferenceVar=0.2
for i in `seq 15`; do
#cat $testfolder/$k/$j/*/PromediosSCPS$i > $testfolder/$k/$j/sumary_prueba$i.csv
sum=$(paste -sd+ $testfolder/$k/$j/sumary_prueba$i.csv | bc)
#my_val=$(echo "(2*${sqrt3}*${a})/2" | bc)
#result=$("$sum * 0.2" | bc)
#result=$(($sum * 0.2))
result=$(echo "$sum* $DiferenceVar" | bc -l)
echo $result
echo $result >> $testfolder/$k/$j/promedi.csv
done
done
done
