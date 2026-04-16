---
title: Get-LnvUpdate
description: Fetch available driver, BIOS, firmware, and utility update packages for Lenovo systems
---

# Get-LnvUpdate

Discovers available driver, BIOS, firmware, and utility updates for Lenovo systems.

## Synopsis

Fetches available update packages for Lenovo computers from the update repository.

## Syntax

```powershell
Get-LnvUpdate [[-Model] <string>] [-All] [-IncludePhantomDevices]
              [-Proxy <Uri>] [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
              [-Repository <string>] [-ScratchDirectory <string>]
              [-StatusMode <string>] [-LogFile] [-LogPath <string>] [-SkipSignature]
```

## Description

`Get-LnvUpdate` queries the Lenovo update repository and returns available update packages. By default, only "needed" updates (applicable to the current system and not yet installed) are returned.

The function evaluates package applicability based on system hardware, BIOS version, and other configuration factors. All package files are downloaded to a scratch directory during applicability checking to verify digital signatures and availability before returning results.

Use the `-All` parameter to retrieve all available packages regardless of applicability or installation status.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Model` | string | Target computer model (default: current system) |
| `-All` | switch | Return all packages, including installed and non-applicable |
| `-IncludePhantomDevices` | switch | Include offline/disconnected devices in applicability checks |
| `-Proxy` | Uri | Proxy server URL for repository access |
| `-ProxyCredential` | PSCredential | Credentials for proxy authentication |
| `-ProxyUseDefaultCredentials` | switch | Use current user's credentials for proxy |
| `-Repository` | string | Path to local repository folder (instead of Lenovo online) |
| `-ScratchDirectory` | string | Directory for temporary files during processing (default: $env:TEMP) |
| `-StatusMode` | string | Change package status (custom filtering) |
| `-LogFile` | switch | Create logfile in default location (`C:\ProgramData\Lenovo\...`) |
| `-LogPath` | string | Create logfile in specified custom path |
| `-SkipSignature` | switch | Skip digital signature verification (not recommended) |

## Examples

### Example 1: Get applicable updates for current system

```powershell
$updates = Get-LnvUpdate
$updates | Format-Table -Property Title, ReleaseDate, Category
```

Retrieves only needed updates (applicable but not installed) and displays them in a table.

### Example 2: Get all available packages

```powershell
$allUpdates = Get-LnvUpdate -All
$allUpdates | Measure-Object
```

Shows the total count of all available packages, including installed and non-applicable.

### Example 3: Get drivers for a different model

```powershell
$updates = Get-LnvUpdate -Model '20LS' -All
$updates | Where-Object { $_.Category -eq 'Driver' } | Save-LnvUpdate -Path "C:\20LS_Drivers"
```

Retrieves all drivers for model 20LS and downloads them.

### Example 4: Query a local repository

```powershell
Get-LnvUpdate -Repository "C:\local-repository" -All -Verbose
```

Queries packages from a local repository instead of Lenovo's online source.

### Example 5: Generate update report with logging

```powershell
$updates = Get-LnvUpdate -LogPath "C:\Logs\updates.log" -Verbose
$updates | Group-Object -Property Category | Select-Object Name, Count
```

Retrieves updates while logging details to a custom path, then groups by category.

## Output

Returns an array of update package objects with properties such as:

- `Title` - Display name of the package
- `Version` - Package version
- `ReleaseDate` - When the package was released
- `Category` - Type of update (Driver, BIOS, Firmware, Application, etc.)
- `IsApplicable` - Whether the package is applicable to this system
- `IsInstalled` - Whether the package is already installed
- `Severity` - Severity level (Critical, Recommended, Optional)
- `Installer` - Details about the installation program
- `FileSize` - Size of the package in bytes
- `PackageID` - Unique identifier
- `URL` - Download URL

## Notes

### Applicability Checking

During applicability evaluation:

- All package files are temporarily downloaded to the scratch directory
- Digital signatures are verified to ensure package authenticity
- Files are deleted after processing unless errors occur

### Logging Options

- `-LogFile` and `-LogPath` cannot be used together; `-LogPath` takes precedence
- Logs are helpful for troubleshooting and audit trails

### Performance

- Applicability checking may take several minutes depending on network speed and update count
- Specify `-Model` if querying for a different computer to speed up searches
- Use `-Repository` for local queries to avoid network latency

### Signature Verification

- `-SkipSignature` should only be used if you need to modify package descriptor XML
- Not recommended for production deployments

## See Also

- [Save-LnvUpdate](save-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
- [Expand-LnvUpdate](expand-lnvupdate.md)
- [Get-LnvUpdateConfiguration](get-lnvupdateconfiguration.md)
