#!/bin/bash

echo "Welcome to the number game."
echo "Guess a number between 1 and 64 (inclusive)"

# Set range and generate a random number between 1 and 64
RANGE=64
number=$(( RANDOM % RANGE + 1 ))

# Allow up to 6 attempts to guess the number
for attempt in {1..6}
do
    read -p "Attempt $attempt: Enter your guess: " guess

    if (( guess < number )); then
        echo "Too small! Try again."
    elif (( guess > number )); then
        echo "Too big! Try again."
    else
        echo "Congratulations! You guessed the number correctly."
        exit 0
    fi
done

echo "Sorry, you've used all attempts. The correct number was $number. Better luck next time!"
  
