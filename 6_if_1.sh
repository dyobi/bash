#!/bin/bash

read -p "Enter a number : " NUM

echo

if [ $NUM -gt 100 ];
then
	echo "We have entered in the IF block."
	sleep 3
	echo "Your number is greater than 100."
	echo
	date
elif [ $NUM -eq 100 ];
then
	echo "Your number is exactly 100."
else
	echo "Your number is less than 100."
fi

echo "Script execution completed successfully."
