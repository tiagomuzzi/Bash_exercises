#!/bin/bash

FILENAME=`echo $0 | awk -F '/' -v OFS= '{print $NF }'`

echo "Make sure this script is inside the desired folder and it's the only .sh file in it"
echo "start? [y/n]"
read command
if [ $command == y ]
then
	for file in `ls $TARGET_DIRECTORY`; do mv $file $file.`date +%d%m%Y`; done
else
	exit 1
fi

SCRIPT_FILENAME=`ls|grep .sh`

mv "$SCRIPT_FILENAME" "$FILENAME"  

exit 0
