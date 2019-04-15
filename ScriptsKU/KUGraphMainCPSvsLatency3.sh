#!/bin/bash
cd ~/ClearwaterTestResults/Kubernetes3/
gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:30]
set boxwidth 0.9
set style line 1 lt 1 lw 1 pt 1 linecolor rgb "0x767676"
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "DespliegueKU3MainCPSvsLATENCY.pdf"
set xlabel "CPS"
set ylabel "LATENCY (ms)"
set title "CPS vs LATENCY Deployment Kubernetes 3"
plot "~/ClearwaterTestResults/Summaries/SUMMARYLATENCY" using 2:xtic(1) title 'Latency' w l ls 1
EOF
