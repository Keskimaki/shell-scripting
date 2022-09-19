#!/bin/bash
date=$(echo $1 | rev | cut -c 4-10 | rev)

day=0
for dir in $@
do
  day=$((day+1))
  max_temp=0
  min_temp=100
  for file in $(find $dir -name hp-temps.txt)
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
  echo "$day $max_temp $min_temp" >> max-min-temps.txt
done

echo "set terminal eps
set output 'min-max-temps-$date.eps'
set title 'Maximum and Minimum Temperatures'
set xrange [1:$day]
set xlabel 'Day'
set yrange [0:50]
set ylabel 'Temperature (C)'
plot 'max-min-temps.txt' using 2 with linespoints ls 1 title 'Max',\
     'max-min-temps.txt' using 3  with linespoints ls 2 title 'Min'" > max-min-temps.gnuplot

gnuplot max-min-temps.gnuplot

rm max-min-temps.txt max-min-temps.gnuplot
