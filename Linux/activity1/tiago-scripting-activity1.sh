#!/bin/sh

echo "Your username is `whoami`"
echo "The current date is `date +%D`"
echo "the current time is `date +"%T"`"
echo "Your current working directory is `pwd`"
echo "and it contains `ls | wc -l` files"
FILE=$(ls -s)
echo "the largest one is the `echo $FILE | cut -d ' ' -f4`"
exit 0
