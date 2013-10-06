#!/usr/bin/gnuplot

FILE = "./SystemMeasurements.csv"
set datafile separator ","

set border lw 6

set mxtics
set mytics

set grid xtics ytics mxtics mytics ls -1 ls -1 lc rgb 'gray60', lc rgb '#C0E5E5E5'

unset key

set term pdf enhanced dashed size 21.0cm,29.7cm transparent
set output 'OpenLoopMotorPlots.pdf'

set multiplot layout 3,2 title 'Motor Parameters' font ',16'

f(x) = a*x + b
fit f(x) FILE every ::::6 using 2:($3*1000) via a,b
set xlabel 'Potentiometer 2 Wiper Voltage [V]'
set ylabel 'Potentiometer 1 Wiper Voltage [mV]'
set title 'Potentiometer Wipers'
plot FILE every ::::6 using 2:($3*1000) with points ls 7 pt 7 lc rgb 'red',\
	 f(x) with lines ls 7 lc rgb 'red'

f(x) = a*x + b
fit f(x) FILE every ::::6 using ($3*1000):6 via a,b
set xlabel 'Pre-amplifier Input Voltage [mV]'
set ylabel 'Armature Voltage [V]'
set title 'Armature Voltage vs Pre-amplifier Input Voltage'
plot FILE every ::::6 using ($3*1000):6 with points pt 7 lc rgb 'red',\
	 f(x) with lines ls 7 lc rgb 'red'

f(x) = a*x + b
fit f(x) FILE every ::::6 using 1:9 via a,b
set xlabel 'Motor Speed [rpm]'
set ylabel 'Tacho-generator Voltage [V]'
set title 'Armature Voltage vs Pre-amplifier Input Voltage'
plot FILE every ::::6 using 1:9 with points ls 7 pt 7 lc rgb 'red',\
	 f(x) with lines ls 7 lc rgb 'red'

f(x) = a*x + b
fit f(x) FILE using ($3*1000):4 via a,b
g(x) = c*x + d
fit g(x) FILE every ::::6 using ($3*1000):5 via c,d
set xlabel 'Pre-amplifier Input Voltage [mV]'
set ylabel 'Pre-amplifier Differential Output Voltage [V]'
set key left
set title 'Pre-amplifier Voltage Transfer Characteristic'
plot FILE using ($3*1000):4 every ::::6 with points ls 7 pt 7 lc rgb 'orange' notitle,\
	 FILE using ($3*1000):5 every ::::6 with points ls 7 pt 7 lc rgb 'blue' notitle,\
	 f(x) with lines ls 7 lc rgb 'orange' title 'Positive Output',\
	 g(x) with lines ls 7 lc rgb 'blue' title 'Negative Output'
unset key

f(x) = a*x + b
fit f(x) FILE every ::::6 using 6:1 via a,b
set xlabel 'Armature Voltage [V]'
set ylabel 'Motor Speed [rpm]'
set title 'Tacho-Generator vs Motor Angular Speed'
plot FILE every ::::6 using 6:1 with points ls 7 lc rgb 'red',\
	 f(x) with lines ls 7 lc rgb 'red'

f(x) = a*x + b
fit f(x) FILE using ($3*1000):($4-$5) via a,b
set xlabel 'Pre-amplifier Input Voltage [mV]'
set ylabel 'Pre-amplifier Output Voltage [V]'
set title 'Pre-amplifier Voltage Transfer Characteristic'
plot FILE every ::::6 using ($3*1000):($4-$5) with points pt 7 lc rgb 'magenta',\
	 f(x) with lines ls 7 lc rgb 'magenta'

unset multiplot

set out

