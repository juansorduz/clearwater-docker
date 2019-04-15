#!/bin/bash
cd ~/ClearwaterTestResults/Kubernetes3/
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
set output "DespliegueKU3CPMvsCPU.pdf"
set xlabel "CPM"
set ylabel "CPU"
set title "CPM vs CPU Deployment Kubernetes 3"
plot "~/ClearwaterTestResults/Summaries/SUMMARYCPU" using 2:3:xtic(1) title "Astaire" fill pattern 1 lc 8, \
            '' using 4:5 title "Urcassandra" fill pattern 2 lc 8, \
            '' using 6:7 title "Msccassandra" fill pattern 3 lc 8, \
            '' using 8:9 title "Chronos" fill pattern 4 lc 8, \
            '' using 10:11 title "Bono" fill pattern 5 lc 8, \
            '' using 12:13 title "Ellis" fill pattern 6 lc 8, \
            '' using 14:15 title "Homestead-Prov" fill pattern 7 lc 8, \
            '' using 16:17 title "Homer" fill pattern 8 lc 8, \
            '' using 18:19 title "Urhomestead" fill pattern 9 lc 8, \
            '' using 20:21 title "Mschomestead" fill pattern 10 lc 8, \
            '' using 22:23 title "Ralf" fill pattern 11 lc 8, \
            '' using 24:25 title "Ursprout" fill pattern 12 lc 8, \
            '' using 26:27 title "Mscsprout" fill pattern 13 lc 8, \
            '' using 28:29 title "Sipptest" fill pattern 14 lc 8
EOF
