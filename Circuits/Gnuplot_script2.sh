#! /bin/bash

gnuplot <<EOF

#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Studio transconduttanza gm"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 3 # --- green
set style line 2 lc rgb '#660000' pt 6 ps 2 lt 1 lw 3 # --- red

#key
set key bottom right

#plot
plot 'Data2.dat' u 1:(1/\$2):(1/\$2*0.3) t 'Misura da fc' w yerrorbars ls 1 , \\
       '' u 1:(1/\$2) t ' ' w lines ls 1, \\
       '' u 1:(1/\$3):(1/\$3*0.3) t 'Misura da Av' w yerrorbars ls 2, \\
       '' u 1:(1/\$3) t ' ' w lines ls 2, \\
       x*0.04 t 'Retta teorica' lw 3

EOF
