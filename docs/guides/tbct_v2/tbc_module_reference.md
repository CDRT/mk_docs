# Lenovo BIOS Config Module - Cmdlet Reference

- **Module:** Lenovo.BIOS.Config
- **Version:** 1.0.2
- **Author:** Devin McDermott
- **Company:** Lenovo
- **Copyright:** (c) 2025 All rights reserved.

---

## Module Initialization

### Initialize-LnvThinkBiosConfig

Gathers the WMI data needed for the module to work.

**Syntax:**

```powershell
Initialize-LnvThinkBiosConfig
```

**Description:**
Initializes the Lenovo ThinkBIOS Config module by gathering WMI data from the system. This cmdlet must be run before using other module functions. No output is shown during initialization.

**Parameters:**
None

**Examples:**

```powershell
Initialize-LnvThinkBiosConfig
```

**Notes:**

- Requires administrator privileges
- Should be called at the beginning of your script or session
- Silently loads all necessary WMI settings

---

### Show-LnvWmiSettings

Displays WMI BIOS settings from the target computer.

**Syntax:**

```powershell
Show-LnvWmiSettings [-Force] [-OnlyChanged]
```

**Description:**
Gathers and displays WMI data from the system. This cmdlet can show all settings or only those that have been modified. Use the `-Force` switch to reload settings from WMI.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Force | Switch | No | Forces settings to be reloaded from WMI |
| OnlyChanged | Switch | No | Displays only modified settings |

**Examples:**

```powershell
# Display all WMI settings
Show-LnvWmiSettings

# Force reload and display all settings
Show-LnvWmiSettings -Force

# Display only modified settings
Show-LnvWmiSettings -OnlyChanged
```

**Output:**
Returns a sorted list of BIOS settings with their current values.

---

## Configuration Management

### Read-LnvTBCPreferenceFile

Returns the preferences for the machine.

**Syntax:**

```powershell
Read-LnvTBCPreferenceFile
```

**Description:**
Reads the `preferences.json` file located in `%ProgramData%\Lenovo\ThinkBiosConfig` and returns an object with configurations for the machine. If the file doesn't exist, it creates one with default values.

**Parameters:**
None

**Examples:**

```powershell
$preferences = Read-LnvTBCPreferenceFile
```

**Output:**
Returns a hashtable containing:

- `Output` - Default output folder path
- `LogFolder` - Default log folder path
- `Logging` - Boolean indicating if logging is enabled
- `Logger` - Logger instance
- `PreferenceFile` - Path to the preference file

**Default Locations:**

- Preference file: `%ProgramData%\Lenovo\ThinkBiosConfig\preferences.json`
- Output folder: `%ProgramData%\Lenovo\ThinkBiosConfig\Output`
- Log folder: `%ProgramData%\Lenovo\ThinkBiosConfig\Logs`

---

### Update-LnvTBCPreferenceFile

Updates the content of the preferences file.

**Syntax:**

```powershell
Update-LnvTBCPreferenceFile -Logging <Boolean> -LogFolder <String> -Output <String>
```

**Description:**
Allows you to change the location of the output folder, log folder, and enable/disable logging functionality.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Logging | Boolean | Yes | True to enable, false to disable logging |
| LogFolder | String | Yes | Folder location for log files |
| Output | String | Yes | Folder location for output files |

**Examples:**

```powershell
# Enable logging with custom folders
Update-LnvTBCPreferenceFile -Logging $true -LogFolder "C:\Logs" -Output "C:\Output"

# Disable logging
Update-LnvTBCPreferenceFile -Logging $false -LogFolder "C:\Logs" -Output "C:\Output"

# Use relative paths
Update-LnvTBCPreferenceFile -Logging $true -LogFolder ".\Logs" -Output ".\MyFolder"
```

**Notes:**

- Both folder paths must exist before calling this cmdlet
- The cmdlet verifies folder access before updating preferences
- Throws an error if folders don't exist or aren't accessible

---

## Remote Computer Management

### Get-LnvTBCTargetComputer

Returns the computer-specific variables.

**Syntax:**

```powershell
Get-LnvTBCTargetComputer
```

**Description:**
Returns an object containing information about the target computer including computer name, BIOS version, current password status, and custom defaults capability.

**Parameters:**
None

**Examples:**

