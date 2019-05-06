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
set output "DespliegueVMCPSvsCPUDespliegue1.pdf"
set xlabel "CPS"
set ylabel "CPU (%)"
set title "CPS vs CPU b${NumBono}urs${NumURS}mscs${NumMSCS}urh${NumURH}msch${NumMSCH}"
plot "~/ClearwaterTestResults/Kubernetes5/b1urs1mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'b1ur1msc1' lc 1, \
     "~/ClearwaterTestResults/Kubernetes5/b2urs1mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'b2ur1msc1' lc 4, \
     "~/ClearwaterTestResults/Kubernetes5/b3urs1mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'b3ur1msc1' lc 7, \
     "~/ClearwaterTestResults/Kubernetes5/b3urs2mscs1urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'b3ur2msc1' lc 10, \
     "~/ClearwaterTestResults/Kubernetes5/b3urs1mscs2urh1msch1/SUMMARYVMCPU" using 18:19:xtic(1) title 'b3ur1msc2' lc 11, \
     "~/ClearwaterTestResults/VM1/SUMMARYVMCPU" using 18:19:xtic(1) title 'VM' lc 8
EOF
