---
title: Think BIOS Config Tool V2
description: PowerShell WFX GUI for managing Lenovo BIOS settings via WMI, with Intune packaging support.
---

# Think BIOS Config Tool V2

## Overview

Think BIOS Config Tool v2 is a PowerShell-based WPF GUI front-end (`ThinkBIOSConfigUI.ps1`) that uses the `Lenovo.BIOS.Config` module \[[Reference Guide](./tbc_module_reference.md)] to read and modify Lenovo BIOS settings via WMI. It supports:

- Viewing and editing BIOS settings interactively.
- Exporting/importing BIOS settings (.ini) with optional encrypted Supervisor password.
- Creating and importing password-change files.
- Clearing or changing Supervisor password and fingerprint data.
- Creating Intune-friendly artifacts (Win32 / [Remediations](https://learn.microsoft.com/intune/intune-service/fundamentals/remediations)) and optionally uploading via Microsoft Graph. (currently only available through the UI)
- Saving and restoring custom defaults.

This solution can be used in combination with the [Lenovo BIOS Certificates Tool and Module](../lbct/index.md) for complete password-less management of BIOS settings on Lenovo commercial PCs.

For detailed information on individual cmdlets, see the [Module cmdlet reference](./tbc_module_reference.md).

!!! note ""
    **This solution replaces the older Think BIOS Config Tool which was implemented as an HTA.** Archived documentation for the HTA version is still available here: [Think BIOS Config Tool - HTA](https://docs.lenovocdrt.com/guides/tbct/tbct_top/)

    Previously created INI files from the HTA version which contain an encrypted password are not compatible with the new Think BIOS Config Tool V2 due to changes in encryption methods. Please recreate the INI files using the new tool.

!!! note
    This solution currently does not support ThinkCentre desktop products due to incompatible WMI BIOS Interface implementation. Hopefully, this will be addressed in future models or through future BIOS updates.

??? note "What's New"

    ??? note "April 6, 2026: Version (GUI)2.0.3 / (Module)1.0.3"

        - Fixed GUI for password change and password export functions.
        - Fixed Export-LnvPasswordFile parameters
        - :material-new-box:{ style="color: #4caf50" } Export-LnvCertificateFile and Import-LnvCertificateFile

    ??? note "November 6, 2025: Version (GUI)2.0.2 / (Module)1.0.2"

        - Initial release


## Prerequisites

- Windows with PowerShell (Windows PowerShell or PowerShell Core) and administrative privileges.
- For Intune packaging/upload: `IntuneWinAppUtil.exe` (tool will be downloaded if missing) and Microsoft Graph modules with appropriate tenant permissions.
- [Licensed](https://learn.microsoft.com/intune/intune-service/fundamentals/remediations#licensing) for Remediations.

## Getting started

### Install the GUI

The Think BIOS Config Tool UI is provided as a PowerShell script hosted on the PowerShell Gallery:

```powershell
Install-Script 'ThinkBiosConfigUI'
```
This installs the script to:

- Windows PowerShell v5: `C:\Users\{your user name}\WindowsPowerShell\Scripts`
- PowerShell v7: `C:\Users\{your user name}\Documents\PowerShell\Scripts`

If this is your first script from the PowerShell Gallery, you'll be prompted to establish the script path and add it to your PATH environment variable.

**Or download directly:**

[https://download.lenovo.com/cdrt/tools/tbct_202_102.zip](https://download.lenovo.com/cdrt/tools/tbct_202_102.zip)

Simply unzip to a local folder and run the GUI script in an elevated terminal.

### Install the module

For direct cmdlet usage (with or without the GUI):

```powershell
Install-Module 'Lenovo.BIOS.Config'
```

### Install optional dependencies

!!! note ""
    To use Graph/Intune features interactively, install Microsoft Graph modules:

    ```powershell
    Install-Module Microsoft.Graph -Scope CurrentUser -Force
    ```

    When creating a Win32 Package, IntuneWinAppUtil.exe will be downloaded automatically to `C:\ProgramData\Lenovo\ThinkBiosConfig\Download`.

### Launch the GUI

1. Open an elevated PowerShell terminal (Run as Administrator).
2. Run:

```powershell
# Assuming installed to default script path and PATH environment variable set accordingly
ThinkBIOSConfigUI
```

!!! note
    The script includes `#Requires -RunAsAdministrator` and will auto-import the module if installed, or attempt to install it from the PowerShell Gallery.

    The GUI script auto-imports `Lenovo.BIOS.Config` if already installed from the PowerShell Gallery. If it is not already installed, it will attempt to install the module from the PowerShell Gallery. If that fails it will try to find the module in the GUI script's location.

## Using the GUI

The main user interface includes:

- **Top-level navigation** (left column): `Settings`, `Actions`, `Preferences` — each opens a panel on the right.
- **Header**: application title and target computer information.
- **Main Content**: panel views based on navigation selection.
- **Status bar**: runtime messages and progress at the bottom; optional logging available from **Preferences** panel.

### UI Panels

??? note "Settings Panel"
    The Settings panel is shown first when the GUI launches. It displays two columns of BIOS settings with controls for selecting or entering values.

    ![Opening screen](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/initial-settings.png)

    **Elements:**

    - **Target**: shows the targeted computer and BIOS version
    - **Settings list**: two-column view with ComboBoxes (for predefined options) or TextBoxes (for Time/Date/BootOrder)
    - **Unsaved-change indicator**: labels turn red when values differ from initial state
    
    **Buttons:**

    - **Save Changed Settings** – Commits changes; system will need to reboot before changes take effect
    - **Revert Changes** – Reverts modified settings to original values
    - **Reset to Factory Defaults** – Restores all settings to factory defaults
    - **Save Custom Defaults** – Saves current settings as a custom profile
    - **Reset to Custom Defaults** – Restores settings to the saved custom profile
    - **Generate INI** – Exports current settings to an .ini file with optional encrypted supervisor password; saves to location defined in Preferences (default: `%ProgramData%\Lenovo\ThinkBiosConfig\Output`)

??? note "Actions Panel"
    The Actions panel displays cards for each major operation available in the tool.

    ![Actions panel](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/actions.png)

    **Available actions:**

    ??? note "Apply Settings"
        ![Apply INI File](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/actions-applysettings.png)
        
        Applies settings from a saved INI file. Accepts inputs for:

        - INI file path (with file browser)
        - Supervisor or System Management password (if needed)
        - Passphrase to decrypt encrypted passwords in the INI
        - Automatically handles both password-change and settings INI files

    ??? note "Remove Password or Fingerprint Data"
        ![Clear password or fingerprint data](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/actions-removepassword.png)
        
        Clears the Supervisor password and/or fingerprint data. Requires:

        - Current Supervisor password
        - Click **Clear SVP** or **Clear Fingerprint Data** as needed
        - Only available when a Supervisor Password is set

    ??? note "Change Supervisor Password"
        ![Change password](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/actions-changepassword.png)
        
        Creates a password change request. Enter:

        - Current password
        - New password (with confirmation)
        - Click **Change Password** to update the current device, or **Create Password Change File** to create a file for deployment to other devices

    ??? note "Create Intune Package"
        ![Create Intune Package](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/actions-intunepackage.png)
        
        Packages BIOS configuration for Intune deployment. Specify:

        - Source INI file and optional passphrase
        - Package Name and Version (displayed in Intune portal)
        - Package type: Win32, Remediation, or both
        - Tag file name for Win32 detection rules
        - Output location (from Preferences)
        - Optional: upload directly to Intune via MS Graph

??? note "Preferences Panel"
    ![Preferences](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/preferences.png)

    Configure tool behavior:

    - **Output Location**: folder for saving generated INI files
    - **Logging**: enable/disable and specify log folder (default: `%ProgramData%\Lenovo\ThinkBiosConfig\Logs`)
    - **Save Preferences**: settings saved to `.json` in `%ProgramData%\Lenovo\ThinkBiosConfig`
    
<!--Generate Debug File: TODO-->


??? note "Dialog Boxes"
    
    **Password Save Changes**  
    Shown when a supervisor password is required for Save/Reset actions.

    ![Password Prompt](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/password-prompt.png){: style="width:400px; height:auto;"}

    **Password Generate INI**  
    Used when generating INI with optional password and passphrase.
    ![Generate INI](https://cdrt.github.io/mk_docs/img/guides/tbct_v2/generate-ini.png)

??? note "Status Bar"

    The UI writes runtime messages to the StatusBar and uses the module logger to write log files to `%ProgramData%\Lenovo\ThinkBiosConfig\Logs` by default.

## Typical workflows

1. Export current BIOS settings to INI (GUI):
    - GUI: Settings → Generate INI → optionally provide Supervisor password and passphrase → choose folder → Continue.

    - CLI:

        ```powershell
        Export-LnvWmiSettings -ConfigFile "C:\Temp\mysettings.ini" -NoKey
        ```

2. Apply an INI to a target (GUI):
    - GUI: Actions → Apply Settings → Browse INI → provide required Supervisor password or passphrase → Apply Settings.

    - CLI:

        ```powershell
        $pw = Read-Host -AsSecureString 'Supervisor password (if required)'
        Import-LnvWmiSettings -ConfigFile 'C:\Temp\mysettings.ini' -K 'MyEncryptKey' -Current $pw
        ```

3. Create a password-change file (for remote deployment):
    - GUI: Actions → Change Password → Fill current/new/confirm + encrypting passphrase → Create Password Change File.

    - CLI (interactive):

        ```powershell
        Export-LnvPasswordChangeFile -FileLocation 'C:\Temp\Password.ini' -Type pap
        ```

4. Clear Supervisor password or fingerprint data:
    - GUI: Actions → Remove Password or Fingerprint Data → enter current password → use Clear actions.

    - CLI:

        ```powershell
        $cur = Read-Host -AsSecureString 'Current Supervisor password'
        Submit-LnvFunctionRequest -Method ResetFingerprintData -Value Yes -C $cur
        # or
        Update-LnvPassword -Old $cur -New $null -Ty 'pap'
        ```

5. Create an Intune package and optionally upload to Intune (GUI only):
    - GUI: Actions → Create Intune Package: choose INI, output path, select Win32/Remediation, click Create Package.
        - You will be asked if you want to upload the generated content directly to Intune. Only do this if you have the necessary access rights to do so.
        - GUI checks/installs Microsoft Graph modules and prompts to sign in.
        - Packaging the Win32 package uses Intune Win32 Content Prep Tool which is available here: [https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/blob/master/IntuneWinAppUtil.exe](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/blob/master/IntuneWinAppUtil.exe).

## Configuration

### Storage locations

- **Preferences file**: `%ProgramData%\Lenovo\ThinkBiosConfig\preferences.json`
- **Output folder**: `%ProgramData%\Lenovo\ThinkBiosConfig\Output` (for generated INI, Intune packages)
- **Logs**: `%ProgramData%\Lenovo\ThinkBiosConfig\Logs`

Use the Preferences panel to change Output and Log locations, or call `Update-LnvTBCPreferenceFile` from the command line.

### Module reference

For detailed information on individual cmdlets, see the [Module cmdlet reference](./tbc_module_reference.md).

!!! info "Tip"
    Run `Get-Help <cmdlet> -Full` after importing the module to get parameter details. Example: `Get-Help Read-LnvTBCPreferenceFile -Full`

## Troubleshooting (common problems)

- GUI fails to load or reports STA errors: start PowerShell with `-STA` and run elevated.

- Intune packaging issues: ensure `IntuneWinAppUtil.exe` is present or allow the tool to download it. Confirm you have Microsoft Graph modules and tenant permissions for upload.

- If you see unexpected failures, check the log files in the Logs folder for stack traces and contextual messages.

## Security & best practices

- Always run the GUI in an elevated, trusted environment.
- Treat Supervisor passwords and encryption passphrases as secrets. Do not store them in plain text.

!!! danger "Security: Remove hard-coded secrets before production use"
    The `ConnectToGraphClientSecret` helper in the module contains a placeholder client secret.
    Replace or remove it before deploying in any production or shared environment.

- Restrict permissions and delete temporary password-change files after use or protect with strict filesystem ACLs.
- Test changes on non-production hardware first.
- Ensure the **Lenovo.BIOS.Config** module is either installed/imported on endpoints before attempting to apply settings using the tool.

## Troubleshooting & FAQ

!!! bug "Common problems"
    - **GUI fails to load or reports STA errors**: start PowerShell with `-STA` and run elevated.
    - **Intune packaging issues**: ensure `IntuneWinAppUtil.exe` is present or allow the tool to download it. Confirm you have Microsoft Graph modules and tenant permissions for upload.
    - **Unexpected failures**: check the log files in the Logs folder for stack traces and contextual messages.

### Frequently asked questions

??? question "Do I need a Supervisor password to change BIOS settings?"
    Many operations require the Supervisor password if one is set on the device. The GUI will prompt for it when necessary.

??? question "Can I run the module headless for automation?"
    Yes — use the module cmdlets directly in scripts. Start with `Initialize-LnvThinkBiosConfig` to initialize the module, then use cmdlets such as `Export-LnvWmiSettings`, `Import-LnvWmiSettings`, and `ConvertTo-LnvIntunePackage` for your automation tasks.

??? question "Does the GUI automatically upload to Intune?"
    The GUI supports packaging and contains code to upload via Microsoft Graph, but upload requires Graph modules and proper tenant permissions and frequently requires interactive consent.
