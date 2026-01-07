# Advanced Usage of LSUClient

## Using Parameters for Fine Control
LSUClient cmdlets support various parameters to customize behavior:

- `-All` : Retrieve all updates, not just recommended ones.
- `-Model` : Specify a model identifier to filter updates.
- `-Path` : Define a custom download directory for packages.

### Example: Download updates for a specific model
```powershell
Get-LSUpdate -Model '20LS' -All | Save-LSUpdate -Path 'C:\Drivers\20LS' -ShowProgress
```

## Automating with Scheduled Tasks
You can automate update checks and installations by creating scheduled tasks that run PowerShell scripts using LSUClient.

### Example: Create a scheduled task
```powershell
$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-File C:\Scripts\UpdateLenovo.ps1'
$trigger = New-ScheduledTaskTrigger -Daily -At 3am
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName 'LenovoUpdateTask' -Description 'Automated Lenovo updates using LSUClient'
```

## Logging and Diagnostics
Enable verbose logging to troubleshoot issues:
```powershell
Install-LSUpdate -Verbose | Tee-Object -FilePath 'C:\Logs\LSUClient.log'
```

*This Markdown was generated from the LSUClient Advanced Usage page.*
