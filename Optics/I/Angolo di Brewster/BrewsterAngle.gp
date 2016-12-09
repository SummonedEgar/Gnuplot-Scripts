#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Angolo di Brewster"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror
set format x "%.2Pπ"

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
set xlabel 'θ'
set ylabel 'Angolo'
#set xrange [0:1]
set yrange [0:1.2]

#fit
f(x) = a*x +b 
#fit f(x) 'data' u ($1*3.1459/180*$1*3.1459/180):2 via a,b 


#plot

set boxwidth 0.13

plot 'bar' u 1:2 w boxes fillstyle solid 0.7 t 'Brewster' , \
	'data' u ($1*3.145/180):(($3-$2)/($3+$2)):((($3-$2)/($3+$2))*0.1) w yerrorbars ls 1 t 'Rσ' 
	
#plot 'data' u ($1*3.1459/180)*($1*3.1459/180):2 w lines ls 1 t 'Data' , \
	a*x+b t 'fit'
	

