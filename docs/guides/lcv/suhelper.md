---
title: SU Helper Reference
description: Command-line interface reference for Commercial Vantage System Update Helper
---

# SU Helper Reference

## Overview

The SU Helper utility is a companion to Lenovo Commercial Vantage that provides command-line control over the System Update process. This utility can be leveraged directly in a terminal window on a device or by sending a script containing the command line from a systems management solutions such as Configuration Manager or Intune.

---

## Installation

SUHelper is provided as a separate installer (not included with Commercial Vantage). The installer is located in the Enterprise package:

**Location:** [Lenovo Commercial Vantage Application and Deployment Guide for Large Enterprise](https://support.lenovo.com/us/en/solutions/hf003321) → `\SystemUpdate` subfolder when extracted

### Installation Methods

**Option 1: As part of Commercial Vantage Enterprise deployment**

Uncomment the installation line in `setup-commercial-vantage.bat` by removing `@REM` from the beginning.

**Option 2: Silent standalone installation**

```powershell
[installer filename] /VERYSILENT
```

**Option 3: Using VantageInstaller.exe (July 2025 Enterprise package and later)**

```powershell
.\VantageInstaller.exe -Vantage -SuHelper
```

With this method, you can install Commercial Vantage and SU Helper simultaneously.

### Uninstall

```powershell
C:\Program Files\Lenovo\SUHelper\unins000.exe /VERYSILENT
```

!!! note "Security"
    SU Helper is installed in a fixed, secure location under Program Files that cannot be altered without Administrator privileges.

---

## Quick Reference – Parameters

| Parameter | Type | Purpose | Value |
| --- | --- | --- | --- |
| **-autoupdate** | Required | Trigger update session | (none) |
| **-include** | Optional | Install only specific packages | Comma-separated package IDs |
| **-exclude** | Optional | Skip specific packages | Comma-separated package IDs |
| **-packagetype** | Optional | Filter by update type | 0=Others, 1=App, 2=Driver, 3=BIOS, 4=Firmware |
| **-reboottype** | Optional | Filter by reboot behavior | 0=No reboot, 1=Forced reboot, 3=Requires reboot, 4=Shutdown, 5=Delayed reboot (5 min) |
| **-allowdefer** | Optional | Allow users to defer updates | (none) |
| **-help** or **/?** | Optional | Display help | (none) |

---

## Usage Scenarios

SU Helper is designed to support these key scenarios:

**Trigger On-Demand Update**
:  Trigger an Auto Update session without waiting for the normal schedule. Useful when you need immediate deployment of critical updates.

**Filtered Update Deployment**
:  Trigger updates for specific types only (e.g., drivers and firmware via Windows Update for Business, but deploy other updates via Commercial Vantage). Example: Deploy Commercial Vantage with Auto Update disabled, then use SU Helper on-demand to install specific packages.

**Block Problematic Updates**
:  If a particular update causes compatibility issues in your test environment, use SU Helper to add it to an exclude list on production devices, preventing installation during Auto Update or Manual Update sessions.

---

## Parameter Reference

??? note "-autoupdate (Required)"
    
    Triggers an Auto Update process by the System Update Addin.
    
    **Behavior:**
    - If used alone, any Group Policy filters are applied
    - If other parameters are specified, command-line filters take priority over Group Policies
    - Can be combined with other optional parameters for filtering

??? note "-include [string] (Optional)"
    
    Specifies one or more package IDs to install. **Only these packages** will be installed (if applicable).
    
    **Format:** Comma-separated package IDs (e.g., `n3uj12w,n3jcd08w`)
    
    **Finding Package IDs:**
    - Use [Update Retriever](https://support.lenovo.com/us/en/solutions) tool
    - Use [Driver & Software Matrix for IT Admins](https://download.lenovo.com/cdrt/tools/drivermatrix/dm_2.html) – search, select updates, click "Copy Package ID(s)"
    
    **Limitation:** Cannot be combined with `-exclude` or `-packagetype`/`-reboottype` parameters

??? note "-exclude [string] (Optional)"
    
    Specifies one or more package IDs to **skip during installation** (even if applicable).
    
    **Format:** Comma-separated package IDs (e.g., `n3jrg03w`)
    
    **Persistent:** Once a package ID is added to the exclude list, subsequent scheduled auto updates will also skip this package.
    
    **Override:** If a later command specifies the same package ID in `-include`, it will be removed from the exclude list and installed if applicable.
    
    **Limitation:** Cannot be combined with `-include` or `-packagetype`/`-reboottype` parameters

??? note "-packagetype [string] (Optional)"
    
    Filter updates by type. Only updates matching the specified type(s) will be installed.
    
    **Package Types:**
    
    | Number | Type |
    | --- | --- |
    | 0 | Others |
    | 1 | Application |
    | 2 | Driver |
    | 3 | BIOS |
    | 4 | Firmware |
    
    **Format:** Comma-separated numbers (e.g., `2,3` = Drivers and BIOS)
    
    **Can combine with:** `-reboottype` parameter (AND logic – intersection of both filters)

??? note "-reboottype [string] (Optional)"
    
    Filter updates by reboot requirement. Only updates requiring the specified reboot type(s) will be installed.
    
    **Reboot Types:**
    
    | Number | Behavior |
    | --- | --- |
    | 0 | No reboot required |
    | 1 | Forced reboot by update |
    | 3 | Requires reboot |
    | 4 | Forces shutdown by update |
    | 5 | Delayed forced reboot (5 minutes) |
    
    **Format:** Comma-separated numbers (e.g., `0,3` = No reboot or requires reboot)
    
    **Can combine with:** `-packagetype` parameter (AND logic – intersection of both filters)

??? note "-allowdefer (Optional)"
    
    Allow end-users to defer updates when applicable Group Policy permits deferral.
    
    **Default behavior:** Updates install without user option to defer.
    
    **With this parameter:** Group Policy deferral rules are applied (if configured).

??? note "-help or /? (Optional)"
    
    Display command-line help and parameter reference.

---

## Return Codes

| Code | Meaning | Action |
| --- | --- | --- |
| **0** | Success | Update session triggered successfully |
| **1** | Error in parameters | Check parameter syntax and combinations |
| **2** | System Update Addin is busy | Wait and retry; another update session is running |
| **3** | Unexpected error occurred | Check logs; see [Troubleshooting](#troubleshooting) |

!!! note "Important"
    Return codes represent only the result of calling `suhelper.exe`, not the result of the update session itself. Check the `Lenovo_Updates` WMI class for actual update results.

---

## Important Rules

!!! warning "Parameter Constraints"
    
    **Cannot combine in same command:**
    - `-include` and `-exclude` (mutually exclusive → return code 1)
    - `-include` with `-packagetype` or `-reboottype`
    - `-exclude` with `-packagetype` or `-reboottype`
    
    **Can combine in same command:**
    - `-packagetype` and `-reboottype` (AND logic – both filters applied simultaneously)
    - Any optional parameter with `-allowdefer`

!!! info "Policy Precedence"
    
    - **Command-line parameters take priority** over Group Policy filters
    - If no parameters: Group Policy filters apply (if configured)
    - If no policies: All applicable updates install

!!! warning "Concurrency"
    
    If System Update Addin is already running, the command terminates with return code 2. Wait for the current session to finish before retrying.

---

## Examples by Scenario

??? note "Install specific packages only"
    
    **Goal:** Deploy only two specific driver packages
    
    ```powershell
    suhelper.exe -autoupdate -include n3uj12w,n3jcd08w
    ```

??? note "Block a problematic update"
    
    **Goal:** Prevent a problematic BIOS update from being installed
    
    ```powershell
    suhelper.exe -autoupdate -exclude n3jrg03w
    ```

??? note "Install drivers and firmware without reboot"
    
    **Goal:** Deploy drivers and BIOS that don't require reboot; allow user deferral if policy permits
    
    ```powershell
    suhelper.exe -autoupdate -packagetype 2,3 -reboottype 0 -allowdefer
    ```

??? note "Install drivers or BIOS (any reboot type)"
    
    **Goal:** Deploy all drivers and BIOS updates regardless of reboot requirement
    
    ```powershell
    suhelper.exe -autoupdate -packagetype 2,3
    ```

??? note "Display help"
    
    ```powershell
    suhelper.exe -help
    ```

---

## Troubleshooting

**Return code 1 (Error in parameters):**
- Check that you're not combining incompatible parameters (e.g., `-include` with `-packagetype`)
- Verify package IDs are comma-separated with no spaces
- Use `-help` to review syntax

**Return code 2 (System Update Addin is busy):**
- Wait for the current update session to finish
- Check Task Scheduler for running update tasks
- Retry the command after the session completes

**Return code 3 (Unexpected error):**
- Check event logs in Windows Event Viewer
- Verify SU Helper is installed: `C:\Program Files\Lenovo\SUHelper\suhelper.exe`
- Ensure running as Administrator
- Verify network connectivity (if fetching updates)

**Updates not installing despite valid command:**
- Verify return code is 0 (success)
- Check `Lenovo_Updates` WMI class for session results
- Review Configuration Manager or Intune logs if deployed remotely
