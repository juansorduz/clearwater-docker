#!/bin/bash
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
Graphfolder=~/ClearwaterTestResults/Graphs
mkdir -p $Graphfolder
cd $Graphfolder
gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:30]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "DespliegueKU4MainDOCKERCPSvsRAM.pdf"
set xlabel "CPS"
set ylabel "RAM (%)"
plot "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYDOCKERRAM" \
              using 10:11:xtic(1) title "Bono" fill pattern 1 lc 8, \
              '' using 24:25:xtic(1) title "Ursprout" fill pattern 2 lc 8, \
              '' using 18:19:xtic(1) title "Urhomestead" fill pattern 3 lc 8, \
              '' using 4:5:xtic(1) title "Urcassandra" fill pattern 4 lc 8, \
              '' using 26:27:xtic(1) title "Mscsprout" fill pattern 5 lc 8, \
              '' using 20:21:xtic(1) title "Mschomestead" fill pattern 6 lc 8, \
              '' using 6:7:xtic(1) title "Msccassandra" fill pattern 7 lc 8
EOF
