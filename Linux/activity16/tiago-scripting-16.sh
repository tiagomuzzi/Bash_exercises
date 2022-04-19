# #!/bin/bash

# # A parser of fixlog message types (code 35).
# # enter the log as an argument when you run this script.

# elects the relevant columns & gets rid of '35=' and '49='
cat $1| awk '{ print $2 $4 }' | sed -E 's/35=//g' | sed -E 's/49=//g' | 
# "adds a column" reflecting sender and receiver, comma-separated
sed -E 's/;MTHREE;/,Sender,/g' | sed -E 's/;MS;/,Receiver,/g' |      
# sorts, counts, sorts back and prints the item before the count.   
tr ' ', ',' | sort | uniq -c | sort -nr |  awk '{ print $2 ',' $1 }' | 
# Gives more human-readable msg types
sed -E 's/8,Receiver, /ExecutionReport,Receiver,/g' | 
sed -E 's/0,Sender, /Heartbeat,Sender,/g' | 
sed -E 's/0,Receiver, /Heartbeat,Receiver,/g' | 
sed -E 's/D,Sender, /NewOrderSingle,Sender,/g' | 
sed -E 's/F,Sender, /OrderCancelRequest,Sender,/g' | 
sed -E 's/A,Sender, /Logon,Sender,/g' | 
sed -E 's/A,Receiver, /Logon,Receiver,/g' > temp.txt

#adds a header
echo MsgType,Side,Count | cat - temp.txt > processed.$1.csv

rm temp.txt

exit 0
