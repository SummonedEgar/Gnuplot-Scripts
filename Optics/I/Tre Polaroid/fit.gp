#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Malus' Law"

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

#labels
set xlabel 'Theta'
set ylabel 'I'
#set xrange [0:100]
#set yrange [0:15]

#fit
f(x) = a*sin(2*x+b)*sin(2*x+b)
fit f(x) 'data' u ($1*3.14/180):2 via a,b 
#fit f(x) 'data' u ($1*3.1459/180*$1*3.1459/180):2 via a,b 


#plot

plot 'data' u ($1*3.14/180):2:(0.1) w yerrorbars ls 1 t 'Data' , \
	a*sin(2*x+b)*sin(2*x+b) t 'fit' ls 5
