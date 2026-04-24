---
title: Lenovo Client Scripting Module (LCSM) Reference
description: PowerShell module cmdlets for Lenovo system managementâ€”BIOS, updates, drivers, hardware information, and reporting
---

# Lenovo Client Scripting Module

## Overview

The Lenovo Client Scripting Module (LCSM) is a comprehensive PowerShell module containing 34 cmdlets that provide useful information and simplified actions for managing Lenovo commercial PCs (ThinkPad, ThinkCentre, ThinkStation).

**System Requirements:**
- PowerShell v5.1 or higher (64-bit)
- Windows 10 or Windows 11

??? note "What's New"

    ??? note "April 9, 2026:  Version 2.4.1"

        - Removed two cmdlets that have been moved to the Lenovo.Client.Update module: `Get-LnvUpdate`, `Get-LnvUpdatesRepo`

    ??? note "April 6, 2026:  Version 2.4.0"

        - As part of the ThinkVantage PowerShell Library launch and the new Lenovo.Client.Update module release, some cmdlets are being deprecated or moved. Deprecated cmdlets are denoted with a warning note.

        - **New Cmdlets:**
            - `Get-LnvSystemFirmwareVersion` - Retrieve System Firmware version from the PnP device tree in human-readable decimal format
            - `Invoke-LnvCVLogViewer` - Parse and analyze Lenovo Commercial Vantage System Update Addin log files with color-coded summaries
            - `Invoke-LnvTILogViewer` - Parse Lenovo ThinInstaller log files and produce concise summaries
            - `Show-LnvUpdatesHistory` - Display update history from WMI Lenovo_Updates class

        - **Enhancements:**
            - `Find-LnvDriverPack` - Now returns structured PSCustomObject with named properties (Model, OS, OSVersion, SHA256, MD5, DateReleased, URL)
            - `Add-LnvSULogging` - Updated for new Lenovo Vantage logging architecture (VantageService\FileLogger registry path)
            - `Find-LnvTool` - Added support for WinAIA tool (Windows Asset ID Information)
            - `Get-LnvBiosInfo` / `Get-LnvBiosVersion` - Significantly improved performance via WMI call caching
            - `Find-LnvUpdate` - Catalog downloads now use HTTPS (cmdlet deprecated)
            - `Get-LnvAvailableBiosVersion` / `Get-LnvCVE` - Added `-UseBasicParsing` for IE-less systems
            - `Get-LnvCVE` - Added early validation for missing BIOS updates

        - **Bug Fixes:**
            - `Get-LnvBatteryInfo` - Fixed Write-Object to Write-Output in error paths
            - `Get-LnvBiosCode` - Added try/catch error handling around WMI calls
            - `Find-LnvBiosInfo` / `Get-LnvBiosInfo` - Fixed missing wildcards in ThinkStation query, fixed single-result array handling
            - `Get-LnvBiosInfo` - Fixed missing parentheses in .ToString()
            - `Export-LnvUpdateRetrieverConfig` - Fixed filename extraction for multi-dot names
            - Deprecated cmdlets (`Get-LnvUpdate`, `Remove-LnvMTOS`, `Get-LnvMTOSList`, `Add-LnvMTOS`) - Various fixes including parameter position, help text, undefined variables, and session termination issues

        - **Removed:**
            - `Get-LnvTaxonomy` (private helper) - No longer used internally

    ??? note "June 11, 2025:  Version 2.3.0"

        - Added `Get-LnvUpdateNotification`, `Get-LnvMTOSList`, `Add-LnvMTOS`, `Remove-LnvMTOS` cmdlets. These allow you to create a list of Machine Type + OS combinations you care about and keep track of what updates have been added to their System Update catalogs since the last time you checked.
        - Added `Get-LnvWUFriendlyName` cmdlet that provides a list of the drivers and firmware installed by Windows Update with their associated Device Names to make it easier to tell what Windows Update is providing.
        - Added `-DeltaUpdate` option to `Get-LnvUpdatesRepo` which will allow you to just download new updates to an existing repository.
        - Fixed error handling when system does not have a battery in `Get-LnvBatteryInfo`.

    ??? note "February 26, 2025:  Version 2.2.0"

        - Added `Find-LnvHSAPack` cmdlet.  This cmdlet lets you see what HSA packs have been released for a specified Machine Type.
        - Added Release Date to the return from `Find-LnvUpdate`.
        - Added DownloadPath parameter to `Get-LnvDriverPack` so you can control where the package is downloaded to.
        - Fixed issue that occurs if a driver pack for the OS Build Version specified is not found in `Get-LnvDriverPack`.
        - Changed to display size in MB in `Get-LnvUpdatesRepo`.
        - Added CloudRepo as a switch parameter for `Get-LnvUpdatesRepo` to generate the repository as a Lenovo Cloud repository (the update packages are left on Lenovo's site).
        - Fixed an issue with `Get-LnvUpdatesRepo` if ran without specifying `-WindowsVersion`.

    ??? note "December 11, 2024:  Version 2.1.0"

        - Now available in the PowerShell Gallery. Use ```Install-Module -Name Lenovo.Client.Scripting``` to install from the gallery.
        - Added `Find-LnvTool` to get URL and version information for the installer packages of our tools: Dock Manager, System Update, Thin Installer, Update Retriever
        - Added option to specify "Latest" as OSBuildVersion on `Get-LnvDriverPack` to get the latest version pack for the `-WindowsVersion` specified.
        - Added `-DownloadPath` option to `Get-LnvDriverPack`; will download to `$env:TEMP` if not specified.
        - Added `-ListAll` option to `Find-LnvUpdate` to get an object containing all the available updates based on any filtering parameters used.
        - Now leveraging BITS Transfers for downloads of package files in `Get-LnvDriverPack`, `Get-LnvUpdate` and `Get-LnvUpdatesRepo`
        - `Get-LnvAvailableBiosVersion` received several improvements (improved Win11/Win10 catalog handling, added `-DownloadPath`, added release date).

    ??? note "November 7, 2024:  Version 2.0.0"

        - Changed name to Lenovo.Client.Scripting to avoid confusion with Lenovo Device Manager product. This version supersedes all prior versions of the Lenovo Device Management Module (LDMM).
        - Added new cmdlets - `Get-LnvBiosInfo`, `Find-LnvBiosInfo`, `Get-LnvWarranty`
        - Made several fixes to `Get-LnvUpdatesRepo`. The ScanOnly option is no longer available. Added `-PackageList` as a parameter to specify specific updates by Package ID.

## Common Usage Scenarios

??? note "Scenario 1: Check What Updates Are Available for Your System"

    ```powershell
    $ModelType = Get-LnvMachineType
    $Updates = Find-LnvUpdate -MachineType $ModelType -WindowsVersion 11
    $Updates | Select-Object Title, Severity, ReleaseDate | Out-GridView
    ```

??? note "Scenario 2: Download All Available Driver Packs for a Specific Model"

    ```powershell
    Get-LnvDriverPack -MachineType 21DD -WindowsVersion 11 -OSBuildVersion Latest
    ```

??? note "Scenario 3: Build a Local Update Repository from a List of Machine Types"

    ```powershell
    Add-LnvMTOS -MachineType "21DD" -OS "Win11"
    Add-LnvMTOS -MachineType "21AH" -OS "Win10"
    Get-LnvUpdatesRepo -RepositoryPath "C:\Updates" -PackageTypes "1,2,3"
    ```

??? note "Scenario 4: Find All Available BIOS Updates"

    ```powershell
    Find-LnvBiosInfo -MachineType "21DD" | Select-Object Version, AvailableVersion, UpdateUrl, CVEs
    ```

## Cmdlet Categories

**System Information & Device Identification**
[Get-LnvMachineType](#get-lnvmachinetype) | [Get-LnvModelName](#get-lnvmodelname) | [Get-LnvSerial](#get-lnvserial) | [Get-LnvProductNumber](#get-lnvproductnumber) | [Get-LnvBiosCode](#get-lnvbioscode) | [Find-LnvMachineType](#find-lnvmachinetype) | [Find-LnvModel](#find-lnvmodel)

**BIOS Management**
[Find-LnvBiosCode](#find-lnvbioscode) | [Find-LnvBiosInfo](#find-lnvbiosinfo) | [Get-LnvBiosCode](#get-lnvbioscode) | [Get-LnvBiosInfo](#get-lnvbiosinfo) | [Get-LnvBiosVersion](#get-lnvbiosversion) | [Get-LnvBiosPasswordsSet](#get-lnvbiospasswordsset) | [Get-LnvBiosUpdateUrl](#get-lnvbiosupdateurl) | [Get-LnvAvailableBiosVersion](#get-lnvavailablebiosversion) | [Get-LnvCVE](#get-lnvcve)

**Updates & Drivers**
[Find-LnvUpdate](#find-lnvupdate-v100) | [Get-LnvUpdate](#get-lnvupdate) | [Find-LnvDriverPack](#find-lnvdriverpack) | [Get-LnvDriverPack](#get-lnvdriverpack) | [Get-LnvUpdatesRepo](#get-lnvupdatesrepo) | [Get-LnvUpdatesNotification](#get-lnvupdatesnotification) | [Get-LnvMTOSList](#get-lnvmtoslist) | [Add-LnvMTOS](#add-lnvmtos-v230) | [Remove-LnvMTOS](#remove-lnvmtos-v230)

**Hardware & Peripherals**
[Get-LnvBatteryInfo](#get-lnvbatteryinfo) | [Find-LnvDockModel](#find-lnvdockmodel) | [Find-LnvHSAPack](#find-lnvhsapack-v220) | [Get-LnvWUFriendlyName](#get-lnvwufriendlyname-v230)

**Utilities & System Updates**
[Find-LnvTool](#find-lnvtool) | [Add-LnvSUCommandLine](#add-lnvsucmdline-v100) | [Add-LnvSULogging](#add-lnvsulogging) | [Export-LnvUpdateRetrieverConfig](#export-lnvupdateretrieverconfig) | [Show-LnvApplicableUpdate](#show-lnvapplicableupdate)

**Warranty**
[Get-LnvWarranty](#get-lnvwarranty)

## Quick Reference Table

| Cmdlet | Category | Purpose | Version |
|--------|----------|---------|---------|
| Add-LnvMTOS | Updates | Add Machine Type + OS to tracking database | 2.3.0 |
| Add-LnvSUCommandLine | Utilities | Configure System Update admin command line | 1.0.0 |
| Add-LnvSULogging | Utilities | Enable/disable System Update logging | 1.0.0 |
| Export-LnvUpdateRetrieverConfig | Utilities | Export Update Retriever settings as .reg file | 1.0.0 |
| Find-LnvBiosCode | BIOS | Find BIOS code by model name or machine type | 1.0.0 |
| Find-LnvBiosInfo | BIOS | Search BIOS information by model or code | 1.0.0 |
| Find-LnvDockModel | Hardware | Get dock model name by machine type | 1.0.0 |
| Find-LnvDriverPack | Updates | List available driver packs for a model | 1.0.0 |
| Find-LnvHSAPack | Hardware | List available HSA packs for a model | 2.2.0 |
| Find-LnvMachineType | Device | Search machine types by model name | 1.0.0 |
| Find-LnvModel | Device | Get model name from machine type | 1.0.0 |
| Find-LnvTool | Utilities | Get Lenovo tool versions and URLs | 2.1.0 |
| Find-LnvUpdate | Updates | Search System Update catalog for updates | 1.0.0 |
| Get-LnvAvailableBiosVersion | BIOS | Get available BIOS update for a model | 1.0.0 |
| Get-LnvBatteryInfo | Hardware | Get battery information for system | 1.0.0 |
| Get-LnvBiosCode | BIOS | Get BIOS code from running device | 1.0.0 |
| Get-LnvBiosInfo | BIOS | Get BIOS info from running device | 2.0.0 |
| Get-LnvBiosPasswordsSet | BIOS | Get BIOS password state | 1.0.0 |
| Get-LnvBiosUpdateUrl | BIOS | Get BIOS update URL for a model | 1.0.0 |
| Get-LnvBiosVersion | BIOS | Get BIOS version in various formats | 1.0.0 |
| Get-LnvCVE | BIOS | Get CVE identifiers addressed in BIOS update | 1.0.0 |
| Get-LnvDriverPack | Updates | Download driver pack for specified model | 1.0.0 |
| Get-LnvMachineType | Device | Get machine type of running system | 1.0.0 |
| Get-LnvModelName | Device | Get model name of running system | 1.0.0 |
| Get-LnvMTOSList | Updates | Get list of tracked Machine Type + OS pairs | 2.3.0 |
| Get-LnvProductNumber | Device | Get 10-character product number | 1.0.0 |
| Get-LnvSerial | Device | Get serial number of running system | 1.0.0 |
| Get-LnvUpdate | Updates | **Removed in 2.4.2 - Use Lenovo.Client.Update module instead.** | - |
| Get-LnvUpdatesNotification | Updates | Show new updates in tracked catalogs | 2.3.0 |
| Get-LnvUpdatesRepo | Updates | **Removed in 2.4.2 - Use Lenovo.Client.Update module instead.** | - |
| Get-LnvWarranty | Warranty | Get warranty information from WMI | 2.0.0 |
| Get-LnvWUFriendlyName | Hardware | Get Windows Update driver names and versions | 2.3.0 |
| Invoke-LnvCVLogViewer | Utilities | Parse and analyze Commercial Vantage System Update Addin log files with color-coded summaries | 2.4.0 |
| Invoke-LnvTILogViewer | Utilities | Parse Lenovo ThinInstaller log files and produce concise summaries | 2.4.0 |
| Remove-LnvMTOS | Updates | Remove Machine Type + OS from tracking database | 2.3.0 |
| Show-LnvApplicableUpdate | Utilities | Get applicable updates from trace log | 1.0.0 |

## Installation & Setup

??? note "PowerShell Gallery (Recommended)"

    As of December 11, 2024, LCSM is published in the PowerShell Gallery for easy installation.

    **Installation:**

    ```powershell
    Install-Module -Name Lenovo.Client.Scripting -Force
    Import-Module Lenovo.Client.Scripting
    ```

    **Verify installation:**

    ```powershell
    Get-Module Lenovo.Client.Scripting
    ```

??? note "Manual Installation"

    The module itself is currently available for manual download here: [Lenovo.Client.Scripting_2.3.0.zip](https://download.lenovo.com/cdrt/tools/Lenovo.Client.Scripting_2.4.2.zip)

    The zip file contains the `Lenovo.Client.Scripting` module folder with:
    - `Lenovo.Client.Scripting.psm1` : module script
    - `Lenovo.Client.Scripting.psd1` : module manifest
    - `Public` folder : individual PowerShell scripts for public functions
    - `Private` folder : individual PowerShell scripts for private functions

    Extract the `Lenovo.Client.Scripting` folder to one of these module locations:

    - **Per User:** `%UserProfile%\Documents\WindowsPowerShell\Modules`
    - **All Users:** `%ProgramFiles%\WindowsPowerShell\Modules`

??? note "Removing Legacy Modules & Importing LCSM"

    If you previously used the Lenovo Device Management Module (LDMM), remove it first:

    ```powershell
    Remove-Module LnvDeviceManagement
    ```

    Import the LCSM module:

    ```powershell
    Import-Module Lenovo.Client.Scripting -Force
    ```

    Verify the module is loaded:

    ```powershell
    Get-Module Lenovo.Client.Scripting
    ```

## Troubleshooting & Common Issues

??? note "Module Won't Import"

    **Error:** `The term 'Lenovo.Client.Scripting' is not recognized`

    **Solutions:**

    - Verify PowerShell is version 5.1 or higher: `$PSVersionTable.PSVersion`
    - Check module is in correct path: `$env:PSModulePath`
    - Use `-Force` flag on import: `Import-Module Lenovo.Client.Scripting -Force`
    - Try refreshing the module cache: `Update-Module Lenovo.Client.Scripting`

??? note "Cmdlet Returns Empty Results"

    **Possible causes:**

    - Invalid machine type - verify with `Get-LnvMachineType` on the target device
    - No internet connection - many cmdlets require access to Lenovo catalogs
    - Regional restrictions - some updates may not be available in your region
    - Incorrect Windows version parameter - ensure you specify "10" or "11", not "Windows 10"

??? note "Get-LnvUpdatesRepo Takes Too Long"

    **Optimization tips:**

    - Specify `-PackageTypes` to limit which types to download (e.g., `"2,3"` for drivers and BIOS only)
    - Use `-DeltaUpdate` parameter (v2.2.0+) to download only new updates to existing repository
    - Use `-CloudRepo` parameter to skip downloading package files (metadata only)

??? note "BIOS Password / Get-LnvBiosPasswordsSet Requires Admin"

    **Error:** `THIS CMDLET REQUIRES ADMIN RIGHTS`

    **Solution:** Run PowerShell as Administrator before executing the cmdlet.

??? note "Show-LnvApplicableUpdate File Not Found"

    **Locations to check:**

    - Thin Installer: `C:\Program Files (x86)\Lenovo\Thin Installer\logs\Update_ApplicabilityRulesTrace.txt`
    - System Update: `%ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs\ApplicabilityRulesTrace.txt`
    - Custom location: Use full path if logs are stored elsewhere

## Cmdlet Reference

Below are all available cmdlets organized alphabetically. Each cmdlet shows its purpose, syntax, parameters, and usage examples.

??? note "Add-LnvMTOS"

    <a id="add-lnvmtos"></a>

    **Purpose:** Add a Machine Type + OS combination to the updates tracking database (lnvUpdatesDatabase.json) to monitor for new updates.

    **Syntax:**
    ```powershell
    Add-LnvMTOS -MachineType <String> -OS <String> [-ListPath <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type code |
    | OS | String | True | Operating system ("Win10" or "Win11") |
    | ListPath | String | False | Path where database will be stored (default: C:\ProgramData\Lenovo\ClientScriptingModule\) |

    **Examples:**

    ```powershell
    # Add ThinkPad 21DD Win11 to tracking database
    Add-LnvMTOS -MachineType 21DD -OS Win11

    # Add to custom location
    Add-LnvMTOS -MachineType 21DD -OS Win11 -ListPath "C:\CustomLocation"
    ```

    !!! note "Note"
        The database file (lnvUpdatesDatabase.json) is created automatically if it doesn't exist. It stores Machine Type, OS, CRC, and a list of available updates from the System Update catalog.

        **Related Cmdlets:**
        [Get-LnvMTOSList](#get-lnvmtoslist) | [Remove-LnvMTOS](#remove-lnvmtos-v230) | [Get-LnvUpdatesNotification](#get-lnvupdatesnotification)

??? note "Add-LnvSUCommandLine"

    <a id="add-lnvsucmdline"></a>

    **Purpose:** Configure administrative command-line settings for Lenovo System Update via Windows Registry.

    **Syntax:**
    ```powershell
    Add-LnvSUCommandLine -Search <String> -Action <String> [-IncludeRebootPackages <String>] [-PackageTypes <String>] [-NoReboot] [-NoIcon] [-RebootPrompt] [-Repository <String>] [-ExportToWmi]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | Search | String | True | Search scope: C (custom), R (recommended), A (all) |
    | Action | String | True | Action to perform: DOWNLOAD, INSTALL, or LIST |
    | IncludeRebootPackages | String | False | Reboot package types: 1, 3, 4, or 5 (comma-separated) |
    | PackageTypes | String | False | Update types: 0-4 (comma-separated) |
    | NoReboot | Switch | False | Suppress system reboot |
    | NoIcon | Switch | False | Hide System Update icon during execution |
    | RebootPrompt | Switch | False | Show reboot prompt before rebooting |
    | Repository | String | False | Local folder, UNC share, or URL to repository |
    | ExportToWmi | Switch | False | Export update history to WMI class |

    **Examples:**

    ```powershell
    # Configure to download all updates
    Add-LnvSUCommandLine -Search A -Action DOWNLOAD

    # Configure to install driver and BIOS only from repository
    Add-LnvSUCommandLine -Search R -Action INSTALL -PackageTypes "2,3" -Repository "C:\Updates"
    ```

    !!! note "Note"
        Check message output to determine script success. Settings are saved to Windows Registry for System Update to read on next execution.

        **Related Cmdlets:**
        [Add-LnvSULogging](#add-lnvsulogging) | [Export-LnvUpdateRetrieverConfig](#export-lnvupdateretrieverconfig)

??? note "Add-LnvSULogging"

    <a id="add-lnvsulogging"></a>

    **Purpose:** Enable or disable logging for Lenovo System Update during update sessions.

    **Syntax:**
    ```powershell
    Add-LnvSULogging [-Enable] [-Disable]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | Enable | Switch | False | Enable System Update logging |
    | Disable | Switch | False | Disable System Update logging |

    **Examples:**

    ```powershell
    # Enable logging for System Update
    Add-LnvSULogging -Enable

    # Disable logging
    Add-LnvSULogging -Disable
    ```

    !!! note "Note"
        If neither `-Enable` nor `-Disable` is specified, logging will be ENABLED by default. When logging is enabled a restart may be required. Log file location: `%ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs`

??? note "Export-LnvUpdateRetrieverConfig"

    <a id="export-lnvupdateretrieverconfig"></a>

    **Purpose:** Export Update Retriever settings (repository path and model list) to a .reg file.

    **Syntax:**
    ```powershell
    Export-LnvUpdateRetrieverConfig -Outfile <String>
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | Outfile | String | True | Output file path (.reg extension added automatically) |

    **Examples:**

    ```powershell
    # Export Update Retriever configuration
    Export-LnvUpdateRetrieverConfig -Outfile "C:\users\admin\Downloads\urconfig"
    ```

    !!! note "Note"
        Exports settings from: `HKLM\Software\Wow6432Node\Lenovo\Update Retriever\Preferences\UserSetting\General`. Specify filename without extension; .reg will be added automatically.

??? note "Find-LnvBiosCode"

    <a id="find-lnvbioscode"></a>

    **Purpose:** Find BIOS code by model friendly name or machine type. BIOS code is the first four characters of the BIOS image name.

    **Syntax:**
    ```powershell
    Find-LnvBiosCode -ModelName <String>
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | ModelName | String | True | Model friendly name or 4-character machine type |

    **Examples:**

    ```powershell
    # Search by full model name with generation
    Find-LnvBiosCode -ModelName 'ThinkPad X13 Yoga Gen 4'

    # Search by partial model name (returns all generations)
    Find-LnvBiosCode -ModelName 'ThinkPad X13 Yoga'

    # Search by machine type
    Find-LnvBiosCode 21F3
    ```

    !!! note "Note"
        When searching by friendly name, omit generation reference to get all generations of that model. For example, use 'ThinkPad X13 Yoga' (not 'Gen 4') to see results for all X13 Yoga generations.

??? note "Find-LnvBiosInfo"

    <a id="find-lnvbiosinfo"></a>

    **Purpose:** Search for BIOS information by model friendly name or BIOS code. Returns BIOS version, URLs, and CVE information.

    **Syntax:**
    ```powershell
    Find-LnvBiosInfo [-ModelName <String>] [-BiosCode <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | ModelName | String | False | Search by model friendly name |
    | BiosCode | String | False | Search by 4-character BIOS code |

    **Examples:**

    ```powershell
    # Search by machine type
    Find-LnvBiosInfo -MachineType '21DD'

    # Search by BIOS code
    Find-LnvBiosInfo -BiosCode 'n3je'
    ```

    !!! note "Note"
        Specify either ModelName or BiosCode (one is required). Returns BIOS code, available version, executable URL, readme link, and associated CVEs.

??? note "Find-LnvDockModel"

    <a id="find-lnvdockmodel"></a>

    **Purpose:** Find dock model name by machine type and optionally display PnP IDs for USB Billboard and audio devices.

    **Syntax:**
    ```powershell
    Find-LnvDockModel -MachineType <String> [-Details]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type (first 4 chars of dock product number) |
    | Details | Switch | False | Display full dock details including USB Billboard and audio device PnP IDs |

    **Examples:**

    ```powershell
    # Get dock model name only
    Find-LnvDockModel -MachineType 40AN

    # Get dock name with full details (USB Billboard and audio PnP IDs)
    Find-LnvDockModel -MachineType 40AN -Details
    ```

    !!! note "Note"
        Without -Details, returns only dock name. With -Details, shows USB Billboard and audio device PnP IDs useful for device targeting.

??? note "Find-LnvDriverPack"

    <a id="find-lnvdriverpack"></a>

    **Purpose:** List available driver packs for a specified machine type with OS, build version, CRC, and download URL.

    **Syntax:**
    ```powershell
    Find-LnvDriverPack [-MachineType] <String>
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type code |

    **Examples:**

    ```powershell
    # List all driver packs for machine type
    Find-LnvDriverPack -MachineType 21DD

    # Shorthand syntax
    Find-LnvDriverPack 21DD

    # Filter by OS and build version to get specific URL
    $url = (Find-LnvDriverPack -MachineType 21DD | Where-Object { (($_.OS -eq 'win10') -and ($_.version -eq '21H2')) }).'#text'
    ```

    !!! note "Note"
        Output fields: "os" (win10/win11), "version" (21H2/22H2), "crc", and "#text" (URL to executable). Use Where-Object to filter by OS and version. URL is in the '#text' field.

??? note "Find-LnvHSAPack"

    <a id="find-lnvhsapack"></a>

    **Purpose:** Returns a list of available HSA packs for a specified machine type, including OS, build version, CRC, and URL to the package executable.

    **Syntax:**
    ```powershell
    Find-LnvHSAPack [-MachineType] <String> [-Latest]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type |
    | Latest | Switch | False | Return only the most current HSA pack |

    **Examples:**

    ```powershell
    # List all HSA packs available for machine type
    Find-LnvHSAPack -MachineType 21DD

    # Get only the latest HSA pack
    Find-LnvHSAPack -MachineType 21DD -Latest

    # Filter by specific Windows version and build
    $url = (Find-LnvHSAPack -MachineType 21DD | Where-Object { (($_.OS -eq 'win10') -and ($_.version -eq '21H2')) }).'#text'
    ```

    **Related Cmdlets:**
    [Find-LnvDriverPack](#find-lnvdriverpack) | [Get-LnvDriverPack](#get-lnvdriverpack)

??? note "Find-LnvMachineType"

    <a id="find-lnvmachinetype"></a>

    **Purpose:** Search for machine types by model friendly name. Returns all matching machine types as models often have multiple variants.

    **Syntax:**
    ```powershell
    Find-LnvMachineType -ModelName <String>
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | ModelName | String | True | Model friendly name (partial names supported) |

    **Examples:**

    ```powershell
    # Search by full model name with generation
    Find-LnvMachineType -ModelName 'ThinkPad P1 Gen 5'

    # Search by partial name to limit results
    Find-LnvMachineType -ModelName 'ThinkPad P1 '

    # Tip: Use 'ThinkPad X1 ' to include X1 Carbon/Yoga, exclude X13/X15/X16
    ```

    !!! note "Note"
        Include a trailing space in partial names to narrow results. For example: 'ThinkPad P1 ' limits to P1 models (excludes P15, P16).

??? note "Find-LnvModel"

    <a id="find-lnvmodel"></a>

    **Purpose:** Get the friendly model name from a machine type code. Useful when display systems show machine type and you need the model name.

    **Syntax:**
    ```powershell
    Find-LnvModel [-MachineType] <String>
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type code |

    **Examples:**

    ```powershell
    # Get model name from machine type
    Find-LnvModel 21DD

    # Using parameter name syntax
    Find-LnvModel -MachineType 21DD
    ```

    !!! note "Note"
        Output also shows other machine types associated with the same model.

??? note "Find-LnvTool"

    <a id="find-lnvtool"></a>

    **Purpose:** Get Lenovo tool version and download URLs for: Dock Manager, System Update, Thin Installer, Update Retriever.

    **Syntax:**
    ```powershell
    Find-LnvTool [-Tool <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | Tool | String | False | Tool name (DockManager, SystemUpdate, ThinInstaller, UpdateRetriever) |

    **Examples:**

    ```powershell
    # Get versions for all Lenovo tools
    Find-LnvTool

    # Get information for specific tool
    Find-LnvTool -Tool DockManager
    ```

    !!! note "Note"
        Returns current version and download URL for each tool. Supported tools: Dock Manager, System Update, Thin Installer, Update Retriever.

??? note "Find-LnvUpdate"

    <a id="find-lnvupdate"></a>

    **Purpose:** Search the Lenovo System Update catalog for updates matching specified criteria.

    **Syntax:**
    ```powershell
    Find-LnvUpdate [-MachineType] <String> [-WindowsVersion <String>] [-PackageType <String>] [-RebootType <String>] [-Severity <String>] [-PackageID <String>] [-ListAll]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type |
    | WindowsVersion | String | False | "10" or "11" (default: 10) |
    | PackageType | String | False | 1=App, 2=Driver, 3=BIOS, 4=Firmware (comma-separated) |
    | RebootType | String | False | 1=Forced reboot, 3=Requires reboot, 4=Shutdown, 5=Delayed reboot (comma-separated) |
    | Severity | String | False | 1=Critical, 2=Recommended, 3=Optional (comma-separated) |
    | PackageID | String | False | Search for specific package ID |
    | ListAll | Switch | False | Return list instead of grid view |

    **Examples:**

    ```powershell
    # Display grid view of all Win11 updates for ThinkPad 21DD
    Find-LnvUpdate -MachineType 21DD -WindowsVersion 11

    # Find only driver updates requiring reboot
    Find-LnvUpdate -MachineType 21DD -PackageType 2 -RebootType 1,3 -Severity 1

    # Get all updates as object list for scripting
    $updates = Find-LnvUpdate -MachineType 21DD -ListAll
    $updates | Where-Object { $_.Severity -eq 1 } | Select-Object Name, Version, PackageExe
    ```

    !!! note "Note"
        By default displays results in grid view. Select an update and click OK to return it as an object. Use value "9" for any parameter to mean "All". Multiple values separated by commas (e.g., "1,3,5").

        **Related Cmdlets:**
        [Get-LnvUpdate](#get-lnvupdate) | [Find-LnvDriverPack](#find-lnvdriverpack) | [Get-LnvUpdatesRepo](#get-lnvupdatesrepo)

??? note "Get-LnvAvailableBiosVersion"

    <a id="get-lnvavailablebiosversion"></a>

    **Purpose:** Get the currently available BIOS update version for a machine type with optional download.

    **Syntax:**
    ```powershell
    Get-LnvAvailableBiosVersion [-MachineType <String>] [-WindowsVersion <String>] [-Download] [-ReadMe] [-DownloadPath <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | False | 4-character machine type (uses system's machine type if omitted) |
    | WindowsVersion | String | False | "10" or "11" (optional; checks both if omitted) |
    | Download | Switch | False | Download the update package |
    | ReadMe | Switch | False | Download and display the readme |
    | DownloadPath | String | False | Where to save download (default: $env:TEMP) |

    **Examples:**

    ```powershell
    # Get available BIOS version for current system
    Get-LnvAvailableBiosVersion

    # Check available version for specific machine type
    Get-LnvAvailableBiosVersion -MachineType 21DD -WindowsVersion 10

    # Download and display readme
    Get-LnvAvailableBiosVersion -MachineType 21DD -Download -ReadMe
    ```

    !!! note "Note"
        WindowsVersion is optional; if not specified and BIOS update not found in Win11 catalog, checks Win10 catalog. When omitted, uses system's detected OS and compares availability.

??? note "Get-LnvBatteryInfo"

    <a id="get-lnvbatteryinfo"></a>

    **Purpose:** Get detailed information about all batteries in the system.

    **Syntax:**
    ```powershell
    Get-LnvBatteryInfo
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get battery information for current system
    Get-LnvBatteryInfo

    # Output shows multiple battery objects for systems with multiple batteries
    # Example output:
    # InstanceName        : ACPI\PNP0C0A\0_0
    # DeviceName          : 5B11H56411
    # DesignedCapacity    : 86000
    # FullChargedCapacity : 85690
    # Charging            : False
    # DischargeRate       : 0
    ```

    !!! note "Note"
        Uses deprecated Get-WmiObject due to compatibility issues with Get-CimInstance and Win32_Battery class. Systems with multiple batteries return multiple objects.

??? note "Get-LnvBiosCode"

    <a id="get-lnvbioscode"></a>

    **Purpose:** Read BIOS image name and return the first 4 characters (BIOS code) from the device.

    **Syntax:**
    ```powershell
    Get-LnvBiosCode
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get BIOS code for current device
    Get-LnvBiosCode
    ```

    !!! note "Note"
        BIOS code is the first 4 characters of the BIOS image name and is useful for uniquely targeting a device model.

??? note "Get-LnvBiosInfo"

    <a id="get-lnvbiosinfo"></a>

    **Purpose:** Get BIOS information and metadata from current device including version, CVEs, and update URLs.

    **Syntax:**
    ```powershell
    Get-LnvBiosInfo
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get BIOS information for current device
    Get-LnvBiosInfo

    # Example output:
    # Version          : 1.10
    # VersionString    : N47ET21W (1.10)
    # ImageCode        : N47E
    # AvailableVersion : 1.10.1.08
    # UpdateUrl        : https://download.lenovo.com/pccbbs/mobiles/n47uj05w.exe
    # ReadmeUrl        : https://download.lenovo.com/pccbbs/mobiles/n47uj05w.html
    # CVEs             :
    # PasswordsSet     : 0: No BIOS Password Set
    ```

    !!! note "Note"
        Returns BIOS version, image code, available update version, download URLs, and list of CVEs unique to the device.

??? note "Get-LnvBiosPasswordsSet"

    <a id="get-lnvbiospasswordsset"></a>

    **Purpose:** Get BIOS password state and interpret which passwords are set on the device.

    **Syntax:**
    ```powershell
    Get-LnvBiosPasswordsSet [-Number]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | Number | Switch | False | Return password state as number instead of description |

    **Examples:**

    ```powershell
    # Get BIOS password description
    Get-LnvBiosPasswordsSet

    # Get password state as number
    Get-LnvBiosPasswordsSet -Number
    ```

    !!! warning "Admin Required"
        THIS CMDLET REQUIRES ADMIN RIGHTS TO EXECUTE. Make sure the PowerShell session is running with elevated privileges.

??? note "Get-LnvBiosUpdateUrl"

    <a id="get-lnvbiosupdateurl"></a>

    **Purpose:** Get URL to the current BIOS update package for specified or current machine type.

    **Syntax:**
    ```powershell
    Get-LnvBiosUpdateUrl [-MachineType <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | False | 4-character machine type (uses system's machine type if omitted) |

    **Examples:**

    ```powershell
    # Get BIOS update URL for current device
    Get-LnvBiosUpdateUrl

    # Get BIOS update URL for specific machine type
    Get-LnvBiosUpdateUrl -MachineType '21AH'
    ```

    !!! note "Note"
        Device must be a Lenovo ThinkPad, ThinkCentre, or ThinkStation.

??? note "Get-LnvBiosVersion"

    <a id="get-lnvbiosversion"></a>

    **Purpose:** Get BIOS version from device in specified format (string or decimal).

    **Syntax:**
    ```powershell
    Get-LnvBiosVersion [-Format <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | Format | String | False | "String" returns SMBIOSBIOSVersion; "Decimal" returns n.nn format |

    **Examples:**

    ```powershell
    # Get BIOS version in default string format
    Get-LnvBiosVersion

    # Get BIOS version in decimal format (n.nn)
    Get-LnvBiosVersion -Format Decimal
    ```

    !!! note "Note"
        Handles differences in BIOS version format between ThinkPad (decimal) and ThinkCentre/ThinkStation (hex build number). Desktop BIOS hex values are converted to standard version format.

??? note "Get-LnvCVE"

    <a id="get-lnvcve"></a>

    **Purpose:** List CVE (Common Vulnerabilities and Exposures) identifiers addressed in the current BIOS update.

    **Syntax:**
    ```powershell
    Get-LnvCVE [-MachineType <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | False | 4-character machine type (uses system's machine type if omitted) |

    **Examples:**

    ```powershell
    # Get CVEs addressed in BIOS update for current device
    Get-LnvCVE

    # Get CVEs for specific machine type
    Get-LnvCVE -MachineType 21DD
    ```

    !!! note "Note"
        CVE data may not be available for all machine types.

??? note "Get-LnvDriverPack"

    <a id="get-lnvdriverpack"></a>

    **Purpose:** Download SCCM driver pack for specified machine type and Windows OS version.

    **Syntax:**
    ```powershell
    Get-LnvDriverPack -MachineType <String> -WindowsVersion <String> -OSBuildVersion <String> [-DownloadPath <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type |
    | WindowsVersion | String | True | "10" or "11" |
    | OSBuildVersion | String | True | Build version (e.g., "22H2") or "Latest" for most current |
    | DownloadPath | String | False | Where to save driver pack (default: $env:TEMP) |

    **Examples:**

    ```powershell
    # Download latest driver pack for Win10
    Get-LnvDriverPack -MachineType 21DD -WindowsVersion 10 -OSBuildVersion Latest

    # Download specific build version
    Get-LnvDriverPack -MachineType 21DD -WindowsVersion 10 -OSBuildVersion 22H2

    # Download to custom path
    Get-LnvDriverPack -MachineType 21DD -WindowsVersion 11 -OSBuildVersion Latest -DownloadPath "C:\\Drivers"
    ```

    !!! note "Note"
        Uses BITS Transfer for downloads. Tab completion supported for -OSBuildVersion. Use "Latest" to get the most current pack for the specified Windows version.

??? note "Get-LnvMachineType"

    <a id="get-lnvmachinetype"></a>

    **Purpose:** Get the 4-character machine type of the current device.

    **Syntax:**
    ```powershell
    Get-LnvMachineType
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get machine type of current device
    Get-LnvMachineType
    ```

    !!! note "Note"
        Returns the 4-character machine type code of the running device.

??? note "Get-LnvModelName"

    <a id="get-lnvmodelname"></a>

    **Purpose:** Get the friendly model name of the current device.

    **Syntax:**
    ```powershell
    Get-LnvModelName
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get model name of current device
    Get-LnvModelName
    ```

    !!! note "Note"
        Returns the friendly model name (e.g., "ThinkPad P1") from WMI.

??? note "Get-LnvMTOSList"

    <a id="get-lnvmtoslist"></a>

    **Purpose:** Get list of Machine Type + OS pairs from the updates tracking database (lnvUpdatesDatabase.json).

    **Syntax:**
    ```powershell
    Get-LnvMTOSList [-ListPath <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | ListPath | String | False | Path to folder containing lnvUpdatesDatabase.json (default: C:\ProgramData\Lenovo\ClientScriptingModule) |

    **Examples:**

    ```powershell
    # Get list from default location
    Get-LnvMTOSList

    # Get list from custom database location
    Get-LnvMTOSList -ListPath "C:\ProgramData\Lenovo\ClientScriptingModule"
    ```

    !!! note "Note"
        Returns all Machine Type + OS pairs that are being tracked for updates in lnvUpdatesDatabase.json.

??? note "Get-LnvProductNumber"

    <a id="get-lnvproductnumber"></a>

    **Purpose:** Get the 10-character product number of the current device.

    **Syntax:**
    ```powershell
    Get-LnvProductNumber
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get product number of current device
    Get-LnvProductNumber
    ```

    !!! note "Note"
        Returns the full 10-character product number from WMI.

??? note "Get-LnvSerial"

    <a id="get-lnvserial"></a>

    **Purpose:** Get the serial number of the current device.

    **Syntax:**
    ```powershell
    Get-LnvSerial
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get serial number of current device
    Get-LnvSerial
    ```

    !!! note "Note"
        Returns the device serial number from WMI.

??? note "Get-LnvUpdatesNotification"

    <a id="get-lnvupdatesnotification"></a>

    **Purpose:** Display new updates added to tracked System Update catalogs since last check.

    **Syntax:**
    ```powershell
    Get-LnvUpdatesNotification [-ListPath <String>] [-ListAll]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | ListPath | String | False | Path to folder containing lnvUpdatesDatabase.json (default: standard location) |
    | ListAll | Switch | False | Show full list at command prompt instead of grid-view |

    **Examples:**

    ```powershell
    # Display grid-view of new updates
    Get-LnvUpdatesNotification

    # Show full list at command prompt
    Get-LnvUpdatesNotification -ListAll

    # Use custom database location
    Get-LnvUpdatesNotification -ListPath "C:\CustomPath"
    ```

    !!! note "Note"
        Tracks catalogs by CRC (Cyclic Redundancy Check) and identifies new updates since last execution. Grid-view allows clicking an update to view its readme. Requires Add-LnvMTOS to be used first to track models.

??? note "Get-LnvWarranty"

    <a id="get-lnvwarranty"></a>

    **Purpose:** Get the device's available warranty status from WMI.

    **Syntax:**
    ```powershell
    Get-LnvWarranty
    ```

    **Parameters:**

    No parameters

    **Examples:**

    ```powershell
    # Get warranty status for current device
    Get-LnvWarranty
    ```

    !!! note "Note"
        Requires Commercial Vantage to be installed and configured via group policy to write warranty information to WMI.

??? note "Get-LnvWUFriendlyName"

    <a id="get-lnvwufriendlyname"></a>

    **Purpose:** Return a list of drivers and firmware installed by Windows Update with their friendly names, versions, and installation dates.

    **Syntax:**
    ```powershell
    Get-LnvWUFriendlyName [-GridView] [-SortbyInstallDate]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | GridView | Switch | False | Display output in Out-GridView window |
    | SortbyInstallDate | Switch | False | Sort by InstallDate instead of WUName |

    **Examples:**

    ```powershell
    # Get all Windows Update drivers with friendly names
    Get-LnvWUFriendlyName

    # Display in grid view sorted by installation date
    Get-LnvWUFriendlyName -GridView -SortbyInstallDate
    ```

    !!! info "Attribution"
        This cmdlet is based on the work of Trevor Jones. Original implementation: [smsagent.blog](https://smsagent.blog/2023/07/07/translating-windows-update-driver-names-to-friendly-driver-names/)

??? note "Invoke-LnvCVLogViewer"

    <a id="invoke-lnvcvlogviewer"></a>

    **Purpose:** Parse and analyze Lenovo Commercial Vantage System Update Addin log files, producing a color-coded, section-by-section summary including session info, scan results, per-package install metrics, errors, and warnings. Supports both the current and legacy log formats, optional output to file, section filtering, and benign-warning suppression.

    **Syntax:**
    ```powershell
    Invoke-LnvCVLogViewer -LogFile <String> [-OutputFile <String>] [-Sections <String>] [-Force] [-IncludeBenign]
    ```

    **Parameters**

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
    | LogFile | string | True |
    | OutputFile | string | False |
    | Sections | string | False |
    | Force | switch | False |
    | IncludeBenign | switch | False |

    **LogFile**

    Path to the Lenovo System Update Addin log file to analyze. The file is expected to follow the naming pattern LenovoSystemUpdateAddin_YYYYMMDD-HHmmss-NNN.log.

    **OutputFile**

    Optional path to write a plain-text summary report. If the file already exists the script prompts for confirmation before overwriting unless -Force is also specified.

    **Sections**

    Limit output to one or more specific report sections. Valid values: All, SessionInfo, SystemInfo, UpdateSchedule, ScanResults, InstallResults, Errors, Warnings. Use 'All' to explicitly request every section. If omitted, all sections are displayed.

    **Force**

    Overwrite the OutputFile without prompting if it already exists.

    **IncludeBenign**

    Include known-benign warnings and errors (e.g. assembly load warnings, duplicate database insert attempts) in the Errors & Warnings output. By default these are suppressed and only a total count is shown.

    #### Examples

    ``` PowerShell
    Invoke-LnvCVLogViewer -LogFile "C:\logs\LenovoSystemUpdateAddin_20260220-121706-015.log"
    ```

    Displays all sections in the console.

    ``` PowerShell
    Invoke-LnvCVLogViewer -LogFile ".\session.log" -OutputFile ".\summary.txt"
    ```

    Displays all sections in the console and writes the summary to summary.txt.

    ``` PowerShell
    Invoke-LnvCVLogViewer -LogFile ".\session.log" -Sections SystemInfo,InstallResults
    ```

    Displays only the System Info and Install Results sections.

    ``` PowerShell
    Invoke-LnvCVLogViewer -LogFile ".\session.log" -OutputFile ".\summary.txt" -Force -IncludeBenign
    ```

    Overwrites any existing summary.txt and includes all benign log entries in the output.

    **Related Cmdlets:**
    [Invoke-LnvTILogViewer](#invoke-lnvtilogviewer)

??? note "Invoke-LnvTILogViewer"

    <a id="invoke-lnvtilogviewer"></a>

    **Purpose:** Analyze log files generated by Lenovo ThinInstaller and provide a human-readable summary of key session details. Supports both the current and legacy log formats, optional output to file, and color-coded console output.

    **Syntax:**
    ```powershell
    Invoke-LnvTILogViewer [-LogFile <String>] [-LogDirectory <String>] [-OutputFile <String>] [-Force] [-NoColor]
    ```

    **Parameters**

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
    | LogFile | string | True |
    | LogDirectory | string | False |
    | OutputFile | string | False |
    | Force | switch | False |
    | NoColor | switch | False |

    **LogFile**

    Path to the Lenovo System Update Addin log file to analyze.

    **LogDirectory**

    Path to a directory containing ThinInstaller log files (.txt and .log).

    **OutputFile**
    Optional path to write the summary to a plain text file.

    **Force**
    Overwrite the output file without prompting.

    **NoColor**
    Suppress color output (useful for redirected output).

    #### Examples

    ``` PowerShell
    Invoke-LnvTILogViewer -LogFile "C:\Logs\Update_log_250221164004.txt"
    ```

    Analyzes the specified log file.

    ``` PowerShell
    Invoke-LnvTILogViewer -LogDirectory "C:\Logs" -OutputFile "C:\Logs\summary.txt"
    ```

    Analyzes all of the log files in the specified log folder and writes the summary to the specified text file.

    **Related Cmdlets:**
    [Invoke-LnvCVLogViewer](#invoke-lnvcvlogviewer)

??? note "Remove-LnvMTOS"

    <a id="remove-lnvmtos"></a>

    **Purpose:** Remove a Machine Type + OS combination from the updates database (lnvUpdatesDatabase.json).

    **Syntax:**
    ```powershell
    Remove-LnvMTOS -MachineType <String> -OS <String> [-ListPath <String>]
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | MachineType | String | True | 4-character machine type (e.g., "21DD") |
    | OS | String | True | Operating system to remove ("Win10" or "Win11") |
    | ListPath | String | False | Path to folder containing lnvUpdatesDatabase.json (default: C:\ProgramData\Lenovo\ClientScriptingModule\) |

    **Examples:**

    ```powershell
    # Remove Win11 entries for machine type 21DD
    Remove-LnvMTOS -MachineType 21DD -OS Win11

    # Remove from custom database location
    Remove-LnvMTOS -MachineType 11W2 -OS Win11 -ListPath "C:\ProgramData\Lenovo\ClientScriptingModule\"
    ```

    **Related Cmdlets:**
    [Add-LnvMTOS](#add-lnvmtos-v230) | [Get-LnvMTOSList](#get-lnvmtoslist)

??? note "Show-LnvApplicableUpdate"

    <a id="show-lnvapplicableupdate"></a>

    **Purpose:** Read update applicability log from Thin Installer or System Update and return applicable package IDs.

    **Syntax:**
    ```powershell
    Show-LnvApplicableUpdate -Path <String>
    ```

    **Parameters:**

    | Parameter | Type | Mandatory | Description |
    |-----------|------|-----------|-------------|
    | Path | String | True | Full path to Update_ApplicabilityRulesTrace.txt or ApplicabilityRulesTrace.txt file |

    **Examples:**

    ```powershell
    # Show applicable updates from Thin Installer log
    Show-LnvApplicableUpdate -Path 'C:\Program Files (x86)\Lenovo\Thin Installer\logs\Update_ApplicabilityRulesTrace.txt'

    # Show applicable updates from Lenovo System Update log
    Show-LnvApplicableUpdate -Path 'C:\ProgramData\Lenovo\SystemUpdate\logs\ApplicabilityRulesTrace.txt'
    ```

    !!! note "Note"
        Output can be piped to Get-LnvUpdatesRepo -PackageList parameter to create repository with only applicable updates.
