#!/bin/bash
cd ~/ClearwaterTestResults/Containers2/
gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:20]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "Despliegue2CPMvsRAM.pdf"
set xlabel "CPM"
set ylabel "RAM"
set title "CPM vs CPU Deployment Contenedores 2"
plot "~/ClearwaterTestResults/Containers2/FinalResultRAM" using 2:3:xtic(1) title "Sprout_ICSCF" fill pattern 5 lc 8, \
            '' using 4:5 title "Sprout_SCSCF" fill pattern 2 lc 8, \
            '' using 6:7 title "Homestead" fill pattern 5 lc 8, \
            '' using 8:9 title "Cassandra" fill pattern 4 lc 8
EOF
