#!/bin/bash

echo "---System Informattion for $(hostname)---"
echo "Hostname: $(hostname)"
echo "Operating System:  $(uname -a)"
echo "CPU Information: "
cat /proc/cpuinfo | grep "model name" | head -n 1
echo ""
echo "Memory Information: "
cat /proc/meminfo | grep "MemTotal"
cat /proc/meminfo | grep "MemFree"
echo ""
echo "Disk Space: "
df -h
echo ""
echo "Uptime: $(uptime)"

exit 0
