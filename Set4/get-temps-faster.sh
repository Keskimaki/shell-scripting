#!/bin/bash
if [ $# -lt 1 ]
then
 echo "Give the directory as argument."
 exit 1
fi

max_temp=0
min_temp=100

for temp in $(find $1 -name hp-temps.txt -exec grep PROCESSOR_ZONE {} \+ | cut -c 77-78 | sed -e s/C//g)
do
  if [ $temp -gt $max_temp ]
  then
    max_temp=$temp
    echo "NEW MAX: $max_temp"
  elif [ $temp -lt $min_temp ]
  then
    min_temp=$temp
    echo "NEW MIN: $min_temp"
  fi
done

echo "
Maximum temperature is $max_temp C.
Minimum temperature is $min_temp C."
