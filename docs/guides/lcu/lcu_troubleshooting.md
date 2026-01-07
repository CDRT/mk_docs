# Troubleshooting LSUClient

## Common Issues and Fixes

### 1. Missing Packages or Updates
If certain updates do not appear, try:
```powershell
# Force refresh and check again
Get-LSUpdate -All
```

### 2. Installer Errors
Some Lenovo packages may fail silently or require manual intervention. Check the `.Installer.Unattended` property:
```powershell
$updates = Get-LSUpdate
$updates | Format-Table Title, Installer
```
If `Unattended` is `$False`, the update may require user interaction.

### 3. Logging for Diagnostics
Enable verbose logging and capture output:
```powershell
Install-LSUpdate -Verbose | Tee-Object -FilePath 'C:\Logs\LSUClient-Troubleshooting.log'
```

### 4. Network Issues
Ensure Lenovo servers are reachable and firewall rules allow PowerShell scripts to download packages.

### 5. GitHub Issues
Refer to the [LSUClient GitHub repository](https://github.com/jantari/LSUClient/issues) for known problems and fixes.

*This Markdown was generated from the LSUClient Troubleshooting page.*
