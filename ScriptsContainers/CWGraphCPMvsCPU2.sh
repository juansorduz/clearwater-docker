gnuplot <<- EOF
set terminal png size 800,500 enhanced font "Helvetica,20"
red = "#FF0000"; green = "#00FF00"; blue = "#0000FF"; skyblue = "#87CEEB";
set yrange [0:100]
set style data histogram
set style histogram cluster errorbars gap 1
set style fill solid
set boxwidth 0.9
set xtics format ""
set grid ytics
set key outside below
set terminal pdf
set output "grafica.pdf"
plot "grafica.csv" using 2:6:xtic(1) title "Sprout_ICSCF" fill pattern 5 lc 8, \
            '' using 3:6 title "Sprout_SCSCF" fill pattern 2 lc 8, \
            '' using 4:6 title "Homestead" fill pattern 3 lc 8, \
            '' using 5:6 title "Cassandra" fill pattern 4 lc 8
EOF
