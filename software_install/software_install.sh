#!/bin/bash

# Author: Ammar Khan
# Installing multiple software without requiring root execution

if [[ $# -eq 0 ]]; then    
    echo "Usage: please provide software names as command line arguments"
    exit 1
fi      

for softwares in "$@"; do      
    if which "$softwares" &> /dev/null; then    
        echo "Already installed: $softwares"
    else    
        echo "Installing $softwares..."
        sudo apt-get install "$softwares" -y &> /dev/null
        if [[ $? -eq 0 ]]; then    
            echo "Successfully installed: $softwares"
        else    
            echo "Unable to install: $softwares"
        fi
    fi      
done    

