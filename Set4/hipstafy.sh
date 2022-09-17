#!/bin/bash
for image in $(find $1/*.jpg)
do
  inputfile=$image
  prefix=${inputfile%.jpg}
  outputfile=$prefix-hipstah.jpg
  convert -sepia-tone 60% +polaroid $inputfile $outputfile
done
