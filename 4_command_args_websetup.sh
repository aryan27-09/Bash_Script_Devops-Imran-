#!/bin/bash 

#Declaring Variable
Package="httpd wget unzip"
SVC="httpd"
#URL="https://www.tooplate.com/zip-templates/2135_mini_finance.zip"
#ART_NAME='2135_mini_finance'
TempDir='/tmp/webfiles'


###This Script Will Setup a Website via a Script ###

#Installing httpd package and unzipping it as well with Sudo so that all users can have the privileges. 
# Installing dependencies
echo "#############################"
echo "Installing Packages"
echo "#############################"
sudo yum install $Package -y > /dev/null
echo


# Start & Enable httpd service 
echo "#############################"
echo "Starting and Enabling Service"
echo "#############################"

sudo systemctl start $SVC
sudo systemctl enable $SVC 
echo


# Creating temp directory
echo "#############################"
echo "Starting Artificat deployment"
echo "#############################"

#Making a directory and cd into it
mkdir -p $TempDir
cd $TempDir
echo


#Downloading a Template from tooplate.com 
wget $1 > /dev/null
unzip $2.zip > /dev/null 
sudo cp -r $2/* /var/www/html/
echo



# Restarting httpd service 
echo "#############################"
echo "Restarting httpd service"
echo "#############################"
systemctl restart $SVC
echo



#CleanUp
echo "#############################"
echo "Removing temporary files"
echo "#############################"
rm -rf $TempDir 
echo


# Status of httpd service
echo "#############################"
echo "Status of httpd service"
echo "#############################"

sudo systemctl status $SVC
echo

echo "#############################"
echo "Showing Contents of /var/www/html"
echo "#############################"
ls /var/www/html/

