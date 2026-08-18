# Security

<!-- TODO :
- Shutdown by Cover Tamper / TPM Clear by Cover Tamper: removed from this page. WMI names confirmed real (ShutdownByCoverTamper, TpmClearByCoverTamper) via the P3TowerG2 spec, but that spec explicitly says "this item is always hidden" — not a customer-facing setting. Do we add it back in?
- BIOS Setup Control, BIOS Unlock Control, Bottom Cover Tamper Detection: still unconfirmed: not found in the P3TinyGen2/P360Tiny/P3TowerG2 specs either. Names + Enable/Disable confirmed only via New WMI reference sheet, no description, no confirmed placement.
- Require SVP when Flashing: this setting's own WMI table lists Values "No, Yes", but its Possible options are Disabled/Enabled — mismatch, left unchanged pending verification.
- Keyboard Layout: this setting's Possible options are Disabled/Enabled, but its own WMI table lists Values "English, French, German, Chinese" — mismatch. A commented-out "Keyboard Language" draft lower on this page (English/French/German, no Chinese) looks like it may be the intended real content for this setting; left both untouched pending verification.
- Smart USB Protection appears twice on this page with materially different WMI enum casing ("Disabled" vs "Disable" for the same option) — left both, not merged.
- Removed "Require POP on System Boot": duplicated "BIOS Password At System Boot" below it, but with broken line-wrapped text, a "form"/"from" typo, and a WMI Setting name ("RequireSVPwhenFlashing") that was already claimed by the separate "Require SVP when Flashing" setting above it. Kept the cleaner "BIOS Password At System Boot" version instead.
-->

## **Supervisor Password**

The supervisor password (SVP) protects the system information stored in UEFI BIOS.

When entering the UEFI BIOS menu, enter the correct supervisor password in the window prompted. You also can press Enter to skip the password prompt. However, you cannot change most of the system configuration options in UEFI BIOS.

!!! warning "Attention"
    - The supervisor password can be set only through the UEFI BIOS menu. Once it is in place, then it can be modified Windows Management Instrumentation (WMI) with the Lenovo client-management interface.
    - If you have set both the supervisor password and power-on password, you can use the supervisor password to access your computer when you turn it on.
    - The supervisor password overrides the power-on password.

View only.

Shows the current password state.

Possible values:

1. Not Installed
2. Installed

### **Power-On Password**

Power-On Password prevents unauthorized users from booting your computer.

View only.

Shows the current password state.

Possible values:

1. Not Installed
2. Installed

### **System Management Password**

The system management password (SMP) protects the system information stored in UEFI BIOS like a supervisor password, but it has lower authority by default.

!!! warning "Attention"
    The system management password can be set through the UEFI BIOS menu or through Windows Management Instrumentation (WMI) with the Lenovo client-management interface. You can enable the system management password to have the same authority as the supervisor password to control security-related features.

View only.

Shows the current password state.

Possible values:

1. Not Installed
2. Installed

### **Set Supervisor Password**

Set, change or delete the Supervisor Password (SVP).

!!! warning "Attention"
    To delete Supervisor Password, enter blank fields for each new password line item.

Parameters:

1. `Enter New Password`
2. `Confirm New Password`
3. < Actions >:

    a. **Save** – Default

    b. Cancel

### **Set Power-On Password**

Set, change or delete the Power-On Password.

!!! warning "Attention"
    To delete Power-On Password, enter blank fields for each new password line item.

Parameters:

1. `Enter New Password`
2. `Confirm New Password`
3. < Actions >:

    a. **Save** – Default

    b. Cancel

### **Set System Management Password**

Set, change or delete the System Management Password (SMP).

!!! warning "Attention"
    To delete System Management Password, enter blank fields for each new password line item.

Parameters:

1. `Enter New Password`
2. `Confirm New Password`
3. < Actions >:

    a. **Save** – Default

    b. Cancel

### **Windows UEFI Firmware Update**

Possible options:

1. **Enabled** – allow Windows UEFI firmware update. Default.
2. Disabled – BIOS will skip Windows UEFI firmware update.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WindowsUEFIFirmwareUpdate | Disabled, Enabled | Yes | Both |

### **BIOS Self-healing**

Allows the BIOS to automatically attempt to recover a corrupted BIOS without needing a recovery file on external media.

!!! warning "Attention"
    WMI can only read this value, not set it.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BIOSSelfHealing | Enabled, Disabled | No | Both |

### **BIOS Never Crash**

Additional BIOS resiliency feature that helps prevent the system from becoming unbootable due to a corrupted or failed BIOS update.

Possible options:

1. **Enabled** – Default.
2. Disabled

### **BIOS Setup Control**

Whether access to BIOS Setup is allowed.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BiosSetupControl | Enabled, Disabled | Yes | Both |

### **BIOS Unlock Control**

Controls whether BIOS Setup is unlocked.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BiosUnlockControl | Enabled, Disabled | Yes | Both |

