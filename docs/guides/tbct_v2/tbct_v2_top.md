# Think BIOS Config Tool V2

## Overview

Think BIOS Config Tool v2 is a PowerShell-based WPF GUI front-end (`ThinkBIOSConfigUI.ps1`) that uses the `Lenovo.BIOS.Config` module to read and modify Lenovo BIOS settings via WMI. This solution replaces the older Think BIOS Config Tool which was implemented as an HTA. It supports:

- Viewing and editing BIOS settings interactively.
- Exporting/importing BIOS settings (.ini) with optional encrypted Supervisor password.
- Creating and importing password-change files.
- Clearing or changing Supervisor password and fingerprint data.
- Creating Intune-friendly artifacts (Win32 / Proactive Remediation) and optionally uploading via Microsoft Graph.
- Saving and restoring custom defaults and remote targeting.

## Prerequisites

- Windows with PowerShell (desktop PowerShell or PowerShell Core) and administrative privileges.
- Start PowerShell with the single-threaded apartment model (`-STA`) because the GUI uses WPF/XAML.
- When targeting remote Lenovo devices, WMI access to the target machines (hostname-based targeting) and the appropriate credentials for WMI access when connecting to remote targets are required.
- For Intune packaging/upload: `IntuneWinAppUtil.exe` (tool will be downloaded if missing) and Microsoft Graph modules with appropriate tenant permissions.

## Installation / setup recommendations

The Think BIOS Config Tool UI is provided as a PowerShell script that is hosted on the PowerShell Gallery. It can be easily installed with the following command:

```PowerShell
Install-Script 'Lenovo.BIOS.Config.UI'
```

The required PowerShell module that support the UI can be installed from the PowerShell Gallery as well:

```PowerShell
Install-Module 'Lenovo.BIOS.Config'
```

!!!note "(Optional)"
    To use Graph/Intune features interactively, install Microsoft Graph modules (the GUI can prompt and install automatically):

    ```PowerShell
    Install-Module Microsoft.Graph -Scope CurrentUser -Force
    ```

## Quick start — launch the GUI

1. Open an elevated PowerShell terminal (Run as Administrator).
2. Run the GUI with STA:

```PowerShell
# From the repository root (adjust path as needed)
PowerShell -sta -File .\ThinkBIOSConfigUI.ps1
```

<!--
TODO:  Figure out where the script resides when installed from the Gallery
-->

Notes:

- The script includes `#Requires -RunAsAdministrator` and requires `-STA` for WPF support.
- The GUI auto-imports `Lenovo.BIOS.Config` if already installed from the PowerShell Gallery.

## UI layout and walkthrough

The main user interface for the application includes the following elements:

- Top-level navigation (left column): `Settings`, `Actions`, `Preferences` — each opens a panel on the right.
- Header: application title and a small reboot-pending indicator appear at the top of the window.
- Status bar: runtime messages and progress appear at the bottom of the window.

Panels and major controls:

### Settings

The Settings panel is always shown first when the UI is launched. It will display two columns of settings and their values with controls for selecting from the possible values for each setting.<!-- Insert screen capture -->

- Target: shows the targeted computer and BIOS version.
- Settings list: two-column view; each setting is either a ComboBox (Analog) or TextBox (Time/Date/BootOrder).
- Unsaved-change indicator: labels turn red when a value differs from initial value.
- Buttons:
    - **Save Changed Settings**: this will make the necessary calls to save any changes that are in a changed state. Once saved, the system will need to reboot before the changes will be active
    - **Revert Changes**: this will cause any settings that are in a changed state to be reverted back to their original values
    - **Reset to Factory Defaults**: this will configure all settings to their Factory Defaults
    - **Save Custom Defaults**: this will allow saving the current settings as a Custom Default. This allows you to have a profile of settings that you can revert back to which may be different than the Factory Defaults.
    - **Reset to Custom Defaults**: this will configure all settings to match the Custom Defaults.
    - **Generate INI**: this will prompt for a location to save an .ini file containing the current profile of settings. If a Supervisor Password may be needed when applying this INI to other devices, that password can be specified and a passphrase must be entered which will allow the Supervisor Password to be encrypted so it is not stored as plain text in the .ini file. If a path is not specified, the .ini file will be saved in the output folder defined in Preferences. The default location is ```%ProgramData%\Lenovo\ThinkBiosConfig\Output```

### Actions

Actions displays a panel of cards for each of the possible actions you can take with this tool. <!-- Insert screen capture -->

