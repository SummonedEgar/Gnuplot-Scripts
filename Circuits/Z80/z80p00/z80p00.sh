#! /bin/bash

gnuplot <<EOF

#terminal type
set terminal pngcairo size 3508, 2480 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
#set title "Porta NOT"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

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
set xtics font ", 20"

#labels
set xlabel 'tempo (s)'
set ylabel 'Vout (V)'
#set xrange [0:100]
set yrange [-1:10]

#fit
#f(x) = a*x +b
#fit f(x) 'data.dat' u 6:5 via a,b 

#plot

#plot 'M1' u 1:2 w lines ls 1 t 'CH1'

#multiplot
set multiplot layout 3,2 rowsfirst

  # GRAPH 1
set title "M1"
set label 1 '' at graph 0.92,0.9 font ',8' 
plot 'M1' u 1:(\$2+4) w lines ls 1 t 'M1', \\
	'' u 3:4 w lines ls 2 t 'CPU Clock'

  # GRAPH 2
set title "MREQ"
set label 1 '' at graph 0.92,0.9 font ',8'
plot 'MREQ' u 1:(\$2+4) w lines ls 1 t 'Memory Request', \\
	'' u 3:4 w lines ls 2 t 'M1'
  
  # GRAPH 3
set title "RD"
set label 1 '' at graph 0.92,0.9 font ',8'
plot 'RD' u 1:(\$2+4) w lines ls 1 t 'Read', \\
	'' u 3:4 w lines ls 2 t 'M1'

  # GRAPH 4
set title "D0"
set label 1 '' at graph 0.92,0.9 font ',8'
plot 'D0' u 1:(\$2+4) w lines ls 1 t 'Dato meno significativo', \\
	'' u 3:4 w lines ls 2 t 'M1'

  # GRAPH 5
set title "A0"
set label 1 '' at graph 0.92,0.9 font ',8'
plot 'A0' u 1:(\$2+4) w lines ls 1 t 'Dato più significativo', \\
	'' u 3:4 w lines ls 2 t 'M1'

  # GRAPH 6
set title "RFSH"
set label 1 '' at graph 0.92,0.9 font ',8'
plot 'RFSH' u 1:(\$2+4) w lines ls 1 t 'Refresh', \\
	'' u 3:4 w lines ls 2 t 'M1'

EOF

