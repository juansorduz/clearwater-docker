#!/bin/bash
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
Graphfolder=$Maintestfolder/Graphs
mkdir -p $Graphfolder
cd $Graphfolder
#echo $Graphfolder

gnuplot <<- EOF
set terminal png size 800 lc 8,500 enhanced font "Helvetica lc 8,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:500]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "DespliegueVMCPSvsRAM.pdf"
set xlabel "CPS"
set ylabel "RAM (%)"
set title "CPS vs RAM b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}"
plot "$Maintestfolder/b1urs1mscs2urh1msch1/SUMMARYCMRAM" using 18:19:xtic(1) title 'b1ur1msc2' fill patter 1 lc 8, \
     "$Maintestfolder/b1urs2mscs1urh1msch1/SUMMARYCMRAM" using 18:19:xtic(1) title 'b1ur2msc1' fill patter 2 lc 8, \
     "$Maintestfolder/b2urs1mscs1urh1msch1/SUMMARYCMRAM" using 18:19:xtic(1) title 'b2ur1msc1' fill patter 3 lc 8, \
     "$Maintestfolder/b2urs1mscs2urh1msch1/SUMMARYCMRAM" using 18:19:xtic(1) title 'b2ur1msc2' fill patter 4 lc 8, \
     "$Maintestfolder/b2urs2mscs1urh1msch1/SUMMARYCMRAM" using 18:19:xtic(1) title 'b2ur2msc1' fill patter 5 lc 8, \
     "$Maintestfolder/b3urs1mscs1urh1msch1/SUMMARYCMRAM" using 18:19:xtic(1) title 'b3ur1msc1' fill patter 6 lc 8
EOF
