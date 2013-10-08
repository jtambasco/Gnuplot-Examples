reset

set term tikz size 17cm,10cm dashed #standalone header '\usepackage{siunitx}'
set out 'MosfetClassAbPowerFixed.tex'
TSCALE = 1.0

#set terminal cairolatex dashed pdf
#set out 'MosfetClassAbPowerFixed.tex'
#TSCALE = 20.0 # use this value for e.g. pdfcairo or cairolatex

TITLE = 'MOSFET $I_D$ Vs Time'
YLABEL = 'Drain Current [\si{\micro\ampere}]'
XLABEL = 'Time [\si{\milli\second}]'

set style fill transparent solid 0.5 noborder

set xrange [0:4]
set xtics 0,0.5,4
set mxtics 4

set yrange [-50:450]
set mytics 4

set rmargin 5
LABEL = '\SI{60}{\micro\ampere}'
set label 1 LABEL at graph 1.01, first 60

unset key
set samples 1000

set multiplot

set title TITLE
set ylabel YLABEL
set xlabel XLABEL
unset border
set tics scale 0,0.001
set grid mxtics mytics lt -1 lc rgb 'gray90'
plot NaN
unset grid

# keep the current margins for all following plots
set lmargin at screen TSCALE*GPVAL_TERM_XMIN/(1.0*GPVAL_TERM_XSIZE)
set rmargin at screen TSCALE*GPVAL_TERM_XMAX/(1.0*GPVAL_TERM_XSIZE)
set tmargin at screen TSCALE*GPVAL_TERM_YMAX/(1.0*GPVAL_TERM_YSIZE)
set bmargin at screen TSCALE*GPVAL_TERM_YMIN/(1.0*GPVAL_TERM_YSIZE)

# unset almost everything
unset border
unset label
unset xlabel
unset ylabel
set format x ''
set format y ''
unset title

set grid xtics ytics lt -1 lc rgb 'gray70'
plot NaN
unset grid

Id(x) = 347*sin(2*3.14*x) + 60
ID(x) = Id(x) >= 0 ? Id(x) : 0
plot    ID(x) w filledcurves above y1=0 lc rgb 'light-blue',\
        60 w lines lt 2 lw 3 lc rgb 'gray60',\
        ID(x) w lines lt 1 lw 5 lc rgb 'navy'

# overdraw borders on left, right, top, bottom
set object 1 rectangle from screen 0, screen 0 to graph 0, screen 1 back \
  fillstyle solid noborder
set object 2 rectangle from graph 1, screen 0 to screen 1, screen 1 back \
  fillstyle solid noborder
set object 3 rectangle from screen 0, graph 1 to screen 1, screen 1 back \
  fillstyle solid noborder
set object 4 rectangle from screen 0, screen 0 to screen 1, graph 0 back \
  fillstyle solid noborder
plot NaN
unset object 1
unset object 2
unset object 3
unset object 4

set title TITLE
set ylabel YLABEL
set xlabel XLABEL
set label 1 LABEL at graph 1.01, first 60
set format x
set format y
set tics scale 1,0.5 front
set border
set border lw 3
plot NaN

unset multiplot
set out

