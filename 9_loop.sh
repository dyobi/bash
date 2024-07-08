#!/bin/bash

USERS="alpha beta gamma"
COUNTER=5

read -p "ADD: 1 / DEL: 2`echo $'\n> '`" OPT

echo

while [ $COUNTER -gt 0 ]
do
	echo "Will be done in $COUNTER sec..."
	COUNTER=$(( $COUNTER - 1 ))
	sleep 1
done

if [ $OPT -eq 1 ]; then
	for usr in $USERS
	do
		echo
		echo "Adding $usr ..."
		useradd $usr
		id $usr
		echo
	done
elif [ $OPT -eq 2 ]; then
	for usr in $USERS
	do
		echo
		echo "Deleting $usr ..."
		userdel -r $usr
		echo
	done
else
	echo "Please give a right input."
fi
