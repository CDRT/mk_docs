---
title: Save-LnvUpdate
description: Download Lenovo update packages to disk
---

# Save-LnvUpdate

Downloads Lenovo update packages from the repository to a local directory.

## Synopsis

Downloads specified update packages to disk for local storage, caching, or offline deployment.

## Syntax

```powershell
Save-LnvUpdate [-Package] <PSObject> [-Path <DirectoryInfo>]
               [-ShowProgress] [-Force]
               [-Proxy <Uri>] [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
```

## Description

`Save-LnvUpdate` downloads Lenovo update packages from the repository to a specified local directory. Each package is downloaded to its own subfolder containing all package files.

Downloads can be quite large. The `-ShowProgress` parameter shows real-time download progress, and the `-Force` parameter allows overwriting existing cached packages.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Package` | PSObject | Package(s) from `Get-LnvUpdate` (accepts pipeline input) |
| `-Path` | DirectoryInfo | Target directory for downloads |
| `-ShowProgress` | switch | Display download progress for each package |
| `-Force` | switch | Overwrite existing files without prompting |
| `-Proxy` | Uri | Proxy server URL |
| `-ProxyCredential` | PSCredential | Proxy authentication credentials |
| `-ProxyUseDefaultCredentials` | switch | Use current user credentials for proxy |

## Examples

### Example 1: Download needed updates with progress

```powershell
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
```

Downloads all applicable updates to C:\Updates, displaying progress for each package.

### Example 2: Download only drivers

```powershell
$drivers = Get-LnvUpdate | Where-Object { $_.Category -eq 'Driver' }
$drivers | Save-LnvUpdate -Path "C:\Drivers"
```

Filters for drivers only, then downloads them to C:\Drivers.

### Example 3: Download for different computer model

```powershell
$updates = Get-LnvUpdate -Model '20LS' -All
$updates | Save-LnvUpdate -Path "C:\20LS_Drivers" -ShowProgress
```

Downloads all packages available for model 20LS to a model-specific folder.

### Example 4: Force redownload of cached packages

```powershell
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate -Path "C:\Updates" -Force -ShowProgress
```

Downloads packages even if they already exist locally, overwriting cached versions.

### Example 5: Download specific packages in a pipeline

```powershell
Get-LnvUpdate | Where-Object { $_.Severity -eq 'Critical' } | Save-LnvUpdate -Path "C:\Critical"
```

Downloads only critical-severity updates to a dedicated folder.

## Output

Returns an object with download result information including:

- `PackageID` - Unique identifier
- `DownloadPath` - Full path where downloaded
- `FileSize` - Size of downloaded package in bytes
- `Status` - Download status (Success, Failed, AlreadyExists)
- `Message` - Details or error information

## Notes

- Downloaded packages are organized in subfolders by package ID
- The module does not automatically clean up downloaded packages
- Downloaded packages can be large; ensure sufficient disk space before downloading
- Downloaded packages remain on disk for later installation or redistribution
- If `-Force` is not used, existing packages are not re-downloaded

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
- [Expand-LnvUpdate](expand-lnvupdate.md)
