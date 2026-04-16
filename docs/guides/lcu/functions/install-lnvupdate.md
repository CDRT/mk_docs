---
title: Install-LnvUpdate
description: Install a Lenovo update package and download it if not previously downloaded
---

# Install-LnvUpdate

Installs Lenovo update packages on the local system.

## Synopsis

Installs Lenovo driver, BIOS, firmware, and application update packages. Packages are downloaded automatically if not already present locally.

## Syntax

```powershell
Install-LnvUpdate [-Package] <PSObject> [-Path <DirectoryInfo>]
                  [-SaveBIOSUpdateInfoToRegistry] [-SkipSignatureCheck]
                  [-ExportToWMI] [-Proxy <Uri>] 
                  [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
```

## Description

`Install-LnvUpdate` executes Lenovo update packages on the local computer. The function:

- Automatically downloads packages not yet cached locally
- Supports digital signature verification for security
- Can export installation history to WMI for audit trails
- Logs BIOS update information to the Windows registry for tracking
- Reports installation status and exit codes

Requires administrative privileges on the local computer.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Package` | PSObject | Package(s) from `Get-LnvUpdate` (accepts pipeline input) |
| `-Path` | DirectoryInfo | Directory containing cached packages |
| `-SaveBIOSUpdateInfoToRegistry` | switch | Write BIOS update details to registry for tracking |
| `-SkipSignatureCheck` | switch | Bypass digital signature verification (not recommended) |
| `-ExportToWMI` | switch | Export installation history to WMI for compliance reporting |
| `-Proxy` | Uri | Proxy server URL |
| `-ProxyCredential` | PSCredential | Proxy authentication credentials |
| `-ProxyUseDefaultCredentials` | switch | Use current user credentials for proxy |

## Examples

### Example 1: Install applicable updates

```powershell
$updates = Get-LnvUpdate
$updates | Install-LnvUpdate -Verbose
```

Retrieves needed updates and installs them with verbose output.

### Example 2: Install only unattended packages

```powershell
$updates = Get-LnvUpdate | Where-Object { $_.Installer.Unattended }
$updates | Install-LnvUpdate -Verbose
```

Installs only packages that support silent/unattended installation.

### Example 3: Install with BIOS registry tracking

```powershell
$updates = Get-LnvUpdate
$updates | Install-LnvUpdate -SaveBIOSUpdateInfoToRegistry -Verbose
```

Installs updates and records BIOS information to registry for tracking.

### Example 4: Complete pipeline with caching and WMI export

```powershell
Get-LnvUpdate | `
  Where-Object { $_.Installer.Unattended } | `
  Save-LnvUpdate -Path "C:\Updates" | `
  Install-LnvUpdate -SaveBIOSUpdateInfoToRegistry -ExportToWMI -Verbose
```

Complete workflow: discover, download, and install, with history tracking.

### Example 5: Install cached packages for deployment

```powershell
$updates = Get-LnvUpdate -Repository "C:\Cached\Updates"
$updates | Install-LnvUpdate -Path "C:\Cached\Updates" -Verbose
```

Installs packages from a pre-built local repository.

## Output

Returns a `PackageInstallResult` object with properties:

- `PackageID` - Unique identifier
- `Title` - Package name
- `Status` - Installation result (Success, Failed, Skipped)
- `ExitCode` - Installation program exit code
- `ActionNeeded` - Whether reboot or other action is required
- `Message` - Details or error information
- `Duration` - How long the installation took

## Notes

### Administrative Requirements

Installation of drivers, firmware, and BIOS updates requires running PowerShell as Administrator. Interactive User Account Control (UAC) prompts may appear.

### Unattended Deployment

When deploying via SCCM, MDT, or remote PowerShell:

```powershell
# Always filter for unattended packages
$updates = Get-LnvUpdate | Where-Object { $_.Installer.Unattended }
$updates | Install-LnvUpdate
```

Interactive installers may hang deployments waiting for user input.

### System Reboots

- Check the `ActionNeeded` property in the result object
- Some packages may require system reboots or shutdowns
- BIOS updates typically require reboots
- Plan update schedules accordingly

### BIOS Update Registry Keys

When `-SaveBIOSUpdateInfoToRegistry` is used, the following registry key is updated:

```
HKLM\Software\LenovoUpdate\BIOSUpdate
  - Version      : BIOS version installed
  - InstallDate  : Date and time of installation
  - ActionNeeded : Whether reboot/shutdown is required
```

### WMI Export for Compliance

When `-ExportToWMI` is used, installation history is written to:

```
root\Lenovo\Lenovo_Updates class
```

This enables audit trails and compliance reporting through enterprise management tools.

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Save-LnvUpdate](save-lnvupdate.md)
- [Expand-LnvUpdate](expand-lnvupdate.md)
- [Get-LnvUpdateHistory](get-lnvupdatehistory.md)
- [Get-LnvUpdateFromWmi](get-lnvupdatefromwmi.md)
