$raw=import-csv .\ShuttleScheduleSourcenew.csv
[datetime]$Appointment=Read-Host -prompt 'Current Time'
$raw | Where-Object { ($Appointment - (([datetime]$_.'GENERAL-DEPARTURE-TIME'))).totalminutes -lt 0 } | Select-object 'GENERAL-DEPARTURE-TIME' | out-gridview 

