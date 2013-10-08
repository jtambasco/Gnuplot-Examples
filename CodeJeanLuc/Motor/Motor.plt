
set datafile separator ','

unset key

set term cairolatex size 20cm,25cm pdf
set out 'Motor.tex'

set style line 1 lc rgb 'red' lw 5
set style line 2 lc rgb 'gray60' lw 10
set style data lines

set border lw 3

set mxtics
set mytics

set grid xtics ytics mxtics mytics ls -1 ls -1 lc rgb 'gray60', lc rgb 'gray90'

set multiplot layout 4,2

set title 'Armature Voltage'
set xlabel 'Time [s]'
set ylabel '$v_a$ [V]'
set yrange [*:*]
plot 'q1 0.5 Va.csv' using 1:2 ls 1

set title 'Step Response ($\theta_\mathit{input}=0.5$)'
set xlabel 'Time [s]'
set ylabel '$\theta_\mathit{opot}$ [\si{.\radian/\second}]'
set yrange [-0.1:0.7]
plot 'q1 0.5 thetas.csv' using 1:2 ls 2,\
	 'q1 0.5 thetas.csv' using 1:3 ls 1

set title 'Armature Voltage'
set xlabel 'Time [s]'
set ylabel '$v_a$ [V]'
set yrange [-10:22]
plot 'q1 2.0 Va.csv' using 1:2 ls 1

set title 'Step Response ($\theta_\mathit{input}=2.0$)'
set xlabel 'Time [s]'
set ylabel '$\theta_\mathit{opot}$ [\si{.\radian/\second}]'
set yrange [-0.1:2.6]
plot 'q1 2.0 thetas.csv' using 1:2 ls 2,\
	 'q1 2.0 thetas.csv' using 1:3 ls 1
	 
set title 'Armature Voltage'
set xlabel 'Time [s]'
set ylabel '$v_a$ [V]'
set yrange [-13:23]
plot 'q1 5.0 Va.csv' using 1:2 ls 1

set title 'Step Response ($\theta_\mathit{input}=5.0$)'
set xlabel 'Time [s]'
set ylabel '$\theta_\mathit{opot}$ [\si{.\radian/\second}]'
set yrange [-0.5:6]
plot 'q1 5.0 thetas.csv' using 1:2 ls 2,\
	 'q1 5.0 thetas.csv' using 1:3 ls 1
	 
set title 'Armature Voltage'
set xlabel 'Time [s]'
set ylabel '$v_a$ [V]'
set yrange [-13:23]
plot 'q1 5.0 Va.csv' using 1:2 ls 1

set title 'Step Response ($\theta_\mathit{input}=10$)'
set xlabel 'Time [s]'
set ylabel '$\theta_\mathit{opot}$ [\si{.\radian/\second}]'
set yrange [-1:12]
plot 'q1 10.0 thetas.csv' using 1:2 ls 2,\
	 'q1 10.0 thetas.csv' using 1:3 ls 1

unset multiplot

set out

