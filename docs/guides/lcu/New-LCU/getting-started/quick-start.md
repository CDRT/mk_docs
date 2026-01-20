# Quick Start Guide

Get up and running with the Lenovo.Client.Update module in just a few minutes.

## 1. Import the Module

```powershell
Import-Module -Name 'LnvUpdate'

If the module is not in the gallery yet use : Import-Module .\LnvUpdate.psd1 -Force
```


## 2. Check Available Updates

See what updates are available for your system:

```powershell
$updates = Get-LnvUpdate
$updates | Format-Table -Property Title, ReleaseDate, Category
```

By default, `Get-LnvUpdate` returns only "needed" updates (applicable and not yet installed).

## 3. Download Updates

Download the updates to a local directory:

```powershell
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate

#if the package is i a local repository :
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
```

The `-ShowProgress` parameter displays download progress for large packages.

## 4. Install Updates

Install the downloaded updates:

```powershell
$updates | Install-LnvUpdate -Verbose
```

The `-Verbose` parameter provides detailed output about the installation process.

## Complete Workflow

Here's a complete example that finds, downloads, and installs updates in one pipeline:

```powershell
# Get available updates for this computer
$updates = Get-LnvUpdate

# Show what will be installed
$updates | Format-Table -Property Title, Category, ReleaseDate

# Download and install
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
$updates | Install-LnvUpdate -Verbose
```

## Silent/Unattended Updates

For automated deployments, filter for packages that support silent installation:

```powershell
# Get only unattended-installable packages
$updates = Get-LnvUpdate | Where-Object { $_.Installer.Unattended }

# Download and install silently
$updates | Save-LnvUpdate -Path "C:\Updates"
$updates | Install-LnvUpdate
```

## View All Available Updates

To see all available packages (including those not applicable to your system):

```powershell
$allUpdates = Get-LnvUpdate -All
$allUpdates | Measure-Object
$allUpdates | Group-Object -Property Category
```

## Get Updates for Another Computer

To retrieve updates for a different computer model:

```powershell
# Download drivers for model 20LS
$updates = Get-LnvUpdate -Model '20LS' -All
$updates | Save-LnvUpdate -Path 'C:\20LS_Drivers'
```

## Next Steps

- **[Function Reference](../functions/get-lnvupdate.md)** - Detailed documentation for all functions
- **[Common Tasks](../examples/common-tasks.md)** - More practical examples
- **[Proxy Configuration](../topics/proxy-configuration.md)** - Set up web proxy support
- **[Custom Repositories](../topics/custom-repositories.md)** - Use your own package repository
