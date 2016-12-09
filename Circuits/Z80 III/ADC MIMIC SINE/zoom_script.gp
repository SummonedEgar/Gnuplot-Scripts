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
set output 'zoom_plot.png'

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

set xrange [0:0.25]
set yrange [0:9]

set multiplot

# === large plot ===
# set white rectangle as a place holder for the small plot

set object 1 rect from 0.127,0.5 to 0.025,4.5 front
set object 1 rect fc rgb '#660000' fillstyle solid 0.0 border  lw 2

set object 2 rect from 0.21,1.9 to 0.17,2.7 fc rgb '#660000' fillstyle solid 0.0 border lw 2
set arrow from 0.21,1.9 to 0.127,0.5 lc '#660000' lw 2 nohead
set arrow from 0.21,2.7 to 0.127,4.5 lc '#660000' lw 2 nohead
set arrow from 0.17,1.9 to 0.025,0.5 lc '#660000' lw 2 nohead
set arrow from 0.17,2.7 to 0.025,4.5 lc '#660000' lw 2 nohead

plot 'data' u 1:($2*20+3) w l ls 6 t 'Segnale' , \
	''  u 3:4 w l ls 14 t 'ADC'

# === small plot ===
set origin 0.12,0.10
set size 0.40,0.40
set xrange [0.17:0.21]
set yrange [1.90:2.7]
unset xlabel
unset ylabel
unset label
unset object 1
unset object 2
unset arrow
unset key
unset title
set title 'ADC ZOOM'
set key bottom right
set tics scale 0.5 front
set xtics offset 0,0.5
set format x "%.1t"
set ytics 0.2 offset 0.5,0

plot 'data' u 3:4 w l ls 14 t 'ADC ZOOM'

unset multiplot
