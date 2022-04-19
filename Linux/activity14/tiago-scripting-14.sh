#!/bin/bash

#A rough text parser to csv. Pass a textfile as an argument and the script will return a word frequency csv.


cat $1 | sed -r 's/[^[:space:]a-zA-Z]//g' | #Remove anything that's not alphabet letters os whitespaces
tr '\n' ' ' | #Replace newlines to spaces
sed -E 's/[ ]+/ /g' > temp.txt #Replace one or more spaces to just one space

cat temp.txt | tr ' ' '\n' | sort | uniq -c | sort -nr | #replaces any space for a newline, sorts, counts and sorts back by count
awk '{ print $2 " " $1}' | #switches column order
sed -E 's/[ ]/,/g' > temp2.txt #switches spaces to comma

echo -e word,frequency | cat - temp2.txt > parsed_$1.csv

rm temp.txt temp2.txt

exit 0
