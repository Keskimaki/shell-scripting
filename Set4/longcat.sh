#!/bin/bash
is_int='^[0-9]+$'
if ! [[ $1 =~ $is_int ]]; then
   echo "error: Not a number" >&2; exit 1
fi

file=shortcat.txt

head -n 9 $file

for ((i=1;i<=$1;i++))
do
  echo "  |       |"
done

tail -n 6 $file
