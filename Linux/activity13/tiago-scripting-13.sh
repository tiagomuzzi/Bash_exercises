#!/bin/bash

# A script that takes two files of unique numbers and displays the difference between the two lists 

# Here follows two methods to achieve the same thing. To check performance I measured the time before and after the execution of each.
# You may try it out for yourself by commenting in and out each method.


#Method 1 -- uncomment to test

start=`date +%s.%N`
sorted1=`sort $1`
sorted2=`sort $2`

#The comm function checks for what's common between two files. the <() operator allows for variables to be passed.
# The -3, -2, -1 allow manipulation of which columns to display in the output. Man comm for more info.

 echo "Only in file 1: `comm -3 -2 <(echo "$sorted1") <( echo "$sorted2")`"
 echo "Only in file 2: `comm -3 -1 <(echo "$sorted1") <( echo "$sorted2")`"

 end=`date +%s.%N`
 echo time elapsed: runtime=$(echo "$end - $start" | bc)

# Method 2
start=`date +%s.%N`

ans1=`grep -Fxvf $1 $2`
and2=`grep -Fxvf $2 $1`

echo "Only in file 1: $ans1"
echo "Only in file 2: $ans2"

end=`date +%s.%N`

echo time elapsed: runtime=$(echo "$end - $start" | bc)

#It seems that the second method has a slight advantage of speed, of a few nanossecond. I'm not sure if that's conclusive of anything.
exit 0
