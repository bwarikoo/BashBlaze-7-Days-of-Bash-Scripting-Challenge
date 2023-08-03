#!/bin/bash

# Day 4 of TWSBashBlazeChallenge
# Part 1: Monitoring a specific process on a Linux System

# Function to check if the process is running
function check_status() {
        target_process=$1
        status_output=$(systemctl status "$target_process" 2>&1)
        if [ $? -eq 0 ]
        then
                echo "Process $target_process is running!"
                echo $status_output
                return 0
        else
                echo "Process $target_process is not running!"
                return 1
        fi
}

# Function to restart a process
function restart_process() {
        target_process=$1
        total_attempts=$2
        for ((i=1; i<=$total_attempts; i++)) 
        do
                echo "Attempt $i to restart process $target_process"
                systemctl restart $target_process
                # Wait for a couple of seconds before checking if the process has started
                sleep 1
                if check_status "$target_process" 
                then
                        echo "Process $target_process restarted successfully!"
                        return 0
                fi
        done
        echo "Unable to restart process $process_name after $total_attempts attempts"
        return 1
}

# Validating if the process name has been declared by the user as a command line argument
if [ $# -eq 0 ]
then
        echo "Process Name missing!"
        echo "USAGE: $0 <process_name>"
fi

target_process=$1
attempts=3

if check_status "$target_process"
then
        exit 0
else
        restart_process "$target_process" "$attempts"
fi
