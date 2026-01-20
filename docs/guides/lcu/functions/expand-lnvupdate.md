# Expand-LnvUpdate

Extract Lenovo update package contents.

## Synopsis

Extracts the contents of a Lenovo update package to a directory.

## Description

Unpacks a downloaded update package, allowing inspection and manual deployment of the package contents.

## Examples

```powershell
# Extract a package
Expand-LnvUpdate -Path "C:\Updates\DriverPackage" -DestinationPath "C:\Extracted"
```
