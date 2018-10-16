#!/bin/bash
users="$1"
duration="$2"
testfolder=~/ClearwaterTestResults/Containers/$users$duration

sed -i '1i astaire           astaire           astaire' $testfolder/astaire.csv
sed -i '1i cassandra           cassandra           cassandra' $testfolder/cassandra.csv
sed -i '1i chronos           chronos           chronos' $testfolder/chronos.csv
sed -i '1i bono           bono           bono' $testfolder/bono.csv
sed -i '1i ellis           ellis           ellis' $testfolder/ellis.csv
sed -i '1i homer           homer           homer' $testfolder/homer.csv
sed -i '1i homestead           homestead           homestead' $testfolder/homestead.csv
sed -i '1i homestead-prov           homestead-prov           homestead-prov' $testfolder/homestead-prov.csv
sed -i '1i ralf           ralf           ralf' $testfolder/ralf.csv
sed -i '1i sprout          sprout           sprout' $testfolder/sprout.csv
sed -i '1i sipptest          sipptest           sipptest' $testfolder/sipptest.csv
for FILE in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf sprout sipptest ; do
    gnuplot <<- EOF
        set xlabel "Time in seconds"
        set ylabel "CPU Percentage"
        set title "$FILE"
        set key autotitle columnhead
        set terminal pdf
        set format x "%8.6f"
        set output "$testfolder/${FILE}.pdf"
        plot "$testfolder/${FILE}.csv" using 0:2 with lines
EOF
done
gnuplot <<- EOF
    set xlabel "Time in seconds"
    set ylabel "CPU Percentage"
    set title "CPU Clearwater $usuarios usuarios $duracion minutos"
    set key autotitle columnhead
    set terminal pdf
    set format x "%8.6f"
    set output "$testfolder/Total.pdf"
    plot "$testfolder/sprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/bono.csv" using 0:2 with lines lt rgb "#7FFFD4", "$testfolder/astaire.csv" using 0:2 with lines lt rgb "#0000FF", "$testfolder/cassandra.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/chronos.csv" using 0:2 with lines lt rgb "#A52A2A", "$testfolder/ellis.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/homer.csv" using 0:2 with lines lt rgb "#7FFF00", "$testfolder/homestead-prov.csv" using 0:2 with lines lt rgb "#006400", "$testfolder/ralf.csv" using 0:2 with lines lt rgb "#FF1493", "$testfolder/sipptest.csv" using 0:2 with lines lt rgb "#FFD700"
EOF
