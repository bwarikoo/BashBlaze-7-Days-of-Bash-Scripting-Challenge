#!/bin/bash

# Script to execute commands remotely on client instances
# Author: Bakul Warikoo

# Declaring array for client machines
client_instances=("ubuntu@54.87.56.20" "ubuntu@18.204.201.2")

# Installing Docker on client machines
for item in "${client_instances[@]}"
do
	echo "Doing SSH into the client machine and installing Docker"
	ssh "$item" "sudo apt-get update && sudo apt install -y docker.io && sudo systemctl start docker && sudo systemctl enable docker && sudo systemctl status docker"
done

# Modifying user permissions for running Docker commands
for item in "${client_instances[@]}"
do
	echo "Changing user permissions: user to be added into the "docker" group"
	ssh "$item" "sudo usermod -aG docker ubuntu"
done

# Setting up Nginx Reverse Proxy on client instances
for item in "${client_instances[@]}"
do
	echo "Installing Nginx on client instances"
	ssh "$item" "sudo apt install -y nginx && sudo systemctl start nginx && sudo systemctl enable nginx && sudo systemctl status nginx"
done

echo "Successfully executed commands on client servers remotely!"
