#!/bin/bash
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
Graphfolder=$Maintestfolder/Graphs
mkdir -p $Graphfolder
cd $Graphfolder
gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:500]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key outside below
set output "DespliegueVMCPSvsCPUb${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}.png"
set xlabel "CPS"
set ylabel "CPU (%)"
set title "CPS vs CPU b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}"
plot "$testMainfolder/SUMMARYVMCPU" \
            using 18:19:xtic(1) title "VMTotal" fill pattern 7 lc 8
EOF
