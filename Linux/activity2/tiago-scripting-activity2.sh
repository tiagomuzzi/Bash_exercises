#!/bin/bash
# Generates testfiles, renames them with the current date and deletes them in the end.


#Creates a few test files
for i in {1..5}; do
	rnd=`echo $(( $RANDOM % $12345+1  ))`
	touch Testfile.$rnd;
done

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

echo "There you go! Remove test files? [y/n]"
read command
if [ $command == y ]
then
	rm Testfil*; 
else
	exit 1
fi

exit 0
