# Security #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_security_1.png)

<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_security1.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_security2.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_security3.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_security4.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /security.png)
-->
<details><summary>Supervisor Password</summary>

The supervisor password (SVP) protects the system information stored in UEFI BIOS.

!!! info ""
    When entering the UEFI BIOS menu, enter the correct supervisor password in the window prompted. You also can press Enter to skip the password prompt. However, you cannot change most of the system configuration options in UEFI BIOS.

!!! info ""
    **The supervisor password can be set only through the UEFI BIOS menu**. Once it is in place, then it can be modified Windows Management Instrumentation (WMI) with the Lenovo client-management interface.

If you have set both the supervisor password and power-on password, you can use the supervisor password to access your computer when you turn it on.

!!! info ""
    The supervisor password overrides the power-on password.

View only.

Shows the current password state.

Possible values:

1. Not Installed
2. Installed

</details>

<details><summary>Power-On Password</summary>

Power-On Password prevents unauthorized users from booting your computer.

View only.

Shows the current password state.

Possible values:

1. Not Installed
2. Installed

</details>

<details><summary>System Management Password</summary>

The system management password (SMP) protects the system information stored in UEFI BIOS like a supervisor password, but it has lower authority by default.

!!! info ""
    The system management password can be set through the UEFI BIOS menu or through Windows Management Instrumentation (WMI) with the Lenovo client-management interface. You can enable the system management password to have the same authority as the supervisor password to control security-related features.

View only.

Shows the current password state.

Possible values:

1. Not Installed
2. Installed

</details>

<details><summary>Set Supervisor Password</summary>

Set, change or delete the Supervisor Password (SVP).<br>

!!! info ""
    To delete Supervisor Password, enter blank fields for each new password line item.

Parameters:
1. [ Enter New Password ]
2. [ Confirm New Password ]
3. < Actions >:<br>
    a. **Save** – default<br>
    b. Cancel

</details>

<details><summary>Set Power-On Password</summary>
Set, change or delete the Power-On Password.

!!! info ""
    To delete Power-On Password, enter blank fields for each new password line item.

Parameters:
1. [ Enter New Password ]
2. [ Confirm New Password ]
3. < Actions >:<br>
    a. **Save** – default<br>
    b. Cancel

</details>

<details><summary>Set System Management Password</summary>

Set, change or delete the System Management Password (SMP).

!!! info ""
    To delete System Management Password, enter blank fields for each new password line item.

Parameters:
1. [ Enter New Password ]
2. [ Confirm New Password ]
3. < Actions >:<br>
    a. **Save** – default<br>
    b. Cancel

</details>

<details><summary>Windows UEFI Firmware Update</summary>

Options:

1. **Enabled** – allow Windows UEFI firmware update. Default.
2. Disabled – BIOS will skip Windows UEFI firmware update.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| WindowsUEFIFirmwareUpdate | Disabled, Enabled | yes | Both |
</details>

<details><summary>Smart USB Protection</summary>

Smart USB Protection blocks copying data from the computer to the USB storage device in Windows.<br>

Options:

1. **Disabled** – the user can copy data from and to USB storage device. Default. 
2. Read Only – the user can copy data from USB storage device to the Computer but not from the computer to USB storage device.
3. No Access – the user cannot use USB storage device in OS.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SmartUSBProtection | Disabled, Read Only, No Access | yes | Both |
</details>

<details><summary>secure wipe</summary>

Whether to display the `secure wipe` option on the F12 BIOS Startup Menu. Users can select this option to securely erase HDD data.

Options:

1. Enabled.
2. **Disabled** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| securewipe | Disabled, Enabled | yes | Intel |
</details>

<details><summary>Computrace</summary>

Settings for Absolute Persistence Module.

!!! info ""
    Absolute(c) is a service designed to help track devices and provide recovery services in the event a device is lost or stolen. Once installed, the Absolute agent communicates with the Absolute Monitoring Center and programmed intervals to provide the tracking service. By installing the agent and activating the service, you consent to the transmission of information between your device and the Absolute Monitoring Center. For customers who have purchased the Absolute service, the firmware Persistence Module checks for the presence and health of Absolute on boot, and restores the functionality in case of agent removal or tampering. Absolute and Persistence are registered trademarks of Absolute Software Corporation.

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_computrace.png)

<details><summary>Absolute Persistence Version</summary>

View only.

</details>

<details><summary>Absolute Persistence Module</summary>

Whether to enable the firmware Persistence Module of the optional service from Absolute.<br>

