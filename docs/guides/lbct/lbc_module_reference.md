---
title: Lenovo BIOS Certificates Module Reference
description: Complete reference for the Lenovo.Bios.Certificates PowerShell module cmdlets, parameters, and usage patterns.
---

# Lenovo BIOS Certificates PowerShell Module Reference

<table>
<tr>
<td><strong>Module</strong></td>
<td>Lenovo.Bios.Certificates</td>
</tr>
<tr>
<td><strong>Version</strong></td>
<td>1.0.8</td>
</tr>
<tr>
<td><strong>Author</strong></td>
<td>Devin McDermott</td>
</tr>
<tr>
<td><strong>Company</strong></td>
<td>Lenovo</td>
</tr>
<tr>
<td><strong>Description</strong></td>
<td>PowerShell module providing secure access to Lenovo Certificate WMI classes for BIOS certificate management</td>
</tr>
</table>

---

## Overview

The Lenovo BIOS Certificates module enables secure management of BIOS settings and certificates on Lenovo devices through WMI (Windows Management Instrumentation). The module supports both local private key files and Azure Key Vault integration for signing BIOS commands.

## Prerequisites

- **Administrator privileges required** - The module requires running PowerShell as Administrator
- **Supported file formats**: DER and PEM for certificates and private keys
- **Azure integration** (optional): Requires `Az.Accounts` and `Az.KeyVault` modules

---

## Exported Cmdlets

### Quick Reference

| Cmdlet | Purpose |
|--------|---------|
| `Get-LnvSignedWmiCommand` | Generate signed WMI commands for BIOS operations |
| `Submit-LnvBiosChange` | Execute a signed WMI command on the device |
| `Submit-LnvBiosConfigFile` | Apply multiple signed commands from a file |
| `Convert-LnvBiosConfigFile` | Convert BIOS settings file to signed commands |
| `Set-LnvBiosCertificate` | Install or update a BIOS certificate |
| `Get-LnvUnlockCode` | Decrypt unlock code from an unlock file |
| `Test-LnvCheckForAzureModule` | Verify Azure module installation |


### Cmdlet Reference

??? note "Get-LnvSignedWmiCommand"

    **Synopsis:** Creates the WMI parameter for the specified class with the signature from your private key.

    **Description:** This cmdlet makes the appropriate parameter for the specified method. Required parameters are the KeyFile location (or Azure Key Vault details) and the Method name. Other parameters will be determined based on the Method parameter.

    **Parameters:**

    | Parameter | Type | Required | Parameter Set | Description |
    |-----------|------|----------|---------------|-------------|
    | KeyFile | String | Yes | LocalFile | The location of the private key you wish to use to sign the command |
    | VaultName | String | Yes | Azure | The name of the Azure Key Vault containing the key |
    | KeyName | String | Yes | Azure | The name of the key in Azure Key Vault |
    | Method | String | Yes | Both | The name of the class that you wish to use |
    | SettingName | String | Conditional | Both | Method: SetBiosSetting - The name of the setting you wish to change |
    | SettingValue | String | Conditional | Both | Method: SetBiosSetting - The value of the setting you wish to change |
    | MachineSerial | String | Conditional | Both | Method: ClearBiosCertificate - The serial of the machine which you want to clear the certificate from |
    | Password | String | Conditional | Both | Method: ChangeBiosCertificateToPassword - The password that you want to set instead of the current certificate |
    | NewCertFile | String | Conditional | Both | Method: UpdateBiosCertificate - The new certificate file to replace the one currently set |
    | FunctionName | String | Conditional | Both | Method: SetFunctionRequest - The name of the function you wish to call |
    | FunctionValue | String | Conditional | Both | Method: SetFunctionRequest - The value of the function call |

    **Valid Methods:**

    | Method | Description |
    |--------|-------------| 
    | `SetBiosSetting` | Set a BIOS setting |
    | `SaveBiosSettings` | Save BIOS settings to persist changes |
    | `ClearBiosCertificate` | Clear BIOS certificate from the device |
    | `ChangeBiosCertificateToPassword` | Replace certificate authentication with password |
    | `LoadDefaultSettings` | Load default BIOS settings |
    | `LoadFactoryDefaultSettings` | Load factory default BIOS settings |
    | `UpdateBiosCertificate` | Update BIOS certificate with a new certificate |
    | `SetFunctionRequest` | Execute a specific function request |
    | `LoadCustomDefaultSettings` | Load custom default BIOS settings |
    | `SaveCustomDefaultSettings` | Save current settings as custom defaults |

    **Valid Function Names for SetFunctionRequest:**

    | Function | Description |
    |----------|-------------| 
    | `ClearSecurityChip` | Clear the security chip on the device |
    | `ResetFingerprintData` | Reset fingerprint sensor data |
    | `ResettoSetupMode` | Reset system to BIOS setup mode |
    | `RestoreFactoryKeys` | Restore factory default Secure Boot keys |
    | `ClearAllSecureBootKeys` | Clear all Secure Boot keys |
    | `ResetSystemToFactoryDefaults` | Reset entire system to factory defaults |

    **Examples:**

    ```powershell
    # Set a BIOS setting using local key file
    Get-LnvSignedWmiCommand -Method SetBiosSetting -KeyFile "C:\Keys\private.pem" -SettingName "WakeOnLAN" -SettingValue "Enable"

    # Save BIOS settings using Azure Key Vault
    Get-LnvSignedWmiCommand -Method SaveBiosSettings -VaultName "MyVault" -KeyName "MySigningKey"

    # Clear BIOS certificate
    Get-LnvSignedWmiCommand -Method ClearBiosCertificate -KeyFile "C:\Keys\private.pem" -MachineSerial "PC123456"

    # Change certificate to password authentication
    Get-LnvSignedWmiCommand -Method ChangeBiosCertificateToPassword -KeyFile "C:\Keys\private.pem" -Password "MySecurePassword"

    # Update BIOS certificate
    Get-LnvSignedWmiCommand -Method UpdateBiosCertificate -KeyFile "C:\Keys\private.pem" -NewCertFile "C:\Certs\newcert.pem"

    # Execute function request
    Get-LnvSignedWmiCommand -Method SetFunctionRequest -KeyFile "C:\Keys\private.pem" -FunctionName "ClearSecurityChip" -FunctionValue "Yes"
    ```

    **Output:** Returns a signed WMI command string formatted as `ClassName[,Parameters]` (e.g., `Lenovo_SetBiosSetting,WakeOnLAN,Enable`). This string can be passed directly to `Submit-LnvBiosChange`. The signature ensures that the command can only be executed if it was properly signed with the corresponding certificate installed on the device.

