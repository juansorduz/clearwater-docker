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
set yrange [0:2000]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set grid xtics
set key outside below
set terminal pdf
set output "${nivel}DespliegueVMCPSvsCPU.pdf"
set xlabel "CPS"
set ylabel "CPU (%) (100% = 1 Core)"
plot "~/ClearwaterTestResults/Summaries/b1urs1mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'Combination 1' lc 1, \
     "~/ClearwaterTestResults/Summaries/b2urs1mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'Combination 2' lc 2, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'Combination 3' lc 6, \
     "~/ClearwaterTestResults/Summaries/b3urs2mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'Combination 4' lc 7, \
     "~/ClearwaterTestResults/Summaries/b3urs1mscs2urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'Combination 5' lc 5, \
     "~/ClearwaterTestResults/Summaries/VM/SUMMARYVMCPU" using 18:19:xtic(1) title 'Regular vIMS' lc 8
EOF
