#!/bin/bash

VAL=$(ip addr show | grep -v LOOPBACK | grep -ic mtu)

if [ $VAL -eq 1 ]; then
	echo "1 active network interface found."
elif [ $VAL -gt 1 ]; then
	echo "Multiple active network interface found."
else
	echo "No active network interface found"
fi
