#!/bin/bash
mkdir -p ~/ClearwaterTestResults/Kubernetes4/Graphs
cd ~/ClearwaterTestResults/Kubernetes4/Graphs
gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:0.8]
set boxwidth 0.9
set style line 1 lt 1 lw 1 pt 1 linecolor rgb "0x767676"
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "DespliegueKU4MainCPSvsSINGLELATENCY.pdf"
set xlabel "CPS"
set ylabel "LATENCY (ms)"
set title "CPS vs SINGLELATENCY Deployment Kubernetes"
plot "~/ClearwaterTestResults/Kubernetes4/SUMMARYSINGLELATENCY" using 2:xtic(1) title 'Latency' w l ls 1
EOF
