#!/bin/sh

echo " THE LOTTERY WILL BEGIN! "

sleep 5

declare -a PICKS=()

for pick in {1..5};
	do PICKS+=`echo $(( $RANDOM % 50+1 ))`; PICKS+=" "; 
done
PICKS+=`echo $(( $RANDOM %10+1 ))`
echo $PICKS > output.`date +%d.%m.%Y`

echo "THE RESULTS ARE IN! ${PICKS[*]}"
echo "To Check your results, run the check.sh script"
exit 0