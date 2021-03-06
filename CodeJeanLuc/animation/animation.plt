reset

SCALE = 50.0
do for [i = 0.0:199.0] {

set output sprintf('./animation/animate%1.0f.pdf',i)

set samples 1000

set term pdfcairo size 15cm,10cm dashed enhanced font 'serif'

unset key

set border lw 2

# overdraw borders on left, right, top, bottom
# The repeated text writing (axis, scales, tics etc) from using multiplot over
# and over again on the same plot.
#set object 1 rectangle from screen 0, screen 0 to graph 0, screen 1 behind \
  fillstyle solid noborder
#set object 2 rectangle from graph 1, screen 0 to screen 1, screen 1 behind \
  fillstyle solid noborder
#set object 3 rectangle from screen 0, graph 1 to screen 1, screen 1 behind \
  fillstyle solid noborder
#set object 4 rectangle from screen 0, screen 0 to screen 1, graph 0 behind \
  fillstyle solid noborder

set style fill transparent solid 0.5 noborder

set xrange [0:4]
set xtics 0,0.5,4
set mxtics 4
set mytics 4

set grid xtics ytics mxtics mytics lt -1 lc rgb 'gray70', lt -1 lc rgb 'gray90'

PI = 3.14159265359
Vds(x) = sin(2*PI*x) + 1
Vdsanim(x) = ((x < i/SCALE) ? Vds(x) : 1/0)

Id(x) = 347*sin(2*3.14*x) + 60
ID(x) = (Id(x) >= 0 ? Id(x) : 0)
IDanim(x) = ((x < i/SCALE) ? ID(x) : 1/0)

set multiplot title 'MOSFET V_{GS} Relation To I_D'

#################################################################
# Plot 1
#################################################################

set format x ''
set tmargin at screen 0.9
set bmargin at screen 0.5
set lmargin at screen 0.1
set rmargin at screen 0.94
set label 1 '1.0V' at 4.02,1
set yrange [-0.1:2.1]
set ylabel 'Gate-Source Voltage [V]'

set label 2 '' front at (i/SCALE),(Vds(i/SCALE)) point pt 7 ps 0.5 lc rgb 'red'
plot	1 w lines lt 2 lw 3 lc rgb 'gray60',\
		Vdsanim(x) w lines lt 1 lw 3 lc rgb 'red'
unset label 2

#################################################################
#################################################################

#################################################################
# Plot 2
#################################################################

set format x
set tmargin at screen 0.5
set bmargin at screen 0.1
set lmargin at screen 0.1
set rmargin at screen 0.94
set label 1 '60uA' at 4.02,60
set yrange [-50:450]
set xlabel 'Time [ms]'
set ylabel 'Drain Current [uA]'

set label 3 '' front at (i/SCALE),(ID(i/SCALE)) point pt 7 ps 0.5 lc rgb 'navy'
plot	IDanim(x) w filledcurves above y1=0 lc rgb 'light-blue',\
		60 w lines lt 2 lw 3 lc rgb 'gray60',\
		IDanim(x) w lines lt 1 lw 3 lc rgb 'navy'
unset label 3

unset xlabel

#################################################################
#################################################################

unset multiplot
}

set out

