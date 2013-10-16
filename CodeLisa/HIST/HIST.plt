#Plot momenta of neutrinos in histogram
#data "NEUTMOM.txt"
reset
set terminal pdfcairo size 3.5,2.62 enhanced color font 'Helvetica,14' lw 2
n=30 #number of intervals
max=200 #max value
min=0. #min value
width=(max-min)/n #interval width
#function used to map a value to the intervals
hist(x,width)=width*floor(x/width)+width/2.0
set output "NEUTMOMK.pdf"
set xrange [min:max]
set yrange [0:]
set title "Histogram of Energy of Neutrinos (Kaons)"
set offset 0.05,0.05,0.05,0.0
set xtics min,(max-min)/5,max
set boxwidth width*0.9
set style fill solid 0.5
set tics out nomirror
set xlabel "Energy of Neutrinos (GeV)"
set ylabel "Frequency"
plot "NEUTMOM.txt" u (hist($1,width)):(1.0) smooth freq w boxes lc rgb "red" notitle
