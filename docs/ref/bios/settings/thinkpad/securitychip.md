# Security Chip Settings #

### General ###

![](./img/tp_securitychip.png)

<details><summary>Security Chip Type</summary>

Shows the security chip type.

View-only when only one TPM option is available.

For some AMD and Qualcomm models, the TPM can be switched from the default discrete TPM 2.0 chip to the Microsoft(R) Pluton TPM 2.0.

!> If a device registered with Autopilot is switched from discrete TPM to Pluton, it will no longer be recognized by the Autopilot service. An administrator will need to [manually register the device again](https://learn.microsoft.com/en-us/autopilot/add-devices#collect-the-hardware-hash) after switching to Pluton to enable Autopilot again.

[Available via standard Windows commands](https://docs.microsoft.com/en-us/powershell/module/trustedplatformmodule/?view=windowsserver2019-ps&preserve-view=true&viewFallbackFrom=win10-ps)

</details>

<details><summary>Security Chip</summary>

Whether to enable security chip functionality.

Possible options:

1.	**On** - Default.
2.	Off - security chip is hidden and is not functional.

?>  If shows `MFG Mode` (manufacturing mode), then TPM (Trusted Platform Module) must be provisioned correctly. If this occurs on a ship-level system, please contact Lenovo Support for assistance.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| SecurityChip | Active, Inactive, Disable, Enable | Yes | Both |

</details>

<details><summary>TPM Selection</summary>

Only an option on some AMD and some Qualcomm models. Allows to switch from discrete TPM 2.0 to Microsoft Pluton TPM 2.0.

!> In order to switch to Pluton TPM, the Microsoft Pluton Processor Control setting must already be Enabled.

!> If a device registered with Autopilot is switched from discrete TPM to Pluton, it will no longer be recognized by the Autopilot service. An administrator will need to [manually register the device again](https://learn.microsoft.com/en-us/autopilot/add-devices#collect-the-hardware-hash) after switching to Pluton to enable Autopilot again.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| TpmSelection | DiscreteTPM2.0, PlutonTPM2.0 | Yes | AMD |

</details>

<details><summary>Clear Security Chip</summary>

Visible and active only if Security Chip` is `Enabled`.

This option is used to clear encryption keys.

!>  It will not be possible to access already encrypted data after these keys are cleared.

?> The option requires additional confirmation for clearing the keys.

Available via standard Windows commands: [Clear-Tpm](https://docs.microsoft.com/en-us/powershell/module/trustedplatformmodule/clear-tpm?view=windowsserver2019-ps)

</details>

<details><summary>Intel(R) TXT Feature</summary>

Visible and active only if Security Chip` is `Enabled`.

?> Intel (R) Trusted Execution Technology is a hardware-based security foundation to build and maintain a chain of trust, to protect information from software-based attacks.

Possible options:

1.	On
2.	**Off** – Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| TXTFeature | Disable, Enable | Yes | Intel |

</details>

<details><summary>Physical Presence for Clear</summary>

Whether to require confirmation of a user`s physical presence when clearing the security chip.

!>  It is possible to change the value from Enable to Disable only when Supervisor Password exists, because it is required to confirm the action.

Possible options:

1.	**On** - Default.
2.	Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| PhysicalPresenceForTpmClear  | Disable, Enable | Yes | Both |

</details>

<details><summary>Microsoft(R) Pluton Processor Control</summary>

Whether to enable or disable the Pluton security processor.

!> This setting must be enabled before the TPM can be switched to Pluton.

When configuring these BIOS settings using WMI scripts, it is possible to follow these steps:

1. set ```PlutonSecurityProcessor``` to **Enable**
2. set ```TpmSelection``` to **PlutonTPM2.0**
3. specify the Supervisor password using WmiOpcodeInterface
4. save settings
5. suspend BitLocker
6. reboot

Possible options:

1. Disabled
2. Enabled
3. **Disabled(SW Controlled)** - Default

When set to ***Disabled*** or ***Enabled***, the setting cannot be changed without specifying a Supervisor password when using WMI.  When set to ***Disabled (SW Controlled)***, the setting can be changed using WMI without requiring Supervisor password. This allows the Pluton Security Processor to be enabled for use with a Discrete TPM 2.0 without requiring Supervisor password. If this setting is being changed in order to switch to the Pluton TPM 2.0, a Supervisor password will be required to make the TpmSelection change. If the setting is already ***Enabled***, then a Supervisor password will be required to change it using WMI. When using WMI, be sure to use the proper values from the table below.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| PlutonSecurityProcessor  | Disable, Enable, Disable(SW_Controlled) | Yes | AMD |

</details>

### Security Reporting Options ###

![](./img/tp_securityreportingoptions.png)

Visible and active only if `Security Chip` is `Enabled`.

Opens settings for Security Reporting Options.

<details><summary>SMBIOS Reporting</summary>

Whether to enable reporting of SMBIOS data.

?> Changes to corresponding UEFI BIOS data are logged in a location, (PCR1, defined in the TCG standards), which other authorized programs can monitor, read, and analyze. 

Possible options:

1.	**On** - Default.
2.	Off

</details>
