# ThinkVantage BIOS Config Tool V2

## Overview

ThinkVantage BIOS Config Tool is a PowerShell-based WPF GUI front-end (`ThinkBIOSConfigUI.ps1`) that uses the `Lenovo.BIOS.Config` module to read and modify Lenovo BIOS settings via WMI. It supports:

- Viewing and editing BIOS settings interactively.
- Exporting/importing BIOS settings (.ini) with optional encrypted Supervisor password.
- Creating and importing password-change files.
- Clearing or changing Supervisor password and fingerprint data.
- Creating Intune-friendly artifacts (Win32 / Proactive Remediation) and optionally uploading via Microsoft Graph.
- Saving and restoring custom defaults and remote targeting.

## Prerequisites

- Windows with PowerShell (desktop PowerShell or PowerShell Core) and administrative privileges.
- Start PowerShell with the single-threaded apartment model (`-STA`) because the GUI uses WPF/XAML.
- WMI access to target Lenovo machines (hostname-based targeting).
- For Intune packaging/upload: `IntuneWinAppUtil.exe` (tool will be downloaded if missing) and Microsoft Graph modules with appropriate tenant permissions.

## Installation / setup recommendations

This solution can be

1. Keep the repository layout intact so the GUI can find the module and templates.
1. (Optional) To use Graph/Intune features interactively, install Microsoft Graph modules (the GUI can prompt and install automatically):

```pwsh
Install-Module Microsoft.Graph -Scope CurrentUser -Force
```

!!!note
    Ensure the target machine hostnames are resolvable and you have appropriate credentials for WMI access when connecting to remote targets.
