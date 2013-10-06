#!/usr/bin/env gnuplot

set t pdfcairo size 15cm,15cm
set out 'test.pdf'

set mxtics
set mytics
set grid mxtics mytics xtics ytics ls -1 ls -1 lc rgb 'gray75', lc rgb '#80e6e6e6'

set border lw 3

unset key

set multiplot

set tmargin at screen 0.9
set bmargin at screen 0.6
set lmargin at screen 0.1
set rmargin at screen 0.9

plot sin(x)*1.2**(-x)


####################
set yrange [-5:5]
set ytics ("" -5, -4.6 1, -4.2 1, -3.8 1, -3.4 1, -3, -2.6 1, -2.2 1, -1.8 1, -1.4 1, -1, -0.6 1, -0.2 1, 0.2 1, 0.6 1, 1, 1.4 1, 1.8 1, 2.2 1, 2.6 1, 3, 3.4 1, 3.8 1, 4.2 1, 4.6 1, "" -5)

set format x

set tmargin at screen 0.3
set bmargin at screen 0.1
set lmargin at screen 0.1
set rmargin at screen 0.45

plot sin(x)*1.2**(-x) lc rgb 'dark-violet'

set format x ""

set tmargin at screen 0.5
set bmargin at screen 0.3
set lmargin at screen 0.1
set rmargin at screen 0.45

plot sin(x)*1.2**(-x) lc rgb 'forest-green'
####################

####################
set yrange [-5:5]
set ytics ("" -5, -4.6 1, -4.2 1, -3.8 1, -3.4 1, -3, -2.6 1, -2.2 1, -1.8 1, -1.4 1, -1, -0.6 1, -0.2 1, 0.2 1, 0.6 1, 1, 1.4 1, 1.8 1, 2.2 1, 2.6 1, 3, 3.4 1, 3.8 1, 4.2 1, 4.6 1, "" -5)

set format x

set tmargin at screen 0.3
set bmargin at screen 0.1
set lmargin at screen 0.55
set rmargin at screen 0.9
set key under right
plot sin(x)*1.2**(-x) lc rgb 'blue' title 'The graph'

set format x ""

set tmargin at screen 0.5
set bmargin at screen 0.3
set lmargin at screen 0.55
set rmargin at screen 0.9
set key under left
plot sin(x)*1.2**(-x) lc rgb 'orange' title 'A graph'
####################

unset multiplot

set t x11

