#!/bin/bash
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
Graphfolder=~/ClearwaterTestResults10Mayo/Graphs

mkdir -p $Graphfolder
cd $Graphfolder
ScaleFiles=1
NumFilesCombination1=$(cat ~/ClearwaterTestResults10Mayo/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF | wc -l)
NumFilesCombination1=$(echo "$ScaleFiles/$NumFilesCombination1" | bc -l)
echo $NumFilesCombination1

gnuplot <<- EOF
set grid ytics
set grid xtics
set key outside below
set terminal pdf
set output “LATENCYCDF.pdf”
set xlabel "Latency (ms)"
set ylabel "SCR (%)"
plot '~/ClearwaterTestResults10Mayo/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF' using 1:(${NumFilesCombination1}) smooth cumul title "Combination1"
EOF

# "~/ClearwaterTestResults10Mayo/Summaries/b1urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b1ur1msc1' w l lc 1, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b1urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b1ur1msc2' w l lc 2, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b1urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b1ur2msc1' w l lc 3, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b2urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b2ur1msc1' w l lc 4, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b2urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b2ur1msc2' w l lc 5, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b2urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b2ur2msc1' w l lc 6, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b3urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b3ur1msc1' w l lc 7, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b3urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b3ur2msc1' w l lc 9, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b3urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b3ur1msc2' w l lc 10, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b4urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b4ur1msc1' w l lc 11, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b4urs2mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b4ur2msc1' w l lc 12, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b4urs1mscs2urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b4ur1msc2' w l lc 13, \
#      "~/ClearwaterTestResults10Mayo/Summaries/b5urs1mscs1urh1msch1/SUMMARYSCR" using 2:xtic(1) title 'b5ur1msc1' w l lc 14, \
#      "~/ClearwaterTestResults10Mayo/Summaries/VM/SUMMARYSCR" using 2:xtic(1) title 'VM' w l lc 8
