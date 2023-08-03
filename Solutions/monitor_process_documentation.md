# Day 4 Part 1 Documentation 
# Monitor Process
# Reference Script: monitor_process.sh
# Author: Bakul Warikoo
# Date: 3rd August, 2023

For Part 1 of Day 4 in TWSBashBlazeChallenge, we had to create a script that will check if a certain process is running or not. In case it is in a stop state, it has to be restarted and a total of 3 attempts can be made while restarting a service. I have created a script that covers all of the above use cases.
The script efficiently monitors a specific process on a Linux system. The script's primary goal is to ensure the process is always running, and if it unexpectedly stops, it should be restarted automatically; saving precious time and preventing unnecessary disruptions.

Please refer to the script in the same repo named "monitor_process.sh" which details all the steps required to achieve this! Also, in order to automate this, I have created a cron job to run every 5 mins. This will ensure that the service is being monitored at regular intervals and in case the service goes down, the system will automatically try to bring it up. 

**Setting up Cron Job**

1. Open the Cron table for editing: ```crontab -e```
   
2. Add an entry to the Crontab file to specify the frequency of script execution. For example, run the script every 5 minutes.
   
   <img width="466" alt="Screenshot 2023-08-03 at 3 09 45 PM" src="https://github.com/bwarikoo/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/32089999/e4e7814c-9074-4137-8d48-2d9dc08c859f">
   
3. Save the file.

**Screenshots of script execution**
Take an example of service ```nginx```
It is in stop state and we will run the script to check the status of the nginx process.

<img width="1435" alt="Screenshot 2023-08-03 at 3 28 56 PM" src="https://github.com/bwarikoo/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/32089999/9d97817d-3aec-441b-84a1-3cccf84a1e36">

