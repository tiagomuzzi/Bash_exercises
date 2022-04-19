#!/bin/bash
# You may pass an argument to this script with the desired filename, otherwise it will prompt you.

if [ $# -eq 0 ]; then
	echo "Insert the name and the extension for the file you would like to create."
	read FILENAME
else
	FILENAME=$1
fi

MATCH=`ls | grep $FILENAME | wc -l`

if [[ $MATCH -gt 0 ]]; then
	echo "This file already exists"
	exit 1
else
	`touch $FILENAME`
fi
exit 0
