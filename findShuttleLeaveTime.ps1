$raw=import-csv .\ShuttleScheduleSourcenew.csv
$AppointmentRawInput=Read-Host -Prompt 'Appointment Time'
$Appointment=[datetime]$AppointmentRawInput
#$TimeToLeave=$raw | Where-Object { ($Appointment - ((([datetime]$_.'GENERAL-DEPARTURE-TIME'))).totalminutes -ge 15) -and ($Appointment - (([datetime]$_.'GENERAL-DEPARTURE-TIME'))).totalminutes -lt 45} 
$TimeToLeave=($raw | where-Object { (($appointment - (((([datetime]$_.'GENERAL-DEPARTURE-TIME'))))).totalminutes -ge 15) -and (($appointment - (((([datetime]$_.'GENERAL-DEPARTURE-TIME'))))).totalminutes -lt 45)}  | Sort-Object -Property 'GENERAL-DEPARTURE-TIME')[0]
#
$TimeToGoForShuttle=([datetime]($timetoleave.'CIVIC-DEPARTURE-TIME')).addminutes(-45)
$Now=get-date
[pscustomobject]@{'CurrentTime'=(get-date -f 'hh:mm:ss');'LeaveLodge'=$TimeToGoForShuttle;'LeaveCivic'=$TimeToLeave.'CIVIC-DEPARTURE-TIME';'ArrivalAtGeneral'=$TimeToLeave.'GENERAL-DEPARTURE-TIME'}

