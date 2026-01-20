# Lenovo.Client.Update

PowerShell module for managing Lenovo driver, BIOS/UEFI, and firmware updates.


## Requirements

- Windows 10 or Windows 11
- PowerShell 5.0 or later
- Administrator rights

## Quick Start

```powershell
Import-Module LnvUpdate
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate -Path "C:\Updates"
$updates | Install-LnvUpdate
```

## Documentation

- [Installation](getting-started/installation.md)
- [Commands](functions/get-lnvupdate.md)
- [LSU vs LnvUpdate](migration-guide.md)
- [Signature Verification](topics/signature-verification.md)

**Version**: 1.0.0
