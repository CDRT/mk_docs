---
title: Get-LnvUpdateSummary
description: Get a summary of Lenovo updates
---

# Get-LnvUpdateSummary

Displays a summary of available, needed, and installed Lenovo updates organized by category.

## Synopsis

Generates a summary report of update status including counts by category and installation status.

## Description

`Get-LnvUpdateSummary` analyzes available updates and produces a summary report showing:

- Total number of available updates
- Count of updates needed (applicable but not installed)
- Count of updates already installed
- Breakdown by category (Driver, BIOS, Firmware, etc.)
- Breakdown by severity (Critical, Recommended, Optional)

This is useful for understanding the update landscape for a system without detailed package listings.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Updates` | PSObject | Update object(s) from `Get-LnvUpdate` (accepts pipeline input) |

## Examples

### Example 1: Get update summary for current system

```powershell
$updates = Get-LnvUpdate
$updates | Get-LnvUpdateSummary
```

Retrieves needed updates and displays a summary report.

### Example 2: Get summary for all available updates

```powershell
Get-LnvUpdate -All | Get-LnvUpdateSummary
```

Shows a summary including all packages, not just needed ones.

### Example 3: Get summary and display as table

```powershell
Get-LnvUpdate | Get-LnvUpdateSummary | Format-Table
```

Formats the summary in table view for better readability.

### Example 4: Get summary for different computer model

```powershell
Get-LnvUpdate -Model '21HM' -All | Get-LnvUpdateSummary
```

Analyzes available updates for a different ThinkPad model.

## Output

Returns a summary object with properties such as:

- `TotalAvailable` - Total number of packages available
- `TotalNeeded` - Number of packages needed (applicable but not installed)
- `TotalInstalled` - Number of packages already installed
- `ByCategory` - Breakdown by type (Driver, BIOS, Firmware, etc.)
- `BySeverity` - Breakdown by severity (Critical, Recommended, Optional)
- `RebootRequired` - Count of updates that require system reboot

## Notes

- Summary is calculated from the input update objects
- Pass pipeline input from `Get-LnvUpdate` to get accurate results
- Use `-All` parameter with `Get-LnvUpdate` to include already-installed packages in the summary

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Get-LnvUpdateHistory](get-lnvupdatehistory.md)
- [Get-LnvUpdateFromWmi](get-lnvupdatefromwmi.md)
