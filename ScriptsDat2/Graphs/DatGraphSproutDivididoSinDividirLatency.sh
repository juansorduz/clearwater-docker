#!/bin/bash
source ~/clearwater-docker/ScriptsDat2/TrafficGenerator/TestCharacteristics
testMainfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}
testfolder=$Maintestfolder/b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}/$cps$duration
Graphfolder=~/ClearwaterTestResults/Graphs

mkdir -p $Graphfolder
cd $Graphfolder
ScaleFiles=1
NumFiles1=$(cat ~/ClearwaterTestResultsSproutDividido/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF | wc -l)
echo $NumFiles1
NumFilesCombination1=$(echo "$ScaleFiles/$NumFiles1" | bc -l)
NumFiles2=$(cat ~/ClearwaterTestResultsSproutSinDividir1/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF | wc -l)
echo $NumFiles2
NumFilesCombination2=$(echo "$ScaleFiles/$NumFiles2" | bc -l)
# NumFiles3=$(cat ~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles3
# NumFilesCombination3=$(echo "$ScaleFiles/$NumFiles3" | bc -l)
# NumFiles4=$(cat ~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles4
# NumFilesCombination4=$(echo "$ScaleFiles/$NumFiles4" | bc -l)
# NumFiles5=$(cat ~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles5
# NumFilesCombination5=$(echo "$ScaleFiles/$NumFiles5" | bc -l)
# NumFiles6=$(cat ~/ClearwaterTestResults/Summaries/VM/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles6
# NumFilesCombination6=$(echo "$ScaleFiles/$NumFiles6" | bc -l)
# NumFiles7=$(cat ~/ClearwaterTestResults/Summaries/b2urs2mscs1urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles7
# NumFilesCombination7=$(echo "$ScaleFiles/$NumFiles7" | bc -l)
# NumFiles8=$(cat ~/ClearwaterTestResults/Summaries/b2urs1mscs2urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles8
# NumFilesCombination8=$(echo "$ScaleFiles/$NumFiles8" | bc -l)
# NumFiles9=$(cat ~/ClearwaterTestResults/Summaries/b3urs2mscs1urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles9
# NumFilesCombination9=$(echo "$ScaleFiles/$NumFiles9" | bc -l)
# NumFiles10=$(cat ~/ClearwaterTestResults/Summaries/b3urs1mscs2urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles10
# NumFilesCombination10=$(echo "$ScaleFiles/$NumFiles10" | bc -l)
# NumFiles11=$(cat ~/ClearwaterTestResults/Summaries/b3urs2mscs2urh1msch1/SUMMARYLATENCYCDF | wc -l)
# echo $NumFiles11
# NumFilesCombination11=$(echo "$ScaleFiles/$NumFiles11" | bc -l)

# MinimumFiles=$NumFiles1
# #echo $NumFilesCombination2
# #NumFilesCombination2=$(echo 0$NumFilesCombination2)
# if [ "$NumFiles2" -lt "$MinimumFiles" ]
# then
#       MinimumFiles=$NumFiles2
# fi
# if [ "$NumFiles3" -lt "$MinimumFiles" ]
# then
#       MinimumFiles=$NumFiles3
# fi
# if [ "$NumFiles4" -lt "$MinimumFiles" ]
# then
#       MinimumFiles=$NumFiles4
# fi
# if [ "$NumFiles5" -lt "$MinimumFiles" ]
# then
#       MinimumFiles=$NumFiles5
# fi
# if [ "$NumFiles6" -lt "$MinimumFiles" ]
# then
#       MinimumFiles=$NumFiles6
# fi
#
# echo Numero menor de filas es $MinimumFiles

gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set boxwidth 0.9
set style line 1 lt 1 lw 1 pt 1 linecolor rgb "0x767676"
set xtics format ""
set grid ytics
set grid xtics
set yrange [0:1]
set xrange [0:150]
set ytics ("0.1" 0.1,"0.2" 0.2,"0.3" 0.3,"0.4" 0.4,"0.5" 0.5,"0.6" 0.6,"0.7" 0.7,"0.8" 0.8,"0.9" 0.9,"1" 1)
set xtics ("1" 1, "10" 10,"20" 20,"50" 50,"100" 100,"150" 150)
set key outside below
set terminal pdf
set output "LATENCYCDF.pdf"
set xlabel "Latency (ms)"
set ylabel "CDF"
plot "~/ClearwaterTestResultsSproutDividido/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination1}) smooth cumul title "Sprout Dividido" lc 1, \
     "~/ClearwaterTestResultsSproutSinDividir1/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination2}) smooth cumul title "Sprout Sin Dividir" lc 2
EOF

# plot "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination1}) smooth cumul title "Combination1" lc 1, \
#      "~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination2}) smooth cumul title "Combination2" lc 2, \
#      "~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination3}) smooth cumul title "Combination3" lc 3, \
#      "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination4}) smooth cumul title "Combination4" lc 4, \
#      "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination5}) smooth cumul title "Combination5" lc 7, \
#      "~/ClearwaterTestResults/Summaries/VM/SUMMARYLATENCYCDF" using 1:(${NumFilesCombination6}) smooth cumul title "vIMS" lc 8
# EOF

# "<(sed -n '1,${MinimumFiles}p' ~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYLATENCYCDF)" using 1:(${NumFilesCombination1}) smooth cumul title "Combination1" lc 1, \
#     "<(sed -n '1,${MinimumFiles}p' ~/ClearwaterTestResults/Summaries/b1urs2mscs1urh1msch1/SUMMARYLATENCYCDF)" using 1:(${NumFilesCombination2}) smooth cumul title "Combination2" lc 2, \
#     "<(sed -n '1,${MinimumFiles}p' ~/ClearwaterTestResults/Summaries/b1urs1mscs2urh1msch1/SUMMARYLATENCYCDF)" using 1:(${NumFilesCombination3}) smooth cumul title "Combination3" lc 3, \
#     "<(sed -n '1,${MinimumFiles}p' ~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYLATENCYCDF)" using 1:(${NumFilesCombination4}) smooth cumul title "Combination4" lc 4, \
#     "<(sed -n '1,${MinimumFiles}p' ~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYLATENCYCDF)" using 1:(${NumFilesCombination5}) smooth cumul title "Combination5" lc 7, \
#     "<(sed -n '1,${MinimumFiles}p' ~/ClearwaterTestResults/Summaries/VM/SUMMARYLATENCYCDF)" using 1:(${NumFilesCombination6}) smooth cumul title "vIMS" lc 8


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
