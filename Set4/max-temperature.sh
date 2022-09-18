#!/bin/bash
max_temp=0
max_temp_file=""
for file in $(find lost24/monitor/2011.11.* -name hp-temps.txt)
do
  temp=$(grep PROCESSOR_ZONE $file | cut -c 32-33)
  if [ $temp -gt $max_temp ]; then
    max_temp=$temp
    max_temp_file=$file
  fi
done
echo "The maximum temperature is $max_temp C in file $max_temp_file."
