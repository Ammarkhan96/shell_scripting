#!/bin/bash

# Welcome message
echo "Welcome to the Folder Cleaner Script!"
echo "This script will remove all empty files and folders in the current directory."

# Prompt for confirmation
read -p "Are you sure you want to proceed? (yes/no): " response

if [[ "$response" != "yes" ]]; then
  echo "Operation canceled."
  exit 0
fi

# Find and delete empty files
echo "Removing empty files..."
find . -type f -empty -exec rm -v {} \;

# Find and delete empty folders
echo "Removing empty folders..."
find . -type d -empty -exec rmdir -v {} \;

echo "Cleanup complete!"

