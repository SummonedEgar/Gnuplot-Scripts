#terminal type
set terminal pngcairo size 1600,900 enhanced font 'Verdana,15'
set output 'plot.png'
set sample 1000
#title
set title "Diagramma di Bode Filtro Butterworth"

#costant


#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11
set tics nomirror

set xlabel 'Frequenza (Hz)'
set ylabel 'Abbattimento (dB)'
set xrange [1:20000]
set log x
set yrange [-30:20]

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

#print in file
set print "valori.txt"

#fit
f(x) = a*log10(x)+b
a=-30
b=130
fit [2000:6000][-100:0] f(x) 'data.txt' u 1:2 via a,b
print "Abbattimento per decade teorico:",a

set print "valori.txt" append

fit [1500:6000][-100:0] f(x) '../data.txt' u 1:(20*log10($3/$2)) via a,b
print "Abbattimento per decade sperimentale:",a
#plot

plot 'data.txt' u 1:2 w linespoints ls 2 t 'teorico' , \
	'../data.txt' u 1:(20*log10($3/$2)):((20*log10($3/$2))*0.02) w yerrorbars ls 1 t 'Data' 