### **Smart USB Protection**

Smart USB Protection blocks copying data from the computer to the USB storage device in Windows.

Possible options:

1. **Disabled** – the user can copy data from and to USB storage device. Default.
2. Read Only – the user can copy data from USB storage device to the Computer but not from the computer to USB storage device.
3. No Access – the user cannot use USB storage device in OS.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SmartUSBProtection | Disabled, Read Only, No Access | Yes | Both |

### **secure wipe**

Whether to display the `secure wipe` option on the F12 BIOS Startup Menu. Users can select this option to securely erase HDD data.

Possible options:

1. Enabled
2. **Disabled** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| securewipe | Disabled, Enabled | Yes | Intel |

### **Computrace**

Settings for Absolute Persistence Module.

Absolute(c) is a service designed to help track devices and provide recovery services in the event a device is lost or stolen. Once installed, the Absolute agent communicates with the Absolute Monitoring Center and programmed intervals to provide the tracking service. By installing the agent and activating the service, you consent to the transmission of information between your device and the Absolute Monitoring Center. For customers who have purchased the Absolute service, the firmware Persistence Module checks for the presence and health of Absolute on boot, and restores the functionality in case of agent removal or tampering. Absolute and Persistence are registered trademarks of Absolute Software Corporation.

### **Absolute Persistence Version**

View only.

### **Absolute Persistence Module**

Whether to enable the firmware Persistence Module of the optional service from Absolute.

