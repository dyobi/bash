#!/bin/bash

sudo systemctl stop httpd.service
sudo systemctl disable httpd.service
sudo rm -rf /var/www/html/* > /dev/null
sudo yum remove httpd wget unzip -y > /dev/null
