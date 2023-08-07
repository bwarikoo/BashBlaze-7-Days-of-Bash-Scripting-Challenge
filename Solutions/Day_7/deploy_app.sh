#!/bin/bash

# Script to run the Docker container for the node application and setting Reverse Proxy with Nginx
# Author: Bakul Warikoo

# Load the tar file of the Docker image

echo "Loading the docker image for the node application..."
sudo docker load -i image.tar
echo "Docker image successfully loaded!"

# Running the Docker container for the node application
docker run -d -p 8000:8000 "node-app:1.0"

# Setting up Reverse Proxy with Nginx
nginx_directory="/etc/nginx/sites-available"
# creating a new config file
sudo nano $nginx_directory/proxy_nodeapp

server_name="18.204.201.2"
proxy_pass_port="8000"

cat << EOF | sudo tee /etc/nginx/sites-available/node-app-proxy
server {
    listen 80;
    server_name $server_name;

    location / {
        proxy_pass http://127.0.0.1:$proxy_pass_port;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOF

# Create a symbolic link to enable the new configuration
sudo ln -s /etc/nginx/sites-available/node-app-proxy /etc/nginx/sites-enabled/

# Restart nginx service
sudo systemctl restart nginx
