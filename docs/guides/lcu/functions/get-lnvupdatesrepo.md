# Get-LnvUpdatesRepo

Create a local Lenovo Update Repository.

## Synopsis

Downloads Lenovo update packages for specified machine types and builds a local repository compatible with Update Retriever and Thin Installer.

## Description

`Get-LnvUpdatesRepo` retrieves Lenovo update metadata and packages directly from Lenovo’s public catalogs and stores them in an **Update Retriever–style repository**.

This cmdlet is intended for environments where:

- Update Retriever cannot be used
- Automated or scheduled repository creation is required
- Offline or controlled update distribution is needed

The generated repository includes package folders, metadata catalogs, and log files.

## Parameters

### `-RepositoryPath` *(Required)*
Path where the local repository is created.

```powershell
-RepositoryPath "C:\Repository"
```

### `-MachineTypes`
Comma-separated list of 4-character Lenovo machine types (e.g. `"21DD,21DE"`).  
If omitted, the local Lenovo system machine type is used.

### `-WindowsVersion`
Target OS version: `"10"` or `"11"`.  
Defaults to the current system OS.

### `-PackageTypes`
Filter by package type:

- `1` Application
- `2` Driver
- `3` BIOS
- `4` Firmware

Defaults to all types.

### `-RebootTypes`
Filter by reboot behavior:

- `0` No reboot
- `1` Forced reboot
- `3` Requires reboot
- `4` Forced shutdown
- `5` Delayed forced reboot

Defaults to all types.

### `-Severities`
Filter by update severity:

- `0` Default
- `1` Critical
- `2` Recommended
- `3` Optional

### `-PackageList`
Limit repository creation to specific package IDs.

### `-RT5toRT3`
Converts Reboot Type 5 updates to Reboot Type 3.  
Intended for task sequence scenarios.

> Cannot be used with `-CloudRepo`.

### `-CloudRepo`
Creates a metadata-only repository that references Lenovo CDN packages.

> Cannot be used with `-RT5toRT3`.

### `-DeltaUpdate`
Downloads only new or changed updates since the last run.

## Output

This cmdlet does not return objects.

It creates:
- Package folders
- `database.xml` and `database.xsd`
- Log file detailing execution

## Examples

### Create a full repository

```powershell
Get-LnvUpdatesRepo `
  -RepositoryPath "C:\Repository" `
  -MachineTypes "21DD,21DE" `
  -PackageTypes "2,3,4" `
  -RebootTypes "3,5"
```

### Update an existing repository (delta)

```powershell
Get-LnvUpdatesRepo `
  -RepositoryPath "C:\Repository" `
  -DeltaUpdate
```

### Create a Cloud-based repository

```powershell
Get-LnvUpdatesRepo `
  -RepositoryPath "C:\Repository" `
  -PackageTypes "2,3,4" `
  -CloudRepo
```

## Notes

- Supported on Lenovo commercial systems
- Internet access is required
- Initial runs should be performed **without** `-DeltaUpdate`



## See Also

- [Set-LnvUpdateConfiguration](set-lnvupdateconfiguration.md)
