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
Get-LnvUpdateFromWmi [-Status <string>]
                     [-Severity <string>] 
```

## Description

`Get-LnvUpdateFromWmi` queries the Lenovo_Updates WMI class to retrieve update installation records. This is useful for auditing, compliance reporting, and verifying installation history across systems.

Results can be filtered by status (Applicable, Installed, NotApplicable) and severity level.

## Parameters

| Parameter | Type | Default | Description |
| --- | --- | --- | --- |
| `-Status` | string | - | Filter by status: `Applicable`, `Installed`, `NotApplicable` |
| `-Severity` | string | - | Filter by severity: `Critical`, `Recommended`, `Optional` |

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
Get-LnvUpdateFromWmi -Severity Critical
```

Retrieves critical-severity updates from a remote system.

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
- Color-coded console output: Cyan (queries), Green (success), Yellow (headers), Gray (details)

## See Also

- [Get-LnvUpdateHist](get-lnvupdatehist.md)
- [Install-LnvUpdate](install-lnvupdate.md)
- [Get-LnvUpdateSummary](get-lnvupdatesummary.md)
