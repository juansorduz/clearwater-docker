#!/bin/bash
cps="$1"
duration="$2"
testfolder=~/ClearwaterTestResults/Kubernetes3/$cps$duration

sed -i '1i astaire           astaire           astaire' $testfolder/astaire.csv
sed -i '1i urcassandra           urcassandra           urcassandra' $testfolder/urcassandra.csv
sed -i '1i msccassandra           msccassandra           msccassandra' $testfolder/msccassandra.csv
sed -i '1i chronos           chronos           chronos' $testfolder/chronos.csv
sed -i '1i bono           bono           bono' $testfolder/bono.csv
#sed -i '1i ellis           ellis           ellis' $testfolder/ellis.csv
sed -i '1i homer           homer           homer' $testfolder/homer.csv
sed -i '1i urhomestead           urhomestead           urhomestead' $testfolder/urhomestead.csv
sed -i '1i mschomestead           mschomestead           mschomestead' $testfolder/mschomestead.csv
#sed -i '1i homestead-prov           homestead-prov           homestead-prov' $testfolder/homestead-prov.csv
sed -i '1i ralf           ralf           ralf' $testfolder/ralf.csv
sed -i '1i ursprout          ursprout           ursprout' $testfolder/ursprout.csv
sed -i '1i mscsprout          mscsprout           mscsprout' $testfolder/mscsprout.csv
sed -i '1i sipptest          sipptest           sipptest' $testfolder/sipptest.csv
#for FILE in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf s_p_r_o_u_t_3 sprout sipptest ; do
for FILE in astaire urcassandra msccassandra chronos bono homer urhomestead mschomestead ralf ursprout mscsprout sipptest; do
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
    plot "$testfolder/mscsprout.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/ursprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/urcassandra.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/msccassandra.csv" using 0:2 with lines lt rgb "#FED700", "$testfolder/urhomestead.csv" using 0:2 with lines lt rgb "#8B2BE5", "$testfolder/mschomestead.csv" using 0:2 with lines lt rgb "#FFD705", "$testfolder/bono.csv" using 0:2 with lines lt rgb "#006400"
EOF

gnuplot <<- EOF
    set xlabel "Time in seconds"
    set ylabel "CPU Percentage"
    set title "CPU Clearwater $usuarios usuarios $duracion minutos"
    set key autotitle columnhead
    set terminal pdf
    set format x "%8.6f"
    set output "$testfolder/Sprouts.pdf"
    plot "$testfolder/mscsprout.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/ursprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/bono.csv" using 0:2 with lines lt rgb "#8A2BE2"
EOF

gnuplot <<- EOF
    set xlabel "Time in seconds"
    set ylabel "CPU Percentage"
    set title "CPU Clearwater $usuarios usuarios $duracion minutos"
    set key autotitle columnhead
    set terminal pdf
    set format x "%8.6f"
    set output "$testfolder/Homesteads.pdf"
    plot "$testfolder/mschomestead.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/urhomestead.csv" using 0:2 with lines lt rgb "#00FFFF"
EOF

gnuplot <<- EOF
    set xlabel "Time in seconds"
    set ylabel "CPU Percentage"
    set title "CPU Clearwater $usuarios usuarios $duracion minutos"
    set key autotitle columnhead
    set terminal pdf
    set format x "%8.6f"
    set output "$testfolder/Cassandras.pdf"
    plot "$testfolder/msccassandra.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/urcassandra.csv" using 0:2 with lines lt rgb "#00FFFF"
EOF
# plot "$testfolder/s_p_r_o_u_t_3.csv" using 0:2 with lines lt rgb "#00FFF0", "$testfolder/sprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/bono.csv" using 0:2 with lines lt rgb "#7FFFD4", "$testfolder/astaire.csv" using 0:2 with lines lt rgb "#0000FF", "$testfolder/cassandra.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/chronos.csv" using 0:2 with lines lt rgb "#A52A2A", "$testfolder/ellis.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/homer.csv" using 0:2 with lines lt rgb "#7FFF00", "$testfolder/homestead-prov.csv" using 0:2 with lines lt rgb "#006400", "$testfolder/ralf.csv" using 0:2 with lines lt rgb "#FF1493", "$testfolder/sipptest.csv" using 0:2 with lines lt rgb "#FFD700"
#plot "$testfolder/s_p_r_o_u_t_3.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/sprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/bono.csv" using 0:2 with lines lt rgb "#7FFFD4", "$testfolder/astaire.csv" using 0:2 with lines lt rgb "#0000FF", "$testfolder/cassandra.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/chronos.csv" using 0:2 with lines lt rgb "#A52A2A", "$testfolder/homer.csv" using 0:2 with lines lt rgb "#7FFF00", "$testfolder/ralf.csv" using 0:2 with lines lt rgb "#FF1493", "$testfolder/sipptest.csv" using 0:2 with lines lt rgb "#FFD700", "$testfolder/homestead.csv" using 0:2 with lines lt rgb "#006400"
