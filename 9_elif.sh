#!/bin/bash 

##Elif test script 

Value=`ip addr show | grep -v LOOPBACK | grep -ic mtu`

if [ $Value -eq 1 ]
then 
	echo "1 Active Network Interface found"
elif [ $Value -gt 1 ]
then 
	echo "Multiple network interface found"
else 
	echo "No network interface found"

fi 


