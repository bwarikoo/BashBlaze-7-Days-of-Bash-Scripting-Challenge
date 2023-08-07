#!/bin/bash

# Script to securely transfer files to the remote client machines
# Author: Bakul Warikoo

# Declaring array for client machines
client_instances=("ubuntu@54.87.56.20" "ubuntu@18.204.201.2")

# Creating directory on client machines where files will be copied
read -p "Please provide the directory path on client machine: " path
for item in "${client_instances[@]}"
do
	ssh "$item" "if [ ! -d $path ]; then mkdir -p $path; fi"
done

echo "The directory path on client machine is : $path"

# Copy docker image to the client machines
src_directory="/home/ubuntu/bashblazechallenge/Day_7"
for item in "${client_instances[@]}"
do
	scp "$src_directory/image.tar" "$item":"$path"
done
