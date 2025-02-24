#!/bin/bash

ACTION=$1    #First argument(add or remove)
USERNAME=$2  #Second argument (username)

if [ -z "$ACTION" ] || [ -z "$USERNAME" ]; then
	echo "Usage: $0 <add|remove> <username>"
	exit 1
fi

if [ "$ACTION" == "add" ]; then
	sudo useradd -m -s /bin/bash "$USERNAME"
	echo "✅ User $USERNAME has been added."
elif [ "$ACTION" == "remove" ]; then
	sudo userdel -r "$USERNAME"
	echo "❌ User $USERNAME has been removed."
else
	echo "Invalid action! Use 'add' or 'remove'."
	exit
fi
