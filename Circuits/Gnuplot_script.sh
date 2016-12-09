#! /bin/bash

gnuplot <<EOF

#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Filtro Attivo Passa-Banda"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 3 # --- green
set style line 2 lc rgb '#660000' pt 6 ps 2 lt 1 lw 3 # --- red
set style line 3 lc rgb '#4c6f76' pt 6 ps 2 lt 1 lw 3 # --- blue
set style line 4 lc rgb '#764c64' pt 6 ps 2 lt 1 lw 3 # --- pink

#key
set key top right


#x axis
set logscale x
#set format x "%t.1*10^%T"

#labels
set xlabel 'Frequenza (Hz)'
set ylabel 'H(Vout/Vin)'
set xrange [1000:3000]
set yrange [0:3]

#plot
set multiplot
plot 'DATA2.dat' u 1:(\$4/\$2):(sqrt((0.20*\$5/\$2)*(0.20*\$5/\$2)+(0.20*\$3/\$2/\$2)*(0.20*\$3/\$2/\$2))) t 'R4=680KOmhm' w yerrorbars ls 2 , \\
      '' u 1:(\$4/\$2) notitle w lines ls 2, \\
      'DATA.dat' u 1:(\$4/\$2):(sqrt((0.20*\$5/\$2)*(0.20*\$5/\$2)+(0.20*\$3/\$2/\$2)*(0.20*\$3/\$2/\$2))) t 'R4 Scollegata' w yerrorbars ls 1 , \\
      '' u 1:(\$4/\$2) notitle w lines ls 1, \\
      'risonanze' u (\$1):(0.85) w impulse ls 3 t 'w1 w2', \\
      'risonanze' u (\$2):(0.85) w impulse ls 3 notitle, \\
      'risonanze' u (\$3):(2.0) w impulse ls 4 t 'w1 w2' ,  \\
      'risonanze' u (\$4):(2.0) w impulse ls 4 notitle, \\



EOF

