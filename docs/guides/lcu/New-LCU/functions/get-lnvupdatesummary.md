# Get-LnvUpdateSummary

Get a summary of Lenovo updates.

## Synopsis

Displays a summary of available and installed Lenovo updates.

## Description

Provides an overview of the update status including counts of available, needed, and installed packages by category.

## Examples

```powershell
# Get update summary
Get-LnvUpdateSummary

# View summary by category
Get-LnvUpdateSummary | Format-Table
```

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Get-LnvUpdateHist](get-lnvupdatehist.md)
