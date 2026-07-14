---
title: Lenovo.Client.Update
description: PowerShell module for managing Lenovo driver, BIOS/UEFI, and firmware updates
---

# Lenovo.Client.Update

This PowerShell module is provided to assist in managing Lenovo driver, BIOS/UEFI, and firmware updates. It is based on the LSU Client community solution available on GitHub. This module is part of the growing ThinkVantage PowerShell Library which is a collection of PowerShell modules and scripts for managing Lenovo commercial PCs.

## Requirements

- Windows 10 or Windows 11
- PowerShell 5.0 or later
- Administrator rights

## Documentation

### Getting Started

- [Installation](getting-started/installation.md)
- [Quick Start Guide](getting-started/quick-start.md)
- [LSU vs LCU](comparison.md)

### Core Commands

- [Get-LnvUpdate](functions/get-lnvupdate.md)
- [Get-LnvDownload](functions/get-lnvdownload.md)
- [Save-LnvUpdate](functions/save-lnvupdate.md)
- [Install-LnvUpdate](functions/install-lnvupdate.md)
- [Expand-LnvUpdate](functions/expand-lnvupdate.md)

### Configuration & History

- [Get-LnvUpdateConfiguration](functions/get-lnvupdateconfiguration.md)
- [Set-LnvUpdateConfiguration](functions/set-lnvupdateconfiguration.md)
- [Get-LnvUpdateHist](functions/get-lnvupdatehist.md)
- [Get-LnvUpdateFromWmi](functions/get-lnvupdatefromwmi.md)

### Repository Management

- [Get-LnvUpdatesRepo](functions/get-lnvupdatesrepo.md)
- [Get-LnvUpdateSummary](functions/get-lnvupdatesummary.md)

## Version History

- 1.0.4 - July 14, 2026:
    - Signed Lenovo.Client.Update.Types.dll
    - Added detailed Comment Help for Expand-LnvUpdate
    - Added file signature checking to Get-LnvDownload including a -SkipSignatureCheck parameter
- 1.0.3 - July 1, 2026:
    - Reorganized how classes and custom types are defined to address an error being thrown in Install-LnvUpdate
    - Removed the downloading of update installer executables in Get-LnvUpdate. This cmdlet assesses current updates to determine applicability and it was unnecessary to download the installer executables. The installers will be installed when calling Save-LnvUpdate or Install-LnvUpdate when you pass the list of applicable updates from Get-LnvUpdate.
    - Added file signature checking to Save-LnvUpdate since the downloading of the update installer exectuable was removed from Get-LnvUpdate. Added -SkipSignatureCheck switch parameter.
- 1.0.2 - June 17, 2026:
    - Bug fix due to lines being removed incorrectly causing error in dependency checking

- 1.0.1 - June 11, 2026:
    - Changed the Registry Key location for BIOS update details to `HKLM\SOFTWARE\LenovoUpdate\BIOSUpdate`

- 1.0.0 - April 07, 2026:
    - Initial release
