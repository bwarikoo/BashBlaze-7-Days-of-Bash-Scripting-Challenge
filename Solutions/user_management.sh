#!/bin/bash

# Defining create account function
function create_user() {
        # Prompt asking the user to enter the username to be created
        read -p "Enter the new user to be created: " username
        # Verifying if the username is already present in the system
        if id "$username" >/dev/null 2>&1
        then
                echo "User $username already exists. Please provide a valid username!"
        else
                # Adding a user and creating a home directory for the user
                useradd -m $username
                # Prompt asking the user to enter a password for the new username
                passwd $username
                echo "User $username has been successfully created!"
        fi
}

# Defining delete account function
function delete_user() {
        # Prompt asking the user to enter the username to be deleted
        read -p "Enter the username to be deleted: " username
        # Verifying if the username exists in the system
        if id "$username" >/dev/null 2>&1
        then
                # Deleting the user account
                userdel -r $username
                echo "User $username has been successfully deleted!"
        else
                echo "User $username does not exist in the system. Please provide a valid username!"
        fi
}

# Defining password reset function
function passwd_reset() {
        # Prompt asking the user to enter the username for which password needs to be reset
        read -p "Enter the username to reset password: " username
        # Verifying if the username exists in the system
        if id "$username" >/dev/null 2>&1
        then
                # Changing password
                passwd $username
                echo "Password has been successfully reset for the user $username"
        else
                echo "User $username does not exist in the system. Please provide a valid username!"
        fi
}

# Defining list user accounts function
function user_list() {
        echo "Listing User Accounts"
        # Extracting username, userID, and home directory
        cat /etc/passwd | awk -F: '{ print $1, "(UserID:", $3")", "(Home Directory:", $6")" }'
}

# Function for help and usage information
function display_usage() {
    echo "Usage: $0 [OPTIONS]"
    echo "Options:"
    echo "  -c, --create    Create a new user account"
    echo "  -d, --delete    Delete an existing user account"
    echo "  -r, --reset     Reset the password of an existing user account"
    echo "  -l, --list      List all user accounts"
    echo "  -h, --help      Display this help message"
}

case "$1" in
    -c|--create)
        create_user
        ;;
    -d|--delete)
        delete_user
        ;;
    -r|--reset)
        passwd_reset
        ;;
    -l|--list)
        user_list
        ;;
    -h|--help)
        display_usage
        ;;
    *)
        echo "Please enter a valid option"
        display_usage
        exit 1
        ;;
esac
