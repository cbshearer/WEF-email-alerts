# WEF-email-alerts
This script combined with a scheduled task will email the alert an address you specify in this script. Download the .ps1 file and save to the system that will be running the script. In my examples I will use "c:\scripts\" as the scripts directory

Configuring the Scheduled Task:

1) Launch Task Scheduler
  a) I recommend right-clicking Task Scheduler Library and creating a new folder for your WEF tasks.
2) Right click the folder you want to create the task in and choose 'Create Task...'
  a) Name - 1102 in this case
  b) Check 'Run whether the user is logged on or not'
  c) Triggers Tab - New... > 'On an event' > Basic 
    i)    Log: 'Forwarded Events'
    ii)   Source: (null)
    iii)  Event ID: 1102
  d) Actions tab, press the 'New...' button.
    i)    Action: Start a program
    ii)   Program/Script: powershell
    iii)  Add arguments: -file "c:\scripts\1102.ps1"
3) Accept the remaining task defaults or configure them to your liking
