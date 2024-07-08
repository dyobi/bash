#!/bin/bash

# Variables
F_SVC="firewalld.service"
TMP_DIR="/tmp/webfiles"
URL="https://www.tooplate.com/zip-templates/2098_health.zip"
ART_NAME="2098_health"

yum --help &> /dev/null
if [ $? -eq 0 ]; then
	PKG="httpd wget unzip"
	H_SVC="httpd.service"

	echo "##################################################"
	echo "######## PREPARING PACKAGES FOR FEDORA OS ########"
	echo "############## INSTALLING PACKAGES ###############"
	echo "##################################################"
	sudo yum install $PKG -y > /dev/null
	echo

	echo "##################################################"
	echo "############## Start & Enable HTTPD ##############"
	echo "##################################################"
	sudo systemctl start $H_SVC
	sudo systemctl enable $H_SVC
	echo

	echo "##################################################"
	echo "############ Stop & Disable Firewalld ############"
	echo "##################################################"
	sudo systemctl stop $F_SVC
	sudo systemctl disable $F_SVC
	echo

	echo "##################################################"
	echo "########### START ARTIFACT DEPLOYMENT ############"
	echo "##################################################"
	mkdir -p $TMP_DIR
	cd $TMP_DIR
	echo

	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null
	sudo cp -r $ART_NAME/* /var/www/html/
	echo

	echo "##################################################"
	echo "################## Restart HTTPD #################"
	echo "##################################################"
	sudo systemctl restart $H_SVC
	echo

	echo "##################################################"
	echo "############# Remove temporary files #############"
	echo "##################################################"
	rm -rf $TMP_DIR
	echo

	echo "##################################################"
	echo "############## Available IP Address ##############"
	echo "##################################################"
	ip addr show | grep "inet\b" | grep -v grep | awk '{print $2}' | cut -d/ -f1
	echo
else
	PKG="apache2 wget unzip"
	H_SVC="apache2"

	echo "##################################################"
	echo "######## PREPARING PACKAGES FOR UBUNTU OS ########"
	echo "############## INSTALLING PACKAGES ###############"
	echo "##################################################"
	sudo apt update
	sudo apt install $PKG -y > /dev/null
	echo

	echo "##################################################"
	echo "############# Start & Enable Apache2 #############"
	echo "##################################################"
	sudo systemctl start $H_SVC
	sudo systemctl enable $H_SVC
	echo

	echo "##################################################"
	echo "############ Stop & Disable Firewalld ############"
	echo "##################################################"
	sudo systemctl stop $F_SVC
	sudo systemctl disable $F_SVC
	echo

	echo "##################################################"
	echo "########### START ARTIFACT DEPLOYMENT ############"
	echo "##################################################"
	mkdir -p $TMP_DIR
	cd $TMP_DIR
	echo

	wget $URL > /dev/null
	unzip $ART_NAME.zip > /dev/null
	sudo cp -r $ART_NAME/* /var/www/html/
	echo

	echo "##################################################"
	echo "################## Restart HTTPD #################"
	echo "##################################################"
	sudo systemctl restart $H_SVC
	echo

	echo "##################################################"
	echo "############# Remove temporary files #############"
	echo "##################################################"
	rm -rf $TMP_DIR
	echo

	echo "##################################################"
	echo "############## Available IP Address ##############"
	echo "##################################################"
	ip addr show | grep "inet\b" | grep -v grep | awk '{print $2}' | cut -d/ -f1
	echo
fi
