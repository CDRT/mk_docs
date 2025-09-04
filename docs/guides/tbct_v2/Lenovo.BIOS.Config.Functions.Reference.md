# Lenovo.BIOS.Config — Function Reference

This reference summarizes the comment-based help (Synopsis, Description, Parameters, Examples) found in `Lenovo.BIOS.Config.psm1` for the module's exported functions.

## Quick index

- [Initialize-LnvThinkBiosConfig](#initialize-lnvthinkbiosconfig)
- [Show-LnvWmiSettings](#show-lnvwmisettings)
- [Read-LnvTBCPreferenceFile](#read-lnvtbcpreferencefile)
- [Update-LnvTBCPreferenceFile](#update-lnvtbcpreferencefile)
- [Get-LnvTBCTargetComputer](#get-lnvtbctargetcomputer)
- [Open-LnvTBCRemoteComputer](#open-lnvtbcremotecomputer)
- [Close-LnvTBCRemoteComputer](#close-lnvtbcremotecomputer)
- [Test-LnvTBCPendingChanges](#test-lnvtbcpendingchanges)
- [Test-LnvTBCPendingReboot](#test-lnvtbcpendingreboot)
- [Export-LnvPasswordChangeFile](#export-lnvpasswordchangefile)
- [Import-LnvPasswordChangeFile](#import-lnvpasswordchangefile)
- [Update-LnvPassword](#update-lnvpassword)
- [Export-LnvWmiSettings](#export-lnvwmisettings)
- [Import-LnvWmiSettings](#import-lnvwmisettings)
- [Save-LnvCustomDefault](#save-lnvcustomdefault)
- [Restore-LnvCustomDefault](#restore-lnvcustomdefault)
- [Get-LnvWmiSetting](#get-lnvwmisetting)
- [Set-LnvWmiSetting](#set-lnvwmisetting)
- [Save-LnvWmiSettings](#save-lnvwmisettings)
- [Reset-LnvWmiSettings](#reset-lnvwmisettings)
- [Restore-LnvDefaultSettings](#restore-lnvdefaultsettings)
- [Submit-LnvFunctionRequest](#submit-lnvfunctionrequest)
- [Convert-LnvConfigFileToScript](#convert-lnvconfigfiletoscript)

---

### Initialize-LnvThinkBiosConfig

- Synopsis: Gathers the WMI data needed for the module to work
- Description: Gathers the WMI data needed for the module to work. No output is shown.
- Example:
    - `Initialize-LnvThinkBiosConfig`

### Show-LnvWmiSettings

- Synopsis: Gathers the WMI data needed for the module to work
- Description: Gathers the WMI data needed for the module to work. All output is shown.
- Parameters:
    - `-Force` (switch): Force the settings to be reloaded
    - `-OnlyChanged` (switch): Only show the modified settings
- Examples:
    - `Show-LnvWmiSettings`
    - `Show-LnvWmiSettings -Force`
    - `Show-LnvWmiSettings -OnlyChanged`

### Read-LnvTBCPreferenceFile

- Synopsis: Returns the preferences for the machine
- Description: Reads the `preferences.json` file located in ProgramData and returns an object with configurations for the machine.
- Example:
    - `Read-LnvTBCPreferenceFile`

### Update-LnvTBCPreferenceFile

- Synopsis: Updates the content of the preferences file
- Description: Allows the user to change the location of the output folder and enable/disable logging.
- Parameters:
    - `-Logging` (bool, Mandatory): Enable/disable logging feature
    - `-Output` (string, Mandatory): Default location where files should be saved
- Examples:
    - `Update-LnvTBCPreferenceFile -Logging $true -OutPut .\MyFolder`
    - `Update-LnvTBCPreferenceFile -Logging $false -OutPut C:\Logs`

### Get-LnvTBCTargetComputer

- Synopsis: Returns the computer specific variables
- Description: Returns an object with the computer name, BIOS version, current password status and can handle custom defaults.
- Example (as in source help):
    - `Get-LnvTBCTargetTargetComputer`
  (note: example in source appears to have a duplicated word — use `Get-LnvTBCTargetComputer` in practice)

### Open-LnvTBCRemoteComputer

- Synopsis: Connects to a remote machine with the specified credentials
- Description: Returns the connection to the remote machine. Hostname is required. Cannot use IP addresses.
- Parameters:
    - `-Hostname` (string, Mandatory): Name (not IP address) of the target machine
    - `-Credential` (PSCredential): Credentials to connect to the specified machine
- Examples:
    - `Open-LnvTBCRemoteComputer -Hostname Target`
    - `Open-LnvTBCRemoteComputer -Hostname Target -Credential MyCreds`

### Close-LnvTBCRemoteComputer

- Synopsis: Closes the connection to the target computer
- Description: Clears the instance holding the information about the machine.
- Example:
    - `Close-LnvTBCRemoteComputer`

### Test-LnvTBCPendingChanges

- Synopsis: Checks to see if there are pending changes on any of the settings
- Description: Returns `True` if there are any modified settings that aren't saved.
- Example:
    - `Test-LnvTBCPendingChanges`

### Test-LnvTBCPendingReboot

- Synopsis: Checks to see if there is a pending reboot
- Description: Returns `True` if there is a pending reboot after making a WMI change.
- Example:
    - `Test-LnvTBCPendingReboot`

### Export-LnvPasswordChangeFile

- Synopsis: Creates a password change file
- Description: Prompts the user for current and new passwords. Creates a file at `$FileLocation` that has the passwords encrypted.
- Parameters (from help):
    - GUI-mode hidden parameters: `-O` (SecureString), `-N` (SecureString), `-K` (string), `-F` (string), `-Ty` (string)
    - CMD-mode parameters:
        - `-FileLocation` (string, Position=1): Location where the file should be saved
        - `-Type` (string, Position=2, ValidateSet: `pap`, `svp`, `smp`, `pop`): Supervisor/System management/Power-on password; default `pap`
- Examples:
    - `Export-LnvPasswordChangeFile`
    - `Export-LnvPasswordChangeFile -FileLocation .\MyFolder`
    - `Export-LnvPasswordChangeFile -Type pap`

### Import-LnvPasswordChangeFile

- Synopsis: Imports a file to apply a new password to a machine that currently has one
- Description: Imports a password change file and applies it to the local machine (may prompt for a key if not supplied).
- Parameters:
    - `-ConfigFile` (string, Mandatory, Position=0): Path to the password change file
    - `-Key` (string, Optional, Position=1): Decrypting key
- Example:
    - `Import-LnvPasswordChangeFile -ConfigFile <PathToFile> -Key MyKey`

### Update-LnvPassword

- Synopsis: Updates the password on the current machine
- Description: Prompts the user for the current and new password and applies the change.
- Parameters (from help):
    - GUI-mode hidden parameters: `-Old` (SecureString), `-New` (SecureString), `-Ty` (string)
    - CMD-mode:
        - `-Type` (string, Position=1, ValidateSet: `pap`, `svp`, `smp`, `pop`): The password type which should be changed
- Example:
    - `Update-LnvPassword`
- Notes: Source has a TODO to enumerate passwords on machine.

### Export-LnvWmiSettings

- Synopsis: Creates a file of the WMI settings
- Description: Exports the WMI settings, optionally with an encrypted supervisor password.
- Parameters:
    - `-ConfigFile` (string): The path to export the file to (defaults to output folder with machine name)
    - `-OnlyChanged` (switch): Only export the modified settings
    - `-Key` (string): The encrypting key
    - `-NoKey` (switch): Suppress the prompt for an encrypting key
- Examples:
    - `Export-LnvWmiSettings`
    - `Export-LnvWmiSettings -NoKey`
    - `Export-LnvWmiSettings -ConfigFile <PathToFile>`
    - `Export-LnvWmiSettings -ConfigFile <PathToFile> -Key MyKey`

### Import-LnvWmiSettings

- Synopsis: Imports the WMI settings from the specified file.
- Description: Imports a list of WMI setting/value pairs from a config file and applies them.
- Parameters:
    - `-ConfigFile` (string, Mandatory): Path to the file to import
    - `-Key` (string, Optional): The encrypting key (if an encrypted SVP is included)
- Examples:
    - `Import-LnvWmiSettings -ConfigFile <PathToFile>`
    - `Import-LnvWmiSettings -ConfigFile <PathToFile> -Key MyKey`
- Notes: The function validates that a supervisor password in the file must be accompanied by a key.

### Set-LnvWmiSetting

- Synopsis: Sets the value of the specified setting
- Description: Changes the value of the specified setting.
- Parameters:
    - `-Name` (string, Mandatory, Position=0): Name of the setting to change (ArgumentCompleter provides names)
    - `-Value` (string, Mandatory, Position=1): Value to change the setting to (dynamic parameter with ValidateSet when applicable)
- Example:
    - `Set-LnvWmiSetting -Name SettingName -Value SettingValue`

### Get-LnvWmiSetting

- Synopsis: Gets the value of the setting
- Description: Returns the current value of the setting.
- Parameters:
    - `-Name` (string, Mandatory, Position=0): The setting name to retrieve (ArgumentCompleter provides names)
- Example:
    - `Get-LnvWmiSetting -Name SettingName`

### Reset-LnvWmiSettings

- Synopsis: Resets all settings back to their initial settings
- Description: All changes made prior to saving are reverted to their initial settings.
- Example:
    - `Reset-LnvWmiSettings`

### Save-LnvWmiSettings

- Synopsis: Saves all the settings that have been changed to a new value
- Description: Persists changed settings to the system.
- Parameters:
    - GUI-only hidden parameter: `-Current` (SecureString)
- Example:
    - `Save-LnvWmiSettings`

### Restore-LnvCustomDefault

- Synopsis: Restores the WMI settings to the previously saved custom default settings
- Description: Restores WMI settings from a saved custom default list. Will prompt for password if one is detected.
- Example:
    - `Restore-LnvCustomDefault`

### Save-LnvCustomDefault

- Synopsis: Saves the current settings as a custom default list
- Description: Saves the settings to a custom list of default settings for later restore.
- Example:
    - `Save-LnvCustomDefault`

### Restore-LnvDefaultSettings

- Synopsis: Resets the WMI settings to the default settings
- Description: Resets WMI settings to the default settings. Will prompt for password if present.
- Example:
    - `Restore-LnvDefaultSettings`

### Submit-LnvFunctionRequest

- Synopsis: Executes a function request
- Description: User selects a function request to run. Prompts for current password when required.
- Parameters:
    - GUI-mode hidden parameters: `-C` (SecureString), `-M` (string), `-V` (ValidateSet: 'Yes','No')
    - CMD-mode parameters:
        - `-Method` (string, Mandatory, Position=1): The string name of the function request (ArgumentCompleter lists available function names)
        - `-Value` (string, Mandatory, Position=2, ValidateSet: 'Yes','No')
- Example (from source help):
    - `Submit-LnvTBCFunctionRequest -Method ResetFingerprintData -Value Yes`
  (note: example uses a slightly different name in the source; use `Submit-LnvFunctionRequest` in practice.)

### Convert-LnvConfigFileToScript

- Synopsis: (no comment-based help block present in source)
- Description (inferred): Converts an exported BIOS configuration INI file into a PowerShell script that invokes the appropriate Lenovo WMI methods to apply the settings. The function writes `ConfigScript.ps1` to the configured output folder.
- Parameters (from function signature):
    - `-FilePath` (string, Mandatory, Position=0): Path to the input config/INI file
    - `-KeyFile` (string, Optional, Position=1): Optional key file path used by conversion (inferred)
- Notes: Source contains validation for file existence and basic parsing. Because there is no comment-based help block for this function, the description above was inferred from the implementation.

---

Notes

- This document reflects the comment-based help present in `Lenovo.BIOS.Config.psm1` as of the extraction. A few examples and lines in the original help contain minor typos; they were preserved or noted where helpful.
- For GUI-mode parameter sets many parameters are hidden (DontShow) and only used by the module UI; CMD/interactive usage parameters are listed where available.

Generated from: `Lenovo.BIOS.Config.psm1` (module version 0.9.6)
