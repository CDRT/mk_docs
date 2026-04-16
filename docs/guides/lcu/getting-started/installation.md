---
title: Installation
description: Installing the Lenovo.Client.Update PowerShell module
---

# Installation

## Quick Start

Ready to install? Here's the fastest path:

```powershell
Install-Module -Name Lenovo.Client.Update -Scope CurrentUser
```

Then verify it works:
```powershell
Get-Command -Module Lenovo.Client.Update
```

**Need to install for all users instead?** Continue to [Prerequisites](#prerequisites) and choose Method 1 with `-Scope AllUsers`.

---

## Prerequisites

Before installing the Lenovo.Client.Update module, ensure your system meets the following requirements:

- **Operating System**: Windows 10 or Windows 11
- **PowerShell**: Version 5.0 or later
- **Administrative Rights**: Required for installation and update operations (for all-users installations)
- **.NET Framework**: May be required for certificate validation components

---

## Installation Methods

### Method 1: PowerShell Gallery (Recommended)

The easiest and most maintainable approach. The module updates automatically when you run `Update-Module`.

#### Current User Installation

```powershell
Install-Module -Name Lenovo.Client.Update -Scope CurrentUser
```

#### All Users Installation

Requires administrator privileges:

```powershell
Install-Module -Name Lenovo.Client.Update -Scope AllUsers
```

#### Verify PowerShell Gallery Installation

```powershell
Get-Command -Module Lenovo.Client.Update
Get-Help Get-LnvUpdate
```

You should see all 11+ commands listed.

---

### Method 2: Manual Installation

Use this method if you need to install from a local copy or have network restrictions.

1. Download from [Lenovo](https://download.lenovo.com/cdrt/tools/luc-1.0.0.zip)
2. Extract the ZIP file
3. Copy the `Lenovo.Client.Update` folder to your modules directory:
   - **Current user only**: `$PROFILE\..\Modules\Lenovo.Client.Update\`
   - **All users**: `C:\Program Files\WindowsPowerShell\Modules\Lenovo.Client.Update\`
4. Import the module:

```powershell
Import-Module Lenovo.Client.Update
```

#### Verify Manual Installation

```powershell
Get-Command -Module Lenovo.Client.Update
Get-Help Get-LnvUpdate
```

If commands are not found, check your PowerShell module path:

```powershell
$PROFILE  # View your profile path
```

---

## Updates & Maintenance

### Update the Module

If installed via PowerShell Gallery:

```powershell
Update-Module -Name Lenovo.Client.Update
```

For manual installations, download the latest ZIP and replace the module folder.

### Remove the Module

**PowerShell Gallery installation:**

```powershell
Uninstall-Module -Name Lenovo.Client.Update
```

**Manual installation:**

Simply delete the `Lenovo.Client.Update` folder from your modules directory.

---

## Troubleshooting

### "Module not found" Error

**Symptom**: `Import-Module: The specified module 'Lenovo.Client.Update' was not found`

**Solutions:**
1. Verify the module path:
   ```powershell
   $env:PSModulePath -split ";"
   ```
2. Manually specify the path if needed:
   ```powershell
   Import-Module "C:\path\to\Lenovo.Client.Update"
   ```
3. Restart PowerShell after installation
4. Run as Administrator if installing for all users

### PowerShell Version Mismatch

**Symptom**: Module loads but commands don't work

**Solution**: Check your PowerShell version:

```powershell
$PSVersionTable.PSVersion
```

Ensure you're running PowerShell 5.0 or later. Windows PowerShell 5.0 is included with Windows 10/11.

### Certificate Validation Errors

**Symptom**: Errors related to `Lenovo.CertificateValidation.dll`

**Solution**: Ensure .NET Framework is installed:

```powershell
Get-ChildItem "C:\Program Files\WindowsPowerShell\Modules\Lenovo.Client.Update"
```

If the DLL is missing, reinstall the module.
