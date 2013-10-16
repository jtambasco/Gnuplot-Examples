#plot HR diagram of R-I
reset

set datafile sep ','

set terminal pdfcairo font ',9'
set output 'RIHR.pdf'
set xlabel 'Colour R-I'
set ylabel 'Magnitude I'	
set yrange [4:-3]

set key left

set border lw 2
set grid lt -1 lc rgb "#bbbbbb"

set title 'H-R Diagram (R-I)'

set mxtics 2
set mytics 2

plot 'RIdata2.txt' using ($1>0.2 ? $1 : 1/0):($13<1 ? $13 : 1/0) pt 7 ps 0.3 lc rgb "red" title "Red Giants",\
	 'RIdata2.txt' u ($1<0.2 ? $1 : 1/0):($13>1 ? $13 : 1/0) pt 7 ps 0.3 lc rgb "blue" title "Main Sequence",\
	 'RIdata2.txt' u ($1>0.2 ? $1 : 1/0):($13>1 ? $13 : 1/0) pt 7 ps 0.3 lc rgb "blue" notitle,\
	 'RIdata2.txt' u ($1<0.2 ? $1 : 1/0):($13<1 ? $13 : 1/0) pt 7 ps 0.3 lc rgb "blue" notitle

