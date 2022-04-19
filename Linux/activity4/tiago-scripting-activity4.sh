#!/bin/sh
#A simple password analyzer

echo "Welcome to the password analyzer"
echo "What is your password"
read PASSWORD

#Check for length

echo "analyzing..."

LEN_PASSWORD=`echo $PASSWORD | awk '{print length}'`

if [ "$LEN_PASSWORD" -le 8 ]; then
	echo "Your password is not long enough"
	exit 1
else
	continue
fi

#Check for character type

if [[ "$PASSWORD" =~ [0-9] && "$PASSWORD" =~ [a-zA-Z] ]]; then
	continue
	exit 1
else
	echo "Password must contain at least a letter and a digit"
fi

#Check for case

if [[ "$PASSWORD" =~ [A-Z] && "$PASSWORD" =~ [a-z] ]]; then
	echo "Password is valid"
else
	echo "Password must contain at least one uppercase and one lowercase character"
fi

exit 0
