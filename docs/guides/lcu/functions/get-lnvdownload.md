# Get-LnvDownload

Downloads Lenovo update packages and optionally extracts them to a local folder.

## Synopsis

Downloads driver, BIOS, firmware, and application updates for a specified Lenovo machine type and creates a local folder.

## Description

`Get-LnvDownload` is a function that downloads Lenovo update packages directly from Lenovo's servers for a specific machine type. It creates a local folder structure and can optionally extract package installers using the `-Expand` parameter.

This function downloads packages to individual folders named by package ID and stores them in the specified folder. When `-Expand` is used, the installer files are extracted directly into each package folder.

!!! note
    This function was migrated from the Lenovo.Client.Scripting module and will be maintained in this module going forward. For more flexible workflows, consider using `Get-LnvUpdate`, `Save-LnvUpdate`, and `Expand-LnvUpdate` separately.

!!! warning
    The `-Expand` parameter requires running PowerShell as Administrator.

## Parameters

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `-MachineType` | String | Yes | - | 4-character Lenovo machine type (e.g., `21HM`, `20E4`) |
| `-WindowsVersion` | String | No | `11` | Windows version: `10` or `11` |
| `-RepositoryFolder` | String | No | `C:\testrepo` | Path where packages will be downloaded |
| `-PackageType` | String | No | `9` (All) | Filter by package type:<br>- `1` = Application<br>- `2` = Driver<br>- `3` = BIOS<br>- `4` = Firmware<br>- `9` = All<br>Multiple types: `"1,2"` |
| `-RebootType` | String | No | `9` (All) | Filter by reboot requirement:<br>- `0` = No reboot required<br>- `1` = Forced reboot<br>- `3` = Requires reboot<br>- `4` = Forces shutdown<br>- `5` = Delayed forced reboot<br>- `9` = All<br>Multiple types: `"0,3"` |
| `-Csv` | Switch | No | - | Export package list to CSV file |
| `-Expand` | Switch | No | - | Extract installers after download (requires admin) |

## Folder Structure

When using `Get-LnvDownload`, packages are organized as follows:
```
RepositoryFolder\
  ├── packageID1\
  │   ├── package.exe          ← Downloaded installer
  │   ├── readme.html          ← Package documentation
  │   ├── descriptor.xml       ← Package metadata
  │   └── [extracted files]    ← Extracted here if -Expand used
  ├── packageID2\
  │   └── ...
  └── MachineType_WindowsVersion.csv  ← If -Csv used
```

## Examples

### Example 1: Download drivers for a machine type
```powershell
Get-LnvDownload -MachineType 21HM -WindowsVersion 11 -RepositoryFolder "C:\Drivers\21HM"
```

Downloads all available packages for ThinkPad machine type 21HM running Windows 11.

### Example 2: Download only drivers and applications
```powershell
Get-LnvDownload -MachineType 20E4 -PackageType "1,2" -RepositoryFolder "C:\Updates"
```

Downloads only applications (1) and drivers (2), excluding BIOS and firmware.

### Example 3: Download and extract packages
```powershell
Get-LnvDownload -MachineType 21N2 -WindowsVersion 11 -RepositoryFolder "E:\LCU\21N2" -Csv -Expand
```

Downloads packages and extracts installers. Requires running PowerShell as Administrator. Creates a CSV file listing all packages with their properties.

### Example 4: Download drivers with specific reboot types
```powershell
$path = "E:\Drivers\ThinkPad"
Get-LnvDownload -MachineType 21HM -WindowsVersion 11 -RepositoryFolder $path -PackageType "2" -RebootType "0,3" -Expand
```

Downloads only drivers that either don't require reboot (0) or require reboot (3), then extracts them.

## Notes

### Package Type Values

- `1` - Application
- `2` - Driver
- `3` - BIOS
- `4` - Firmware
- `9` - All (default)

### Reboot Type Values

- `0` - No reboot required.
- `1` - The update will force the system to reboot. This cannot be prevented if you install this update.
- `3` - Reboot recommended.
- `4` - The update will force the system to power off. This cannot be prevented if you install this update.
- `5` - Reboot required immediately. Allows for multiple updates to be installed and serviced by one reboot.


### Extraction Behavior

When using `-Expand`:

- Extraction happens in the background using PowerShell runspaces
- Progress messages display every 5 seconds
- Extracted files are placed directly in each package folder
- The function waits for all extractions to complete before exiting
