# ThinkVantage PowerShell Library

The ThinkVantage PowerShell Library is a collection of modules and scripts published to the [PowerShell Gallery](https://www.powershellgallery.com) for managing Lenovo ThinkPad, ThinkCentre, and ThinkStation devices. The library covers driver and firmware updates, BIOS configuration, and certificate-based BIOS authentication.

**Requirements:** Windows 10/11 · PowerShell 5.0+ · Administrator privileges

```powershell
Install-Module 'Lenovo.Client.Scripting'
Install-Module 'Lenovo.Client.Update'
Install-Module 'Lenovo.BIOS.Config'
Install-Module 'Lenovo.Bios.Certificates'
```

---

## Lenovo.Client.Scripting

`Lenovo.Client.Scripting` is a PowerShell Module containing numerous cmdlets which provide useful information or simplified actions that can be leveraged in day to day management of Lenovo commercial PCs (ThinkPad, ThinkCentre, ThinkStation).

## Key Capabilities

- Query device information (model, BIOS version, serial number, warranty)
- Search for available driver packs and HSA packs
- Identify CVE's addressed by BIOS updates
- Generate Windows Update friendly names for drivers


## Popular Use Cases

- **Update Management**: Find and download driver packs for deployment
- **Inventory**: Collect hardware/software details from devices
- **BIOS Updates**: Check available BIOS versions and automate downloads
- **Compliance Tracking**: Monitor CVEs and security updates

## Installation & Quick Start

```powershell
# Install from PowerShell Gallery
Install-Module -Name Lenovo.Client.Scripting -Force

# Examples
Get-LnvMachineType
Find-LnvUpdate -MachineType 21DD
Get-LnvAvailableBiosVersion
```

---

## Lenovo.Client.Update

`Lenovo.Client.Update` is the official Lenovo fork of the popular LSUClient project on Github. It provides 12 cmdlets for discovering, downloading, and installing driver, BIOS/UEFI, and firmware updates on Lenovo commercial PCs.

| Cmdlet | Purpose |
|--------|---------|
| `Get-LnvUpdate` | Query applicable updates for this device or a target model |
| `Save-LnvUpdate` | Download update packages to a local directory |
| `Install-LnvUpdate` | Install packages silently with optional signature enforcement |
| `Get-LnvUpdatesRepo` | Build a local update repository filtered by package type and reboot behavior |
| `Get-LnvUpdateSummary` | Get a point-in-time compliance snapshot for the current device |
| `Get-LnvUpdateHistory` | Retrieve installation history filtered by date range |

**Basic workflow:**

```powershell
$updates = Get-LnvUpdate
$updates | Save-LnvUpdate -Path 'C:\Lenovo\Updates' -ShowProgress
$updates | Install-LnvUpdate -Verbose
```

**OSD task sequence — use in two passes to handle chained driver dependencies:**

```powershell
$repo = 'C:\Lenovo_Updates'
Get-LnvUpdatesRepo -RepositoryPath $repo -RebootType '0,3,5'

Get-LnvUpdate -Repository $repo | Install-LnvUpdate -Path $repo -ExportToWMI -Verbose
```

The `-ExportToWMI` parameter writes installation history to WMI for later retrieval with `Get-LnvUpdateHistory`. By default, the `Install-LnvUpdate` blocks any package that fails Lenovo's digital signature check.

Existing LSUClient scripts require only cmdlet renames (`Get-LSUpdate` → `Get-LnvUpdate`, etc.) to migrate.

---

## Lenovo.BIOS.Config

`Lenovo.BIOS.Config` provides PowerShell cmdlets for reading and modifying BIOS settings via WMI, along with a WPF GUI (`ThinkBiosConfigUI`) for interactive management. It replaces the older HTA-based Think BIOS Config Tool.

**Core cmdlets:**

| Cmdlet | Purpose |
|--------|---------|
| `Export-LnvWmiSettings` | Export current BIOS settings to an INI file |
| `Import-LnvWmiSettings` | Apply a saved INI profile to the current device |

**Script-driven BIOS deployment:**

```powershell
# Export current settings to a baseline INI
Export-LnvWmiSettings -ConfigFile 'C:\Temp\corp-bios.ini' -NoKey

# Apply the baseline to a target device
$svp = Read-Host -AsSecureString 'Supervisor Password'
Import-LnvWmiSettings -ConfigFile 'C:\Temp\corp-bios.ini' -Current $svp
```

**GUI features (`ThinkBiosConfigUI`):**

- View and modify all BIOS settings interactively; changed values are highlighted until saved
- Export the current configuration to an INI file with optional Supervisor Password encryption
- Apply a saved INI profile to the local device
- Generate Win32 app or Remediation packages from an INI and optionally upload them to Microsoft Intune via Microsoft Graph
- Create and apply Supervisor Password change files
- Save a set of settings as Custom Defaults for fleet-wide baseline reversion

```powershell
Install-Script 'ThinkBiosConfigUI'
ThinkBiosConfigUI   # Run from an elevated terminal
```

---

## Lenovo.Bios.Certificates

`Lenovo.Bios.Certificates` enables certificate-based BIOS authentication, replacing the Supervisor Password with an X.509 certificate. BIOS configuration commands are cryptographically signed — the private key never leaves its secure store.

Signing can use a local key file or an **Azure Key Vault** key, making it suitable for zero-trust and cloud-managed deployments.

**Azure Key Vault example:**

```powershell
Connect-AzAccount

# Sign and apply a single BIOS setting change
$cmd = Get-LnvSignedWmiCommand -Method SetBiosSetting `
    -VaultName 'CorpKeyVault' -KeyName 'BiosSigningKey' `
    -SettingName 'WakeOnLAN' -SettingValue 'Enable'
Submit-LnvBiosChange -Command $cmd

# Or sign and apply an entire INI configuration batch
Convert-LnvBiosConfigFile -ConfigFile 'settings.ini' `
    -VaultName 'CorpKeyVault' -KeyName 'BiosSigningKey'
Submit-LnvBiosConfigFile -ConfigFile 'SignedSettings.ini'
```

A companion GUI (`LnvBiosCertInterface`) is also available:

```powershell
Install-Script 'LnvBiosCertInterface'
```

---

## Resources

| | |
|---|---|
| **PowerShell Gallery** | Search "lenovocdrt" at [www.powershellgallery.com](https://www.powershellgallery.com) |
| **Documentation** | [docs.lenovocdrt.com](https://docs.lenovocdrt.com) |
| **Blog** | [blog.lenovocdrt.com](https://blog.lenovocdrt.com) |
| **Community forum** | [forums.lenovo.com — Enterprise Client Management Board](https://forums.lenovo.com/t5/Enterprise-Management-Board/bd-p/sa01_eg) |