```powershell
$computerInfo = Get-LnvTBCTargetComputer
Write-Host "Computer: $($computerInfo.ComputerName)"
Write-Host "BIOS Version: $($computerInfo.BiosVersion)"
Write-Host "Password Set: $($computerInfo.PasswordFound)"
```

**Output:**
Returns an object with properties:

- `ComputerName` - Name of the target computer
- `BiosVersion` - Current BIOS version
- `PasswordFound` - Boolean indicating if a supervisor password is set
- Custom defaults information

---

### Open-LnvTBCRemoteComputer

Connects to a remote machine with the specified credentials.

**Syntax:**

```powershell
Open-LnvTBCRemoteComputer -Hostname <String> [-Credential <PSCredential>]
```

**Description:**
Establishes a connection to a remote Lenovo computer for BIOS management operations. The hostname is required and must be a valid computer name (IP addresses are not supported).

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Hostname | String | Yes | Name of the target machine (not IP address) |
| Credential | PSCredential | No | Credentials to connect to the machine |

**Examples:**

```powershell
# Connect with credential prompt
Open-LnvTBCRemoteComputer -Hostname "DESKTOP-01"

# Connect with pre-defined credentials
$cred = Get-Credential
Open-LnvTBCRemoteComputer -Hostname "DESKTOP-01" -Credential $cred
```

**Output:**
Returns a LenovoSettings instance for the remote computer.

**Notes:**

- Requires network connectivity to the remote machine
- Requires appropriate permissions on the remote machine
- Must use hostname, not IP address
- If credentials are not provided, you will be prompted

---

### Close-LnvTBCRemoteComputer

Closes the connection to the target computer.

**Syntax:**

```powershell
Close-LnvTBCRemoteComputer
```

**Description:**
Clears the instance holding information about the remote machine and terminates the connection.

**Parameters:**
None

**Examples:**

```powershell
Close-LnvTBCRemoteComputer
```

**Notes:**

- Always close remote connections when finished to free resources
- After closing, you'll need to reconnect to manage remote computers again

---

## Status Checks

### Test-LnvTBCPendingChanges

Checks if there are pending changes on any of the settings.

**Syntax:**

```powershell
Test-LnvTBCPendingChanges
```

**Description:**
Returns true if there are any modified settings that haven't been saved to the BIOS.

**Parameters:**
None

**Examples:**

```powershell
if (Test-LnvTBCPendingChanges) {
    Write-Host "There are unsaved changes"
    Save-LnvWmiSettings
}
```

**Output:**
Returns `$true` if there are pending changes, `$false` otherwise.

---

### Test-LnvTBCPendingReboot

Checks if there is a pending reboot.

**Syntax:**

```powershell
Test-LnvTBCPendingReboot
```

**Description:**
Returns true if a system reboot is required after making WMI changes. Most BIOS changes require a reboot to take effect.

**Parameters:**
None

**Examples:**

```powershell
if (Test-LnvTBCPendingReboot) {
    Write-Host "A system reboot is required"
    Restart-Computer -Confirm
}
```

**Output:**
Returns `$true` if a reboot is pending, `$false` otherwise.

---

## Password Management

### Export-LnvPasswordChangeFile

Creates a password change file.

**Syntax:**

```powershell
Export-LnvPasswordChangeFile [-FileLocation <String>] [-Type <String>]
```

**Description:**
Prompts the user for current and new passwords, then creates an encrypted file at the specified location. This file can be used to change BIOS passwords on multiple machines.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| FileLocation | String | No | `%ProgramData%\Lenovo\ThinkBiosConfig\Output\{ComputerName}Password.ini` | Location to save the password file |
| Type | String | No | "pap" | Password type: "pap"/"svp" (Supervisor), "smp" (System Management), "pop" (Power-on) |

**Examples:**

```powershell
# Create password file with default location
Export-LnvPasswordChangeFile

# Specify custom location
Export-LnvPasswordChangeFile -FileLocation "C:\Temp\password.ini"

# Create power-on password file
Export-LnvPasswordChangeFile -Type pop
```

**Interactive Prompts:**

- Encrypting key
- Current password
- New password
- Password confirmation

**Notes:**

- Passwords are encrypted using the provided key
- The encrypting key will be required to import the file
- Type "svp" is treated as "pap" (both are supervisor passwords)
- Returns success or error message

