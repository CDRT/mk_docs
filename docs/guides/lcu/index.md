# Lenovo.Client.Update

PowerShell module for managing Lenovo driver, BIOS/UEFI, and firmware updates.


## Requirements

- Windows 10 or Windows 11
- PowerShell 5.0 or later
- Administrator rights

## Quick Start

```powershell
Import-Module LnvUpdate
$updates = Get-LnvUpdate #Finds applicable updates
$updates | Save-LnvUpdate -Path "C:\Updates" #Downloads the applicable updates
$updates | Install-LnvUpdate #Installs the applicable updates
```

## Documentation

- [Installation](getting-started/installation.md)
- [Commands](functions/get-lnvupdate.md)
- [LSU vs LnvUpdate](comparison.md)


**Version**: 1.0.0