- **Apply Settings**: opens the "Apply settings from saved INI file" panel
- **Remove Password or Fingerprint Data**: opens the "Clear Supervisor Password or Fingerprint Data" panel
- **Change Password**: opens the "Change Supervisor Password" panel
- **Create Intune Package**: opens the "Create Intune Package" panel

#### Apply settings from saved INI file <!-- Insert screen capture -->

This panel displays inputs for the following information:

- INI file path and browse button to pick an INI.
- Password input box for supervisor password, password input box for passphrase to decrypt encrypted Supervisor Password in the INI.
- Button to apply settings from INI (can handle password-change file vs settings INI automatically).

#### Clear Supervisor Password or Fingerprint Data <!-- Insert screen capture -->

- Enter current Supervisor password, then click 'Clear SVP' or 'Clear Fingerprint Data'. This action can only be taken when a Supervisor Password is set.

#### Change Supervisor Password <!-- Insert screen capture -->

- Enter current password, new password, and confirm new password, then click **Change Password** to change the password on the current device or click **Create Password Change File** to create a password-change file that can be used on other devices.

#### Create Intune Package <!-- Insert screen capture -->

- Select INI file and output folder, optional password/passphrase, choose Win32 and/or Proactive Remediation package types.
- Click 'Create Intune Package` begins packaging and interactive upload to Intune (optional).

### Preferences <!-- Insert screen capture -->

- Output Location: specify the folder path for saving generated INI files
- Logging: Checkbox to enable logging, and input for folder to store log files. The default is ```%ProgramData%\Lenovo\ThinkBiosConfig\Logs```
- Save Preferences:  the preferences are saved to a .json file in ```%ProgramData%\Lenovo\ThinkBiosConfig``` folder
- Generate Debug File: TODO

### Dialog boxes <!-- Insert screen capture -->

- **Password Save Changes** — shown when a supervisor password is required for Save/Reset actions.
- **Password Generate INI** — used when generating INI with optional password and passphrase.

### Status and logging

The UI writes runtime messages to the `StatusBar` and uses the module logger to write log files to ```%ProgramData%\Lenovo\ThinkBiosConfig\Logs``` by default.

## Module Cmdlet Reference

The primary cmdlets exposed by the included `Lenovo.BIOS.Config` module are documented in this [reference guide.](Lenovo.BIOS.Config.Functions.Reference.md)

!!!info "Tip"
    Run an explicit example such as `Get-Help Read-LnvTBCPreferenceFile -Full` after importing the module to get parameter details for a cmdlet.

## Typical workflows (step-by-step)

1. Export current BIOS settings to INI (GUI):
    - GUI: Settings → Generate INI → optionally provide Supervisor password and passphrase → choose folder → Continue.

    - CLI:

        ```PowerShell
        Export-LnvWmiSettings -ConfigFile "C:\Temp\mysettings.ini" -NoKey
        ```

1. Apply an INI to a target (GUI):
    - GUI: Actions → Apply Settings → Browse INI → provide required Supervisor password or passphrase → Apply Settings.

    - CLI:

        ```PowerShell
        $pw = Read-Host -AsSecureString 'Supervisor password (if required)'
        Import-LnvWmiSettings -ConfigFile 'C:\Temp\mysettings.ini' -K 'MyEncryptKey' -Current $pw
        ```

1. Create a password-change file (for remote deployment):
    - GUI: Actions → Change Password → Fill current/new/confirm + encrypting passphrase → Create Password Change File.

    - CLI (interactive):

        ```PowerShell
        Export-LnvPasswordChangeFile -FileLocation 'C:\Temp\Password.ini' -Type pap
        ```

1. Clear Supervisor password or fingerprint data:
    - GUI: Actions → Remove Password or Fingerprint Data → enter current password → use Clear actions.

    - CLI:

        ```PowerShell
        $cur = Read-Host -AsSecureString 'Current Supervisor password'
        Submit-LnvFunctionRequest -Method ResetFingerprintData -Value Yes -C $cur
        # or
        Update-LnvPassword -Old $cur -New $null -Ty 'pap'
        ```