---

### Import-LnvPasswordChangeFile

Imports a password change file.

**Syntax:**

```powershell
Import-LnvPasswordChangeFile -ConfigFile <String> [-Key <String>]
```

**Description:**
Imports a file to apply a new password to a machine that currently has a password set.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| ConfigFile | String | Yes | Path to the password change file |
| Key | String | No | Decrypting key (will prompt if not provided) |

**Examples:**

```powershell
# Import with key prompt
Import-LnvPasswordChangeFile -ConfigFile "C:\Temp\password.ini"

# Import with specified key
Import-LnvPasswordChangeFile -ConfigFile "C:\Temp\password.ini" -Key "MyEncryptionKey"
```

**Output:**
Returns success or failure message.

**Notes:**

- The key must match the one used during export
- Requires the current password to be correct
- Changes take effect immediately but may require a reboot

---

### Update-LnvPassword

Updates the password on the current machine.

**Syntax:**

```powershell
Update-LnvPassword -Type <String>
```

**Description:**
Prompts the user for the current and new password, then updates the specified BIOS password.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Type | String | Yes | Password type: "pap"/"svp" (Supervisor), "smp" (System Management), "pop" (Power-on) |

**Examples:**

```powershell
# Update supervisor password
Update-LnvPassword -Type pap

# Update power-on password
Update-LnvPassword -Type pop
```

**Interactive Prompts:**

- Current password
- New password
- Password confirmation

**Output:**
Returns success or failure message.

**Notes:**

- Only works if a password is already set
- Type "svp" is treated as "pap"
- New password must match confirmation
- Changes take effect immediately

---

## WMI Settings Operations

### Export-LnvWmiSettings

Creates a file of the WMI settings.

**Syntax:**

```powershell
Export-LnvWmiSettings [-ConfigFile <String>] [-OnlyChanged] [-Key <String>] [-NoKey]
```

**Description:**
Exports WMI BIOS settings to a configuration file, optionally with an encrypted supervisor password for deployment.

**Parameters:**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| ConfigFile | String | No | `%ProgramData%\Lenovo\ThinkBiosConfig\Output\{ComputerName}.ini` | Path to export file |
| OnlyChanged | Switch | No | False | Export only modified settings |
| Key | String | No | None | Encrypting key for password |
| NoKey | Switch | No | False | Suppress prompt for encryption key |

**Examples:**

```powershell
# Export all settings without password
Export-LnvWmiSettings -NoKey

# Export to specific file
Export-LnvWmiSettings -ConfigFile "C:\Configs\biosconfig.ini" -NoKey

# Export only changed settings
Export-LnvWmiSettings -OnlyChanged -NoKey

# Export with encrypted password
Export-LnvWmiSettings -Key "MyEncryptionKey"

# Interactive key prompt
Export-LnvWmiSettings
```

**Interactive Prompts:**

- Encrypting key (if not using `-NoKey` or `-Key` parameter)
- Current password (if encrypting)

**Output:**
Creates a configuration file with settings in format: `SettingName,Value`

**File Format:**

```ini
Wake On LAN,Primary
WakeOnLAN,Enabled
AMT Control,Disabled
```

With encrypted password:

```ini
EncryptedPassword,encoding,language
SettingName,Value
...
```

---

### Import-LnvWmiSettings

Imports WMI settings from the specified file.

**Syntax:**

```powershell
Import-LnvWmiSettings -ConfigFile <String> [-Key <String>]
Import-LnvWmiSettings -Settings <String[]> [-Key <String>]
```

**Description:**
Imports BIOS settings from a configuration file or array and applies them to the system. Supports encrypted passwords when a key is provided.

**Parameters:**

| Parameter | Type | Required | ParameterSet | Description |
|-----------|------|----------|--------------|-------------|
| ConfigFile | String | Yes | CMD | Path to the configuration file |
| Settings | String[] | Yes | Intune | Array of settings to import |
| Key | String | No | Both | Decrypting key for encrypted password |

**Examples:**

