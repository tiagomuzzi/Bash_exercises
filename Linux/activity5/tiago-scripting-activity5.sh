#!/bin/sh

echo "insert number"
read NUM


if [[ "$NUM" =~  ^[0-9]*$ ]]; then
	echo $NUM | rev
else
	echo "Not a number"
fi

exit 0
