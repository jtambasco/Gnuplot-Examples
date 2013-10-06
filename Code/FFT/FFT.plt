#!/usr/bin/env gnuplot

set term cairolatex size 15cm,10cm pdf
set output 'FFT.tex'

set datafile separator '	'
unset key

set border lw 4 back

set grid mxtics mytics xtics ytics lt 1 lc rgb 'gray70', lt 1 lc rgb 'gray90'

set mxtics
set mytics 5

set xrange [10:10e3]

set title 'Harmonic Distortion'
set xlabel 'Frequency [Hz]'
set ylabel 'Output Voltage [dB]'

set logscale x 10

plot 'FFT.dat' using ($1):(20*log10((($2**2)+($3**2))**0.5)-5.49074) with lines lw 4 lc rgb 'red'

set out

