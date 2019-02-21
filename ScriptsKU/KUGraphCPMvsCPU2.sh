#!/bin/bash
cd /home/gabriel/ClearwaterTestResults/Kubernetes2/
gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:100]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "DespliegueKU2CPMvsCPU.pdf"
plot "/home/gabriel/ClearwaterTestResults/Kubernetes2/FinalResultCPU" using 2:3:xtic(1) title "Sprout" fill pattern 5 lc 8, \
            '' using 4:5 title "Homestead" fill pattern 2 lc 8, \
            '' using 6:7 title "Cassandra" fill pattern 5 lc 8
EOF
