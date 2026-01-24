# LSU vs Lenovo.Client.Update (LCU)

This document outlines the differences between the original **LSUClient** (LSU) by jantari and the **Lenovo.Client.Update** (LCU) module in case you need to migrate some existing scripts to use this module.

## Feature Comparison

| Feature | LSU | LCU | Notes |
|---------|--------------|-----------------|-------|
| **Core Update Discovery** | YES | YES | Fetch available updates for Lenovo systems |
| **Driver Updates** | YES | YES | Install device drivers |
| **BIOS/UEFI Updates** | YES | YES | Update system BIOS/UEFI |
| **Firmware Updates** | YES | YES | Firmware updates for various components |
| **Silent Installation** | YES | YES | Unattended installation support |
| **Custom Repository** | YES | YES | Host own update repository |
| **Proxy Support** | YES | YES | Web proxy with authentication |
| **Package Extraction** | YES | YES | Extract package contents |
| **Proxy Configuration Management** | YES | YES | Get/Set proxy and credentials |
| **Signature Verification** | NO | YES | Test-LnvSignature - verify package authenticity |
| **Signature Enforcement** | NO | YES | -VerifySignature flag on installation |
| **Skip Signature Check** | NO | YES | -SkipSignatureCheck for testing environments |
| **Certificate Validation** | Basic | YES (Dedicated DLL) | Lenovo.CertificateValidation.dll |
| **Update History** | LIMITED | YES (Enhanced) | Better history tracking |

---

## Command Comparison

### Quick Reference: Commands

**Original LSU had 6 public functions:**

- Get-LSUpdate
- Save-LSUpdate
- Install-LSUpdate
- Expand-LSUpdate
- Get-LSUClientConfiguration
- Set-LSUClientConfiguration

**LCU has 12 public functions (6 from LSU + 6 NEW):**

- Get-LnvUpdate (renamed from Get-LSUpdate)
- Save-LnvUpdate (renamed from Save-LSUpdate)
- Install-LnvUpdate (renamed from Install-LSUpdate)
- Expand-LnvUpdate (renamed from Expand-LSUpdate)
- Get-LnvUpdateConfiguration (renamed from Get-LSUClientConfiguration)
- Set-LnvUpdateConfiguration (renamed from Set-LSUClientConfiguration)
- **Get-LnvDownload** (NEW)
- **Get-LnvUpdateHist** (NEW - enhanced version)
- **Add-LnvUpdateHist** (NEW)
- **Get-LnvUpdateSummary** (NEW)
- **Get-LnvUpdatesRepo** (NEW - from Lenovo.Client.Scripting Module)
- **Get-LnvUpdatefromWMI** (NEW)

### Core Commands (Unchanged)

These commands work the same in both LSU and LCU:

#### Get-LnvUpdate / Get-LSUpdate

```powershell
# Original LSU
$updates = Get-LSUpdate
$updates = Get-LSUpdate -Model "20LS" -All


# LCU (fully compatible)
$updates = Get-LnvUpdate
$updates = Get-LnvUpdate -Model "20LS" -All

```

#### Save-LnvUpdate / Save-LSUpdate

```powershell
# Original LSU
$updates | Save-LSUpdate -Path "C:\Updates" -ShowProgress

# LCU (compatible)
$updates | Save-LnvUpdate -Path "C:\Updates" -ShowProgress
```

#### Install-LnvUpdate / Install-LSUpdate

```powershell
# Original LSU
$updates | Install-LSUpdate -Verbose

# LCU (compatible)
$updates | Install-LnvUpdate -Verbose
```

#### Get-LnvUpdateConfiguration / Get-LSUpdateConfiguration

```powershell
# Original LSU
$config = Get-LSUpdateConfiguration

# LCU
$config = Get-LnvUpdateConfiguration
```

#### Set-LnvUpdateConfiguration / Set-LSUpdateConfiguration

```powershell
# Original LSU
Set-LSUpdateConfiguration -Proxy "http://proxy.com:8080"

# LCU
Set-LnvUpdateConfiguration -Proxy "http://proxy.com:8080"
```

#### Expand-LnvUpdate

```powershell
# Original LSU
# Download and extract
$updates = Get-LSUpdate
$updates | Save-LSUpdate -Path C:\Packages
$updates | Expand-LSUpdate -Path C:\Packages

# LCU
# Download and extract
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate -Path C:\Packages
$updates | Expand-LnvUpdate -Path C:\Packages

# Or use Get-LnvDownload with -Expand
Get-LnvDownload -MachineType 21N2 -RepositoryFolder "C:\Repo" -Expand
```

### New Commands in LCU

