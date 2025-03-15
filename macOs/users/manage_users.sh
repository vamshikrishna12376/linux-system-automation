#!/bin/bash
# manage_users.sh - Automate user management (creation & deletion) for macOS

ACTION=$1   # 'add' or 'delete'
USERNAME=$2 # Username to add or delete
PASSWORD=$3 # Optional password for new users

if [[ -z "$ACTION" || -z "$USERNAME" ]]; then
    echo "Usage: $0 <add|delete> <username> [password]"
    exit 1
fi

if [[ "$ACTION" == "add" ]]; then
    if id "$USERNAME" &>/dev/null; then
        echo "User $USERNAME already exists."
    else
        if [[ -z "$PASSWORD" ]]; then
            PASSWORD="defaultPassword123"
        fi
        sudo sysadminctl -addUser "$USERNAME" -password "$PASSWORD" -admin && echo "User $USERNAME created successfully."
    fi
elif [[ "$ACTION" == "delete" ]]; then
    if id "$USERNAME" &>/dev/null; then
        sudo sysadminctl -deleteUser "$USERNAME" && echo "User $USERNAME deleted successfully."
    else
        echo "User $USERNAME does not exist."
    fi
else
    echo "Invalid action. Use 'add' or 'delete'."
    exit 1
fi

