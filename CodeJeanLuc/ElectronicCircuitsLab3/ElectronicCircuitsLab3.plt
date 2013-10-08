
set datafile separator '	'

set term pdfcairo size 15cm,10cm
set out 'ElectronicCircuitsLab3.pdf'

# overdraw borders on left, right, top, bottom
set object 1 rectangle from screen 0, screen 0 to graph 0, screen 1 behind lw 0
set object 2 rectangle from graph 1, screen 0 to screen 1, screen 1 behind lw 0
set object 3 rectangle from screen 0, graph 1 to screen 1, screen 1 behind lw 0
set object 4 rectangle from screen 0, screen 0 to screen 1, graph 0 behind lw 0

unset key

set border lw 3

set title 'PNP Voltage Gain'
set ylabel 'Output Voltage [V]'
set xlabel 'Input Voltage [V]'

set xrange [-7:-1]
set xtics -7,0.5,-1
set mxtics 2

set yrange [-5.5:0]
set mytics 2

set multiplot

set grid mxtics mytics lt -1 lc rgb 'gray90'
plot NaN notitle
unset grid
set grid xtics ytics lt -1 lc rgb 'gray70'
plot NaN notitle
unset grid
plot 'ElectronicCircuitsLab3.dat' u 2:3 w linespoints lw 5 pt 7 ps 3.75 lc rgb 'red'
plot NaN notitle

unset multiplot

set out

