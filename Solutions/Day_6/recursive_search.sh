#!/bin/bash

Author: Bakul Warikoo

if [ $# -ne 2 ]; then
  echo "Usage: ./recursive_search.sh <directory> <target_file>"
  exit 1
fi

search_directory=$1
target_file=$2

# Validate if the $search_directory exists or not.
if [[ -d $search_directory ]]
then
    echo "Hey there! We are searching for the $target_file in the $search_directory!" 
else
    echo "ERROR: $search_directory does not exist!"
    echo "Please provide a valid directory name during next execution!"
    exit
fi

# Search for the $target_file in a recursive way.
target_path=$(find ~+ $search_directory -type f -name $target_file)
if [[ $target_path ]]
then
  echo "$target_file found! File is located at path: $target_path"
  exit 0
fi

echo "File not found: $target_file"
exit 1
