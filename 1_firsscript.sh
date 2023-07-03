#!/bin/bash 
### The above is the path of interpreter ###

### This scipt prints System Info###

echo "Welcome to bash script"
echo

#checking uptime of system 

echo "Uptime of system is: "
uptime
echo 
 
#checkiing Memory utilization
echo "Memory utilization: "
free -m
echo

#checking disk utilization
echo "Disk Utilization: "
df -h 

