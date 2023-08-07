In today's challenge, we were tasked with creating a shell script that automates the deployment of docker containers into two remote client servers. 

I have created below shell scripts in order to execute tasks for Day 7. 

```remote_execute.sh``` - Remotely executes commands to all the remote client servers

```secure_transfer.sh``` - To transfer files etc.. from main server to remote client servers

```deploy_app.sh```  - To run deployment-related commands in the remote client servers

There is one output file that was generated while executing remote_execute.sh script: ```remote_execute_output.txt```


Please find below screenshots:

1. Instances defined:
   

   <img width="647" alt="Screenshot 2023-08-07 at 12 06 03 AM" src="https://github.com/bwarikoo/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/32089999/f9eac82e-59d7-4b8f-a3ce-2ce956d8f25f">

3. Secure transfer script execution and validation:
   

   <img width="725" alt="Screenshot 2023-08-07 at 1 36 20 AM" src="https://github.com/bwarikoo/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/32089999/4cc38794-86f3-4c73-8505-6060512488c8">

   <img width="561" alt="Screenshot 2023-08-07 at 1 35 43 AM" src="https://github.com/bwarikoo/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/32089999/9f6aefb7-8466-434c-bbda-5f0eae8d5181">

5. Application deployment execution and validation:
   
   
   <img width="906" alt="Screenshot 2023-08-07 at 2 07 44 AM" src="https://github.com/bwarikoo/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/32089999/701caaa3-257a-47cc-ba24-10e5854a94d9">

   <img width="1249" alt="Screenshot 2023-08-07 at 2 08 58 AM" src="https://github.com/bwarikoo/BashBlaze-7-Days-of-Bash-Scripting-Challenge/assets/32089999/9d64eaf4-4e05-488e-a910-63bfa153a835">
