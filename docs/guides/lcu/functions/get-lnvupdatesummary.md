# Get-LnvUpdateSummary

Get a summary of Lenovo updates.

## Synopsis

Displays a summary of available and installed Lenovo updates.

## Description

Provides an overview of the update status including counts of available, needed, and installed packages by category.

## Examples

```powershell
# Get update summary
$updates = Get-LnvUpdate
$updates | Get-LnvUpdateSummary

# View summary by category
$updates | Get-LnvUpdateSummary | Format-Table
```
