#!/bin/bash

# Update package list
apt-get update -y

# Install security updates
apt-get upgrade --only-upgrade-y

# Print success message
echo "Security updates applied successfully."
