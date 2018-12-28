#!/bin/bash

users="$1"
duration="$2"
testfolder=~/ClearwaterTestResults/VM/$users$duration

sed -i '1i vellum           vellum           vellum' $testfolder/Vellum.csv
sed -i '1i homer           homer           homer' $testfolder/Homer.csv
sed -i '1i bono           bono           bono' $testfolder/Bono.csv
sed -i '1i ellis           ellis           ellis' $testfolder/Ellis.csv
sed -i '1i dime           dime           dime' $testfolder/Dime.csv
#sed -i '1i dime-prov           dime-prov           dime-prov' $testfolder/dime-prov.csv
sed -i '1i sprout          sprout           sprout' $testfolder/Sprout.csv
#for FILE in astaire vellum homer bono ellis homer dime dime-prov ralf sprout sipptest ; do
for FILE in Vellum Homer Bono Dime Sprout Ellis ; do
    gnuplot <<- EOF
        set xlabel "Time in seconds"
        set ylabel "CPU Percentage"
        set title "$FILE"
        set key autotitle columnhead
        set terminal pdf
        set format x "%8.6f"
        set output "$testfolder/${FILE}.pdf"
        plot "$testfolder/${FILE}.csv" using 0:3 with lines
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
    plot "$testfolder/Sprout.csv" using 0:3 with lines lt rgb "#00FFFF", "$testfolder/Bono.csv" using 0:3 with lines lt rgb "#7FFFD4", "$testfolder/Vellum.csv" using 0:3 with lines lt rgb "#8A2BE2", "$testfolder/Homer.csv" using 0:3 with lines lt rgb "#7FFF00", "$testfolder/Ellis.csv" using 0:3 with lines lt rgb "#FFD700", "$testfolder/Dime.csv" using 0:3 with lines lt rgb "#006400"
EOF
#plot "$testfolder/sprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/bono.csv" using 0:2 with lines lt rgb "#7FFFD4", "$testfolder/astaire.csv" using 0:2 with lines lt rgb "#0000FF", "$testfolder/vellum.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/homer.csv" using 0:2 with lines lt rgb "#A52A2A", "$testfolder/ellis.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/homer.csv" using 0:2 with lines lt rgb "#7FFF00", "$testfolder/dime-prov.csv" using 0:2 with lines lt rgb "#006400", "$testfolder/ralf.csv" using 0:2 with lines lt rgb "#FF1493", "$testfolder/sipptest.csv" using 0:2 with lines lt rgb "#FFD700"
