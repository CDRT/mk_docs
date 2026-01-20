# Save-LnvUpdate

## Synopsis

Downloads Lenovo update packages to disk.

## Syntax

```powershell
Save-LnvUpdate [-Package] <PSObject> [-Path <DirectoryInfo>] 
               [-Proxy <Uri>] [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
```

## Description

Downloads specified update packages from the Lenovo repository to a local directory. Each package is downloaded to a subfolder containing all its files. Downloads can be quite large, so the function supports progress indication for monitoring.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Package` | PSObject | Package(s) from Get-LnvUpdate (pipeline) |
| `-Path` | DirectoryInfo | Download directory |
| `-ShowProgress` | switch | Show download progress |
| `-Force` | switch | Overwrite existing files |
| `-Proxy` | Uri | Proxy URL |
| `-ProxyCredential` | PSCredential | Proxy credentials |
| `-ProxyUseDefaultCredentials` | switch | Use current user for proxy |

## Examples

### Example 1: Download Needed Updates with Progress

```powershell
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
```

Downloads all needed updates to C:\Updates, showing download progress.

### Example 2: Download Specific Package Category

```powershell
$drivers = Get-LnvUpdate | Where-Object { $_.Category -eq 'Driver' }
$drivers | Save-LnvUpdate -Path "C:\Drivers"
```

Downloads only driver packages.

### Example 3: Download for Another Computer Model

```powershell
$updates = Get-LnvUpdate -Model '20LS' -All
$updates | Save-LnvUpdate -Path "C:\20LS_Drivers" -ShowProgress
```

Downloads all packages for a different computer model.

### Example 4: Force Redownload

```powershell
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate -Path "C:\Updates" -Force -ShowProgress
```

Downloads packages, overwriting existing files.

## Output

Returns an object with download result information.

## Notes

- The module does not automatically clean up downloaded packages
- Default download location is `$env:TEMP\LenovoUpdatePackages` or as configured
- Downloaded packages can be large; ensure sufficient disk space
- Downloaded packages remain on disk for installation or redistribution

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