```powershell
# Import from file without password
Import-LnvWmiSettings -ConfigFile "C:\Configs\biosconfig.ini"

# Import with encrypted password
Import-LnvWmiSettings -ConfigFile "C:\Configs\biosconfig.ini" -Key "MyEncryptionKey"

# Import from array (for scripting/Intune)
$settings = @(
    "WakeOnLAN,Enabled",
    "AMT Control,Disabled"
)
Import-LnvWmiSettings -Settings $settings
```

**Interactive Prompts:**

- Current password (if machine has password and no encrypted password in file)

**Output:**
Returns detailed results of each setting change.

**Notes:**

- Settings are applied but not automatically saved
- Call `Save-LnvWmiSettings` to commit changes
- If file contains encrypted password but no key provided, operation will fail
- Changes may require a reboot to take effect

---

### Get-LnvWmiSetting

Gets the value of a specific setting.

**Syntax:**

```powershell
Get-LnvWmiSetting -Name <String>
```

**Description:**
Returns the current value of the specified BIOS setting.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Name | String | Yes | Name of the setting to retrieve |

**Examples:**

```powershell
# Get a specific setting
$value = Get-LnvWmiSetting -Name "WakeOnLAN"
Write-Host "WakeOnLAN is set to: $value"

# Check multiple settings
$settings = @("WakeOnLAN", "AMT Control", "SecureBoot")
foreach ($setting in $settings) {
    $value = Get-LnvWmiSetting -Name $setting
    Write-Host "$setting : $value"
}
```

**Output:**
Returns the current value of the setting, or "Not found on this machine" if the setting doesn't exist.

**Notes:**

- Tab completion is available for setting names
- Setting names are case-sensitive in some contexts
- Returns actual current value from BIOS, not pending changes

---

### Set-LnvWmiSetting

Sets the value of the specified setting.

**Syntax:**

```powershell
Set-LnvWmiSetting -Name <String> -Value <String>
```

**Description:**
Changes the value of the specified BIOS setting. The change is not committed until `Save-LnvWmiSettings` is called.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Name | String | Yes | Name of the setting to change |
| Value | String | Yes | Value to set (validated against available options) |

**Examples:**

```powershell
# Set a single setting
Set-LnvWmiSetting -Name "WakeOnLAN" -Value "Enabled"

# Set multiple settings
Set-LnvWmiSetting -Name "AMT Control" -Value "Disabled"
Set-LnvWmiSetting -Name "SecureBoot" -Value "Enabled"

# Check for pending changes
if (Test-LnvTBCPendingChanges) {
    Save-LnvWmiSettings
}
```

**Output:**
Returns "Success" or an error message.

**Notes:**

- Tab completion available for both setting names and values
- Value is validated against allowed options for the setting
- Changes are staged but not saved until `Save-LnvWmiSettings` is called
- Some settings may have dependencies on other settings
- For boot order settings, use comma-separated values

---

### Save-LnvWmiSettings

Saves all settings that have been changed to new values.

**Syntax:**

```powershell
Save-LnvWmiSettings
```

**Description:**
Commits all pending BIOS setting changes to the system. A supervisor password is required if one is set on the machine.

**Parameters:**
None (password is prompted if needed)

**Examples:**

```powershell
# Make changes and save
Set-LnvWmiSetting -Name "WakeOnLAN" -Value "Enabled"
Set-LnvWmiSetting -Name "AMT Control" -Value "Disabled"
Save-LnvWmiSettings

# Check before saving
if (Test-LnvTBCPendingChanges) {
    Write-Host "Saving changes..."
    $result = Save-LnvWmiSettings
    Write-Host $result
}
```

**Interactive Prompts:**

- Current password (if supervisor password is set)

**Output:**
Returns "Success" or an error message.

**Notes:**

- Most changes require a system reboot to take effect
- Check `Test-LnvTBCPendingReboot` after saving
- If save fails, changes remain staged and can be retried
- Some critical settings may require multiple reboots

---

### Reset-LnvWmiSettings

Resets all settings back to their initial values.

**Syntax:**

```powershell
Reset-LnvWmiSettings
```

**Description:**
All changes made prior to saving are reverted to their initial values. This only affects staged changes, not saved ones.

**Parameters:**
None

**Examples:**

```powershell
# Make some changes
Set-LnvWmiSetting -Name "WakeOnLAN" -Value "Enabled"
Set-LnvWmiSetting -Name "AMT Control" -Value "Disabled"

# Changed your mind? Reset them
Reset-LnvWmiSettings

# Verify no pending changes
Test-LnvTBCPendingChanges  # Returns $false
```

