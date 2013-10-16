reset

set terminal cairolatex pdf dashed color size 17cm,10cm
set output 'TotalControl.tex'

TITLE = 'MOSFET $I_D$ Vs Time'
YLABEL = 'Drain Current (in \si{\uA})'
XLABEL = 'Time (in \si{\ms})'

set style fill transparent solid 0.5 noborder

set xrange [0:4]
set xtics 0,0.5,4
set mxtics 4
set yrange [-50:450]
set mytics 4

RMARGIN=0.92
LMARGIN=0.1
set rmargin at screen RMARGIN
set lmargin at screen LMARGIN
set tmargin at screen 0.91
set bmargin at screen 0.11

unset key
set samples 1000

set multiplot

# first plot the minor grid lines
unset border
set tics scale 0,0.001 format ''
set grid mxtics mytics lt -1 lc rgb 'gray90'
plot NaN

# now plot the major grid lines
unset grid
set grid xtics ytics lt -1 lc rgb 'gray70'
plot NaN
unset grid

# plot the actual curve
# overdraw borders on left and right
set object rectangle from graph -0.005, graph 0 to screen LMARGIN, graph 1 front \
  fillstyle solid noborder
set object rectangle from screen RMARGIN, graph 0 to graph 1.005, graph 1 front \
  fillstyle solid noborder
Id(x) = 347*sin(2*3.14*x) + 60
ID(x) = Id(x) >= 0 ? Id(x) : 0
plot    ID(x) w filledcurves above y1=0 lc rgb 'light-blue',\
        60 w lines lt 2 lw 3 lc rgb 'gray60',\
        ID(x) w lines lt 1 lw 5 lc rgb 'navy'

unset object
# plot all tics and labels
LABEL = '\SI{60}{\uA}'
set label 1 LABEL at graph 1.01, first 60 front
set title TITLE
set ylabel YLABEL
set xlabel XLABEL
set tics scale 1,0.5 format
set border
set border lw 2

plot NaN

unset multiplot
set out

