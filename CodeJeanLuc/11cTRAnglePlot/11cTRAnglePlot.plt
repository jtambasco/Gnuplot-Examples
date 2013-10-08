#!/usr/bin/env gnuplot

set term cairolatex size 15cm,15cm pdf
set output '11cTRAngle.tex'

set datafile separator '	'
set key top right

set border lw 6 back

set grid mxtics mytics xtics ytics lt 1 lc rgb 'gray70', lt 1 lc rgb 'gray90'

set xrange [0:90]
set yrange [0:0.02]
set y2range [-20:-18]

set xtics 0,15,90
set mxtics 3
set ytics
set mytics 5

set ytics nomirror 
set y2tics -20,0.5,-18
set my2tics 2

set xlabel 'Angle [degrees]'

set multiplot layout 2,1

set title 'Angle vs Transmission Coefficient (At Five Skin Depths)'
set ylabel 'Transmission Coefficient Magnitude'
set y2label 'Transmission Coefficient Phase'
plot	'11cTRAngle.dat' using ($1):($2) with linespoints pt 7 ps 0.5 lw 1 lc rgb 'blue' title 'Magnitude',\
		'11cTRAngle.dat' using ($1):($3) with linespoints pt 7 lw 1 ps 0.5 lc rgb 'red' axes x1y2 title 'Phase'


set title 'Angle vs Reflection Coefficient (At Five Skin Depths)'
set ylabel 'Reflection Coefficient Magnitude'
set y2label 'Reflection Coefficient Phase'
set key right center
set yrange [0.98:1]
set mytics 4
set y2tics -179,0.25,180
set my2tics 2
set y2range [179:180]
plot	'11cTRAngle.dat' using ($1):($4) with linespoints pt 7 ps 0.5 lw 1 lc rgb 'blue' title 'Magnitude',\
		'11cTRAngle.dat' using ($1):($5) with linespoints pt 7 lw 1 ps 0.5 lc rgb 'red' axes x1y2 title 'Phase'


unset multiplot

set out

