#!/bin/bash
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
set output "DespliegueCPSvsSCR.pdf"
set xlabel "CPS"
set ylabel "SCR (%)"
plot "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 1' w l lc 1, \
     "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 1, \
     "~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 2' w l lc 2, \
     "~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 2, \
     "~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 3' w l lc 3, \
     "~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 3, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 4' w l lc 4, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 4, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'Combination 5' w l lc 7, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 7, \
     "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR" using 2:xtic(1) title 'Regular vIMS' w l lc 8, \
     "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR" using 2:xtic(1) with points notitle pt 21 ps 0.5 lc 8
EOF

# "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b1ur1msc1' w l lc 1, \
#      "~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b1ur1msc2' w l lc 2, \
#      "~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b1ur2msc1' w l lc 3, \
#      "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b2ur1msc1' w l lc 4, \
#      "~/ClearwaterTestResults/Summaries/b2urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b2ur1msc2' w l lc 5, \
#      "~/ClearwaterTestResults/Summaries/b2urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b2ur2msc1' w l lc 6, \
#      "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b3ur1msc1' w l lc 7, \
#      "~/ClearwaterTestResults/Summaries/b3urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b3ur2msc1' w l lc 9, \
#      "~/ClearwaterTestResults/Summaries/b3urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b3ur1msc2' w l lc 10, \
#      "~/ClearwaterTestResults/Summaries/b4urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b4ur1msc1' w l lc 11, \
#      "~/ClearwaterTestResults/Summaries/b4urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b4ur2msc1' w l lc 12, \
#      "~/ClearwaterTestResults/Summaries/b4urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b4ur1msc2' w l lc 13, \
#      "~/ClearwaterTestResults/Summaries/b5urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b5ur1msc1' w l lc 14, \
#      "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR" using 2:xtic(1) title 'VM' w l lc 8
