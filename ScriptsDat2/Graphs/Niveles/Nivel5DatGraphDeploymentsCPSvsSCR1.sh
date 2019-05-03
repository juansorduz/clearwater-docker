#!/bin/bash
nivel=${1:-120}
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
Graphfolder=~/ClearwaterTestResults/Graphs
mkdir -p $Graphfolder
cd $Graphfolder
#echo $Graphfolder

gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:110]
set boxwidth 0.9
set style line 1 lt 1 lw 1 pt 1 linecolor rgb "0x767676"
set xtics format ""
set grid ytics
set grid xtics
set key outside below
set terminal pdf
set output "${nivel}DespliegueCPSvsSCRAllKubernetesDeployments.pdf"
set xlabel "CPS"
set ylabel "SCR (%)"
plot "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 1' w l lc 1, \
     "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 1, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 2' w l lc 2, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 2, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 3' w l lc 6, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 6, \
     "~/ClearwaterTestResults/Summaries/b3urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 4' w l lc 7, \
     "~/ClearwaterTestResults/Summaries/b3urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 7, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 5' w l lc 5, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 5, \
     "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR" using 2:xtic(1) title 'Regular vIMS' w l lc 8, \
     "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 8
EOF
