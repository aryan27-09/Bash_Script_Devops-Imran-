#!/bin/bash 

##Script to run a test if statement code

read -p "Enter a number: " NUM 
echo 

if [ $NUM -gt 100 ]
then 
	echo "We have entered if block"
	sleep 2 
	echo "Number entered is greater than 100"
	echo 
	date
else
	echo "We have entered else block"
	sleep 2 
	echo "Number entered is less than 100"
	date
fi 

echo "Script execution completed successfully"

