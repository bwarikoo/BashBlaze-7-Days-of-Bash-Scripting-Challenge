#!/bin/bash

# Welcome to Day 2 of the BashBlazeChallenge
# Author: Bakul Warikoo

# Part 1: File and Directory Exploration

# Listing all files and directories in the current path

ls -ls


# For each file and directory, print its name and size in human-readable format

ls -lh | awk '{print $9,$5}'


# The list of files and directories will be displayed in a loop until the user decides to exit the explorer

while true;
do
        ls -lh | awk '{print $9,$5}'
        read -p "Press e to exit from the loop: " selection
        if [ $selection == e ]
        then
                echo "You have selected $selection hence, coming out of the loop"
                break
        fi
done

# Part 2: Character Counting

# After displaying the file and directory list, prompt the user to enter a line of text"
# The script will read the user's input until an empty string is entered (i.e., the user presses Enter without any text).
# For each line of text entered by the user, the script will count the number of characters in that line.
# The character count for each line entered by the user will be displayed.

while true;
do
        read -p "Enter a line of text: " text
        character_count=$(echo -n $text | wc -c)
        if [ $character_count -eq  0 ]
        then
                echo "Exiting the loop since empty string was passed"
                break
        else
                echo "Total number of characters: $character_count"
        fi
done
