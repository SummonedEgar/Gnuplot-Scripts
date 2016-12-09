#! /bin/bash

gnuplot <<EOF

#terminal type
set terminal pngcairo size 1600, 900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Onda Triangolare Z80"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror out

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 3 # --- green
set style line 2 lc rgb '#660000' pt 6 ps 2 lt 1 lw 3 # --- red
set style line 3 lc rgb '#0022ee' pt 6 ps 2 lt 1 lw 3 # --- blue
set style line 4 lc rgb '#764c64' pt 6 ps 2 lt 1 lw 3 # --- pink
set style line 5 lc rgb '#1155ff' pt 6 ps 2 lt 1 lw 3 # --- blueish

#key
set key top right

#x axis
#set log x
set format x "%.1t*10^%T"
set xtics font ", 10"

#labels
set xlabel 'Tempo (s)'
set ylabel 'Vout (V)'
#set xrange [0:20]
set yrange [-1:6]

#fit
#f(x) = a*x +b
#fit f(x) 'retta calibr' u 1:2 via a,b 

#plot
#plot 'data' u 1:2 w l ls 2 t 'data'

#multiplot
set multiplot layout 1,2 rowsfirst

  # GRAPH 1
set title "Onda Triangolare"
set label 1 '' at graph 0.92,0.9 font ',8' 
plot 'DATA' u 1:2 w lines ls 1 t 'CH1'

  # GRAPH 2
set title "Onda Triangolare Periodo Diverso (Input 9)"
set label 1 '' at graph 0.92,0.9 font ',10'
plot 'DATA2' u 1:2 w lines ls 1 t 'CH1'


EOF

