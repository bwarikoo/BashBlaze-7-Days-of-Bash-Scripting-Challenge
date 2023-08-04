#!/bin/bash

# Task 1: Comments
# Comments are used to add notes and are ignored by the script during execution
# Comments start with "#"

# Task 2: Echo Command
echo "This is day 1 of BashBlaze Challenge"

# Task 3: Variables
# Defining two variables
a=3
b=5

# Task 4: Using Variables

sum=$(( $a + $b ))
echo $sum

# Task 5: Using Built-in Variables
echo "My present working directory is: $PWD"
echo "My home directory is located at: $HOME"
echo "Bash version I am using is: $BASH_VERSION"

# Task 6: Wildcards
echo "List down all the files (with .txt extension) present in the current working directory"
ls *.txt
