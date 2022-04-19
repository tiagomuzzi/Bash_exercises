#!/bin/bash
#Checks user input agains the lottery result

#Ask user for their numbers
echo "what was your first number?"
read n1
echo "what was your second number?"
read n2
echo "what was your third number?"
read n3
echo "what was your fourth number?"
read n4
echo "what was your fifth number?"
read n5
echo "what was your bonus  number?"
read n6

#store them in an array
PICKS+=($n1 $n2 $n3 $n4 $n5 $n6)

#retrieve lottery results and unpack each number
RESULT_temp=`cat output.$(date +%d.%m.%Y)`
read -r r1 r2 r3 r4 r5 r6 <<< $RESULT_temp
RESULT+=($r1 $r2 $r3 $r4 $r5 $r6)

#loop over each number and count how many matches threre were

counter=0


for i in {0..5}; do
	if [ "${PICKS[i]}" == "${RESULT[i]}" ]; then
		let counter+=1
	fi	
done

if [ "$counter" -lt 6 ]; then
	echo "You have `echo $counter` matches with the lottery result."
elif [ "$counter" = 6 ]; then
	echo "Congratulations ! You won the lottery!"
else 
	echo "This is a bug"
	exit 1
fi

rm output*

exit 0
