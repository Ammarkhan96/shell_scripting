#!/bin/bash

# Todo List Manager
# Author: [Your Name]
# Date: [Today's Date]

# File to store tasks
TODO_FILE="todo.txt"

# Function to display the menu
display_menu() {
    echo "========================"
    echo "  TODO LIST MANAGER"
    echo "========================"
    echo "1. View Tasks"
    echo "2. Add Task"
    echo "3. Delete Task"
    echo "4. Exit"
    echo "========================"
}

# Function to view tasks
view_tasks() {
    if [[ ! -f $TODO_FILE ]] || [[ ! -s $TODO_FILE ]]; then
        echo "No tasks found. Add some tasks!"
    else
        echo "Your Tasks:"
        nl -w 2 -s '. ' $TODO_FILE
    fi
}

# Function to add a task
add_task() {
    read -p "Enter the new task: " task
    if [[ -n $task ]]; then
        echo "$task" >> $TODO_FILE
        echo "Task added successfully!"
    else
        echo "Task cannot be empty!"
    fi
}

# Function to delete a task
delete_task() {
    view_tasks
    if [[ -f $TODO_FILE ]] && [[ -s $TODO_FILE ]]; then
        read -p "Enter the task number to delete: " task_num
        if [[ $task_num =~ ^[0-9]+$ ]]; then
            sed -i "${task_num}d" $TODO_FILE && echo "Task deleted successfully!" || echo "Invalid task number!"
        else
            echo "Invalid input. Please enter a valid number."
        fi
    fi
}

# Main program loop
while true; do
    display_menu
    read -p "Choose an option [1-4]: " choice
    case $choice in
        1) view_tasks ;;
        2) add_task ;;
        3) delete_task ;;
        4) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid choice. Please try again." ;;
    esac
done

