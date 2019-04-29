#!/bin/bash
mkdir -p ~/ClearwaterTestResults/Kubernetes4/Graphs
cd ~/ClearwaterTestResults/Kubernetes4/Graphs
gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:1500]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "DespliegueKU4VMCPSvsCPU.pdf"
set xlabel "CPS"
set ylabel "CPU (%)"
set title "CPS vs CPU Deployment Kubernetes 4"
plot "~/ClearwaterTestResults/Kubernetes4/SUMMARYVMCPU" \
            using 2:3:xtic(1) title "VM1" fill pattern 1 lc 8, \
            '' using 4:5:xtic(1) title "VM2" fill pattern 2 lc 8, \
            '' using 6:7:xtic(1) title "VM3" fill pattern 3 lc 8, \
            '' using 8:9:xtic(1) title "VM4" fill pattern 4 lc 8, \
            '' using 10:11:xtic(1) title "VM5" fill pattern 5 lc 8, \
            '' using 12:13:xtic(1) title "VM6" fill pattern 6 lc 8, \
            '' using 14:15:xtic(1) title "VM7" fill pattern 7 lc 8, \
            '' using 16:17:xtic(1) title "VM8" fill pattern 8 lc 8
EOF
