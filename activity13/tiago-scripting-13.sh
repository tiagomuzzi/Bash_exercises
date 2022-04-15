#!/bin/bash

# Here follows two methods to achieve the same thing. To check performance I measured the time before and after the execution of each.
# You may try it out for yourself by commenting in and out each method.

##Method 1 -- uncomment to test

# start=`date +%s.%N`
# sorted1=`sort $1`
# sorted2=`sort $2`

##The comm function checks for what's common between two files. the <() operator allows for variables to be passed.
## The -3, -2, -1 allow manipulation of which columns to display in the output. Man comm for more info.

# echo "Only in file 1: `comm -3 -2 <(echo "$sorted1") <( echo "$sorted2")`"
# echo "Only in file 2: `comm -3 -1 <(echo "$sorted1") <( echo "$sorted2")`"

# end=`date +%s.%N`
# runtime=$( echo "$end - $start" )
# echo $runtime

# Method 2
start=`date +%s.%N`
ans1=`grep -Fxvf $1 $2`
and2=`grep -Fxvf $2 $1`

echo "Only in file 1: $ans1"
echo "Only in file 2: $ans2"
end=`date +%s.%N`
runtime=$( echo "$end - $start" )
echo $runtime

#In the end They both seem to run too fast to be able to tell anything. I'm not sure which one runs faster.
exit 0
