#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'plot.png'

#title
set title "Timer 555 Multivibratore Astabile"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set format x "%.1t*10^%T"
set xlabel 't (s)'
set ylabel 'Vout (V)'
set xrange [0.0005:0.0024]

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 3 pi -8# --- green
set style line 2 lc rgb '#660000' pt 6 ps 2 lt 1 lw 3 pi -8# --- red
set style line 3 lc rgb '#0022ee' pt 6 ps 2 lt 1 lw 3 # --- blue
set style line 4 lc rgb '#764c64' pt 6 ps 2 lt 1 lw 3 # --- pink
set style line 5 lc rgb '#1155ff' pt 6 ps 2 lt 1 lw 3 # --- blueish
set style line 6  lc rgb '#0099ad' lt 1 lw 3
set style line 7  lc rgb '#00ada4' lt 1 lw 3
set style line 8  lc rgb '#00ad88' lt 1 lw 3
set style line 9  lc rgb '#00ad6b' lt 1 lw 3
set style line 10 lc rgb '#00ad4e' lt 1 lw 3
set style line 11 lc rgb '#00ad31' lt 1 lw 3
set style line 12 lc rgb '#00ad14' lt 1 lw 3
set style line 13 lc rgb '#09ad00' lt 1 lw 3
set style line 15 lc rgb '#660000' pt 6 ps 2 lt 1 lw 3 # --- #660000

#key
set key top right

#plot

#Data
set arrow from 0.00067,8.5 to 0.00137,8.5 lc '#660000' lw 2 heads 
set label "dt=714 μs" at 0.001,8.7 
set arrow from 0.00138,6.9 to 0.001621,6.9 lc '#660000' lw 2 heads 
set label "dt=241 μs" at 0.00145,7.1 
#Pspice
set arrow from 0.00067,3 to 0.001445,3 lc '#660000' lw 2 heads 
set label "dt=775 μs" at 0.00103,3.2 
set arrow from 0.001446,2 to 0.001711,2 lc '#660000' lw 2 heads 
set label "dt=267 μs" at 0.0015,2.2 

plot '555_1.txt' u 1:($2+6) t 'Data' w lines ls 2, \
	'555_1_5V.txt' u ($1+0.000248):2 t 'Simulazione' w  lines ls 3



