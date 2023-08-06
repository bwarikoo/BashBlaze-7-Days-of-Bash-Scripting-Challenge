#!/bin/bash

# Welcome to the Mysterious Script Challenge!
# Your task is to unravel the mystery behind this script and understand what it does.
# Once you've deciphered its objective, your mission is to improve the script by adding comments and explanations for clarity.

# DISCLAIMER: This script is purely fictional and does not perform any harmful actions.
# It's designed to challenge your scripting skills and creativity.

# Author: Bakul Warikoo

# The Mysterious Function
mysterious_function() {
    local input_file="$1"
    local output_file="$2"
    
    # The "tr" command takes the content of the file specified by the variable $input_file, translates all the letters using the Caesar cipher with a shift of 13, and then writes the translated content to the file specified by the variable $output_file. 
    # This effectively performs a ROT13 encryption/decryption on the content of the input file and saves the result in the output file.
    tr 'A-Za-z' 'N-ZA-Mn-za-m' < "$input_file" > "$output_file"

    # The "rev" command takes the content of the file specified by the variable "$output_file".
    # Reverses the characters in each line of that file, and then writes the reversed content to a new file named "reversed_temp.txt". 
    rev "$output_file" > "reversed_temp.txt"

    # Generates a random number between 1 and 10 and assigns it to the variable "random_number". 
    # Each time you run this line, it will produce a different random number within the specified range.
    random_number=$(( ( RANDOM % 10 ) + 1 ))

    # Mystery loop: 
    # The loop runs "random_number" times.
    # It operates exclusively on "reversed_temp.txt" without modifying the "output_file".
    # Within the loop, text manipulation on "reversed_temp.txt" takes place.
    for (( i=0; i<$random_number; i++ )); do
        # Uses "rev" command to write lines in "reversed_temp.txt" into "temp_rev.txt" by reversing order of letters in each line.
        # Hence, it contains the original content from "output_file"
        rev "reversed_temp.txt" > "temp_rev.txt"

        # The "tr" command takes the content of the file "temp_rev.txt", performs a ROT13 encryption on it, and writes the encrypted content to the file "temp_enc.txt". 
        # The "temp_rev.txt" file remains unchanged.
        tr 'A-Za-z' 'N-ZA-Mn-za-m' < "temp_rev.txt" > "temp_enc.txt"

        # Using "mv" command, rename "temp_enc.txt" to "reversed_temp.txt".
        mv "temp_enc.txt" "reversed_temp.txt"
    done

    # Clean up temporary files
    rm "temp_rev.txt"

    # The mystery continues...
    # The script will continue with more operations that you need to figure out!
}

# Main Script Execution

# Check if two arguments are provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

input_file="$1"
output_file="$2"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
    echo "Error: Input file not found!"
    exit 1
fi

# Call the mysterious function to begin the process
# Calling the function in order to encrypt the content of $input_file and save it in the $output_file.
mysterious_function "$input_file" "$output_file"

# Display the mysterious output
echo "The mysterious process is complete. Check the '$output_file' for the result!"
