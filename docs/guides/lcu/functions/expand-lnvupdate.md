---
title: Expand-LnvUpdate
description: Extract Lenovo update package contents
---

# Expand-LnvUpdate

Extracts the contents of a Lenovo update package to a directory for inspection or manual deployment.

## Synopsis

Unpacks one or more packages returned by Get-LnvUpdate, allowing access to individual installer files and documentation.

## Syntax

```powershell
Expand-LnvUpdate [-Package] <PSCustomObject> [-Path] <string>
```

## Description

`Expand-LnvUpdate` extracts Lenovo update packages to a specified directory. This allows you to inspect package contents, manually deploy installers, or prepare packages for offline use.

Each package is extracted to its own subfolder containing all files: installers, readme files, descriptor XML, and any related documentation.

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `-Package` | PSCustomObject | Yes | Package object(s) from `Get-LnvUpdate` (accepts pipeline input) |
| `-Path` | string | Yes | Directory path where packages will be extracted |

## Examples

### Example 1: Extract a single package

```powershell
$package = Get-LnvUpdate | Select-Object -First 1
$package | Expand-LnvUpdate -Path "C:\Extracted"
```

Extracts the first available update package to C:\Extracted.

### Example 2: Extract all applicable drivers

```powershell
$drivers = Get-LnvUpdate | Where-Object { $_.Category -eq 'Driver' }
$drivers | Expand-LnvUpdate -Path "C:\Drivers\Extracted"
```

Extracts all driver packages to a dedicated folder.

### Example 3: Extract packages via pipeline

```powershell
Get-LnvUpdate -All | Expand-LnvUpdate -Path "E:\AllUpdates\Extracted"
```

Gets all available packages and extracts them to E:\AllUpdates\Extracted.

## Output

`Expand-LnvUpdate` returns an extraction result object with properties such as:

- `PackageID` - Unique identifier for the package
- `ExtractionPath` - Full path where files were extracted
- `FileCount` - Number of files extracted
- `Status` - Extraction status (Success, Failed)
- `Message` - Details or error information

## Notes

- Extraction creates a subfolder for each package named by its package ID
- Existing files are overwritten without confirmation
- Large packages may take several minutes to extract depending on disk speed
- Extracted packages can be large; ensure adequate disk space

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Save-LnvUpdate](save-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
