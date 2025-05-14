#!/bin/bash

LOG_FILE="system_monitor.log"

echo "Monitoring System Resource..." > $LOG_FILE
echo "Timestamp: $(date)" >> $LOG_FILE

#CPU Usage
echo "CPU Usage:" >> $LOG_FILE
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Load: " $2 "%"}' >> $LOG_FILE

#Memory Usage
echo "Memory Usage:" >> $LOG_FILE
free -h >> $LOG_FILE

#Disk Usage
echo "Disk Usage:" >> $LOG_FILE
df -h >> $LOG_FILE

echo "Monitoring complete. Check $LOG_FILE for details. "