**Output:**
Returns success message.

**Notes:**

- Only affects unsaved changes
- Does not require password
- After reset, all settings return to their last saved state
- To reset BIOS to factory defaults, use `Restore-LnvDefaultSettings`

---

## Default Settings Management

### Restore-LnvDefaultSettings

Resets the WMI settings to the default settings.

**Syntax:**

```powershell
Restore-LnvDefaultSettings [-SuppressPrompt]
```

**Description:**
Resets BIOS settings to factory default values. Will prompt for password if one is set.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| SuppressPrompt | Switch | No | Suppress password prompt |

**Examples:**

```powershell
# Restore defaults with password prompt
Restore-LnvDefaultSettings

# Restore defaults without prompt (for automation)
Restore-LnvDefaultSettings -SuppressPrompt
```

**Interactive Prompts:**

- Current password (if supervisor password is set and not suppressed)

**Output:**
Returns success or error message.

**Notes:**

- This resets ALL settings to factory defaults
- Changes take effect after reboot
- Custom default settings are not affected
- Cannot be undone without a backup configuration

---

### Save-LnvCustomDefault

Saves the current settings as a custom default list.

**Syntax:**

```powershell
Save-LnvCustomDefault
```

**Description:**
Saves the current BIOS configuration as a custom default baseline that can be restored later.

**Parameters:**
None (password is prompted if needed)

**Examples:**

```powershell
# Configure desired settings
Set-LnvWmiSetting -Name "WakeOnLAN" -Value "Enabled"
Set-LnvWmiSetting -Name "AMT Control" -Value "Disabled"
Save-LnvWmiSettings

# Save as custom default
Save-LnvCustomDefault
```

**Interactive Prompts:**

- Current password (if supervisor password is set)

**Output:**
Returns success or error message.

**Notes:**

- Only one custom default can be saved at a time
- Overwrites any previously saved custom default
- Useful for maintaining a standard configuration
- Can be restored using `Restore-LnvCustomDefault`

---

### Restore-LnvCustomDefault

Restores the WMI settings to the previously saved custom default settings.

**Syntax:**

```powershell
Restore-LnvCustomDefault
```

**Description:**
Restores BIOS settings from a previously saved custom default configuration. Will prompt for password if one is set.

**Parameters:**
None (password is prompted if needed)

**Examples:**

```powershell
# Restore custom default configuration
Restore-LnvCustomDefault

# Verify settings after restore
Show-LnvWmiSettings
```

**Interactive Prompts:**

- Current password (if supervisor password is set)

**Output:**
Returns success or error message.

**Notes:**

- A custom default must have been previously saved
- Changes take effect after reboot
- This is different from factory defaults
- Useful for returning to a known good configuration

---

## Advanced Operations

### Submit-LnvFunctionRequest

Executes a function request.

**Syntax:**

```powershell
Submit-LnvFunctionRequest -Method <String> -Value <String>
```

**Description:**
Executes low-level BIOS function requests such as resetting TPM, clearing fingerprint data, or other advanced operations. Requires supervisor password if one is set.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| Method | String | Yes | The function request name |
| Value | String | Yes | Typically "Yes" to execute, "No" to cancel |

**Examples:**

```powershell
# Reset fingerprint data
Submit-LnvFunctionRequest -Method "ResetFingerprintData" -Value "Yes"

# Clear TPM
Submit-LnvFunctionRequest -Method "ClearTpm" -Value "Yes"

# List available function requests
$wmi = [LenovoSettings]::GetInstance()
$wmi.GetFunctionNames()
```

**Interactive Prompts:**

- Current password (if supervisor password is set)

**Output:**
Returns success or error message.

**Notes:**

- Tab completion available for Method parameter
- Available methods vary by model
- Some functions may require a reboot
- Use with caution as some operations cannot be undone
- Common methods include:
    - ResetFingerprintData
    - ClearTpm
    - ResetToFactoryDefaults

---

## Deployment Tools

### New-LnvRemediationScript

Creates detection and remediation scripts for deployment.

**Syntax:**

```powershell
New-LnvRemediationScript -FilePath <String> [-PassFile <String>] [-Key <String>]
```

