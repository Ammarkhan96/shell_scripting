#!/bin/bash

# Generate a random number between 1 and 100
TARGET=$(( RANDOM % 100 + 1 ))
ATTEMPTS=0

echo "Welcome to the Guess the Number game!"
echo "I’ve chosen a number between 1 and 100. Start guessing!"

# Loop until the user guesses correctly
while true; do
    # Prompt for user input
    read -p "Enter your guess: " GUESS
    ATTEMPTS=$(( ATTEMPTS + 1 ))

    # Check if input is a valid number
    if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number!"
        continue
    fi

    # Compare the guess with the target
    if [ "$GUESS" -eq "$TARGET" ]; then
        echo "Congratulations! You guessed the number $TARGET in $ATTEMPTS attempts!"
        break
    elif [ "$GUESS" -lt "$TARGET" ]; then
        echo "Too low! Try again."
    else
        echo "Too high! Try again."
    fi
done
