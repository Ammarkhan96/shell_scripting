#!/bin/bash

# 1. Ask for a number to start the countdown.
echo "Enter a number to start the countdown:"
read number

# 2. Countdown from the entered number to 1
while [ $number -gt 0 ]; do
	echo $number
	((number--)) #Decrement the number by 1
done

# 3. Print "Blast Off!" when the countdown finishes
echo "Blast Off!" 
