#!/bin/bash
min=0
max=0
both=0
ascii=0

while getopts ":cwbah" opt
do
    case $opt in
        c)  min=1
            continue
            ;;
        w)  max=1   
            continue        
            ;;
        b)  both=1
            continue
            ;;
        a)  ascii=1
	        continue
            ;;
        h)  echo "-- HELP --
-c: minimum temperatures
-w: maximum temperatures
-b: both minimum and maximum temperatures
-a: ASCII output
-h: help"
            exit 0
            ;;
        *)  echo "Usage: $0 [-cwbah] <file>"
            $0 -h
            exit 1
            ;;
    esac
done

if [ $# -lt 2 ]
then
    echo "Usage: $0 [-cwbah] <file>"
    $0 -h
    exit 1
fi

date=$(echo $3 | rev | cut -c 4-10 | rev)

day=0
for dir in $@
do
  day=$((day+1))
  max_temp=0
  min_temp=100
  for file in $(find $dir -name hp-temps.txt 2>/dev/null)
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

  if [ $both == 1 ]
  then
    echo "$day $max_temp $min_temp" >> max-min-temps.txt
  elif [ $min == 1 ]
  then
    echo "$day $min_temp" >> max-min-temps.txt
  elif [ $max == 1 ]
  then
    echo "$day $max_temp" >> max-min-temps.txt
  fi
done

if [ $ascii == 1 ]
then
  echo "set terminal dumb" > max-min-temps.gnuplot
else
  echo $date
  echo 'min-max-temps-$date.eps'
  echo "set terminal eps
  set output 'min-max-temps-$date.eps'" > max-min-temps.gnuplot
fi

echo "set title 'Maximum and Minimum Temperatures'
set xrange [1:$day]
set xlabel 'Day'
set yrange [0:50]
set ylabel 'Temperature (C)'
plot 'max-min-temps.txt' using 2 with linespoints ls 1,\
     'max-min-temps.txt' using 3  with linespoints ls 2" >> max-min-temps.gnuplot

gnuplot max-min-temps.gnuplot 2>/dev/null

rm max-min-temps.txt max-min-temps.gnuplot
