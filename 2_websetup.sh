#!/bin/bash 

###This Script Will Setup a Website via a Script ###

#Installing httpd package and unzipping it as well with Sudo so that all users can have the privileges. 
# Installing dependencies
echo "#############################"
echo "Installing Packages"
echo "#############################"
sudo yum install wget unzip httpd -y > /dev/null
echo


# Start & Enable httpd service 
echo "#############################"
echo "Starting and Enabling Service"
echo "#############################"

sudo systemctl start httpd
sudo systemctl enable httpd 
echo


# Creating temp directory
echo "#############################"
echo "Starting Artificat deployment"
echo "#############################"

#Making a directory and cd into it
mkdir -p /tmp/webfiles 
cd /tmp/webfiles
echo


#Downloading a Template from tooplate.com 
wget https://www.tooplate.com/zip-templates/2135_mini_finance.zip > /dev/null
unzip 2135_mini_finance.zip > /dev/null 
sudo cp -r 2135_mini_finance/* /var/www/html/
echo



# Restarting httpd service 
echo "#############################"
echo "Restarting httpd service"
echo "#############################"
systemctl restart httpd
echo



#CleanUp
echo "#############################"
echo "Removing temporary files"
echo "#############################"
rm -rf /tmp/webfiles 
echo


# Status of httpd service
echo "#############################"
echo "Status of httpd service"
echo "#############################"

sudo systemctl status httpd
echo

echo "#############################"
echo "Showing Contents of /var/www/html"
echo "#############################"
ls /var/www/html/

