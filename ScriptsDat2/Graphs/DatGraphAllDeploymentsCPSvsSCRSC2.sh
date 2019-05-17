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
set boxwidth 0.9
set xtics format ""
set grid ytics
set grid xtics
set yrange [25:150]
set ytics ("25" 25, "50" 50, "75" 75, "100" 100, "125" 125, "150" 150, "175" 175, "200" 200)
set key outside below
set terminal pdf
set output "DespliegueCPSvsSCR2.pdf"
set xlabel "CPS"
set ylabel "SCR"
plot "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'Combination 1' w l lc 1, \
     "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 1, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'Combination 2' w l lc 2, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 2, \
     "~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'Combination 3' w l lc 3, \
     "~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 3, \
     "~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'Combination 4' w l lc 4, \
     "~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 4, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'Combination 5' w l lc 5, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 5, \
     "~/ClearwaterTestResults/Summaries/b2urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'Combination 6' w l lc 6, \
     "~/ClearwaterTestResults/Summaries/b2urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 6, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'Combination 7' w l lc 7, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 2 ps 0.5 lc 7, \
     "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR2" using 2:xtic(1) title 'vIMS' w l lc 8, \
     "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR2" using 2:xtic(1) with points notitle pt 21 ps 0.5 lc 8, \
     "~/ClearwaterTestResults/Summaries/SUMMARYSCR2" using 2:xtic(1) title 'Target' w l dt 2 lc rgb "#757575"
EOF

# "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b1ur1msc1' w l lc 1, \
#      "~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b1ur1msc2' w l lc 2, \
#      "~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b1ur2msc1' w l lc 3, \
#      "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b2ur1msc1' w l lc 4, \
#      "~/ClearwaterTestResults/Summaries/b2urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b2ur1msc2' w l lc 5, \
#      "~/ClearwaterTestResults/Summaries/b2urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b2ur2msc1' w l lc 6, \
#      "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b3ur1msc1' w l lc 7, \
#      "~/ClearwaterTestResults/Summaries/b3urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b3ur2msc1' w l lc 9, \
#      "~/ClearwaterTestResults/Summaries/b3urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b3ur1msc2' w l lc 10, \
#      "~/ClearwaterTestResults/Summaries/b4urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b4ur1msc1' w l lc 11, \
#      "~/ClearwaterTestResults/Summaries/b4urs2mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b4ur2msc1' w l lc 12, \
#      "~/ClearwaterTestResults/Summaries/b4urs1mscs2urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b4ur1msc2' w l lc 13, \
#      "~/ClearwaterTestResults/Summaries/b5urs1mscs1urh1msch1/SUMMARYSCR2" using 2:xtic(1) title 'b5ur1msc1' w l lc 14, \
#      "~/ClearwaterTestResults/Summaries/VM/SUMMARYSCR2" using 2:xtic(1) title 'VM' w l lc 8
