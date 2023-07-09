#!/bin/bash 

counter=2

while true
do 
  echo "Looping"
  echo "Value of counter is $counter"
  counter=$((counter *2))
done

echo "Out of the loop"
