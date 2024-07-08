#!/bin/bash

### This script prints the system info ###
echo
echo "Welcome to bash script."
echo
echo "###########################################"
echo

# Checking system uptime
echo "The uptime of this system is : "
uptime
echo
echo "###########################################"
echo

# Memory utilization
echo "Memory utilization : "
free -m
echo
echo "###########################################"
echo

# Disk utilization
echo "Disk utilization : "
df -h
