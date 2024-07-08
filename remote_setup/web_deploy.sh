#!/bin/bash

USR="devops"

for host in `cat remote_hosts`
do
	echo "*--------------------------------------------*"
	echo "*- Connecting to $host"
	scp webSetup.sh $USR@$host:/tmp
	ssh $USR@$host sudo /tmp/webSetup.sh
	ssh $USR@$host sudo rm -rf /tmp/webSetup.sh
	echo "*--------------------------------------------*"
done
