#!/bin/bash


echo "##################################################"
echo "############## INSTALLING PACKAGES ###############"
echo "##################################################"
sudo yum install wget httpd unzip -y > /dev/null
echo

echo "##################################################"
echo "############## Start & Enable HTTPD ##############"
echo "##################################################"
sudo systemctl start httpd.service
sudo systemctl enable httpd.service
echo

echo "##################################################"
echo "############ Stop & Disable Firewalld ############"
echo "##################################################"
sudo systemctl stop firewalld.service
sudo systemctl disable firewalld.service
echo

echo "##################################################"
echo "########### START ARTIFACT DEPLOYMENT ############"
echo "##################################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/
echo

echo "##################################################"
echo "################## Restart HTTPD #################"
echo "##################################################"
sudo systemctl restart httpd.service
echo


echo "##################################################"
echo "############# Remove temporary files #############"
echo "##################################################"
rm -rf /tmp/webfiles
echo

echo "##################################################"
echo "############## Available IP Address ##############"
echo "##################################################"
ip addr show | grep "inet\b" | grep -v grep | awk '{print $2}' | cut -d/ -f1
echo
