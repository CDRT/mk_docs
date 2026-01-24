# Installation

## Prerequisites

Before installing the Lenovo.Client.Update module, ensure your system meets the following requirements:

- **Operating System**: Windows 10 or Windows 11
- **PowerShell**: Version 5.0 or later
- **Administrative Rights**: Required for installation and update operations
- **.NET Framework**: May be required for certificate validation components

## Installation Methods

### Method 1: PowerShell Gallery (Recommended)

The easiest way to install the module is from the PowerShell Gallery:

```powershell
Install-Module -Name Lenovo.Client.Update -Scope CurrentUser
```

For all users:

```powershell
Install-Module -Name Lenovo.Client.Update -Scope AllUsers
```

## Manual Installation

1. Download from [Lenovo](https://download.lenovo.com/cdrt/tools/luc-1.0.0.zip)
2. Extract to: `C:\Program Files\WindowsPowerShell\Modules\LnvUpdate\`
3. Import: `Import-Module Lenovo.Client.Update`

## Verify Installation

```powershell
Get-Command -Module Lenovo.Client.Update
Get-Help Get-LnvUpdate
```

## Update Module

```powershell
Update-Module -Name Lenovo.Client.Update
```
