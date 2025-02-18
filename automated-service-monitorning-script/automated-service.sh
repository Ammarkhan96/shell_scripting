#!/bin/bash

# List of services to monitor
SERVICES=("nginx" "mysql" "docker")

for SERVICE in "${SERVICES[@]}"; do
    if systemctl is-active --quiet "$SERVICE"; then
	 echo "✅ $SERVICE is running."
     else
        echo "❌ $SERVICE is not running. Restarting now..."
        sudo systemctl start "$SERVICE"

        # Check again after restart
        if systemctl is-active --quiet "$SERVICE"; then
            echo "✅ $SERVICE restarted successfully!"
        else
            echo "⚠️ Alert: $SERVICE failed to start. Check logs!"
        fi
    fi
done

