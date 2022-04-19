#!/bin/bash
: '

This script parses fixlogs into a more human-readable format. 
You may pass whichever fixlog as an argument.
'

declare -a NAME_TABLE

NAME_TABLE["AAPL"]="Apple"
NAME_TABLE["MSFT"]="Microsoft"
NAME_TABLE["AMZN"]="Amazon"
NAME_TABLE["FB"]="Facebook"
NAME_TABLE["GOOG"]="Google C"
NAME_TABLE["GOOGL"]="Google A"
NAME_TABLE["INTC"]="Intel"
NAME_TABLE["PEP"]="Pepsi"
NAME_TABLE["NFLX"]="Netflix"
NAME_TABLE["CSCO"]="Costco"
NAME_TABLE["AMGN"]="Amgen"
NAME_TABLE["PYPL"]="Paypal"
NAME_TABLE["TSLA"]="Tesla"
NAME_TABLE["TXN"]="Texas Instruments"
NAME_TABLE["AVGO"]="Broadcom"
NAME_TABLE["GILD"]="Gilead"
NAME_TABLE["SBUX"]="Starbucks"
NAME_TABLE["QCOM"]="Qualcomm"
NAME_TABLE["TMUS"]="T-Mobile"
NAME_TABLE["MDLZ"]="Mondelez"
NAME_TABLE["BAC"]="Bank of America"
NAME_TABLE["DDD"]="3D systems"
NAME_TABLE["MMM"]="3M"
NAME_TABLE["WBAI"]="500.com"
NAME_TABLE["WUBA"]="58.com"
NAME_TABLE["EGHT"]="8x8"
NAME_TABLE["AHC"]="Austco"
NAME_TABLE["AOS"]="A O Smith"
NAME_TABLE["ATEN"]="A10"
NAME_TABLE["AIR"]="AAR"
NAME_TABLE["AAN"]="Aarons"
NAME_TABLE["ABB"]="ABB"
NAME_TABLE["ABT"]="Abbott Labs"
NAME_TABLE["ABBV"]="Abbvie"
NAME_TABLE["ANF"]="abercrombie"
NAME_TABLE["ABM"]="ABM"

declare -a EXEC_STATUS

EXEC_STATUS[0]="New Order"
EXEC_STATUS[1]="Partial fill"
EXEC_STATUS[2]="Fill"
EXEC_STATUS[4]="Cancelled"
EXEC_STATUS[6]="Pending Cancel"


# loops through each line. It then stores in variables the key information (msg type, name of share, etc...)
# and generates the message at the end of the loop.
while read -r line; do
    if [[ $line =~ "35=" ]]; then
        if [[ $line =~ "35=A" ]]; then
            MSGTYPE="New Logon"
        elif [[ $line =~ "35=0" ]]; then
            MSGTYPE="Heartbeat Message"
        elif [[ $line =~ "35=D" ]]; then
            MSGTYPE="New buy order"
        elif [[ "$line" =~ "35=8" && "$line" =~ "150=" ]]; then
            STATUS=`echo $line | grep -Po '(?<=150=)[^;]*'`
            MSGTYPE="Execution report: ${EXEC_STATUS[$STATUS]}"
        elif [[ $line =~ "35=F" ]]; then
            MSGTYPE="Cancel request"
        else
            continue
        fi;
    fi;
    if [[ $line =~ "55=" ]]; then
        KEY=`echo $line | grep -Po '(?<=55=)[^;]*'`
        STOCK="for `echo ${NAME_TABLE[$KEY]}`"
        
    fi;

    if [[ $line =~ "11=" ]]; then
        ID=`echo $line | grep -Po '(?<=11=)[^;]*'`
        ORDERID="with Order ID `echo $ID`,"
    fi;
    
    if [[ $line =~ "38=" ]]; then
        QTTY=`echo $line | grep -Po '(?<=38=)[^;]*'`
        SHARECOUNT="`echo $QTTY` shares"
    fi;
    
    if [[ $line =~ "44=" ]]; then
        PRICE=`echo $line | grep -Po '(?<=44=)[^;]*'`
        SHARECOUNT="at price `echo $PRICE`"
    fi;

    echo "$MSGTYPE $STOCK $ORDERID $SHARECOUNT" >> parsed_$1
    

done < $1

exit 0