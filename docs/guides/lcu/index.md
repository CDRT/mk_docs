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
- [Quick Start Guide](getting-started/quick-start.md)
- [LSU vs LnvUpdate](comparison.md)
- Commands
    - [Expand-LnvUpdate](functions/expand-lnvupdate.md)
    - [Get-LnvDownload](functions/get-lnvdownload.md)
    - [Get-LnvUpdate](functions/get-lnvupdate.md)
    - [Get-LnvUpdateConfiguration](functions/get-lnvupdateconfiguration.md)
    - [Get-LnvUpdateFromWmi](functions/get-lnvupdatefromwmi.md)
    - [Get-LnvUpdateHist](functions/get-lnvupdatehist.md)
    - [Get-LnvUpdatesRepo](functions/get-lnvupdatesrepo.md)
    - [Get-LnvUpdateSummary](functions/get-lnvupdatesummary.md)
    - [Install-LnvUpdate](functions/install-lnvupdate.md)
    - [Save-LnvUpdate](functions/save-lnvupdate.md)
    - [Set-LnvUpdateConfiguration](functions/set-lnvupdateconfiguration.md)

**Version**: 1.0.0
