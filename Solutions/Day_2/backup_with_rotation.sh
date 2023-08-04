#!/bin/bash

# Part 2: Directory Backup with Rotation

# Passing the command line argument as the value for variable "source_path"
source_path=$1

# Validating if the source path has been passed as a command line argument
if [ -z "$source_path" ]
then
        echo "Please enter the valid source path on the next execution"
        break
fi

# Define target backup directory
target_path="$source_path/backup"

# Create the target_path directory
mkdir $target_path

# Define variables for the backup folder
backup_folder="backup_$(date +"%Y-%m-%d_%H-%M-%S")"
backup_path=$target_path/$backup_folder

# Taking backup
rsync -av --exclude='backup/' $source_path/ $backup_path/

echo "Backup created: ${backup_path}"

# Implement a rotation mechanism to keep only the last 3 backups

cd $target_path 
count=$( ls -l | grep 'backup_*' | wc -l )

# Checking the total number of backup folders present
if [ $count -gt 3 ]
then
        reduce_count=$(( $count - 3 ))
        echo "Cleaning up the Backup folder"
        ls -lt | tail -n $reduce_count | awk '{print $9}' | xargs rm -rf
fi
