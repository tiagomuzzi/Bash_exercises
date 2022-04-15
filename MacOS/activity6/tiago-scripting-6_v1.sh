#!/bin/sh
#Version 1

echo "Enter a number"
read NUM

echo "Enter a number that's not as large"
read NUM2

if [[ "$NUM" =~  ^[0-9]*$ && "$NUM2" =~  ^[0-9]*$ ]]; then
	if [[ "$NUM" -gt "$NUM2" ]]; then
		echo "True. $NUM is bigger than $NUM2"
	else
		echo "False. $NUM2 is bigger than $NUM" 
	fi
else
	echo "Invalid. Input not a number."
	exit 1
fi

exit 0