??? note "Submit-LnvBiosChange"

    **Synopsis:** Calls a WMI method with the provided parameters.

    **Description:** Sends an invoke command to the specified class with the provided parameters.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | Command | String | Yes | A string generated by Get-LnvSignedWmiCommand or a string in the format ClassName[,Parameters] |

    **Examples:**

    ```powershell
    # Using a signed command from Get-LnvSignedWmiCommand
    $signedCommand = Get-LnvSignedWmiCommand -Method SetBiosSetting -KeyFile "C:\Keys\private.pem" -SettingName "WakeOnLAN" -SettingValue "Enable"
    Submit-LnvBiosChange -Command $signedCommand

    # Using direct command format (ClassName[,Parameters])
    Submit-LnvBiosChange -Command "Lenovo_SetBiosSetting,WakeOnLAN,Enable"
    ```

    **Direct Command Format:** Commands can be submitted in the format `ClassName[,Parameters]`, where the class name is typically `Lenovo_SetBiosSetting` or another Lenovo BIOS WMI class name. Parameters are comma-separated and must match the expected signature. This format is useful when building commands programmatically or from configuration files.


??? note "Submit-LnvBiosConfigFile"

    **Synopsis:** Applies all signed commands in a file to the machine.

    **Description:** Reads the file with signed WMI commands and applies each one to the machine.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | ConfigFile | String | Yes | The path to the config file containing signed commands |

    **Examples:**

    ```powershell
    Submit-LnvBiosConfigFile -ConfigFile "C:\Config\SignedCommands.ini"
    ```

    **File Format:** The config file should contain one signed WMI command per line, typically generated by `Convert-LnvBiosConfigFile`.