**Description:**
Generates PowerShell detection and remediation scripts from a configuration file, suitable for deployment through Intune or other management platforms.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| FilePath | String | Yes | Path to the configuration file |
| PassFile | String | No | Path to password file |
| Key | String | No | Decryption key for password file |

**Examples:**

```powershell
# Create scripts from config file
New-LnvRemediationScript -FilePath "C:\Configs\biosconfig.ini"

# Create scripts with password file
New-LnvRemediationScript -FilePath "C:\Configs\biosconfig.ini" `
                         -PassFile "C:\Configs\password.ini" `
                         -Key "MyEncryptionKey"
```

**Output:**
Creates two files in the output folder:

- `Detect_{filename}.ps1` - Detection script
- `Remediate_{filename}.ps1` - Remediation script

**Generated Files Location:**
`%ProgramData%\Lenovo\ThinkBiosConfig\Output\`

**Notes:**

- Detection script checks if settings match desired configuration
- Remediation script applies settings that don't match
- Scripts are ready to upload to Intune or other management platforms
- Templates are located in the module's Templates folder

---

### ConvertTo-LnvIntunePackage

Converts configuration to an Intune package.

**Syntax:**

```powershell
ConvertTo-LnvIntunePackage -ConfigFile <String> [-OutputPath <String>]
```

**Description:**
Packages BIOS configuration as a Microsoft Intune deployment package ready for upload.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| ConfigFile | String | Yes | Path to configuration file |
| OutputPath | String | No | Destination for the package |

**Examples:**

```powershell
# Create Intune package
ConvertTo-LnvIntunePackage -ConfigFile "C:\Configs\biosconfig.ini"

# Specify output location
ConvertTo-LnvIntunePackage -ConfigFile "C:\Configs\biosconfig.ini" `
                           -OutputPath "C:\IntunePackages"
```

**Output:**
Creates an `.intunewin` package file ready for Intune deployment.

**Notes:**

- Requires IntuneWinAppUtil.exe
- Package includes all necessary scripts and files
- Can be uploaded directly to Microsoft Intune
- Suitable for large-scale deployments

---

### Convert-LnvConfigFileToScript

Converts configuration file to PowerShell script.

**Syntax:**

```powershell
Convert-LnvConfigFileToScript -FilePath <String> [-KeyPhrase <String>] [-Tagfile <String>]
```

**Description:**
Transforms a BIOS configuration file into a standalone executable PowerShell script that can apply the settings.

**Parameters:**

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| FilePath | String | Yes | Path to configuration file |
| KeyPhrase | String | No | Decryption key if file has encrypted password |
| Tagfile | String | No | Name for the tag file (without extension) |

**Examples:**

```powershell
# Convert standard config file
Convert-LnvConfigFileToScript -FilePath "C:\Configs\biosconfig.ini"

# Convert with encrypted password
Convert-LnvConfigFileToScript -FilePath "C:\Configs\biosconfig.ini" `
                              -KeyPhrase "MyEncryptionKey"

# Convert with custom tag file
Convert-LnvConfigFileToScript -FilePath "C:\Configs\biosconfig.ini" `
                              -KeyPhrase "MyEncryptionKey" `
                              -Tagfile "BiosConfigApplied"
```

**Output:**
Creates `ConfigScript.ps1` in the output folder:
`%ProgramData%\Lenovo\ThinkBiosConfig\Output\ConfigScript.ps1`

**Generated Script Features:**

- Self-contained with module import
- Applies all settings from config file
- Creates tag file on success
- Exits with code 3010 on success (soft reboot)
- Exits with code 1 on failure
- Handles both standard INI and certificate-based configs

**Exit Codes:**

- `3010` - Success, soft reboot required
- `1` - Failure or settings not installed

**Notes:**

- Generated script can run independently
- Useful for SCCM, PDQ Deploy, or other deployment tools
- Tag file is created at: `%ProgramData%\Lenovo\ThinkBiosConfig\{Tagfile}.tag`
- Automatically detects config file type (standard vs certificate)

---

## Common Workflows

### Initial Setup

```powershell
# Import the module
Import-Module Lenovo.BIOS.Config

# Initialize the module
Initialize-LnvThinkBiosConfig

