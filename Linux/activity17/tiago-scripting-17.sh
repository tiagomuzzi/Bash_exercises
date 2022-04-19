#!/bin/bash

# A Parser that makes a nice CSV out of the FIXlogs.
# To run this on a mac you'll need the UNIX grep (brew install grep).

# I'm sure there's a better way to do this, but I failed to uncover it.

declare -a Column1=()
while read -r line; do

    if [[ $line =~ "56=" ]]; then
        echo $line | ggrep -Po '(?<=56=)[^;]*' >> col2.txt
    else
        echo "NULL" >> col2.txt
    fi;

    if [[ $line =~ "35=" ]]; then
        echo $line | ggrep -Po '(?<=35=)[^;]*' >> col3.txt
    else
        echo "NULL" >> col3.txt
    fi;

    if [[ $line =~ "55=" ]]; then
        echo $line | ggrep -Po '(?<=55=)[^;]*' >> col4.txt
    else
        echo "NULL" >> col4.txt
    fi;

    if [[ $line =~ "38=" ]]; then
        echo $line | ggrep -Po '(?<=38=)[^;]*' >> col5.txt
    else
        echo "NULL" >> col5.txt
    fi;

    if [[ $line =~ "44=" ]]; then
        echo $line | ggrep -Po '(?<=44=)[^;]*' >> col6.txt
    else
        echo "NULL" >> col6.txt
    fi;

    if [[ $line =~ "54=" ]]; then
        echo $line | ggrep -Po '(?<=54=)[^;]*' >> col7.txt
    else
        echo "NULL" >> col7.txt
    fi;

    if [[ $line =~ "11=" ]]; then
        echo $line | ggrep -Po '(?<=11=)[^;]*' >> col8.txt
    else
        echo "NULL" >> col8.txt
    fi;

    if [[ $line =~ "32=" ]]; then
        echo $line | ggrep -Po '(?<=32=)[^;]*' >> col9.txt
    else
        echo "NULL" >> col9.txt
    fi;

    if [[ $line =~ "17=" ]]; then
        echo $line | ggrep -Po '(?<=17=)[^;]*' >> col10.txt
    else
        echo "NULL" >> col10.txt
    fi;

    if [[ $line =~ "31=" ]]; then
        echo $line | ggrep -Po '(?<=31=)[^;]*' >> col11.txt
    else
        echo "NULL" >> col11.txt
    fi;
done < $1

#put each column together, remove spaces, switch for comma and remove nulls.
paste col*.txt | tr '\t' ' ' | sed -E 's/[ ]+/,/g' | sed -E 's/NULL//g' > temp.txt 

echo -e Client,MessageType,Stock,Quantity,Side,OrderiD,LastQuantity,Execid,LastPrice | cat - temp.txt > parsed_$1.csv

rm col*.txt temp.txt

exit 0