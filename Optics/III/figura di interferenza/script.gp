#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'plot.png'

#title
set title "Figura di interferenza"

#costant
L=847
offset=4.1
d=0.3
#I0=12.264
I0=10.877

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror
set sample 10000

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
set ylabel 'Visibilità'
#set xrange [0.0001:0.01]
#set xrange [-0.01:0.01]
set yrange [0:1.2]

#fit

#f(x) = (sin(pi*d/a*sin(x))**2)/((pi*d/a*sin(x))**2)
#a=0.0006

f(x) = I0*(sin(a*sin(x))**2)/((a*sin(x))**2)
a=1570

fit [0.0001:0.008] f(x) 'data' using (($1-offset)/L):($2):(($2*0.05)) via a

#fit [-0.0001:-0.008] f(x) 'data' u (($1-offset)/L):($2/I0) via a,A

#print "Lunghezza lambda laser=",a,"mm" 

#plot

#set object 1 rect from -0.4,0.03 to 0.2,0.19 fc rgb '#660000' fillstyle solid 0.0 border  lw 2

#set label " λ  = (0.50 ± 0.09) nm" at -0.35,0.14


plot 'data' u (atan(($1-offset)/L)):($2/I0):(($2/I0)*0.05) w yerrorbars ls 1 t 'Data' , \
	f(x)/I0 t 'fit' ls 2
