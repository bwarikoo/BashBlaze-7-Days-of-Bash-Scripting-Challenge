#!/bin/bash

# Day 4 of TWSBashBlazeChallenge
# Part 2: Monitoring Metrics with Sleep Mechanism

# Function for system metrics
function system_metrics() {
        # CPU Utilization
        cpu_utilization=$(mpstat 1 1 | awk '/^Average:/ {print 100-$NF}') 
        # Memory Usage
        mem_usage=$(free | grep Mem | awk '{print $3/$2 * 100}')
        # Disk Space Usage
        disk_usage=$(df -H | awk '$6=="/"{print $5}')
        # Displaying Metrics
        echo "CPU Usage = $cpu_utilization%    Memory Usage = $mem_usage%    Disk Usage = $disk_usage"
        sleep_interval=2
        sleep $sleep_interval
}

# Function to check status of any service
function service_status_check() {
        read -p "Enter the name of the service to monitor: " svc_name
        status_output=$(systemctl status "$svc_name" 2>&1)
        if [ $? -eq 0 ]
        then
                echo "Service $svc_name is running!"
        else
                echo "Service $svc_name is not running!"
                read -p "Do you want to start $svc_name? (Y/N): " selection
                if [[ $selection =~ ^[Yy]$ ]]
                then
                        echo "Starting the service $svc_name!"
                        systemctl start "$svc_name" 
                else
                        echo "As requested, service $svc_name not started!"
                fi
        fi
}

# Function for the main menu
function main_menu() {
        echo " ---- Monitoring Metrics Script Options ---- "
        echo "1 --> View System Metrics"
        echo "2 --> Monitor a Specific Service"
        echo "3 --> Exit"
        read -p "Please specify your option: " option
        case $option  in
                1)
                system_metrics
                while true 
                do
                        echo "Press enter to continue or Press 1 for the Main Menu"
                        read -p "Your choice please: " temp
                        if [ "$temp" == "1" ]
                        then
                                main_menu
                        else
                                system_metrics
                        fi
                done
                ;;
                2)
                service_status_check
                sleep 1
                main_menu
                ;;
                3)
                echo "**Exiting the Script!**"
                exit
                ;;
                *)
                echo "Please make a valid selection"
                main_menu
                ;;
        esac
}

main_menu
