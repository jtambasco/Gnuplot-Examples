#!/usr/bin/env ruby

############################################################
############################################################
# This script generates the commands to generate major
# and minor tics that do not have the numbers marked
# at either end of the axis.
# 
# This is useful when plotting stacked graphs in multi-
# plot mode as the final number on the axis is not dis-
# played ensuring that no numbers overlap.
############################################################
############################################################

############################################################
############################################################
# Minimum range on the axis.
MIN = 0
# Maximum range on the axis.
MAX = 20
# Major ticks step size.
STEP = 5
# Number of minor ticks between to adjacent major ticks.
mFREQ = 1
# Scale result by factor.
SCALE = 1;
#
# MIN, MAX, STEP and mFREQ must all be integers.  In or-
# to get decimal values, set SCALE to scale the results
# to decimal ones at the end.
#
############################################################
############################################################


############################################################
############################################################
mSTEP = STEP.to_f / (mFREQ+1).to_f

majorTicks = (MIN..MAX).step(STEP).to_a

minorTicks = []
step = MIN
((MAX-MIN)/STEP).times do
	step += mSTEP
	(mFREQ).times do |i|
		minorTicks << step.round(2)
		step += mSTEP
	end
end

majorTicks.map! { |item| item*SCALE }
minorTicks.map! { |item| item*SCALE }

puts "set yrange [#{MIN*SCALE}:#{MAX*SCALE}]"

print "set ytics (\"\" #{majorTicks[0]}"
mFREQ.times do
	print ', '
	print minorTicks.shift
	print ' 1'
end

majorTicks[1...-1].each do |num|
	print ', '
	print num
	mFREQ.times do
		print ', '
		print minorTicks.shift
		print ' 1'
	end
end

print ", \"\" #{majorTicks[0]})"
############################################################
############################################################

