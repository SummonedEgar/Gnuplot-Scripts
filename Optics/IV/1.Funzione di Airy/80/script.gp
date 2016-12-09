#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'plot.png'
set sample 1000

#stats
stats 'ch2' using 2 nooutput


#title
set title "Fit Funzione di Airy"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set format x "%.0t0"
set xlabel 't (ps)'
set ylabel 'Trasmittanza'
set xrange [1:9]
set yrange [0:1]

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

#fit
f(x) = 1/(1+(2*(A/pi)*sin(w*pi*(x-x0)))**2 )

A=80
w=1/2.5
x0=3
fit [2:7]  f(x) 'ch2' u ($1/10**11):($2/STATS_max) via A,x0,w

#plot

plot 'ch2' u ($1/10**11):($2/STATS_max) t 'CH1	' w lines ls 2 , \
	f(x) ls 1 t 'Fit'




