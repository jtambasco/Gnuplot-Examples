#!/usr/bin/env gnuplot

set term cairolatex size 15cm,15cm pdf
set output 'MaxMinVoltages.tex'

set datafile separator '	'
unset key

set border lw 4 back

set grid mxtics mytics xtics ytics lt 1 lc rgb 'gray70', lt 1 lc rgb 'gray90'

set mxtics 5
set mytics 5

set xlabel 'Time [ms]'

set multiplot layout 2,1

set title 'Maximum And Minimum Output Voltage'
set ylabel 'Output Voltage [V]'
plot 'MaxMinOutputVoltage.dat' using (1000*$1):($2) with lines lw 4 lc rgb 'red'


set title 'Drain-Source Voltage Of $Q1$ For A Swept Input'
set xlabel '$v_\mathit{in}$ (Swept) [V]'
set ylabel 'Drain-Source Voltage Of $Q1$ [V]'
set xtics 0,1,10
set mxtics 5
set mytics 5
set xrange [0:10]
set yrange [0:3]
set label 3 '(3.56,0.4)' front at (3.56),(398.844e-3) point pt 7 ps 0.5 lc rgb 'blue' offset 0.7,0.7
set arrow from 3.56,0 to 3.56,3 nohead lc rgb 'light-blue' lw 1.5
plot	'DCsweepSaturationTriode.dat' using ($1):($2) with lines lw 4 lc rgb 'blue',\
		0.4 with lines lc rgb 'light-blue' lw 1.5

unset multiplot

set out