!!! warning "Attention"
    Selecting `Permanently Disabled` requires additional confirmation and cannot be done by WMI, because if Computrace activation is permanently disabled, then you can never enable it again. More information on the official site of [Absolute Software Corporation](https://www.absolute.com/partners/device-manufacturers/lenovo/){: target="_blank"}.

Possible options:

1. **Enabled** – Default.
2. Disabled
3. Permanently Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AbsolutePersistenceModule | Disabled, Enabled | Yes | Both |

### **Device Guard**

Device Guard enables PCs to be protected against malware by introducing a collective set of restrictions on a device across several technologies.

Possible options:

1. **Disabled** – Ethernet, USB, CD, and other boot methods to be enabled. Default.
2. Enabled – CPU Virtualization Technology to be enabled, IOMMU (Intel Input\Output Memory Management Unit), such as Intel VT-d, AMD-Vi to be enabled, TPM to be enabled. Ethernet, USB, CD, and other boot methods to be disabled, only SATA device to be allowed.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DeviceGuard | Disabled, Enabled | Yes | Both |

### **Secure Core PC Level3**

Whether to support Windows 10/11 Secured-core PC's Level3 requirements.

!!! warning "Attention"
    When `Enabled`, related security features (Secure Boot, Security Chip 2.0, and platform-dependent items such as TxT, IOMMU, VT-d, Pre-boot DMA Protection, Kernel DMA Protection, AMD Secure Virtual Machine, or AMD Memory Guard) are automatically enabled, and `Allow Microsoft 3rd Party UEFI CA` is automatically disabled. If a required feature isn't available, this setting is disabled automatically.

Possible options:

1. **Disabled** – Default.
2. Enabled

[More information at Microsoft Docs](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-highly-secure)

### **Odometer**

Whether to enable the BIOS Odometer feature.

Possible options:

1. **Disabled** – Default.
2. Enabled

### **Electronic Lock**

Whether to lock the chassis to prevent unauthorized physical access to the system components.

!!! warning "Attention"
    The setting is effective on the next startup after BIOS setting is saved.

Possible options:

1. **Unlock** – Default.
2. Lock

For more information, please refer to the [user manual](https://thinkstation-specs.com/thinkstation/p350-tower/).

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ElectronicLock | Unlock, Lock | Yes | Intel |

### **ThinkShield Passwordless Power-On Authentication**

Enable or Disable the ThinkShield Passwordless Power-On Authentication and Device Manager.

Possible options:

1. **Enabled** – Default.
2. Disabled

### **Cover Tamper Detected**

Whether to enable Chassis Intrusion Detection, a utility that can tell whether someone has opened the case (intruded into the chassis).

!!! warning "Attention"
    If chassis tamper occurs, you must enter setup to clear this error.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| CoverTamperDetected | Disabled, Enabled | Yes | Both |

### **Bottom Cover Tamper Detection**

Whether to enable tamper detection for the bottom cover.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BottomCoverTamperDetected | Disabled, Enabled | Yes | Both |

### **Configuration Change Detection**

Whether the system will notify the user during POST (Power On Self Test), when a device is installed or removed.

!!! warning "Attention"
    This notice can only be cleared by entering BIOS setup, saving, and then exiting.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ConfigurationChangeDetection | Disabled, Enabled | Yes | Both |

### **AMD Platform Security Boot**

If enabled, when a new CPU is installed, the system will notify the user during POST (Power On Self Test). This notice message can be cleared by pressing Y.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AmdPlatformSecurityBoot | Enable, Disable | Yes | AMD |

### **Reset system to Factory Default**

This option is used clear all data stored in UEFI system. Not affected to storage data. After selecting this item, the system will be automatically reboot, then reset system to factory default settings.

### **Set Password Encryption Algorithm**

Select the encryption algorithm for BIOS Password.

Possible options:

1. **SHA-256 Hash** - Default.
2. SM3 Hash

### **Custom Password Mode**

<!-- TODO: custom password mode description -->

Possible options:

1. **Disabled** - Default.
2. Enabled

### **Max Password Attempts**

Set maximum number of supervisor password attempts from any software on the operating system.

!!! warning "Attention"
    If password attempts exceeds this, BIOS does not accept further password attempts.

Possible options:

1. **3** - Default.
2. 1
3. 100
4. Unlimited

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| MaxPasswordAttempts | 3, 1, 100, Unlimited | Yes | Both |

### **Password Change Time**

When to change the supervisor password if it is requested by software on the operating system. This option is used to control the timing to change the supervisor password if it is requested by software on the operating system.

Possible options:

1. **After Reboot** - Default.
2. Immediately

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PasswordChangeTime | After Reboot, Immediately | Yes | Both |

### **Set Minimum Length**

If a minimum is set, Supervisor Password, System Management Password, Power-On and Hard Disk password lengths must be equal to or longer than that number. Otherwise, they can be 1 to 128 characters.

Possible options:

1. **Disabled** - Default.
2. 4 Characters
3. 5 Characters
4. 6 Characters
5. 7 Characters
6. 8 Characters
7. 9 Characters
8. 10 Characters
9. 11 Characters
10. 12 Characters

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SetMinimumLength | Disable, 4 Characters, 5 Characters, 6 Characters, 7 Characters, 8 Characters, 9 Characters, 10 Characters, 11 Characters, 12 Characters | Yes | Both |

### **Set Strong Password**

Affects:

- Supervisor Password
- System Management Password
- Power-On password
- Hard Disk password

For a strong password, length must:

- be equal to or more than 8 characters
- include at least one uppercase character, one lowercase character and one number

Otherwise, minimum length depends on the minimum password length setting.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SetStrongPassword | Disable, Enable | Yes | Both |

### **Keyboard Layout**

Select keyboard layout in pre-OS environment. Does not affect OS.

Possible options:

1. English
2. French
3. German
4. Chinese

Default varies by specific model.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| KeyboardLayout | English, French, German, Chinese | Yes | Both |

### **Allow Jumper Clear SVP**

Whether to allow the hardware jumper to clear the Supervisor Password.

!!! warning "Attention"
    No action can reset the SVP if you forget it.

Possible options:

1. **Yes** - Default.
2. No

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AllowJumperClearSVP | Yes, No | Yes | Both |

### **Secure Roll Back Prevention**

Whether flashing BIOS to a previous or current version is prevented.

Possible options:

1. **Yes** - Default.
2. No

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SecureRollBackPrevention | Yes, No | Yes | Both |

### **Require SVP when Flashing**

Whether the supervisor password is required when updating the system firmware.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| RequireSVPwhenFlashing | No, Yes | Yes | Both |

### **BIOS Password At System Boot**

Whether to prompt for passwords when the system starts from the full off or hibernate state.

!!! warning "Attention"
    To prevent unauthorized access to the system, we recommend setting user authentication on the OS.

Possible options:

1. **Yes** - Default.
2. No

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BIOSPasswordAtSystemBoot | Yes, No | Yes | Both |

### **BIOS Password At Reboot**

Whether the Power-On Password is required when system restarts.

Possible options:

1. **No** - Default.
2. Yes

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BIOSPasswordAtReboot | No, Yes | Yes | Both |

### **POP Changeable by User**

If `No` is selected, the Power-On Password can only be changed by the supervisor password.

Possible options:

1. **Yes** - Default.
2. No

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| POPChangeablebyUser | Yes, No | Yes | AMD |

### **BIOS Password At Boot Device List**

Whether the user is prompted for a password when F12 is pressed during POST.

!!! warning "Attention"
    A supervisor password must be set.

Possible options:

1. **No** - Default.
2. Yes

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BIOSPasswordAtBootDeviceList | No, Yes | Yes | Both |

### **Smart USB Protection**

Blocks copying data from the computer to the USB storage device in Windows.

Possible options:

1. **Disabled** - Default.
2. Read Only - user can copy data from USB storage device to the computer, but cannot copy data from the computer to USB storage device.
3. No Access - user cannot use USB storage device in Windows.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SmartUSBProtection | Disable, Read Only, No Access | Yes | Both |

### **Password Count Exceeded Error**

Whether to show the POST 0199 error and prompt for password.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PasswordCountExceededError | Disabled, Enabled | Yes | Both |

<!-- TODO: confirm WMI -->
