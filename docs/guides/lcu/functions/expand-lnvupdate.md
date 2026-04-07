# Expand-LnvUpdate

Extract Lenovo update package contents.

## Synopsis

Extracts the contents of a Lenovo update package to a directory.

## Description

Unpacks one or more packages returned by Get-LnvUpdate, allowing inspection and manual deployment of the package contents.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Package` | PSCustomObject | package or packages returned by Get-LnvUpdate |
| `-Path` | string | Path to extract package(s) to |

## Examples

```powershell
# Extract a package
Expand-LnvUpdate -Package $package -Path "C:\Extracted"
```
