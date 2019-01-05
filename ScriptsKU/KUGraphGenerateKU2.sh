#!/bin/bash
users="$1"
duration="$2"
testfolder=~/ClearwaterTestResults/Kubernetes2/$users$duration

sed -i '1i astaire           astaire           astaire' $testfolder/astaire_astaire.csv
sed -i '1i cassandra           cassandra           cassandra' $testfolder/cassandra_cassandra.csv
sed -i '1i chronos           chronos           chronos' $testfolder/chronos_chronos.csv
sed -i '1i bono           bono           bono' $testfolder/bono_bono.csv
#sed -i '1i ellis           ellis           ellis' $testfolder/ellis.csv
sed -i '1i homer           homer           homer' $testfolder/homer_homer.csv
sed -i '1i homestead           homestead           homestead' $testfolder/homestead_homestead.csv
sed -i '1i homestead-prov           homestead-prov           homestead-prov' $testfolder/homestead-prov_homestead-prov.csv
sed -i '1i ralf           ralf           ralf' $testfolder/ralf_ralf.csv
sed -i '1i icscf_icscf          icscf_icscf           icscf_icscf' $testfolder/icscf_icscf.csv
sed -i '1i scscf_scscf          scscf_scscf           scscf_scscf' $testfolder/scscf_scscf.csv
sed -i '1i sipptest          sipptest_sipptest          sipptest' $testfolder/sipptest_sipptest.csv
#for FILE in astaire cassandra chronos bono ellis homer homestead homestead-prov ralf s_p_r_o_u_t_3 sprout sipptest ; do
for FILE in astaire_astaire cassandra_cassandra chronos_chronos bono_bono homer_homer homestead_homestead ralf_ralf icscf_icscf scscf_scscf sipptest_sipptest; do
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
    plot "$testfolder/scscf_scscf.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/icscf_icscf.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/cassandra_cassandra.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/sipptest_sipptest.csv" using 0:2 with lines lt rgb "#FFD700", "$testfolder/homestead_homestead.csv" using 0:2 with lines lt rgb "#006400"
EOF
# plot "$testfolder/s_p_r_o_u_t_3.csv" using 0:2 with lines lt rgb "#00FFF0", "$testfolder/sprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/bono_bono.csv" using 0:2 with lines lt rgb "#7FFFD4", "$testfolder/astaire_astaire_astaire.csv" using 0:2 with lines lt rgb "#0000FF", "$testfolder/cassandra.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/chronos_chronos.csv" using 0:2 with lines lt rgb "#A52A2A", "$testfolder/ellis.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/homer_homer.csv" using 0:2 with lines lt rgb "#7FFF00", "$testfolder/homestead-prov_homestead-prov.csv" using 0:2 with lines lt rgb "#006400", "$testfolder/ralf_ralf.csv" using 0:2 with lines lt rgb "#FF1493", "$testfolder/sipptest.csv" using 0:2 with lines lt rgb "#FFD700"
#plot "$testfolder/s_p_r_o_u_t_3.csv" using 0:2 with lines lt rgb "#5F9EA0", "$testfolder/sprout.csv" using 0:2 with lines lt rgb "#00FFFF", "$testfolder/bono_bono.csv" using 0:2 with lines lt rgb "#7FFFD4", "$testfolder/astaire_astaire.csv" using 0:2 with lines lt rgb "#0000FF", "$testfolder/cassandra_cassandra.csv" using 0:2 with lines lt rgb "#8A2BE2", "$testfolder/chronos_chronos.csv" using 0:2 with lines lt rgb "#A52A2A", "$testfolder/homer_homer.csv" using 0:2 with lines lt rgb "#7FFF00", "$testfolder/ralf_ralf.csv" using 0:2 with lines lt rgb "#FF1493", "$testfolder/sipptest.csv" using 0:2 with lines lt rgb "#FFD700", "$testfolder/homestead.csv" using 0:2 with lines lt rgb "#006400"
