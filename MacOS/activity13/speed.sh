#!/bin/bash

tmpfile=`mktemp`

for i in {1..1000}; do  command time $tmpfile -f "%K" ./tiago-scripting-13 1>/dev/null; done;

awk 'NR == 1 {min = $0} $0 > max {max = $0} {total += $0} END {print total/NR, min, max}' $tmpfile

rm $tmpfile
