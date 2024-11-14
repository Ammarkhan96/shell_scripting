#!/bin/bash

# Display current date and time
show_date_time() {
    echo "Current Date and Time: $(date)"
}

# Display system uptime
show_uptime() {
    echo "System Uptime:"
    uptime
}

# Display logged-in users
show_users() {
    echo "Logged-in Users:"
    who
}

# Display disk usage
show_disk_usage() {
    echo "Disk Usage:"
    df -h
}

# Display memory usage
show_memory_usage() {
    echo "Memory Usage:"
    free -h
}

# Show menu options
show_menu() {
    echo "Select an option to display:"
    echo "1) Current Date and Time"
    echo "2) System Uptime"
    echo "3) Logged-in Users"
    echo "4) Disk Usage"
    echo "5) Memory Usage"
    echo "6) Display All"
    echo "7) Exit"
}

# Main script loop
while true; do
    show_menu
    read -p "Enter your choice [1-7]: " choice
    
    case $choice in
        1) show_date_time ;;
        2) show_uptime ;;
        3) show_users ;;
        4) show_disk_usage ;;
        5) show_memory_usage ;;
        6) 
            show_date_time
            show_uptime
            show_users
            show_disk_usage
            show_memory_usage
            ;;
        7) echo "Exiting..."; break ;;
        *) echo "Invalid option. Please try again." ;;
    esac

    echo # Blank line for readability
done

