#!/bin/sh
#Version 2

echo "Enter a number"
read NUM

echo "Enter a second number"
read NUM2


if [[ "$NUM" =~  ^[0-9]*$ && "$NUM2" =~  ^[0-9]*$ ]]; then
	DIFF=`expr $NUM - $NUM2`
	echo "Difference: ${DIFF}"
else
	echo "Invalid. Input not a number."
	exit 1
fi

exit 0


