# Lenovo.Client.Update

PowerShell module for managing Lenovo driver, BIOS/UEFI, and firmware updates.

## Features

- Driver, BIOS/UEFI, firmware, and utility updates
- Silent/unattended installation
- Proxy support with authentication
- Custom repository support
- Digital signature verification
- Registry tracking for BIOS updates
- SCCM, Intune, MDT, PDQ integration

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
- [Proxy & Repositories](topics/proxy-configuration.md)
- [Signature Verification](topics/signature-verification.md)

**Version**: 1.0.0
