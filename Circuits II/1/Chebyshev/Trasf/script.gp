#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'plot.png'

#title
set title "Funzione di Trasferimento Filtro Chebyshev"

#costant

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set xlabel 'ω/ωc'
set ylabel '|T(jω)|'
set xrange [0:6]
#set log x
#set yrange [0:1]

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 3 pi -8# --- green
set style line 2 lc rgb '#660000' pt 6 ps 2 lt 1 lw 3 pi -8# --- red
set style line 3 lc rgb '#0022ee' pt 6 ps 2 lt 1 lw 3 # --- blue
set style line 4 lc rgb '#764c64' pt 6 ps 2 lt 1 lw 3 # --- pink
set style line 5 lc rgb '#1155ff' pt 6 ps 2 lt 1 lw 3 # --- blueish

#key
set key top right

#plot

plot 'data.txt' u ($1/1000):2 w linespoints ls 2 t 'teorico' , \
	'../data.txt' u ($1/1000):($3/$2):($3/$2*0.02) w yerrorbars ls 1 t 'Data'

