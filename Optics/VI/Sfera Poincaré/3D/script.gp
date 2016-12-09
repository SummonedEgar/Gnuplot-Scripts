
set sample 1000

#title
set title "Parametri di Stokes"

#background and axis
set style line 11 lc rgb '#282828' lt 1
set border 3 back ls 11

set pm3d #depthorder hidden3d 1
set style fill transparent solid 0.55
set pm3d explicit 

set palette rgb 9,9,3
unset colorbox
set ticslevel 0
set xtics 0.5
set ytics 0.5
set ztics 0.5
set tics font "Times-Roman, 11" 
set isosamples 25
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

# Parametric functions for the sphere
fx(v,u) = r*cos(v)*cos(u)
fy(v,u) = r*cos(v)*sin(u)
fz(v)   = r*sin(v)

r=1
#splot
set origin 0,0

set label 'S3' at 0.2,0.1,1.3 tc ls 15  front
set label 'S1' at 1.3,0,0.1 tc ls 15  front
set label 'S2' at 0,1.1,0 tc ls 15  front

set arrow from 0,0,-1 to 0,0,1 lc '#FFCC00' lw 2 head front
set arrow from -1,0,0 to 1,0,0 lc '#FFCC00' lw 2 head front
set arrow from 0,-1,0 to 0,1,0 lc '#FFCC00' lw 2 head front

unset hidden3d

splot  fx(v,u),fy(v,u),fz(v) notitle w pm3d ls 1, \
	fx(v,u),fy(v,u),fz(v) notitle ls 1, \
	'1' u 1:2:3 t 'Glucosio' w p ls 2 , \
	'2' u 1:2:3 t 'Fruttosio' w p ls 3 
	 
#terminal type
set terminal pngcairo size 900,600 enhanced font 'Verdana,15'
set output 'plot.png'
replot
