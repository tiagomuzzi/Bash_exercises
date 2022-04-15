#!/bin/bash

echo "Welcome to the Quiz Game! This one is on bats. Answer either T (true) or F (false)"
count=0

echo "Statement 1: Bats are Furry"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi

echo "Statement 2: Bats Feed their babies on milk"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi


echo "Statement 3: Bats fly with their hands"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi


echo "Statement 4: All british bats eat insects"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi


echo "Statement 5: Bats are not blind"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi


echo "Statement 6: All british bats use their ears to hekp them find their food in the dark"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi


echo "Statement 7: British bats hibernate in winter"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break	
fi


echo "Statement 8: There are over 1000 different sorts of bats in the world"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi


echo "Statement 9: All british bats are protected by law"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi


echo "Statement 10: Vampire bats are only found in Central and South America"
read ans

if [[ $ans = "T" ]]; then
	echo "Right Answer"
	let count+=1
elif	[[ $ans = "F" ]]; then
	echo "Wrong Answer"
else
	break
fi

echo "your result is: `echo $count`"
exit 0
#To learn more about bats:  https://webcache.googleusercontent.com/search?q=cache:JWQ5jK7stWIJ:https://www.dundeesciencecentre.org.uk/files/true-or-false.pdf+&cd=32&hl=en&ct=clnk&gl=ca&client=firefox-b-d
