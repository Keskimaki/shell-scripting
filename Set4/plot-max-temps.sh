#!/bin/bash
for i in {01..30}
do
  max_temp=0
  for file in $(find lost24/monitor/2011.11.$i -name hp-temps.txt)
  do
    temp=$(grep PROCESSOR_ZONE $file | cut -c 32-33)
    if [ $temp -gt $max_temp ]; then
      max_temp=$temp
    fi
  done
  echo "$i $max_temp" >> max-temps.txt
done

echo "set terminal eps
set output 'max-temps-2011-11.eps'
set title 'November 2011 Maximum Temperatures'
set xrange [01:30]
set xlabel 'Day'
set yrange [10:40]
set ylabel 'Temperature (C)'
plot 'max-temps.txt' with linespoints ls 1" > max-temps.gnuplot

gnuplot max-temps.gnuplot

rm max-temps.txt max-temps.gnuplot
