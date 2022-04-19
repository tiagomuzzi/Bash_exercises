#!/bin/bash

for i in {1..5}; do
        echo "Choose a number ($i)"
	read NUM
	declare N_$i=$NUM
	INDEX=N_$i

	if [[ ${!INDEX} =~  ^[0-9]*$ ]]; then
		continue;
        else
                echo "Not a number."
		exit 1;
        fi
done

echo "$N_1 $N_2 $N_3 $N_4 $N_5"


for i in {6..10}; do
	echo "Choose another number, or press S to stop and go to the next step."
	read NUM
	declare N_$i=$NUM
	INDEX=N_$i

	if [[ ${!INDEX} =~  ^[0-9]*$ ]]; then
		continue;
	elif [[ ${!INDEX} = 'S' ]]; then
		
		break
        else
                echo "Not a number."
		exit 1;
        fi
done

declare -a PICKS=($N_1 $N_2 $N_3 $N_4 $N_5 $N_6 $N_7 $N_8 $N_9 $N_10)

delete='S'
PICKS=( "${PICKS[@]/$delete}"  )

#Sum, product, min and max of array

SUM=0
PRODUCT=1
MIN=9999999999999999
MAX=0

for pick in ${PICKS[*]};do
	let SUM+=$pick;
	let PRODUCT*=$pick;
	if [[ $pick -lt $MIN ]]; then
			MIN=$pick
	fi
	if [[ $pick -gt $MAX ]]; then
		MAX=$pick
	fi
done

#Average of Array

AVG=`expr $SUM / $(echo ${#PICKS[@]})`

echo "The numbers you have entered are:`echo ${PICKS[*]}`"
echo "The product of the numbers is: `echo $PRODUCT`"
echo "The Sum of the numbers is: `echo $SUM`"
echo "The smallest number is: `echo $MIN`"
echo "The largest number is: `echo $MAX`"
echo "The average of all numbers is: `echo $AVG`"

exit 0