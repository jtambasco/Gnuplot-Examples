
#set datafile separator ' '
set samples 1000

set term tikz size 17cm,10cm dashed
set out 'MosfetClassAbPower.tex'

unset key

set border lw 2

# overdraw borders on left, right, top, bottom
# The repeated text writing (axis, scales, tics etc) from using multiplot over
# and over again on the same plot.
set object 1 rectangle from screen 0, screen 0 to graph 0, screen 1 behind \
  fillstyle solid noborder
set object 2 rectangle from graph 1, screen 0 to screen 1, screen 1 behind \
  fillstyle solid noborder
set object 3 rectangle from screen 0, graph 1 to screen 1, screen 1 behind \
  fillstyle solid noborder
set object 4 rectangle from screen 0, screen 0 to screen 1, graph 0 behind \
  fillstyle solid noborder

set style fill transparent solid 0.5 noborder

set title 'MOSFET $\mathrm{I_D}$ Vs Time'
set ylabel 'Drain Current [$\mu$A]'
set xlabel 'Time [ms]'

set xrange [0:4]
set xtics 0,0.5,4
set mxtics 4

set yrange [-50:450]
set mytics 4

set rmargin 5
set label 1 '\SI{60}{\micro\ampere}' at 4.02,60


set multiplot

set grid mxtics mytics lt -1 lc rgb 'gray90'
plot NaN notitle
unset grid

set grid xtics ytics lt -1 lc rgb 'gray70'
plot NaN notitle
unset grid

plot NaN notitle

Id(x) = 347*sin(2*3.14*x) + 60
ID(x) = Id(x) >= 0 ? Id(x) : 0
plot	ID(x) w filledcurves above y1=0 lc rgb 'light-blue',\
		60 w lines lt 2 lw 3 lc rgb 'gray60',\
		ID(x) w lines lt 1 lw 5 lc rgb 'navy'

plot NaN notitle

# Plot 2


unset multiplot


set out

