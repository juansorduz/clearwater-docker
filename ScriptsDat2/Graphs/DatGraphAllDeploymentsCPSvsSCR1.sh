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
set yrange [0:110]
set boxwidth 0.9
set style line 1 lt 1 lw 1 pt 1 linecolor rgb "0x767676"
set xtics format ""
set grid ytics
set key outside below
set output "DespliegueCPSvsSCRAllKubernetesDeployments.png"
set xlabel "CPS"
set ylabel "SCR (%)"
set title "CPS vs SCR"
plot "$Maintestfolder/b1ur1smscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'SCR' w l lc 0
plot "$Maintestfolder/b1ur1smsc2surh1msch1/SUMMARYSCR" using 2:xtic(1) title 'SCR' w l lc 0
plot "$Maintestfolder/b1ur2smsc1surh1msch1/SUMMARYSCR" using 2:xtic(1) title 'SCR' w l lc 0
plot "$Maintestfolder/b2ur1smsc1surh1msch1/SUMMARYSCR" using 2:xtic(1) title 'SCR' w l lc 0
plot "$Maintestfolder/b2ur1smsc2surh1msch1/SUMMARYSCR" using 2:xtic(1) title 'SCR' w l lc 0
plot "$Maintestfolder/b2ur2smsc1surh1msch1/SUMMARYSCR" using 2:xtic(1) title 'SCR' w l lc 0
plot "$Maintestfolder/b3ur1smsc1surh1msch1/SUMMARYSCR" using 2:xtic(1) title 'SCR' w l lc 0
EOF
