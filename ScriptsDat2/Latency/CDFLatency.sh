#!/bin/bash
# source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
# testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
# testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
# Graphfolder=$Maintestfolder/Graphs
# mkdir -p $Graphfolder
# cd $Graphfolder
#echo $Graphfolder

gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:1]
set boxwidth 0.9
set style line 1 lt 1 lw 1 pt 1 linecolor rgb "0x767676"
set xtics format ""
set grid ytics
set key outside below
set output "DespliegueCPSvsSCRb1urs1mscs1urh1msch1.png"
set xlabel "CPS"
set ylabel "SCR (%)"
set title "CPS vs SCR b1urs1mscs1urh1msch1"
plot "~/ClearwaterTestResults7/resultsb1ur1msc1.txt" using 1:xtic(2) title 'SCR' w l ls 1
EOF
