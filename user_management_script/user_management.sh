#!/bin/bash

# File to store user names
USER_FILE="users.txt"

# Check if the user file exists; if not, create it
if [[ ! -f "$USER_FILE" ]]; then
  touch "$USER_FILE"
fi

# Function to display the menu
show_menu() {
  echo "========================"
  echo "  User Management Menu  "
  echo "========================"
  echo "1. Add a user"
  echo "2. Delete a user"
  echo "3. Display all users"
  echo "4. Search for a user"
  echo "5. Exit"
  echo "========================"
}

# Function to add a user
add_user() {
  read -p "Enter username to add: " username
  if grep -q "^$username$" "$USER_FILE"; then
    echo "User '$username' already exists."
  else
    echo "$username" >> "$USER_FILE"
    echo "User '$username' added successfully."
  fi
}

# Function to delete a user
delete_user() {
  read -p "Enter username to delete: " username
  if grep -q "^$username$" "$USER_FILE"; then
    grep -v "^$username$" "$USER_FILE" > temp_file && mv temp_file "$USER_FILE"
    echo "User '$username' deleted successfully."
  else
    echo "User '$username' does not exist."
  fi
}

# Function to display all users
display_users() {
  if [[ -s "$USER_FILE" ]]; then
    echo "List of users:"
    cat "$USER_FILE"
  else
    echo "No users found."
  fi
}

# Function to search for a user
search_user() {
  read -p "Enter username to search: " username
  if grep -q "^$username$" "$USER_FILE"; then
    echo "User '$username' found."
  else
    echo "User '$username' not found."
  fi
}

# Main loop
while true; do
  show_menu
  read -p "Choose an option: " choice
  case $choice in
    1) add_user ;;
    2) delete_user ;;
    3) display_users ;;
    4) search_user ;;
    5) echo "Exiting the script. Goodbye!"; break ;;
    *) echo "Invalid option. Please try again." ;;
  esac
done

