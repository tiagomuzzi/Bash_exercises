#!/bin/sh
#Version 1

echo "Enter a number"
read NUM

echo "Enter a second number"
read NUM2

if [[ "$NUM" =~  ^[0-9]*$ && "$NUM2" =~  ^[0-9]*$ ]]; then
	if [[ "$NUM" -gt "$NUM2" ]]; then
		echo "True"
	else
		echo "False"
	fi
else
	echo "Invalid. Input not a number."
	exit 1
fi

exit 0
