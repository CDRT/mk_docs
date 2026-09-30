---
title: LSU vs Lenovo.Client.Update
description: Comparison of LSUClient and Lenovo.Client.Update module features and commands
---

# LSU vs LCU

This document outlines the differences between the original **LSUClient** (LSU) by jantari and the **Lenovo.Client.Update** (LCU) module in case you need to migrate some existing scripts to use this module.

## Feature Comparison

| Feature | LSU | LCU | Notes |
| --- | --- | --- | --- |
| **Core Update Discovery** | Yes | Yes | Fetch available updates for Lenovo systems |
| **Driver Updates** | Yes | Yes | Install device drivers |
| **BIOS/UEFI Updates** | Yes | Yes | Update system BIOS/UEFI |
| **Firmware Updates** | Yes | Yes | Firmware updates for various components |
| **Silent Installation** | Yes | Yes | Unattended installation support |
| **Custom Repository** | Yes | Yes | Host own update repository |
| **Proxy Support** | Yes | Yes | Web proxy with authentication |
| **Package Extraction** | Yes | Yes | Extract package contents |
| **Proxy Configuration Management** | Yes | Yes | Get/Set proxy and credentials |
| **Signature Verification** | No | Yes | Test-LnvSignature - verify package authenticity |
| **Signature Enforcement** | N/A | Yes | -VerifySignature flag on installation |
| **Skip Signature Check** | N/A | Yes | -SkipSignatureCheck for testing environments |
| **Certificate Validation** | N/A | Yes (Dedicated DLL) | Lenovo.CertificateValidation.dll |
| **Update History** | Limited | Yes (Enhanced) | Better history tracking |

---

## Command Comparison

### Quick Reference: Commands

#### Migrated from LSU (6 commands)

All work identically, just renamed:

- [`Get-LnvUpdate`](functions/get-lnvupdate.md) (renamed from Get-LSUpdate)
- [`Save-LnvUpdate`](functions/save-lnvupdate.md) (renamed from Save-LSUpdate)
- [`Install-LnvUpdate`](functions/install-lnvupdate.md) (renamed from Install-LSUpdate)
- [`Expand-LnvUpdate`](functions/expand-lnvupdate.md) (renamed from Expand-LSUpdate)
- [`Get-LnvUpdateConfiguration`](functions/get-lnvupdateconfiguration.md) (renamed from Get-LSUClientConfiguration)
- [`Set-LnvUpdateConfiguration`](functions/set-lnvupdateconfiguration.md) (renamed from Set-LSUClientConfiguration)

#### New to LCU (6 commands)

- [`Get-LnvDownload`](functions/get-lnvdownload.md) - Download and optionally expand packages by machine type
- [`Get-LnvUpdateHist`](functions/get-lnvupdatehist.md) - View update installation history
- [`Get-LnvUpdateSummary`](functions/get-lnvupdatesummary.md) - Get system update status summary
- [`Get-LnvUpdatesRepo`](functions/get-lnvupdatesrepo.md) - Build a local update repository
- [`Get-LnvUpdateFromWmi`](functions/get-lnvupdatefromwmi.md) - Query WMI for update information
- `Add-LnvUpdateHist` - Manually record updates in history

---

### Core Commands (Unchanged)

These commands work the same in both LSU and LCU:

??? note "Get-LnvUpdate / Get-LSUpdate"
    ```powershell
    # Original LSU
    $updates = Get-LSUpdate
    $updates = Get-LSUpdate -Model "20LS" -All

    # LCU (fully compatible)
    $updates = Get-LnvUpdate
    $updates = Get-LnvUpdate -Model "20LS" -All
    ```

??? note "Save-LnvUpdate / Save-LSUpdate"
    ```powershell
    # Original LSU
    $updates | Save-LSUpdate -Path "C:\Updates" -ShowProgress

    # LCU (compatible)
    $updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
    ```

??? note "Install-LnvUpdate / Install-LSUpdate"
    ```powershell
    # Original LSU
    $updates | Install-LSUpdate -Verbose

    # LCU (compatible)
    $updates | Install-LnvUpdate -Verbose
    ```

??? note "Get-LnvUpdateConfiguration / Get-LSUpdateConfiguration"
    ```powershell
    # Original LSU
    $config = Get-LSUpdateConfiguration

    # LCU
    $config = Get-LnvUpdateConfiguration
    ```

??? note "Set-LnvUpdateConfiguration / Set-LSUpdateConfiguration"
    ```powershell
    # Original LSU
    Set-LSUpdateConfiguration -Proxy "http://proxy.com:8080"

    # LCU
    Set-LnvUpdateConfiguration -Proxy "http://proxy.com:8080"
    ```

??? note "Expand-LnvUpdate"
    ```powershell
    # Original LSU
    $updates = Get-LSUpdate
    $updates | Save-LSUpdate -Path C:\Packages
    $updates | Expand-LSUpdate -Path C:\Packages

    # LCU
    $updates = Get-LnvUpdate
    $updates | Save-LnvUpdate -Path C:\Packages
    $updates | Expand-LnvUpdate -Path C:\Packages

    # Or use Get-LnvDownload with -Expand
    Get-LnvDownload -MachineType 21N2 -RepositoryFolder "C:\Repo" -Expand
    ```

### New Commands in LCU - Detailed Examples

