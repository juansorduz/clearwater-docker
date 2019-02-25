#!/bin/bash
cd ~/ClearwaterTestResults/Kubernetes2/
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
set xlabel "CPM"
set ylabel "CPU"
set title "CPM vs CPU Deployment Kubernetes 2"
plot "~/ClearwaterTestResults/Kubernetes2/FinalResultCPU" using 2:3:xtic(1) title "URSprout" fill pattern 5 lc 8, \
            '' using 4:5 title "MSCSprout" fill pattern 2 lc 8, \
            '' using 6:7 title "Homestead" fill pattern 2 lc 8, \
            '' using 8:9 title "Cassandra" fill pattern 5 lc 8
EOF
