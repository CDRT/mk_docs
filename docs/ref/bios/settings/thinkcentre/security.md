# Security

![Security](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_security.PNG)
![Security](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_security_2.PNG)
![Security](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_security_3.PNG)

[More information at Lenovo Support - types of password](https://support.lenovo.com/us/en/solutions/ht513634)

Supervisor Password
:  Display only

    Options:

    1.  **Not Installed** - password disabled. Default.
    2.  Installed -  password enabled.

Power-On Password
:  Display only

    Options:

    1. **Not Installed** - password disabled. Default.
    2. Installed -  password enabled.

System Management Password
:  Display only

    Options:

    1. **Not Installed** - password disabled. Default.
    2. Installed -  password enabled.

Set Supervisor Password
:  Set, change, or delete the Supervisor Password.

    !!! note ""
        To delete Supervisor Password, enter blank fields for each new password line item.

    Enter and confirm new password.

Set Power-On Password
:  Set, change, or delete the Power-On Password.

    !!! note ""
        To delete Power-On Password, enter blank fields for each new password line item.

    Enter and confirm new password.

Set System Management Password
:  Set, change, or delete the System Management Password (SMP).

    !!! note ""
        To delete System Management Password, enter blank fields for each new password line item.

    Enter and confirm new password.

Secure Roll Back Prevention
:  Whether flashing BIOS to a previous or current version is prevented (NOT allowed).

    Options:

    1.  **Yes** - Flashing NOT allowed. Default.
    1.  No - Flashing BIOS allowed.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | SecureRollBackPrevention | No, Yes | Yes |

Windows UEFI Firmware Update
:  
    Options:

    1. **Enabled** - Default.
    1. Disabled - BIOS will skip Windows UEFI firmware update.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WindowsUEFIFirmwareUpdate | Disabled, Enabled | Yes |

Smart USB Protection
:  Block USB write access (copying data from computer to USB storage device) in Windows.

    Options:

    1.  **Disabled** - Default.
    1.  Read Only - The user can copy data from USB to computer, but not from computer to USB.
    1.  NO Access - The user cannot use USB storage device in Windows.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | SmartUSBProtection | Disabled, Read Only, No Access | Yes |

Secure Wipe
:  Hide or display the `secure wipe` option on the F12 BIOS Startup Menu.

    Options:

    1.  **Disabled** - hides `secure wipe` option. Default.
    2.  Enabled - shows `secure wipe` option.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | securewipe | Disabled, Enabled | yes |

Device Guard
:  Device Guard protects against malware by restricting the device across several technologies.

    Options:

    1.  **Disabled** - Ethernet, USB, CD, and other boot methods are enabled. Default.
    1.  Enabled - CPU Virtualization Technology，IOMMU (Intel VT-d, AMD-Vi),  Secure boot, and TPM are enabled. Ethernet, USB, CD, and other boot methods are disabled. Only SATA devices are allowed.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | DeviceGuard | Disabled, Enabled | yes |

Secure Core PC Level3
:  Whether to support Windows 10/11 Secured-core PCs' Level3:

    1.  **Disabled** - Default.
    2.  Enabled.

[More information at Microsoft Docs](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-highly-secure)

Electronic Lock
:  Whether to lock the chassis to prevent unauthorized physical access to the system components.

    !!! note ""
        Effective on the next startup after BIOS setting is saved.

    Options:

    1.  **Disabled** - Default.
    2.  Enabled.

Cover Tamper Detected
:  Chassis Intrusion Detection is a utility that can tell whether someone has opened the case (intruded into the chassis).

    Options:

    1.  **Disabled** - Default.
    1.  Enabled.

    !!! note ""
        If chassis tamper occurs, you can only clear this error by entering setup.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | CoverTamperDetected | Disabled, Enabled | yes |

Configuration Change Detection
:  
    Options:

    1.  **Disabled** - Default.
    2.  Enabled. When a device is installed or removed, the system will notify the user during POST.

    !!! note ""
        This notice can only be cleared by entering BIOS setup, saving and then exiting.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | ConfigurationChangeDetection | Disabled, Enabled | yes |