??? note "Convert-LnvBiosConfigFile"

    **Synopsis:** Converts a BIOS configuration file into signed WMI commands.

    **Description:** Takes a configuration file with BIOS settings and converts each setting into a signed WMI command using the specified private key or Azure Key Vault key.

    **Parameters:**

    | Parameter | Type | Required | Parameter Set | Description |
    |-----------|------|----------|---------------|-------------|
    | ConfigFile | String | Yes | Both | The path to the configuration file |
    | KeyFile | String | Yes | LocalFile | The path to the private key file |
    | VaultName | String | Yes | Azure | The name of the Azure Key Vault |
    | KeyName | String | Yes | Azure | The name of the key in Azure Key Vault |
    | OutFileName | String | No | Both | Optional output file name (defaults to "Signed" + original filename) |

    **Examples:**

    ```powershell
    # Convert config file using local key
    Convert-LnvBiosConfigFile -ConfigFile "C:\Config\BiosSettings.ini" -KeyFile "C:\Keys\private.pem" -OutFileName "SignedSettings.ini"

    # Convert config file using Azure Key Vault
    Convert-LnvBiosConfigFile -ConfigFile "C:\Config\BiosSettings.ini" -VaultName "MyVault" -KeyName "MySigningKey"
    ```

    **Input File Format:** The configuration file should contain settings in the format:

    ```text
    SettingName,SettingValue
    WakeOnLAN,Enable
    SecureBoot,Disable
    ```
    **Output:** Generates a new file with the same name prefixed with "Signed" (or the specified OutFileName) containing the signed WMI commands corresponding to each setting.

??? note "Set-LnvBiosCertificate"

    **Synopsis:** Sets a BIOS certificate on the system.

    **Description:** Installs or updates a BIOS certificate from either a local file or Azure Key Vault.

    **Parameters:**

    | Parameter | Type | Required | Parameter Set | Description |
    |-----------|------|----------|---------------|-------------|
    | CertFile | String | Yes | LocalFile | The path to the certificate file |
    | VaultName | String | Yes | Azure | The name of the Azure Key Vault |
    | VaultCertificateName | String | Yes | Azure | The name of the certificate in Azure Key Vault |
    | Pass | String | No | Both | Optional password for the certificate |
    | CertType | String | No | Both | Certificate type: "Unspecified", "SVC", or "SMC" |

    **Examples:**

    ```powershell
    # Set certificate from local file
    Set-LnvBiosCertificate -CertFile "C:\Certs\bios.pem"

    # Set certificate with password
    Set-LnvBiosCertificate -CertFile "C:\Certs\bios.pem" -Pass "CertPassword" -CertType "SVC"

    # Set certificate from Azure Key Vault
    Set-LnvBiosCertificate -VaultName "MyVault" -VaultCertificateName "BiosCert"
    ```

    **Note:** This cmdlet supports `-WhatIf` and `-Confirm` parameters for safety.

??? note "Get-LnvUnlockCode"

    **Synopsis:** Retrieves the unlock code from an unlock file.

    **Description:** Retrieves the unlock code from an unlock file using the specified private key.

    **Parameters:**

    | Parameter | Type | Required | Parameter Set | Description |
    |-----------|------|----------|---------------|-------------|
    | UnlockFile | String | Yes | Both | The path to the unlock file |
    | KeyFile | String | Yes | LocalFile | The path to the private key file |
    | VaultName | String | No | Azure | The name of the Azure Key Vault |
    | KeyName | String | No | Azure | The name of the key in Azure Key Vault |

    **Examples:**

    ```powershell
    # Get unlock code using local key file
    Get-LnvUnlockCode -UnlockFile "C:\Unlock\unlock.dat" -KeyFile "C:\Keys\private.pem"

    # Get unlock code using Azure Key Vault
    Get-LnvUnlockCode -UnlockFile "C:\Unlock\unlock.dat" -VaultName "MyVault" -KeyName "MySigningKey"
    ```

    **Output:** Returns the decrypted unlock code as a string.


??? note "Test-LnvCheckForAzureModule"

    **Synopsis:** Checks if the specified Azure module is installed.

    **Description:** Verifies whether a specific Azure PowerShell module is available on the system.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | ModuleName | String | Yes | The name of the Azure module to check for |

    **Examples:**

    ```powershell
    # Check if Az.Accounts module is installed
    Test-LnvCheckForAzureModule -ModuleName "Az.Accounts"

    # Check if Az.KeyVault module is installed
    Test-LnvCheckForAzureModule -ModuleName "Az.KeyVault"
    ```

    **Output:** Returns `$true` if the module is installed, `$false` otherwise.

---

## Common Usage Patterns

### Quick Reference

| Pattern | Use Case | Complexity | Key Cmdlets |
|---------|----------|------------|-------------|
| Basic BIOS Setting | Change single setting on one device | Beginner | `Get-LnvSignedWmiCommand`, `Submit-LnvBiosChange` |
| Batch Configuration | Apply multiple settings to multiple devices | Intermediate | `Convert-LnvBiosConfigFile`, `Submit-LnvBiosConfigFile` |
| Azure Key Vault | Enterprise deployment with cloud-based key management | Advanced | `Test-LnvCheckForAzureModule`, `Get-LnvSignedWmiCommand` (Azure) |
| Certificate Management | Install or update BIOS certificates | Intermediate | `Set-LnvBiosCertificate`, `Get-LnvUnlockCode` |


