---
title: Get-LnvUpdateHistory
description: View the history of updates installed by the Lenovo.Client.Update module
---

# Get-LnvUpdateHistory

Retrieves the installation history of Lenovo updates on the system.

## Synopsis

Displays a complete history of Lenovo packages installed by Install-LnvUpdate, including installation dates, results, and package details.

## Description

`Get-LnvUpdateHistory` queries the update history stored locally in JSON files. Installation records include success/failure status, timestamps, package information, user details, and exit codes.

History data is retained indefinitely unless manually removed, making it useful for audit trails and compliance reporting.

## Parameters

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `-Status` | string | - | Filter by status: `Success`, `Failed`, `Skipped` |
| `-Category` | string | - | Filter by category: `Driver`, `BIOS`, `Firmware`, `Application`, etc. |
| `-Last` | int | - | Return only the last N records |

## Examples

### Example 1: View all update history

```powershell
Get-LnvUpdateHistory | Format-Table -Property InstallDate, Title, Status
```

Displays all update installations in table format.

### Example 2: View failed installations

```powershell
Get-LnvUpdateHistory -Status Failed
```

Shows only installation attempts that failed.

### Example 3: View BIOS update history

```powershell
Get-LnvUpdateHistory -Category BIOS | Format-Table -Property InstallDate, Title, Result
```

Filters for BIOS updates only.

### Example 4: View recent updates

```powershell
Get-LnvUpdateHistory | Where-Object { $_.InstallDate -gt (Get-Date).AddDays(-30) }
```

Retrieves updates installed in the past 30 days.

### Example 5: Get last 10 installations

```powershell
Get-LnvUpdateHistory -Last 10
```

Shows the 10 most recent update installations.

## Output

Returns an array of installation history objects with properties:

- `Timestamp` - Installation date and time
- `Status` - Result (Success, Failed, Skipped)
- `Title` - Update package title
- `Version` - Package version
- `Category` - Type (`Driver`, `BIOS`, `Firmware`, `Application`, etc.)
- `Type` - Package type code (0=Other, 1=Application, 2=Driver, 3=BIOS, 4=Firmware)
- `Severity` - Level (1=Critical, 2=Recommended, 3=Optional)
- `ExitCode` - Installation exit code
- `RebootRequired` - Whether reboot was needed
- `ComputerName` - System where update was installed
- `UserName` - User who performed installation
- `Message` - Additional details or error message
- `UpdateID` - Unique package identifier

## Notes

History storage location:
```
$env:ProgramData\Lenovo\Lenovo.Client.Update\History\InstallHistory-<timestamp>.json
```

History files are created automatically after each installation session. Records are retained for historical tracking and cannot be easily modified.

## See Also

- [Get-LnvUpdateSummary](get-lnvupdatesummary.md)
- [Install-LnvUpdate](install-lnvupdate.md)
- [Get-LnvUpdateFromWmi](get-lnvupdatefromwmi.md)
