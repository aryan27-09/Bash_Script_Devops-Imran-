#!/bin/bash 

##Script to run a test if statement code

read -p "Enter a number: " NUM 
echo 

if [ $NUM -gt 100 ]
then 
	echo "We have entered if block"
	sleep 3 
	echo "Number entered is greater than 100"
	echo 
	date
fi 

echo "Script execution completed successfully"

