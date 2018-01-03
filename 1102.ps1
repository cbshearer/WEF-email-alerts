## email event out
## Chris Shearer
## 8/1/2017
## v1.0
## Modify the first 3 variables to suit your environment

$to   = "WEF_alerts@your.com" ## email address the alert is sent to 
$from = "WEF_alerts@your.com" ## email address the alert is sent from
$smtp = "888.888.888.888"	  ## SMTP server the system running the script is allowed to use for a relay

$subj = "Security: WEF eid 1102 - Local Security Event Log Cleared"		## subject of the email being sent
$file = "c:\temp\event_1102_$(get-date -f yyyy-MM-dd_h-m-ss_tt).txt"	## temporary file name (includes timestamp)

## export the most recent event to the temp file
    wevtutil qe ForwardedEvents /q:"*[System[(EventID=1102)]]" /c:1 /f:text /rd:true > $file

## convert the temporary file to a string and store as the $body variable
    $body = get-content -path $file | Out-String

## delete the temporary file
    del $file

## send the mail message
    send-mailmessage -to $to -from $from -Subject $subj -Body $body -SmtpServer $smtp
