#!/usr/bin/gnuplot
#
# Using multiplot to include a zoomed in version into your plot
#
# AUTHOR: Hagen Wierstorf

reset

# wxt
#set terminal wxt size 350,262 enhanced font 'Verdana,10' persist
# png
set terminal pngcairo size 1600,900 enhanced font 'Verdana,10'
set output 'zoom_lag_quadra.png'

#title
set title "ADC"

# color definitions
set style line 2  lc rgb '#0025ad' lt 1 lw 3
set style line 3  lc rgb '#0042ad' lt 1 lw 3
set style line 4  lc rgb '#0060ad' lt 1 lw 3
set style line 5  lc rgb '#007cad' lt 1 lw 3
set style line 6  lc rgb '#0099ad' lt 1 lw 3
set style line 7  lc rgb '#00ada4' lt 1 lw 3
set style line 8  lc rgb '#00ad88' lt 1 lw 3
set style line 9  lc rgb '#00ad6b' lt 1 lw 3
set style line 10 lc rgb '#00ad4e' lt 1 lw 3
set style line 11 lc rgb '#00ad31' lt 1 lw 3
set style line 12 lc rgb '#00ad14' lt 1 lw 3
set style line 13 lc rgb '#09ad00' lt 1 lw 3
set style line 14 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 3 # --- green
set style line 15 lc rgb '#660000' pt 6 ps 2 lt 1 lw 3 # --- #660000


#key
unset key
set key top right


# Axes
set style line 101 lc rgb '#808080' lt 1
set border 3 back ls 101
set tics nomirror out scale 0.75
# Grid
set style line 102 lc rgb'#808080' lt 0 lw 1
set grid back ls 102

set format x "%.1t*10^%T"
set xlabel 'Tempo (s)'
set ylabel 'Vout (V)'

#set xrange [0:0.25]
#set yrange [0:9]

set multiplot

# === large plot ===
# set white rectangle as a place holder for the small plot

set object 1 rect from 0.135,0.6 to 0.005,2.7 front
set object 1 rect fc rgb '#660000' fillstyle solid 0.0 border  lw 2

set object 2 rect from 0.21,2.7 to 0.17,3.6 fc rgb '#660000' fillstyle solid 0.0 border lw 2
set arrow from 0.21,3.6 to 0.135,2.7 lc '#660000' lw 2 nohead #top left
set arrow from 0.21,2.7 to 0.135,0.6 lc '#660000' lw 2 nohead #bottom left
set arrow from 0.17,3.6 to 0.005,2.7 lc '#660000' lw 2 nohead #top right
set arrow from 0.17,2.7 to 0.005,0.6 lc '#660000' lw 2 nohead #bottom right

plot 'data' u 1:($2+2) w l ls 6 t 'ADC' , \
	''  u 3:4 w l ls 14 t 'Segnale'

# === small plot ===
set origin 0.05,0.10
set size 0.50,0.50
set xrange [0.17:0.21]
set yrange [2.7:3.6]
unset xlabel
unset ylabel
unset label
unset object 1
unset object 2
unset arrow
unset key
unset title
unset tics
#set title 'ADC ZOOM'
set key bottom right
set tics scale 0.5 front
set xtics 0.002 offset 0,0.5
set format x "%.2t"
set ytics 0.2 offset 0.5,0

set arrow from 0.1865,2.7 to 0.1865,3.6 lc '#0025ad' lw 2 nohead
set arrow from 0.2015,2.7 to 0.2015,3.6 lc '#0025ad' lw 2 nohead
set arrow from 0.1865,3.2 to 0.2015,3.2 lc '#ff25ad' lw 2 heads
set label "dt=0.015 s" at 0.190,3.23 
plot 'data' u 1:($2+2) w l ls 6 t 'ADC ZOOM'


unset multiplot