1. Create an Intune package and optionally upload to Intune (GUI):
    - GUI: Actions → Create Intune Package: choose INI, output path, select Win32/Proactive Remediation, click Create Package.
        - You will be asked if you want to upload the generated content directly to Intune. Only do this if you have the necessary access rights to do so.
        - GUI checks/installs Microsoft Graph modules and prompts to sign in.
        - Packaging the Win32 package uses Intune Win32 Content Prep Tool which is available here: [https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/blob/master/IntuneWinAppUtil.exe](https://github.com/microsoft/Microsoft-Win32-Content-Prep-Tool/blob/master/IntuneWinAppUtil.exe).

    CLI: packaging example (create `.intunewin`):  <!-- Is this real? -->

        ```PowerShell
        ConvertTo-LnvIntunePackage -in 'C:\SourceFolder' -setup 'ApplyBIOSConfig.ps1' -out 'C:\Output'
        ```

## Verification / smoke tests

- Launch GUI and confirm StatusBar contains `Gui v` and module version.
- On Settings panel, confirm `tbTarget` shows the target system and BIOS version.
- Change a setting and observe label turns red, then click `Save Changed Settings` and verify StatusBar reports the save result.
- Export an INI and verify file appears in Output folder configured in Preferences.

## Logs, preferences and storage

- Preferences file: `%ProgramData%\Lenovo\ThinkBiosConfig\preferences.json`
- Default output folder: `%ProgramData%\Lenovo\ThinkBiosConfig\Output`
- Logs: `%ProgramData%\Lenovo\ThinkBiosConfig\Logs`
- Use the Preferences panel to change Output and Log locations or call `Update-LnvTBCPreferenceFile`.

## Troubleshooting (common problems)

- GUI fails to load or reports STA errors: start PowerShell with `-STA` and run elevated.
- Module import error: manually import module using the PSD1 path and ensure files are not blocked by Windows (Unblock-File if needed).

```PowerShell
Import-Module 'C:\git\cdrt\PS-ThinkBiosConfig\Lenovo.BIOS.Config\0.9.6\Lenovo.BIOS.Config.psd1' -Force -ErrorAction Stop
```

- Intune packaging issues: ensure `IntuneWinAppUtil.exe` is present or allow the tool to download it. Confirm you have Microsoft Graph modules and tenant permissions for upload.
- Remote connection failures: use hostnames (not IPs), provide valid credentials, and ensure the account can access the Lenovo WMI provider on the target.
- If you see unexpected failures, check the log files in the Logs folder for stack traces and contextual messages.

## Security & best practices

- Always run the GUI in an elevated, trusted environment.
- Treat Supervisor passwords and encryption passphrases as secrets. Do not store them in plain text.
- Remove or rotate any hard-coded secrets. (The module contains a helper `ConnectToGraphClientSecret` with a client secret in source — treat this as a placeholder and remove or replace it for production use.)
- Restrict permissions and delete temporary password-change files after use or protect with strict filesystem ACLs.
- Test changes on non-production hardware first.

## FAQ

- Q: Do I need a Supervisor password to change BIOS settings?

    - A: Many operations require the Supervisor password if one is set on the device. The GUI will prompt for it when necessary.

- Q: Can I run the module headless for automation?

    - A: Yes — use the module cmdlets directly in scripts (Export-LnvWmiSettings, Import-LnvWmiSettings, ConvertTo-LnvIntunePackage, etc.).

- Q: Does the GUI automatically upload to Intune?

    - A: The GUI supports packaging and contains code to upload via Microsoft Graph, but upload requires Graph modules and proper tenant permissions and frequently requires interactive consent.

## Appendix — useful commands & examples

- Start GUI (STA & elevated):

```PowerShell
PowerShell -sta -File C:\git\cdrt\PS-ThinkBiosConfig\ThinkBIOSConfigUI.ps1
```

- Import module manually:

```PowerShell
Import-Module C:\git\cdrt\PS-ThinkBiosConfig\Lenovo.BIOS.Config\0.9.6\Lenovo.BIOS.Config.psd1 -Force
```

- Export settings to INI (no key):

```PowerShell
Export-LnvWmiSettings -ConfigFile 'C:\Temp\machine.ini' -NoKey
```

- Export with encryption key (CLI will prompt for Supervisor password if needed):

```PowerShell
Export-LnvWmiSettings -ConfigFile 'C:\Temp\machine_secure.ini' -Key 'MySecretKey'
```

- Import settings INI (with optional key and current password):

```PowerShell
$pw = Read-Host -AsSecureString 'Supervisor password'
Import-LnvWmiSettings -ConfigFile 'C:\Temp\machine.ini' -K 'MySecretKey' -Current $pw
```

- Create an Intune package (CLI):

```PowerShell
ConvertTo-LnvIntunePackage -in 'C:\SourceFolder' -setup 'ApplyBIOSConfig.ps1' -out 'C:\Output'
```
