#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Studio Funzione di Autocorrelazione"

#costant
c=30

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 2 # --- green
set style line 2 lc rgb '#660000' pt 6 ps 2 lt 1 lw 4 # --- red
set style line 3 lc rgb '#0022ee' pt 6 ps 2 lt 1 lw 1 # --- blue
set style line 4 lc rgb '#764c64' pt 6 ps 2 lt 1 lw 1 # --- pink
set style line 5 lc rgb '#1155ff' pt 6 ps 2 lt 1 lw 1 # --- blueish

#key
set key top right

#labels
set xlabel 'τ (ns)'
set ylabel 'Visibility'
set xrange [-5:10]
set yrange [0:1]

#fit


g(x) = exp(-abs(s*x/2))/N*abs(sin(N*w*x/2)/sin(w*x/2))
s=2
w=3
N=1
	
#plot
set multiplot 
set sample 1000

plot g(x) ls 1 t 'N=1'
N=3 
replot g(x) ls 3 t 'N=3'
N=4
replot g(x) ls 4 t 'N=4'
N=2
replot g(x) ls 2 t 'N=2' 