??? note "Get-LnvDownload - Download and expand packages by machine type"
    **NEW** - Downloads current updates for a specified Machine Type to a specified local folder with an option to expand the packages. This cmdlet was migrated from the Lenovo.Client.Scripting module and will be maintained in this module going forward.

    ```powershell
    # LCU (NEW)
    Get-LnvDownload -MachineType 21N2 -RepositoryFolder "C:\Repo" -Expand
    ```

??? note "Get-LnvUpdateHist - View update installation history"
    **NEW** - Get update install history:

    ```powershell
    # LCU (NEW)
    Get-LnvUpdateHist | Where-Object { $_.InstallDate -gt (Get-Date).AddDays(-30) }
    ```

??? note "Get-LnvUpdateSummary - Get system update status"
    **NEW** - Get update status summary:

    ```powershell
    # LCU (NEW)
    Get-LnvUpdateSummary
    ```

??? note "Add-LnvUpdateHist - Manually record updates"
    **NEW** - Manually record updates:

    ```powershell
    # LCU (NEW)
    Add-LnvUpdateHist -Title "Custom Update" -InstallDate (Get-Date) -Result "Success"
    ```

??? note "Get-LnvUpdatesRepo - Create a local update repository"
    **NEW** - Create a repository of updates in the style of Update Retriever using the machine type of the running system. This cmdlet was migrated from the Lenovo.Client.Scripting Module and will be maintained in the LCU module going forward.

    ```powershell
    # LCU (NEW)
    Get-LnvUpdatesRepo -RepositoryPath 'C:\Lenovo_Repository' -PackageTypes '1,2' -RebootTypes '0,3'
    ```

---

## Parameter & Feature Enhancements

### Security Features (NEW to LCU)

**Install-LnvUpdate** now includes signature verification and security controls:

```powershell
# Verify signatures before installation
$updates | Install-LnvUpdate -VerifySignature

# Skip signature verification (testing only)
$updates | Install-LnvUpdate -SkipSignatureCheck

# Dedicated signature verification function
$updates | Test-LnvSignature
```

??? note "Security Parameters"
    | Parameter | LSU | LCU | Purpose |
    | --- | --- | --- | --- |
    | `VerifySignature` | No | Yes | Enforce digital signature verification before installation |
    | `SkipSignatureCheck` | No | Yes | Bypass verification for testing (not recommended for production) |

    | Component | LSU | LCU | Purpose |
    | --- | --- | --- | --- |
    | Lenovo.CertificateValidation.dll | N/A | Yes | Enhanced cryptographic certificate validation |

---

### Tracking & Logging Features (NEW to LCU)

**Install-LnvUpdate** can export installation data to WMI for compliance tracking:

```powershell
$updates | Install-LnvUpdate -ExportToWMI -Verbose
```

**Get-LnvUpdate** provides enhanced logging capabilities:

```powershell
# Create a logfile in the default location
$updates = Get-LnvUpdate -LogFile

# Create a logfile in a custom location
$updates = Get-LnvUpdate -LogPath "C:\Logs\updates.log"

# Modify package status
$updates = Get-LnvUpdate -StatusMode "Approved"
```

??? note "Logging & Tracking Parameters"
    | Parameter | Command | LSU | LCU | Purpose |
    | --- | --- | --- | --- | --- |
    | `ExportToWMI` | Install-LnvUpdate | No | Yes | Export installation info to WMI for audit/tracking |
    | `SaveBIOSUpdateInfoToRegistry` | Install-LnvUpdate | Yes | Yes | Record BIOS updates in registry |
    | `-LogFile` | Get-LnvUpdate | No | Yes | Create logfile in default path (`C:\ProgramData\Lenovo\...`) |
    | `-LogPath` | Get-LnvUpdate | No | Yes | Create logfile in specified custom path |
    | `-StatusMode` | Get-LnvUpdate | No | Yes | Change the status of retrieved packages |

---

### Complete Parameter Reference

??? note "Install-LnvUpdate - All Parameters"
    | Parameter | LSU | LCU | Purpose |
    | --- | --- | --- | --- |
    | `Package` | Yes | Yes | Update package to install |
    | `Path` | Yes | Yes | Downloaded package location |
    | `Proxy` | Yes | Yes | Proxy server URL |
    | `ProxyCredential` | Yes | Yes | Proxy authentication |
    | `SaveBIOSUpdateInfoToRegistry` | Yes | Yes | Record BIOS update in registry |
    | `VerifySignature` | No | Yes | **NEW:** Verify package signatures |
    | `SkipSignatureCheck` | No | Yes | **NEW:** Bypass signature verification |
    | `ExportToWMI` | No | Yes | **NEW:** Export to WMI for tracking |

??? note "Get-LnvUpdate - All Parameters"
    | Parameter | LSU | LCU | Purpose |
    | --- | --- | --- | --- |
    | `Model` | Yes | Yes | Computer model to target |
    | `All` | Yes | Yes | Return all packages |
    | `Proxy` | Yes | Yes | Proxy server |
    | `Repository` | Yes | Yes | Custom repository URL |
    | `IncludePhantomDevices` | Yes | Yes | Include offline devices |
    | `MachineCharacteristicsOverride` | Yes | Yes | Override system info |
    | `NoTestApplicable` | Yes | Yes | Skip applicability checks |
    | `NoTestInstalled` | Yes | Yes | Skip installation checks |
    | `ScratchDirectory` | Yes | Yes | Temp folder for downloads |
    | `-StatusMode` | No | Yes | **NEW:** Change package status |
    | `-LogPath` | No | Yes | **NEW:** Custom logfile path |
    | `-LogFile` | No | Yes | **NEW:** Create logfile automatically |
