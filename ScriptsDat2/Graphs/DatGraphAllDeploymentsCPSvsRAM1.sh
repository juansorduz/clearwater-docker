#!/bin/bash
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
Graphfolder=$Maintestfolder/Graphs
mkdir -p $Graphfolder
cd $Graphfolder
#echo $Graphfolder

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
set grid xtics
set key outside below
set terminal pdf
set output "DespliegueVMCPSvsRAM.pdf"
set xlabel "CPS"
set ylabel "RAM (%)"
set title "CPS vs RAM b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}"
plot "$Maintestfolder/b1urs1mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b1ur1msc1' lc 1, \
     "$Maintestfolder/b1urs1mscs2urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b1ur1msc2' lc 2, \
     "$Maintestfolder/b1urs2mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b1ur2msc1' lc 3, \
     "$Maintestfolder/b2urs1mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b2ur1msc1' lc 4, \
     "$Maintestfolder/b2urs1mscs2urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b2ur1msc2' lc 5, \
     "$Maintestfolder/b2urs2mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b2ur2msc1' lc 6, \
     "$Maintestfolder/b3urs1mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b3ur1msc1' lc 7, \
     "$Maintestfolder/b3urs2mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b3ur2msc1' lc 9, \
     "$Maintestfolder/b3urs1mscs2urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b3ur1msc2' lc 10, \
     "$Maintestfolder/b4urs1mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b4ur1msc1' lc 11, \
     "$Maintestfolder/b4urs2mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b4ur2msc1' lc 12, \
     "$Maintestfolder/b4urs1mscs2urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b4ur1msc2' lc 13, \
     "$Maintestfolder/b5urs1mscs1urh1msch1/SUMMARYVMRAM" using 18:19:xtic(1) title 'b5ur1msc1' lc 14, \
     "~/ClearwaterTestResults/VM1/SUMMARYVMRAM" using 18:19:xtic(1) title 'VM' lc 8
EOF
