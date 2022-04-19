#!/bin/bash
#Checks how many elements in common there are between two files (that must be passed as arguments to this script)

declare -a ARRAY1=(`cat $1`)
declare -a ARRAY2=(`cat $2`)

equal=0

for elem1 in "${ARRAY1[@]}"; do
    for elem2 in "${ARRAY2[@]}"; do
        if [[ $elem1 -eq $elem2 ]]; then
            let equal+=1
        fi
    done
done

if [[ $equal -gt 0 ]]; then
    echo "There are $equal elements in common between $1 and $2"
else
    echo "There are no elements in common between these files."
fi
exit 0

