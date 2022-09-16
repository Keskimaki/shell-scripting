#!/bin/bash
echo "scale=2; ($(echo $@ | sed 's/ /+/g'))/$#" | bc
