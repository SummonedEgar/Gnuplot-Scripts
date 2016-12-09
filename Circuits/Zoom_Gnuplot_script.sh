#! /bin/bash

gnuplot <<EOF

#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Seconda Armonica Onda Quadra"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 9 ps 1 lt 1 lw 3 # --- green
set style line 2 lc rgb '#660000' pt 6 ps 1 lt 1 lw 3 # --- red
set style line 3 lc rgb '#4c6f76' pt 6 ps 1 lt 1 lw 3 # --- blue
set style line 4 lc rgb '#764c64' pt 6 ps 1 lt 1 lw 3 # --- pink

#key
set key opaque top rmargin 

#x axis
#set logscale x
set format x "10^%S"
set format y "10^%S"

#labels
set xlabel 'Tempo (s)'
set ylabel 'Voltaggio (V)'
set xrange [0:0.0025]
set yrange [-0.5:0.5]

#plot
plot 'oscilloscopio.dat' u 1:2 t 'Vin Onda Quadra' w lines ls 2 , \\
     '' u 3:4 t 'Seconda Armonica' w l ls 1

EOF
