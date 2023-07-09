#!/bin/bash 


#This script will install httpd service across multiple webservers without dependency of OS. 

#Declaring Variable
#Package="httpd wget unzip"
#SVC="httpd"
URL="https://www.tooplate.com/zip-templates/2135_mini_finance.zip"
ART_NAME='2135_mini_finance'
TempDir='/tmp/webfiles'


###This Script Will Setup a Website via a Script ###


yum --help &> /dev/null

if [ $? -eq 0 ]
then 
   # Setting Variable for CentOS 
   Package="httpd wget unzip"
   SVC="httpd"


echo "Running script for CentOS" 
	

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
wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null 
sudo cp -r $ART_NAME/* /var/www/html/
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



else 

   # Setting Variable for Ubuntu 
   Package="apache2 wget unzip"
   SVC="apache2"


echo "Running script for Ubuntu"


#Installing httpd package and unzipping it as well with Sudo so that all users can have the privileges.
# Installing dependencies
echo "#############################"
echo "Installing Packages"
echo "#############################"


sudo apt update
sudo apt install $Package -y > /dev/null
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
wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/
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


fi
