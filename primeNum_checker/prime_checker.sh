#!/bin/bash

# 1. Ask the user for a number
echo "Enter a number:"
read number

# 2. Check if the number is less than 2 (not prime)
if (( number < 2 )); then
	echo "$number is not a prime number."
	exit 0
fi

# 3. Loop through numbers from 2 to the square root of the number
for (( i=2; i<=number/2; i++ )); do
	# 4. Check if the number is divisible by 1
	if (( number % i == 0 )); then
		echo "$number is not a prime number."
		exit 0
	fi
done

# 5. If no divisors were found, it's a prime number
echo "$number is a prime number."
