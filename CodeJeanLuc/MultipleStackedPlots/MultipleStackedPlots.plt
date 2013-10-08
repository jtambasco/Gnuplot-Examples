#!/usr/bin/env gnuplot

### n: change this parameter to equal the number of data sets to be plotted
n = 4
# t: top margin in pixels
t = 75.0
# b: key height in pixels (bottom margin)
b = 300.0
# h: height of output in pixels
h = 150.0*n + t + b

### define functions to help set top/bottom margins
top(i,n,h,t,b) = 1.0 - (t+(h-t-b)*(i-1)/n)/h
bot(i,n,h,t,b) = 1.0 - (t+(h-t-b)*i/n)/h

### first set up some basic plot parameters
set term pdfcairo size 20cm,20cm #enhanced
set output 'SinewavesStacked.pdf'

set title 'Sinewaves Stacked'
set ylabel 'Y Axis'

# Make yrange > ytics > function to get padding.
set ytics -1.25,0.5,1.25
set yrange [-1.5:1.5]

set xtics 0,1,10
set xrange [0:10]

set xtics
set mxtics
set mytics

set border lw 4

set format x ""
set grid xtics ytics mxtics mytics ls -1 ls -1 lc rgb 'gray60', lc rgb '#C0E5E5E5''

set multiplot layout (n+1),1

### First plot
# change only plot command here
currentplot = 1
set tmargin at screen top(currentplot,n,h,t,b)
set bmargin at screen 0.8*bot(currentplot,n,h,t,b)
unset key
plot 1.2*sin(2*3.14*100*x)*exp(-x/2)
     
### Middle plot
# copy and paste this code to make more middle plots
currentplot = currentplot + 1
set tmargin at screen 0.8*top(currentplot,n,h,t,b)
set bmargin at screen 0.8*bot(currentplot,n,h,t,b)
unset title
plot 1.2*sin(2*3.14*0.5*x)*exp(-x/2) lc rgb 'navy'

### Middle plot
# copy and paste this code to make more middle plots
currentplot = currentplot + 1
set tmargin at screen 0.8*top(currentplot,n,h,t,b)
set bmargin at screen 0.6*bot(currentplot,n,h,t,b)
unset title
plot 1.2*cos(2*3.14*0.8*x)*exp(-x/2) lc rgb 'dark-violet'

### Last plot
# change only plot command here
currentplot = currentplot + 1
set tmargin at screen 0.6*top(currentplot,n,h,t,b)
set bmargin at screen 0.2*bot(currentplot,n,h,t,b)
set format x
set xlabel 'Time [s]'
set key right
plot 1.2*cos(2*3.14*1.1*x)*exp(-x/2) lc rgb 'orange' title '1.2*cos(2*3.14*1.1*x)*e^\frac{-x}{2}'

unset multiplot

set term x11

