#!/bin/bash
echo "This is the first Bash session. It's PID is $$."

echo "Saving value of date: '$(date)' to variable today."
today=$(date)
echo "Value of today is now $today."

echo "Entering a new bash shell."
bash -c 'echo "This is the second Bash session. Its PID is $$. and the value of today is $today."'

echo "This is the first session again. It's PID is $$ and value of today is $today."
