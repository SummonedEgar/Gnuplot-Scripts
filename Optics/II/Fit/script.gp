#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'nice_web_plot.png'

#title
set title "Michelson's Interferometer"

#costant
c=30

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
set xlabel 'τ (ns)'
set ylabel 'Visibility'
#set xrange [0:100]
set yrange [0:1]

#fit

f(x) = A*abs(cos(w*(x+b)))*exp(-abs(s*(x+b)/2))
s=2
w=3
deL=0.35

fit f(x) 'data' u ($1/c-deL):($2-$3)/($2+$3) via s,w,b,A
	
L=pi*c/w
tau=2/s
print "Lunghezza=",L 
#plot

set object 1 rect from -0.4,0.03 to 0.2,0.19 fc rgb '#660000' fillstyle solid 0.0 border  lw 2
set label "   σ= (0.50 ± 0.09) ns⁻¹" at -0.35,0.14
set label "Δω= (2.65 ± 0.05) ns⁻¹" at -0.35,0.10
#set label " τc= (3.97 ± 0.72) ns" at -0.35,0.10


plot 'data' u ($1/c-deL):($2-$3)/($2+$3):(($2-$3)/($2+$3)*0.05) w yerrorbars ls 1 t 'Data' , \
	f(x) ls 2 

#lunghezza di coerenza
#n
#sigma
#delta omega su 2pi

print "Tempo di coerenza=",tau
