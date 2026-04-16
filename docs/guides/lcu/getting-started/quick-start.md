---
title: Quick Start
description: Get up and running with Lenovo.Client.Update module in minutes
---

# Quick Start Guide

Get up and running with the Lenovo.Client.Update module in just a few minutes. The typical workflow takes 5–10 minutes depending on network speed and the number of available updates.

---

## Basic Workflow

Follow these steps to discover, download, and install updates:

### 1. Install and Import the Module

```powershell
Install-Module Lenovo.Client.Update #Installs the module from PS Gallery
Import-Module Lenovo.Client.Update -Force #Loads the module into the current session
```

!!! note ""
    If the module is not in the gallery yet, use: `Import-Module .\Lenovo.Client.Update.psd1 -Force`

### 2. Check Available Updates

See what updates are available for your system:

```powershell
$updates = Get-LnvUpdate
$updates | Format-Table -Property Title, ReleaseDate, Category
```

By default, `Get-LnvUpdate` returns only "needed" updates (applicable and not yet installed). To ensure the updates are fully available, digitally signed, and applicable, all the files for the update will be downloaded to a scratch directory. This will either be in $env:TEMP or a folder you specify using the -ScratchDirectory parameter. The process may take a few minutes depending on how many updates are available for the device and the network connection.

### 3. Download Updates

Download the updates to a local directory:

```powershell
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate

#download to a specific folder:
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
```

The `-ShowProgress` parameter can be used to display download progress for large packages.

### 4. Install Updates

Install the downloaded updates:

```powershell
$updates | Install-LnvUpdate -Verbose
```

The `-Verbose` parameter provides detailed output about the installation process.

---

## Complete Workflow Example

Here's a complete script that finds, downloads, and installs all applicable updates in one go:

```powershell
# Get available updates for this computer
$updates = Get-LnvUpdate

# Show what will be installed
$updates | Format-Table -Property Title, Category, ReleaseDate

# Download and install
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
$updates | Install-LnvUpdate -Verbose
```

---

## Advanced Scenarios

??? note "Silent/Unattended Updates"
    For automated deployments, filter for packages that support silent installation:

    ```powershell
    # Get only unattended-installable packages
    $updates = Get-LnvUpdate | Where-Object { $_.Installer.Unattended }

    # Download and install silently
    $updates | Save-LnvUpdate -Path "C:\Updates"
    $updates | Install-LnvUpdate
    ```

    This approach is ideal for scheduled tasks or automated deployment pipelines where user interaction is not available.

??? note "View All Available Updates"
    By default, `Get-LnvUpdate` returns only "needed" updates. To see all available packages (including those not applicable to your system):

    ```powershell
    $allUpdates = Get-LnvUpdate -All
    $allUpdates | Measure-Object  # or can use $allUpdates.Count to see the total number of updates
    $allUpdates | Group-Object -Property Category
    ```

    This is useful for auditing, reporting, or building a complete repository.

??? note "Get Updates for Another Computer Model"
    To retrieve all of the currently available updates for a different computer model:

    ```powershell
    # Download drivers for model 20LS
    $updates = Get-LnvUpdate -Model '20LS' -All
    $updates | Save-LnvUpdate -Path 'C:\20LS_Drivers'
    ```

    Helpful for preparing updates for deployment to different hardware models without running on that specific machine.

---

## Enterprise Deployment: OS Deployment (OSD) Task Sequence

??? note "Deploying Updates via OSD Task Sequence"
    When performing a bare-metal OS deployment, you can dynamically retrieve the latest updates for a given machine type and install applicable updates to the specific model being deployed. This approach ensures systems receive all critical BIOS, firmware, and driver updates during imaging.

    ### Recommended Workflow

    ```powershell
    # Create a local repository of all updates for the machine type of the device
    # - exclude updates that would automatically restart the computer (reboot type 1)
    $repoPath = 'C:\Lenovo_Updates'
    Get-LnvUpdatesRepo -RepositoryPath $repoPath -RebootType '0,3,5'

    # Determine applicable updates in repository and send to Install-LnvUpdate,
    # write history in WMI and give Verbose output
    Get-LnvUpdate -Repository $repoPath | Install-LnvUpdate -Path $repoPath -ExportToWMI -Verbose

    # Wait for device drivers to load before checking for additional updates.
    # Some drivers must be installed before other drivers become applicable.
    Start-Sleep -Seconds 10

    # Check for applicable updates again. This catches cases where one driver must be
    # installed before other drivers will become applicable.
    Get-LnvUpdate -Repository $repoPath | Install-LnvUpdate -Path $repoPath -ExportToWMI -Verbose
    ```

    ### Why Two Install Passes?

    The two `Install-LnvUpdate` calls are intentional. Some drivers must be installed before others become applicable. The sleep interval allows driver installations to complete and Windows to recognize new devices before the second pass checks for newly applicable updates.

    ### WMI Export

    The `-ExportToWMI` parameter exports installation history to the WMI class `root\Lenovo\Lenovo_Updates`, enabling audit trails and compliance reporting after the image is deployed.

    For complete OSD integration guidance, see the [comparison guide](../comparison.md) or [function reference](../functions/get-lnvupdatesrepo.md).
