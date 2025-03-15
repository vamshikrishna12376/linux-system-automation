#!/bin/bash
# manage_users.sh - Automate user management in Linux

LOG_FILE="/var/log/user_management.log"

echo "========== User Management Script =========="

echo "Choose an option:"
echo "1. Add User"
echo "2. Delete User"
echo "3. Exit"
read -p "Enter choice [1-3]: " choice

case $choice in
    1)
        read -p "Enter new username: " username
        if id "$username" &>/dev/null; then
            echo "User '$username' already exists!" | tee -a "$LOG_FILE"
        else
            sudo useradd -m -s /bin/bash "$username"
            echo "User '$username' created successfully." | tee -a "$LOG_FILE"
        fi
        ;;
    2)
        read -p "Enter username to delete: " username
        if id "$username" &>/dev/null; then
            sudo userdel -r "$username"
            echo "User '$username' deleted successfully." | tee -a "$LOG_FILE"
        else
            echo "User '$username' does not exist!" | tee -a "$LOG_FILE"
        fi
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option! Please choose 1, 2, or 3."
        ;;
esac

