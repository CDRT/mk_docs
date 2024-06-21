# Security #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_security.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_security_2.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_security_3.png)

 - [More information at Lenovo Support - types of password](https://support.lenovo.com/us/en/solutions/ht513634)
 - [More information at Lenovo Support - password manager](https://support.lenovo.com/us/en/solutions/ht103666-introduction-to-password-manager-thinkpad-thinkcentre-thinkstation)

<details><summary>Supervisor Password (display only)</summary>

Options:

1.  **Not Installed** - password disabled. Default.
2.  Installed -  password enabled.

</details>

<details><summary>Power-On Password (display only)</summary>

Options:

1. **Not Installed** - password disabled. Default.
2. Installed -  password enabled.

</details>

<details><summary>System Management Password (display only)</summary>

Options:

1. **Not Installed** - password disabled. Default.
2. Installed -  password enabled.

</details>

<details><summary>Set Supervisor Password</summary>

Set, change, or delete the Supervisor Password.

!!! note ""
    To delete Supervisor Password, enter blank fields for each new password line item.

Enter and confirm new password.


</details>

<details><summary>Set Power-On Password</summary>

Set, change, or delete the Power-On Password.

!!! note ""
    To delete Power-On Password, enter blank fields for each new password line item.

Enter and confirm new password.


</details>

<details><summary>Set System Management Password</summary>

Set, change, or delete the System Management Password (SMP).

!!! note ""
    To delete System Management Password, enter blank fields for each new password line item.

Enter and confirm new password.


</details>

<details><summary>Secure Roll Back Prevention</summary>

Whether flashing BIOS to a previous or current version is prevented (NOT allowed).

Options:

1.  **Yes** - Flashing NOT allowed. Default.
1.  No - Flashing BIOS allowed.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SecureRollBackPrevention | No, Yes | Yes |


</details>

<details><summary>Windows UEFI Firmware Update</summary>

Options:

1. **Enabled** - Default.
1. Disabled - BIOS will skip Windows UEFI firmware update.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| WindowsUEFIFirmwareUpdate | Disabled, Enabled | Yes |


</details>

<details><summary>Smart USB Protection</summary>

Block USB write access (copying data from computer to USB storage device) in Windows.

Options:

1.  **Disabled** - Default.
1.  Read Only - The user can copy data from USB to computer, but not from computer to USB.
1.  NO Access - The user cannot use USB storage device in Windows.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SmartUSBProtection | Disabled, Read Only, No Access | Yes |


</details>

<details><summary>secure wipe</summary>

Hide or display the `secure wipe` option on the F12 BIOS Startup Menu.

Options:

1.  **Disabled** - hides `secure wipe` option. Default.
2.  Enabled - shows `secure wipe` option.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| securewipe | Disabled, Enabled | yes |


</details>


<details><summary>Device Guard</summary>

Device Guard protects against malware by restricting the device across several technologies.   

Options:

1.  **Disabled** - Ethernet, USB, CD, and other boot methods are enabled. Default.
1.  Enabled - CPU Virtualization Technology，IOMMU (Intel VT-d, AMD-Vi),  Secure boot, and TPM are enabled. Ethernet, USB, CD, and other boot methods are disabled. Only SATA devices are allowed.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| DeviceGuard | Disabled, Enabled | yes |


</details>

<details><summary>Secure Core PC Level3</summary>

Whether to support Windows 10/11 Secured-core PCs' Level3:

1.  **Disabled** - Default.
2.  Enabled.

 - [More information at Microsoft Docs](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/oem-highly-secure)


</details>

<details><summary>Electronic Lock</summary>

Whether to lock the chassis to prevent unauthorized physical access to the system components.

!!! note ""
    Effective on the next startup after BIOS setting is saved.

Options:

1.  **Disabled** - Default.
2.  Enabled.


</details>

<details><summary>Cover Tamper Detected</summary>

Chassis Intrusion Detection is a utility that can tell whether someone has opened the case (intruded into the chassis).

Options:

1.  **Disabled** - Default.
1.  Enabled.

!!! note ""
    If chassis tamper occurs, you can only clear this error by entering setup.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| CoverTamperDetected | Disabled, Enabled | yes |


</details>

<details><summary>Configuration Change Detection</summary>

Options:

1.  **Disabled** - Default.
2.  Enabled. When a device is installed or removed, the system will notify the user during POST.

!!! note ""
    This notice can only be cleared by entering BIOS setup, saving and then exiting.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| ConfigurationChangeDetection | Disabled, Enabled | yes |


</details>
