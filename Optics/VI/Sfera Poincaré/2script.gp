#terminal type
set terminal pngcairo size 900,600 enhanced font 'Verdana,15'
set output 'plot2.png'
set sample 1000

#title
set title "Fit Parametri di Stokes"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11



set tics font "Times-Roman, 11" 
#set format x "%.0t"

set parametric
set urange [0:2*pi]
set vrange [-pi/2:pi/2]

set view equal xyz
set view 60,135

set style line 12 lc rgb '#282828' lt 0 lw 2
set grid back ls 12

#line styles
set style line 1 lc rgb '#5e9c36' pt 6 ps 2 lt 1 lw 1 pi -8# --- green
set style line 2 lc rgb '#660000' pt 7 ps 1 lt 1 lw 1 pi -8# --- red
set style line 3 lc rgb '#0022ee' pt 7 ps 1 lt 1 lw 1 # --- blue
set style line 4 lc rgb '#764c64' pt 7 ps 1 lt 1 lw 1 # --- pink
set style line 5 lc rgb '#1155ff' pt 6 ps 2 lt 1 lw 1 # --- blueish
set style line 6  lc rgb '#0099ad' lt 1 lw 3
set style line 7  lc rgb '#00ada4' lt 1 lw 3
set style line 8  lc rgb '#00ad88' lt 1 lw 3
set style line 9  lc rgb '#00ad6b' lt 1 lw 3
set style line 10 lc rgb '#00ad4e' lt 1 lw 3
set style line 11 lc rgb '#00ad31' lt 1 lw 3
set style line 12 lc rgb '#00ad14' lt 1 lw 3
set style line 13 lc rgb '#09ad00' lt 1 lw 3
set style line 15 lc rgb '#333333' pt 6 ps 2 lt 1 lw 3 # --- 

#key
set key outside right

#fit
f(x) = 0.5*arctg(x) 
plot 'data' u ($1/$2):($4-160) t 'stuff' ls 1


