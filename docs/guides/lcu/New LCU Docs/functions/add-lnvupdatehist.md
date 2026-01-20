# Add-LnvUpdateHist

Record a Lenovo update in the installation history.

## Synopsis

Adds an entry to the Lenovo update installation history.

## Description

Manually adds an update installation record to the module's history tracking. Useful for recording manual installations or third-party updates.

## Examples

```powershell
# Record an update manually
Add-LnvUpdateHist -Title "Driver Update" -InstallDate (Get-Date) -Result "Success"
```

## See Also

- [Get-LnvUpdateHist](get-lnvupdatehist.md)
