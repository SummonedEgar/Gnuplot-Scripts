#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Fit Lineare"

#costant
L=847

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror
set sample 1000

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
set xlabel 'm/b (mm⁻¹)'
set ylabel 'rad'
#set xrange [0:100]
#set yrange [0:1]

#fit

f(x) = a*x
fit f(x) 'datasx' u 2:1 via a

set print "valori.txt"
print "Lambda laser massimi sx=",a*10**6,"nm" 

g(x) = b*x
fit g(x) 'datadx' u 2:1 via b

print "Lambda laser massimi dx=",b*10**6,"nm" 

#plot

set object 1 rect from -0.4,0.03 to 0.2,0.19 fc rgb '#660000' fillstyle solid 0.0 border  lw 2

set label " λ  = (0.50 ± 0.09) nm" at -0.35,0.14


plot 'datasx' u 2:1:($1*0.02+0.0001) w yerrorbars ls 2 t 'Data sx' , \
	f(x) ls 3 t 'fit lambda sinistra', \
	'datadx' u 2:1:($1*0.02+0.0001) w yerrorbars ls 1 t 'Data dx' , \
	g(x) ls 4 t 'fit lambda destra' 
