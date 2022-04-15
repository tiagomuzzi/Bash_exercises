#!/bin/bash
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