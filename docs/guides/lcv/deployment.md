---
title: Deployment
description: Commercial Vantage deployment methods and procedures
---

# Deployment

## Deployment Methods

### Microsoft Store (Not Recommended)

Available at: [https://www.microsoft.com/store/apps/9NR5B8GVVM13](https://www.microsoft.com/store/apps/9NR5B8GVVM13)

- Requires Administrator privileges
- Generates UAC prompts
- **Not suitable** for limited user deployments in managed environments

### Enterprise Package (Recommended)

Best for OS deployment task sequences, ConfigMgr, Intune, and managed environments.

!!! info "Download"
    [Lenovo Support - hf003321](https://support.lenovo.com/us/en/solutions/hf003321)
    
    Includes VantageInstaller.exe (July 2025+), deployment scripts, and ADMX templates.

---

## VantageInstaller.exe

VantageInstaller must run with Administrator privileges. All parameters are **case sensitive**.

### Quick Reference

| Parameter | Purpose |
| --- | --- |
| `Install \| Uninstall` | **Required.** Specify operation (must be first) |
| `-Vantage` | Full app + Lenovo Vantage Service + Add-ins |
| `-App` | App only (no service/add-ins) |
| `-Lite` | System Update feature only |
| `-SuHelper` | SU Helper command-line utility |
| `-LogLevel -Debug` | Enable verbose logging |
| `-Output -Path <file>` | Specify log file location |

### Common Scenarios

```cmd
# Full installation
.\VantageInstaller.exe Install -Vantage -SuHelper

# App and SU Helper only (no service)
.\VantageInstaller.exe Install -App -SuHelper

# System Update Lite mode
.\VantageInstaller.exe Install -Lite

# Uninstall with debug logging
.\VantageInstaller.exe Uninstall -Vantage -LogLevel -Debug -Output -Path C:\logs\uninstall.log
```

### PowerShell Usage

```powershell
# Recommended: Use call operator (&) for consistent argument parsing
& .\VantageInstaller.exe Install -Vantage -SuHelper
$process = Get-Process -Name "Lenovo.Vantage.InstallerHelper" -ErrorAction SilentlyContinue
if ($process) { Wait-Process -Id $process.Id }
```

### Installation Modes

??? note "Standard Mode (-Vantage)"
    
    Full installation of Commercial Vantage with all components (Vantage Service and Add-ins). When switching from Lite mode, uninstall first, then install the full version.

??? note "Lite Mode (-Lite)"
    
    System Update feature only. Sets registry key at `HKLM\Software\WOW6432Node\Lenovo\VantageService\DeviceTags\System.Profile.CommercialLite` to ensure Lite mode persists through updates.

??? note "App Only Mode (-App)"
    
    Application without Vantage Service and Add-ins. Use when components are deployed separately.

---

## Platform-Specific Deployment

??? note "Configuration Manager"
    
    [Deploying Commercial Vantage with ConfigMgr](https://blog.lenovocdrt.com/deploying-commercial-vantage-with-configmgr/)

??? note "Intune"
    
    [Deploying Commercial Vantage with Intune](https://blog.lenovocdrt.com/deploying-commercial-vantage-with-intune/)
