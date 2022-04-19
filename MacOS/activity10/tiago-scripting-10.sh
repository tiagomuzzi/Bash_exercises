#!/bin/bash
# For this to work you must pass a filename as the first argument and the number of lines you'd like to create second.
#e.g. ./tiago-scripting-10 filetest.txt 15

echo "RANDOM NUMBER GENERATOR"

MATCH=`ls | grep $1 | wc -l`

if [[ $MATCH -eq 0 ]]; then
echo "This file does not exist. Would you like to create one? (Y/N)"
read ans
    if [[ $ans = "Y" ]]; then
        `touch $1`
    else
        exit 0
    fi
fi

for i in $(seq 1 $2); do
    GENERATOR=`echo $(( $RANDOM % 12345+1 ))`
    echo $GENERATOR >> $1
done

exit 0