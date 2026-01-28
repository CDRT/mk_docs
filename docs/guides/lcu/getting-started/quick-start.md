# Quick Start Guide

Get up and running with the Lenovo.Client.Update module in just a few minutes.

## 1. Import the Module

```powershell
Import-Module -Name 'Lenovo.Client.Update'
```

If the module is not in the gallery yet use : Import-Module .\Lenovo.Client.Update.psd1 -Force

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

#if the package is in a local repository :
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
```

The `-ShowProgress` parameter can be used to display download progress for large packages.

## 4. Install Updates

Install the downloaded updates:

```powershell
$updates | Install-LnvUpdate -Verbose
```

The `-Verbose` parameter provides detailed output about the installation process.

## Complete Workflow

Here's a complete example that finds, downloads, and installs updates in one script:

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

To retrieve all of the currently available updates for a different computer model:

```powershell
# Download drivers for model 20LS
$updates = Get-LnvUpdate -Model '20LS' -All
$updates | Save-LnvUpdate -Path 'C:\20LS_Drivers'
```

## Using LCU in an OSD Task Sequence

When performing a bare-metal OS deployment, it is possible to dynamically retrieve the latest updates for a given machine type and then install the applicable updates to the specific model being deployed. The recommended approach for doing this follows:

```powershell
# Create a local repository of all updates for the machine type of the device
# - exclude updates that would automatically restart the computer
$repoPath = 'C:\Lenovo_Updates'
Get-LnvUpdatesRepo -RepositoryPath $repoPath -RebootType '0,3,5'

# Determine applicable updates in repository and send to Install-LnvUpdate,
# write history in WMI and give Verbose output
Get-LnvUpdate -Repository $repoPath | Install-LnvUpdate -Path $repoPath -ExportToWMI -Verbose

# wait 10 seconds
Start-Sleep -Seconds 10

# Check for applicable updates again. This catches cases where one driver must be
# installed before other drivers will become applicable.
Get-LnvUpdate -Repository $repoPath | Install-LnvUpdate -Path $repoPath -ExportToWMI -Verbose

```