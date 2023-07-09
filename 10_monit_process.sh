#!/bin/bash 

##This script checks whether the httpd service is running or not##

echo "#################################"
date

ls /var/run/httpd/httpd.pid  2> /dev/null

if [ $? -eq 0 ]
then 
	echo "httpd is running"
else 
	echo "httpd is not running"
	echo "starting the process"
	systemctl start httpd
	if [ $? -eq 0 ]
	then
		echo "Service started successfully"
	else
		echo "Service start failed"
	fi
fi 

echo "#################################"
echo
