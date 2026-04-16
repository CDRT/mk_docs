---
title: Get-LnvUpdateFromWmi
description: Retrieve update information from Windows Management Instrumentation (WMI)
---

# Get-LnvUpdateFromWmi

Queries Lenovo update information from the WMI repository on the local or remote computer.

## Synopsis

Retrieves update information stored in WMI by the Install-LnvUpdate cmdlet using the `root\Lenovo\Lenovo_Updates` class.

## Syntax

```powershell
Get-LnvUpdateFromWmi [-ComputerName <string>] [-Status <string>] 
                     [-Severity <string>] [-IncludeHistory]
```

## Description

`Get-LnvUpdateFromWmi` queries the Lenovo_Updates WMI class to retrieve update installation records. This is useful for auditing, compliance reporting, and verifying installation history across systems.

Results can be filtered by status (Applicable, Installed, NotApplicable) and severity level. The `-IncludeHistory` parameter retrieves the last 10 installation records for historical tracking.

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `-ComputerName` | string | $env:COMPUTERNAME | Local or remote computer name |
| `-Status` | string | - | Filter by status: `Applicable`, `Installed`, `NotApplicable` |
| `-Severity` | string | - | Filter by severity: `Critical`, `Recommended`, `Optional` |
| `-IncludeHistory` | switch | - | Include last 10 installation records |

## Examples

### Example 1: Query local computer updates

```powershell
Get-LnvUpdateFromWmi
```

Retrieves all update entries from the local computer.

### Example 2: Query only applicable updates

```powershell
Get-LnvUpdateFromWmi -Status Applicable
```

Filters for updates that are applicable but not yet installed.

### Example 3: Query critical updates on remote computer

```powershell
Get-LnvUpdateFromWmi -ComputerName COMPUTER01 -Severity Critical
```

Retrieves critical-severity updates from a remote system.

### Example 4: Include installation history

```powershell
Get-LnvUpdateFromWmi -IncludeHistory | Select-Object Title, InstallDate, Status
```

Retrieves current status plus last 10 installation records.

## Output

Returns WMI objects with properties such as:

- `Title` - Update package name
- `Version` - Package version
- `Status` - Current status (Applicable, Installed, NotApplicable)
- `Severity` - Update severity level
- `Size` - Package size in bytes
- `InstallDate` - Installation date and time
- `Message` - Additional status or error information

## Notes

- WMI queries use the `root\Lenovo\Lenovo_Updates` namespace
- Remote queries require appropriate WMI permissions on the target computer
- History limited to 10 most recent entries when `-IncludeHistory` is used
- Color-coded console output: Cyan (queries), Green (success), Yellow (headers), Gray (details)

## See Also

- [Get-LnvUpdateHistory](get-lnvupdatehistory.md)
- [Install-LnvUpdate](install-lnvupdate.md)
- [Get-LnvUpdateSummary](get-lnvupdatesummary.md)