??? note "Basic BIOS Setting Management"

    **Scenario:** Change a single BIOS setting on one device (e.g., enable WakeOnLAN).

    ```powershell
    # Generate signed command
    $command = Get-LnvSignedWmiCommand -Method SetBiosSetting -KeyFile "C:\Keys\private.pem" -SettingName "WakeOnLAN" -SettingValue "Enable"

    # Apply the setting
    Submit-LnvBiosChange -Command $command

    # Save settings to make them persistent
    $saveCommand = Get-LnvSignedWmiCommand -Method SaveBiosSettings -KeyFile "C:\Keys\private.pem"
    Submit-LnvBiosChange -Command $saveCommand
    ```

??? note "Batch Configuration Management"

    **Scenario:** Apply multiple BIOS settings to multiple devices from a configuration file.

    ```powershell
    # Create a configuration file with multiple settings
    $configFile = "C:\Config\BiosSettings.ini"
    @"
    WakeOnLAN,Enable
    SecureBoot,Disable
    VirtualizationTechnology,Enable
    "@ | Out-File $configFile

    # Convert to signed commands
    Convert-LnvBiosConfigFile -ConfigFile $configFile -KeyFile "C:\Keys\private.pem"

    # Apply all signed commands
    Submit-LnvBiosConfigFile -ConfigFile "C:\Config\SignedBiosSettings.ini"
    ```

??? note "Azure Key Vault Integration"

    **Scenario:** Enterprise deployment using Azure Key Vault for secure, centralized key management.

    ```powershell
    # Ensure Azure modules are available
    if (-not (Test-LnvCheckForAzureModule -ModuleName "Az.Accounts") -or -not (Test-LnvCheckForAzureModule -ModuleName "Az.KeyVault")) {
        Write-Error "Required Azure modules not found. Please install Az.Accounts and Az.KeyVault"
        return
    }

    # Connect to Azure (if not already connected)
    Connect-AzAccount

    # Use Azure Key Vault for signing
    $command = Get-LnvSignedWmiCommand -Method SetBiosSetting -VaultName "MyKeyVault" -KeyName "BiosSigningKey" -SettingName "WakeOnLAN" -SettingValue "Enable"
    Submit-LnvBiosChange -Command $command
    ```

??? note "Certificate Management"

    **Scenario:** Install a new BIOS certificate or update an existing certificate on devices.

    ```powershell
    # Set a new BIOS certificate
    Set-LnvBiosCertificate -CertFile "C:\Certs\newcert.pem" -CertType "SVC"

    # Update existing certificate using signed command
    $updateCommand = Get-LnvSignedWmiCommand -Method UpdateBiosCertificate -KeyFile "C:\Keys\private.pem" -NewCertFile "C:\Certs\updated.pem"
    Submit-LnvBiosChange -Command $updateCommand
    ```

---

## Error Handling

The module implements comprehensive error handling and logging. Common error scenarios include:

- **File not found**: Invalid paths to key files, certificate files, or configuration files
- **Invalid file format**: Only DER and PEM formats are supported for keys and certificates
- **Empty files**: The module validates that files contain actual data
- **Azure connectivity**: Azure-related functions require active Azure connection
- **Permissions**: Administrator privileges are required for BIOS operations
- **WMI errors**: Issues communicating with the Lenovo WMI classes

All functions log their activities and errors for troubleshooting purposes.

---

## Security Considerations

- **Private Key Security**: Keep private key files secure and limit access
- **Certificate Validation**: Ensure certificates are from trusted sources
- **Administrator Rights**: The module requires elevated privileges
- **Azure Security**: When using Azure Key Vault, ensure proper access policies
- **Command Signing**: All BIOS commands must be properly signed for security

---

## Module Files and Directories

The module creates and uses the following directory structure:

```text
%ProgramData%\Lenovo\
├── BIOSCertificates\
│   ├── Logs\          # Module operation logs
│   └── Output\        # Generated signed command files
```
---

## Version History

??? note "Version 1.0.8"
    Initial public release with Azure Key Vault support and enhanced functionality

??? note "Version 1.0.7"
    Technical Preview release adding Azure Key Vault support

??? note "Version 1.0.6"
    Technical Preview release

---

## Support

For additional support or questions, please visit Lenovo's [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Management-Board/bd-p/sa01_eg).
