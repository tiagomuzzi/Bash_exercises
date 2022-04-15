#!/bin/sh

declare -a PICKS=()

for pick in {1..5};
	do PICKS+=`echo $(( $RANDOM % 50+1 ))`; PICKS+=" "; 
done
PICKS+=`echo $(( $RANDOM %10+1 ))`
echo $PICKS > output.`date +%d.%m.%Y`

exit 0.