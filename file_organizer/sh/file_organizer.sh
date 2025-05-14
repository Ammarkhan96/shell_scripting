#!/bin/bash

# Simple File Organizer Script
# This script organizes files in the current directory into subdirectories based on file extensions.

# Create directories based on file extensions and move files
for file in *.*; do
    if [ -f "$file" ]; then
        ext="${file##*.}"
        mkdir -p "$ext"
        mv "$file" "$ext/"
    fi
done

echo "Files organized successfully!"