# View all current settings
Show-LnvWmiSettings
```

### Backup Current Configuration

```powershell
# Export all settings without password
Export-LnvWmiSettings -ConfigFile "C:\Backup\$(Get-Date -Format 'yyyyMMdd')_backup.ini" -NoKey

# Or with encrypted password for deployment
Export-LnvWmiSettings -ConfigFile "C:\Deployment\standard_config.ini" -Key "DeploymentKey123"
```

### Apply Configuration

```powershell
# Import settings from file
Import-LnvWmiSettings -ConfigFile "C:\Configs\standard_config.ini"

# Check what will be changed
Show-LnvWmiSettings -OnlyChanged

# Save the changes
Save-LnvWmiSettings

# Check if reboot is needed
if (Test-LnvTBCPendingReboot) {
    Write-Host "Reboot required"
}
```

### Change Individual Settings

```powershell
# Modify specific settings
Set-LnvWmiSetting -Name "WakeOnLAN" -Value "Enabled"
Set-LnvWmiSetting -Name "SecureBoot" -Value "Enabled"

# Verify changes before saving
Show-LnvWmiSettings -OnlyChanged

# Save changes
Save-LnvWmiSettings
```

### Remote Management

```powershell
# Connect to remote computer
Open-LnvTBCRemoteComputer -Hostname "DESKTOP-01"

# Get remote computer info
$remoteInfo = Get-LnvTBCTargetComputer

# View settings on remote computer
Show-LnvWmiSettings

# Make changes on remote computer
Set-LnvWmiSetting -Name "WakeOnLAN" -Value "Enabled"
Save-LnvWmiSettings

# Close connection
Close-LnvTBCRemoteComputer
```

### Password Hangling

```powershell
# Export password change file
Export-LnvPasswordChangeFile -FileLocation "C:\Temp\password_change.ini"

# Deploy to multiple machines, then on each machine:
Import-LnvPasswordChangeFile -ConfigFile "C:\Temp\password_change.ini" -Key "YourKey"
```

### Create Deployment Package

```powershell
# Export desired configuration
Export-LnvWmiSettings -ConfigFile "C:\Deploy\standard_bios.ini" -Key "DeployKey"

# Convert to deployment script
Convert-LnvConfigFileToScript -FilePath "C:\Deploy\standard_bios.ini" `
                              -KeyPhrase "DeployKey" `
                              -Tagfile "StandardBiosApplied"

# Or create Intune remediation scripts
New-LnvRemediationScript -FilePath "C:\Deploy\standard_bios.ini"
```

---

## Requirements

- Windows PowerShell 5.1 or later
- Administrator privileges
- Lenovo ThinkPad, ThinkCentre, or ThinkStation computer
- WMI access (local or remote)
- For remote management: Network connectivity and appropriate permissions

---

## Important Notes

### General

- Most cmdlets require administrator privileges
- Changes typically require a system reboot to take effect
- Always verify changes before saving using `Show-LnvWmiSettings -OnlyChanged`
- Create backups before making significant changes

### Security

- Passwords are encrypted when stored in configuration files
- Keep encryption keys secure and separate from configuration files
- Use strong passwords for BIOS/supervisor passwords
- Limit access to password change files

### Targeting Remote Device

- Remote operations require appropriate network permissions
- Must use hostname, not IP address
- Ensure WMI access is enabled on remote machines
- Always close remote connections with `Close-LnvTBCRemoteComputer`

### Deployment

- Test configuration files on a single machine before mass deployment
- Use tag files to track successful deployments
- Monitor exit codes in deployment tools
- Some settings may be model-specific and should be gracefully ignored so applicable settings can be set successfully

### Troubleshooting

- Check logs in: `%ProgramData%\Lenovo\ThinkBiosConfig\Logs`
- Use `Show-LnvWmiSettings` to verify available settings
- Not all settings are available on all models
- Some settings may have dependencies on other settings

---

## Support

For issues or questions:

- Check the logs in the configured log folder
- Verify BIOS/firmware is up to date
- Ensure WMI services are running
- For additional support or questions, please vist Lenovo's [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Management-Board/bd-p/sa01_eg)

---

## Version History

**Version 1.0.2**

- Initial public release
- Full feature set as documented

**Version 1.0.1**

- Technical Preview release

---

Copyright (c) 2025 Lenovo. All rights reserved.
