#!/bin/bash

# Print a welcome message
echo "Welcome to the Bash scripting tutorial!"

# Ask for the user's name
read -p "What is your name? " name

# Display a personalized greeting
echo "Hello, $name! Nice to meet you."

# Ask how the user is doing
read -p "How are you doing today? " mood

# Respond based on the user's input
echo "I'm glad to hear you're $mood, $name!"

# End the script
echo "Have a great day!"
