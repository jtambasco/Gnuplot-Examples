
set datafile separator '	'

set term pdfcairo enhanced size 21cm,14.8cm dashed
set output 'OutputResistanceQ2.pdf'

set mxtics
set mytics

set border lw 4
set grid xtics ytics mxtics mytics ls -1 ls -1 lc rgb 'gray60', lc rgb '#C0E5E5E5'

unset key

set title 'Output Current vs Collector-Emitter Voltage'
set xlabel 'I_C [mA]'
set ylabel 'V_{CE} [V]'

f(x) = a*x + b
fit f(x) 'OutputResistanceQ2.dat' using 1:2 via a,b
plot 'OutputResistanceQ2.dat' using 1:2 with points pt 7 lc rgb 'navy',\
	 f(x) lc rgb 'navy'


