# Get-LnvUpdate

## Synopsis

Fetches available driver packages and updates for Lenovo computers.

## Syntax

```powershell
Get-LnvUpdate [[-Model] <string>] [-All] [-IncludePhantomDevices] 
              [-Proxy <Uri>] [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
```

## Description

Retrieves driver, BIOS/UEFI, firmware, and utility software update packages from Lenovo. By default, only "needed" updates (applicable and not yet installed) are returned. Use the `-All` parameter to get all available packages.

The function queries the Lenovo update repository and evaluates which packages are applicable to the current system based on hardware configuration, BIOS version, and other factors.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Model` | string | Target model (default: current) |
| `-All` | switch | All packages, including installed |
| `-IncludePhantomDevices` | switch | Include disconnected devices |
| `-Proxy` | Uri | Proxy URL |
| `-ProxyCredential` | PSCredential | Proxy credentials |
| `-ProxyUseDefaultCredentials` | switch | Use current user for proxy |
| `-ScratchDirectory` | switch | directory where temp files are downloaded |
| `-Repository` | string | Path to local repository |
| `-StatusMode`| String | Change the status of the packages |
| `-LogPath` | String | specify the path of the logfile|
| `-LogFile` | switch| creates a logfile after the packages are retrieved |
| `-SkipSignature` | Switch skip the signature check of the pakages |

## Examples

```powershell
$updates = Get-LnvUpdate
$updates | Format-Table -Property Title, ReleaseDate, Category
```

Retrieves only updates needed for the current systems. 
### Example 2: Get All Available Updates

```powershell
$allUpdates = Get-LnvUpdate -All
$allUpdates | Measure-Object
```

Shows the total count of all available package for the computer.

### Example 3: Get Updates for a Different Computer Model

```powershell
$updates = Get-LnvUpdate -Model '20LS' -All
$updates | Where-Object { $_.Category -eq 'Driver' } | Save-LnvUpdate
```

Retrieves all drivers for model 20LS and downloads them.

### Example 4: Using a local repository 

```powershell
Get-LnvUpdate -Repository "C:\local-repository" -All -Verbose

```

Retrieves the packages from  the local repository specified. -All, -SkipSignatureCheck and other parameter are applicable 

## Output

Return an array of  objects with properties such as:

- `Title` - Display name of the package
- `Version` - Package version
- `ReleaseDate` - When the package was released
- `Category` - Type of update (Driver, BIOS, Firmware, etc.)
- `IsApplicable` - Whether the package is applicable to this system
- `IsInstalled` - Whether the package is already installed
- `Installer` - Details about the installation program
- `FileSize` - Size of the package in bytes

## See Also

- [Save-LnvUpdate](save-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
- [Get-LnvUpdateConfiguration](get-lnvupdateconfiguration.md)
