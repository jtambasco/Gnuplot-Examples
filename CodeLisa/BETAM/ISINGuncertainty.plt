#Plot beta vs. magnetisation with fill between lines
#data: "BETAMJL.txt" magnetisation, "BETAEJL.txt" energy
reset
set terminal pdfcairo solid size 6,2.62 enhanced color font 'Helvetica,12' lw 1
set output "BETA2.pdf"
#set style data lines
set style fill transparent solid 0.5 noborder
set title "Magnetisation vs. Beta"
set offset 0.05,0.05,0.05,0.0
set ylabel "Absolute Magnetisation per Site"
set y2label "Energy per Site"
set yrange [0:1.5]
set y2range [-2:0]
set xlabel "Beta"
set grid xtics ytics mxtics mytics lc rgb "#bbbbbb" lw 1 lt 0
set xtics auto
set ytics auto nomirror
set y2tics
set mxtics 5
set mytics 4

plot "BETAM.txt" u 1:3:4 w filledcu lc rgb "purple" notitle axes x1y1, \
      '' u 1:3 lt -1 lc rgb "purple" notitle axes x1y1, '' u 1:4 lt -1 lc rgb "purple" notitle axes x1y1, "BETAM.txt" using 1:2 with lines lc rgb "purple" title "Magnetisation" axes x1y1,"BETAE.txt" u 1:3:4 w filledcu lc rgb "blue" notitle axes x1y2, \
      '' u 1:3 lt -1 lc rgb "blue" notitle axes x1y2, '' u 1:4 lt -1 lc rgb "blue" notitle axes x1y2, "BETAE.txt" using 1:2 with lines lc rgb "blue" title "Energy" axes x1y2