Options:

1.	**Enabled** – Default.
2.	Disabled.
3.	Permanently Disabled.

!!! info ""
    Selecting `Permanently Disabled` requires additional confirmation and cannot be done by WMI, because if Computrace activation is permanently disabled, then you can never enable it again. <br> More information on the official site of [Absolute Software Corporation](https://www.absolute.com/partners/device-manufacturers/lenovo/).

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| AbsolutePersistenceModule | Disabled, Enabled | yes | Both |
</details>

</details>

<details><summary>Device Guard</summary>

Device Guard enables PCs to be protected against malware by introducing a collective set of restrictions on a device across several technologies.

Options:

1. Enabled – CPU Virtualization Technology to be enabled, IOMMU (Intel Input\Output Memory Management Unit), such as Intel VT-d, AMD-Vi to be enabled, TPM to be enabled. 
Ethernet, USB, CD, and other boot methods to be disabled, only SATA device to be allowed.
2. **Disabled** – Ethernet, USB, CD, and other boot methods to be enabled. Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| DeviceGuard | Disabled, Enabled | yes | Both |
</details>

<details><summary>Electronic Lock</summary>

Whether to lock the chassis to prevent unauthorized physical access to the system components.

Options:

1. Lock. 
2. **Unlock** – Default. 

!!! info ""
    The setting is effective on the next startup after BIOS setting is saved. <br /> For more information, please refer to [user manual](https://thinkstation-specs.com/thinkstation/p350-tower/). 

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ElectronicLock | Lock, Unlock | yes | Intel |
</details>

<details><summary>ThinkShield Passwordless Power-On Authentication</summary>

Enable or Disable the ThinkShield Passwordless Power-On
Authentication and Device Manager.

Options:

1. **Enabled** – Default.
2. Disabled.
</details>

<details><summary>Cover Tamper Detected</summary>

Whether to enable Chassis Intrusion Detection, a utility that can tell whether someone has opened the case (intruded into the chassis).

Options:

1. **Disabled** – Default.
2. Enabled.

!!! info ""
    If chassis tamper occurs, you must enter setup to clear this error.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| CoverTamperDetected | Disabled, Enabled | yes | Both |
</details>

<details><summary>Configuration Change Detection</summary>

Whether the system will notify the user during POST (Power On Self Test), when a device is installed or removed.

!!! info ""
    This notice can only be cleared by entering BIOS setup, saving, and then exiting.

Options:

1. Enabled.
2. **Disabled** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ConfigurationChangeDetection | Disabled, Enabled | yes | Both |
</details>

<details><summary>Reset system to Factory Default</summary>

This option is used clear all data stored in UEFI system. Not
affected to storage data. After selecting this item, the system
will be automatically reboot, then reset system to factory default
settings.

</details>


<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_security.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_security2.png)-->

<details><summary>Set Password Encryption Algorithm</summary>

Select the encryption algorithm for BIOS Password.

Options:

1. **SHA-256 Hash** - Default.
1. SM3 Hash

</details>

<details><summary>Custom Password Mode</summary>

<!-- TODO: custom password mode description -->

Options:

1.  **Disabled** - Default.
2.  Enabled.

<!-- NO WMI -->

</details>

<details><summary>Max Password Attempts</summary>

Set maximum number of  supervisor password attempts from any software on the operating system.

!!! info ""
    If password attempts exceeds this, BIOS does not accept further password attempts.

Options:

1. 1
1. **3** - Default.
1. 100
1. Unlimited

<!-- NO WMI -->
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| MaxPasswordAttempts | 1, 3, 100, Unlimited | Yes | Both |

</details>

<details><summary>Password Change Time</summary>

When to change the supervisor password if it is requested by software on the operating system. This option is used to control the timing to change the supervisor password if it is requested by software on the operating system.

Options:

1. **After Reboot** - Default.
1. Immediately

<!-- NO WMI -->
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PasswordChangeTime | After Reboot, Immediately | Yes | Both |

</details>

<details><summary>Set Minimum Length</summary>

If a minimum is set, Supervisor Password, System Management Password, Power-On and Hard Disk password lengths must be equal to or longer than that number. Otherwise, they can be 1 to 128 characters.

Options:

1. **Disabled** - Default.
1. 4 Characters
1. 5 Characters
1. 6 Characters
1. 7 Characters
1. 8 Characters
1. 9 Characters
1. 10 Characters
1. 11 Characters
1. 12 Characters

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SetMinimumLength | Disable, 4 Characters, 5 Characters, 6 Characters, 7 Characters, 8 Characters, 9 Characters, 10 Characters, 11 Characters, 12 Characters | Yes | Both |

</details>

<details><summary>Set Strong Password</summary>

!!! info ""
    Affects: <br> - Supervisor Password <br> - System Management Password <br> - Power-On password <br> - Hard Disk password

!!! info ""
    For a strong password, length must <br> - be equal to or more than 8 characters <br> - include at least one uppercase character, one lowercase character and one number.

!!! info ""
    Otherwise, minimum length depends on the minimum password length setting.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SetStrongPassword | Disable, Enable | Yes | Both |

</details>

<details><summary>Keyboard Layout</summary>

Select keyboard layout in pre-OS environment. Does not affect OS.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| KeyboardLayout | English, French, German, Chinese | Yes | Both |

</details>

<!--<details><summary>Keyboard Language</summary>

Select the keyboard language for password. The default
is English keyboard.

Options:

1.  **English** - Default.
2.  French.
3.	German

</details>-->

<details><summary>Allow Jumper Clear SVP</summary>

Whether to allow the hardware jumper to clear the Supervisor Password.

!!! info ""
    No action can reset the SVP if you forget it.

Options:

1. **Yes** - Default.
1. No

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| AllowJumperClearSVP | No, Yes | Yes | Both |

</details>

<details><summary>Secure Roll Back Prevention</summary>

Whether flashing BIOS to a previous or current version is prevented.

Options:

1. **Yes** - Default.
1. No

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SecureRollBackPrevention | No, Yes | Yes | Both |

</details>

<details><summary>Require SVP when Flashing</summary>

Whether the supervisor password is required when updating the system firmware.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| RequireSVPwhenFlashing | No, Yes | Yes | Both |

</details>

<details><summary>Require POP on System Boot</summary>


Options:

1.  **Yes** - Default.  The system prompts for passwords when the system starts form the full off or hibernate state.
2.  No - Passwords are not prompted and continue to boot the
OS. To prevent unauthorized access to the system, recommended
to set user authentication on the OS.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| RequireSVPwhenFlashing | No, Yes | Yes | Both |

</details>


<details><summary>BIOS Password At System Boot</summary>

Whether to prompt for passwords when the system starts from the full off or hibernate state.

!!! info ""
    To prevent unauthorized access to the system, we recommend setting user authentication on the OS.

Options:

1. **Yes** - Default.
1. No

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| BIOSPasswordAtSystemBoot | No, Yes | Yes | Both |

</details>

<details><summary>BIOS Password At Reboot</summary>

Whether the Power-On Password is required when system restarts.

Options:

1.  **No** - Default.
2.  Yes.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| BIOSPasswordAtReboot | No, Yes | Yes | Both |

</details>

<details><summary>POP Changeable by User</summary>

If "No" is selected, the Power-On Password can only be changed by the supervisor password..

Options:

1.  **Yes** - Default.
2.  No.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| POPChangeablebyUser | No, Yes | Yes | AMD |

</details>

<details><summary>BIOS Password At Boot Device List</summary>

Whether the user is prompted for a password when F12 is pressed during POST.

!!! info ""
    A supervisor password must be set.

Options:

1.  **No** - Default.
2.  Yes.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| BIOSPasswordAtBootDeviceList | No, Yes | Yes | Both |

</details>

<details><summary>Smart USB Protection</summary>

Blocks copying data from the computer to the USB storage device in Windows.


Options:

1. **Disabled** - Default. 
1. Read Only - user can copy data from USB storage device to the computer, but cannot copy data from the computer to USB storage device.
1. No Access - user cannot use USB storage device in Windows.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SmartUSBProtection | Disable, Read Only, No Access | Yes | Both |

</details>

<!-- ### Fingerprint Setup ###

Not supported on P620

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_fingerprintsetup.png)

<details><summary>Preboot Authentication</summary>

Whether to enable the fingerprint reader function for entering BIOS passwords.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both |


</details>

<details><summary>Erase Fingerprint Data</summary>

Whether to clear fingerprint data stored in a fingerprint reader.

Options:

1.  **No** - Default.
2.  Yes.

TODO: confirm WMI
| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both |


</details> -->

<details><summary>Password Count Exceeded Error</summary>

Whether to show the POST 0199 error and prompt for password.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PasswordCountExceededError | Disabled, Enabled| Yes | Both |

<!-- TODO: confirm WMI -->

</details>
