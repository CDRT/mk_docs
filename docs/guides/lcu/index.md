# Lenovo.Client.Update

This PowerShell module is provided to assist in managing Lenovo driver, BIOS/UEFI, and firmware updates. This module is part of the growing library of Lenovo PowerShell modules and scripts that include:

- Lenovo.Client.Scripting
- Lenovo.Bios.Config
- ThinkBiosConfigUI.ps1
- Lenovo.Bios.Certificates
- LnvBiosCertInterface.ps1


## Requirements

- Windows 10 or Windows 11
- PowerShell 5.0 or later
- Administrator rights

## Quick Start

```powershell
Install-Module Lenovo.Client.Update #Installs the module from PS Gallery
Import-Module Lenovo.Client.Update -Force #Loads the module into the current session
$updates = Get-LnvUpdate #Finds applicable updates
$updates | Save-LnvUpdate -Path "C:\Updates" #Downloads the applicable updates
$updates | Install-LnvUpdate -Path "C:\Updates" #Installs the applicable updates
```

## Documentation

- [Installation](getting-started/installation.md)
- [Quick Start Guide](getting-started/quick-start.md)
- [LSU vs LCU](comparison.md)
- Commands
    - [Expand-LnvUpdate](functions/expand-lnvupdate.md)
    - [Get-LnvDownload](functions/get-lnvdownload.md)
    - [Get-LnvUpdate](functions/get-lnvupdate.md)
    - [Get-LnvUpdateConfiguration](functions/get-lnvupdateconfiguration.md)
    - [Get-LnvUpdateFromWmi](functions/get-lnvupdatefromwmi.md)
    - [Get-LnvUpdateHistory](functions/get-lnvupdatehistory.md)
    - [Get-LnvUpdatesRepo](functions/get-lnvupdatesrepo.md)
    - [Get-LnvUpdateSummary](functions/get-lnvupdatesummary.md)
    - [Install-LnvUpdate](functions/install-lnvupdate.md)
    - [Save-LnvUpdate](functions/save-lnvupdate.md)
    - [Set-LnvUpdateConfiguration](functions/set-lnvupdateconfiguration.md)

**Version**: 1.0.0
