#!/bin/bash

# TWSBashBlazeChallenge Day 5 : Log Analyzer and Report Generator

# Check if the log file path has been passed as a command line argument
if [ $# -eq 0 ]
then
        echo "Please provide the log file path during execution of the script."
        echo "USAGE: $0 <logfilepath>"
fi

# Defne variable for the log file path
log_file=$1

# Verify if the log file path is valid
if [ ! -f $log_file ]
then
        echo "ERROR: Log file not present: $log_file"
        exit 1
fi

# Function for Error/Failed entries in the Log File
function error_count() {
    error_count=$(grep -i "Error\|Failed" $log_file | wc -l)
}

# Function to print critical events
function critical_events() {
    critical_events=$(grep -i -n "Critical" $log_file)
}

# Function to extract top 5 common error messages
function common_errors() {
    count=5
    error_messages=$(grep -i "Error" "$log_file" | sort | uniq -c)
    frequent_errors=$(echo "$error_messages" | sort -rn | head -n $count)
}

# Run the functions defined above
error_count
critical_events
common_errors

# Counting total number of lines in the Log File
total_lines=$(wc -l < "$log_file")

# Define timestamp
timestamp=$(date "+%Y-%m-%d_%H-%M-%S")

# Define Summary Report File
summary_report="summary_report_$timestamp.txt"

# Write the summary report
cat <<EOF > "$summary_report"

Date of Analysis - $timestamp

Log file: $log_file

Total lines processed: $total_lines

Total error count: $error_count

Top 5 Error Messages:
$frequent_errors

List of Critical Events with Line Numbers:
$critical_events

EOF

echo "Summary report generated: $summary_report"

# Create an archive directory if it doesn't exist
archive_dir="archive_logs"
mkdir -p "$archive_dir"

# Move the processed log file to the archive directory
mv "$log_file" "$archive_dir/"

echo "Log file archived at location: $archive_dir"