#### Get-LnvDownload

**NEW** - Downloads current updates for a specified Machine Type to a specified local folder with an option expand the packages. This cmdlet was migrated from the Lenovo.Client.Scripting module and will be maintained in this module going forward.

```powershell
# LCU (NEW)
Get-LnvDownload -MachineType 21N2 -RepositoryFolder "C:\Repo" -Expand
```

#### Get-LnvUpdateHist

**NEW** - Get update install history:

```powershell
# LCU (NEW)
Get-LnvUpdateHist | Where-Object { $_.InstallDate -gt (Get-Date).AddDays(-30) }
```

#### Get-LnvUpdateSummary

**NEW** - Get update status summary:

```powershell
# LCU (NEW)
Get-LnvUpdateSummary
```

#### Add-LnvUpdateHist

**NEW** - Manually record updates:

```powershell
# LCU (NEW)
Add-LnvUpdateHist -Title "Custom Update" -InstallDate (Get-Date) -Result "Success"
```

#### Get-LnvUpdatesRepo

**NEW** - Create a repository of updates in the style of Update Retriever using the machine type of the running system. This cmdlet was migrated from the Lenovo.Client.Scripting Module and will be maintained in the LCU module going forward.

```powershell
# LCU (NEW)
Get-LnvUpdatesRepo -RepositoryPath 'C:\Lenovo_Repository' -PackageTypes '1,2' -RebootTypes '0,3'
```

---

## Main Function Parameter Changes

### Install-LnvUpdate - New Parameters

**Original LSU:**
```powershell
Install-LSUpdate -Package $package -Path "C:\Updates" -Verbose
```

**LCU - Enhanced Parameters:**

```powershell
# Original parameters still work
Install-LnvUpdate -Package $package -Path "C:\Updates" -Verbose

# NEW: Verify signatures before installation
Install-LnvUpdate -Package $package -VerifySignature

# NEW: Skip signature verification (testing only)
Install-LnvUpdate -Package $package -SkipSignatureCheck
```

| Parameter | LSU | LCU | Purpose |
|-----------|-----|----------|---------|
| `Package` | YES | YES | Update package to install |
| `Path` | YES | YES | Downloaded package location |
| `Proxy` | YES | YES | Proxy server URL |
| `ProxyCredential` | YES | YES | Proxy authentication |
| `SaveBIOSUpdateInfoToRegistry` | Yes | YES
| `VerifySignature` | NO | YES | NEW: Verify package signatures |
| `SkipSignatureCheck` | NO | YES | NEW: Bypass signature verification |

### Get-LnvUpdate - New Parameters

All original parameters preserved plus:

| Parameter | LSU | LCU | Purpose |
|-----------|-----|----------|---------|
| `Model` | YES | YES | Computer model to target |
| `All` | YES | YES | Return all packages |
| `Proxy` | YES | YES | Proxy server |
| `Repository` | YES | YES | Custom repository URL |
| `IncludePhantomDevices` | YES | YES | Include offline devices |
| `MachineCharacteristicsOverride` | YES | YES | Override system info |
| `NoTestApplicable` | YES | YES | Skip applicability checks |
| `NoTestInstalled` | YES | YES | Skip installation checks |
| `ScratchDirectory` | YES | YES | Temp folder for downloads |
| `-StatusMode`| String | Change the status of the packages |
| `-LogPath` | String | specify the path of the logfile|
| `-LogFile` | switch| creates a logfile after the packages are retrieved |

### New Parameters on Existing Commands

**Install-LnvUpdate - NEW parameters:**
- `-VerifySignature` - Enforce signature verification
- `-SkipSignatureCheck` - Bypass signature verification
- `-ExportToWMI` - Export the update information to WMI in the root\Lenovo\Lenovo_Updates class

### Core Infrastructure Additions
 **Lenovo.CertificateValidation.dll** - Dedicated certificate validation assembly

---

## Security Enhancements

### Digital Signature Verification

**Original LSU:**
- Basic signature checking but no enforcement
- No dedicated verification function
- No options to skip signature checks

**LnvUpdate:**

```powershell
# NEW: Dedicated signature verification function
$updates | Test-LnvSignature

# NEW: Enforce signatures during installation
$updates | Install-LnvUpdate -VerifySignature

# NEW: Dedicated certificate validation DLL
# File: Lenovo.CertificateValidation.dll
# Purpose: Enhanced cryptographic verification
```

### Certificate Validation

```powershell
# Examples showing enhanced validation
$updates = Get-LnvUpdate
$updates | Install-LnvUpdate -VerifySignature  # Uses enhanced validation

# Or manually test
$updates | Test-LnvSignature
```
