#!/bin/bash

echo "Checking Server Health..."

# Check CPU Usage
echo "CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{printf "User: %.1f%%, System: %.1f%%, Idle: %.1f%%\n", $2, $4, $8}'

# Check Memory Usage
echo "Memory Usage:"
free -h | awk 'NR==2 {printf "Total: %s, Used: %s, Free: %s, Available: %s\n", $2, $3, $4, $6}'

# Check Disk Usage
echo "Disk Usage:"
df -h --output=source,pcent | grep '^/dev/' | awk '{printf "%s: %s\n", $1, $2}'

echo "Health Check Completed!"

