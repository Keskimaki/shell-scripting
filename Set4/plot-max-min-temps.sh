#!/bin/bash
for i in {01..30}
do
  max_temp=0
  min_temp=100
  for file in $(find lost24/monitor/2011.11.$i -name hp-temps.txt)
  do
    temp=$(grep PROCESSOR_ZONE $file | cut -c 32-33)
    if [ $temp -gt $max_temp ]
    then
      max_temp=$temp
    elif [ $temp -lt $min_temp ]
    then
      min_temp=$temp
    fi
  done
  echo "$i $max_temp $min_temp" >> max-min-temps.txt
done

echo "set terminal eps
set output 'min-max-temps-2011-11.eps'
set title 'November 2011 Maximum and Minimum Temperatures'
set xrange [01:30]
set xlabel 'Day'
set yrange [10:30]
set ylabel 'Temperature (C)'
plot 'max-min-temps.txt' using 2 with linespoints ls 1 title 'Max',\
     'max-min-temps.txt' using 3  with linespoints ls 2 title 'Min'" > max-min-temps.gnuplot

gnuplot max-min-temps.gnuplot

rm max-min-temps.txt max-min-temps.gnuplot
