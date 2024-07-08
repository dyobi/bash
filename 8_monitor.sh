#!/bin/bash

echo "#########################################################"
date
echo "#########################################################"

if [ -f /var/run/httpd/httpd.pid ]; then
	echo "The process is running."
else
	echo "The process is not running."
	echo "Starting the process ..."
	systemctl start httpd.service
	if [ $? -eq 0 ]; then
		echo "The process started successfully."
	else
		echo "Something went wrong."
	fi
fi
echo "#########################################################"
echo
