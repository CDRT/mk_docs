# Password Settings #

### General ###

![](./img/tp_password.png)

The [Types of Passwords](/bios/settings/thinkpad/password?id=types-of-passwords) section describes the different passwords' behaviors.

- [More information about passwords on support.lenovo.com.](https://support.lenovo.com/at/en/solutions/ht036206-types-of-password-for-thinkpad)

<details><summary>Supervisor Password</summary>

Whether the system will request the user to set and confirm the Supervisor Password.

Possible options:

1.	**Disabled** - Default.
2.	Enabled

While enabling the following parameters are available:

* Enter New Password
* Confirm New Password
* Show Password – [On\Off] statuses
    * Keyboard layout: – Possible values are the same as in [Keyboard Layout](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/keyboardmouse.md)
* < Actions >:
   - **Save** – default
   - Cancel<br>

!> When enabled, Supervisor Password prevents unauthorized users from accessing these items in ThinkPad Setup: <br> - Boot priority lists <br> - Network related items <br> - Date & Time <br>

?>  To have a beep sound when the system is waiting for this password, enable the [Password Beep feature in the Alarm submenu](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/beepalarm).

</details>

<details><summary>System Management Password</summary>

 Whether system will request the user to set and confirm System Management Password password.

Possible options:

1.	**Off** - Default.
2.	On

While enabling the following parameters are available:

- [Enter New Password]
- [Confirm New Password]
- Show Password – [On\Off] statuses
- Keyboard layout: XXXX – Possible values are the same as in [Keyboard\Mouse -> Keyboard Layout](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/keyboardmouse.md)
- < Actions >:
   - **Save** – default
   - Cancel

!> When enabled System Management Password presents unauthorized users from accessing these items in ThinkPad Setup: <br> - Boot priority lists <br> - Network related items <br> - Date & Time

?>  To have a beep sound when the system is waiting for this password, enable the [Password Beep feature in the Alarm submenu](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/beepalarm.md).

</details>

<details><summary>Power-On Password</summary>

Whether will request user to set and confirm Power-On Password password.

?> When enabled Power-On Password prevents unauthorized users from booting your computer.

Possible options:

1.	**Off** - Default.
2.	On

While enabling the following parameters are available:

- [Enter New Password]
- [Confirm New Password]
- Show Password – [On\Off] statuses
- Keyboard layout: – Possible values are the same as in [Keyboard Layout](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/keyboardmouse.md)
- < Actions >:
   - **Save** – default
   - Cancel

When enabled Power-On Password prevents unauthorized users from booting your computer.

?>  To have a beep sound when the system is waiting for this password, enable the [Password Beep feature in the Alarm submenu](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/beepalarm.md).

</details>

<details><summary>NVMe1 Password</summary>

Also known as **Hard Disk Password (HDP)**.

Possible options:

1.	**Off** - no password defined. Default.
2.	On - for enabling system will request 'Setup Confirmation' and 'Password and confirmation'.

Setup Confirmation:

1. **Single Password** - when a Single NVMe password is set, the user must enter the user NVMe password to access files and applications on the storage drive. Default.
2. Dual Password (User+Admin) - The admin NVMe password is set and used by a system administrator. It enables the administrator to access any storage drive in a system or any computer connected in the same network. The administrator can also assign a user NVMe password for each computer in the network. The user of the computer can change the user NVMe password as desired, but only the administrator can remove the user NVMe password.
3. Cancel

Password and confirmation:

- [Enter New Password]
- [Confirm New Password]
- Show Password – [On\Off] statuses
- Keyboard layout: XXXX – Possible values are the same as in [Keyboard\Mouse -> Keyboard Layout](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/keyboardmouse.md)
- < Actions >:
   - **Save** – default
   - Cancel

?> To have a beep sound when the system is waiting for this password, enable the [Password Beep feature in the Alarm submenu](https://docs.lenovocdrt.com/#/bios/settings/thinkpad/beepalarm.md).

?> When prompted to enter an NVMe password, press F1 to switch between the admin NVMe password and user NVMe password.

!>  The NVMe password is not available in the following situations:

* A Trusted Computing Group (TCG) Opal-compliant storage drive and a TCG Opal management software program are installed in the computer, and the TCG Opal management software program is activated.
* For Intel models, when an eDrive storage drive is installed in the computer preinstalled with the Windows 10 operating system.

</details>

<details><summary>Block SID Authentication</summary>

Whether TCG (Trusted Computing Group) Storage device will block attempts to authenticate the SID (Security Identifier) authority until a subsequent device power cycle occurs.

!> If switched `Off`, system will allow SID authentication in TCG Storage device at the next system boot only, but not subsequent boots.

Possible options:

1.	**On** - Default.
2.	Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| BlockSIDAuthentication | Disable, Enable | Yes | Both |

</details>

<details><summary>Lock UEFI BIOS Settings</summary>

Whether to prevent users from making any changes in ThinkPad Setup without entering a Supervisor Password.

Possible options:

1.	On
2.	**Off** - Default.

!>  UEFI BIOS Lock will not take effect unless Supervisor password is enabled.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| LockBIOSSetting | Disable, Enable | Yes | Both |

</details>

<details><summary>Password at Unattended Boot</summary>

Whether the system prompts for passwords when the system starts from full off state or hibernate by unattended events.

Possible options:

1.	**On** - Default.
2.	Off

!>  To protect unauthorized access to the system we recommended setting user authentication on the OS.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| BIOSPasswordAtUnattendedBoot | Disable, Enable | Yes | Both |

</details>

<details><summary>Password at Restart</summary>

Whether the system prompts for passwords when the system restarts.

Possible options:

1.	On
2.	**Off** - Default.

!>  To protect unauthorized access to the system we recommended setting user authentication on the OS.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| BIOSPasswordAtReboot | Disable, Enable | Yes | Both |

</details>

<details><summary>Password at Boot Device List</summary>

Whether the system prompts for the Security password.

?> If the Security password is set, this option is used to specify whether the Security password must be entered to display the F12 boot device list.

Possible options:

1.	On
2.	**Off** - system will proceed without any user action required. Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| BIOSPasswordAtBootDeviceList | Disable, Enable | Yes | Both |

</details>

<details><summary>Password Count Exceeded Error</summary>

Whether system will show POST 0199 error when a wrong supervisor password is entered more than three times and prompt for the Security password.

Possible options:

1.	**On** - Default.
2.	Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| PasswordCountExceededError | Disable, Enable | Yes | Both |

</details>

<details><summary>Set Minimum Length</summary>

?> Applies to: <br> - Supervisor Password System Management Password <br> - Power-On password <br> - Hard Disk password

Possible options:

1.	**Disabled** - passwords can be from 1 to 128 symbols. Default.
2.	4 characters
3.	5 characters
4.	6 characters
5.	8 characters
6.	9 characters
7.	10 characters
8.	11 characters
9.	12 characters

?>  If a supervisor password is set, you cannot change the minimum length until you log in as a supervisor.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| MinimumPasswordLength | Disable, 4, 5, 6, 7, 8, 9, 10, 11, 12 | Yes | Both |

</details>

<details><summary>Set Strong Password</summary>

"Strong password" means:
 - 8 or more characters
 - must include at least one uppercase character, one lowercase character and one number.

?> Applies to: <br> - Supervisor Password <br> - System Management Password <br> - Power-On password <br> - Hard Disk password

Possible options:

1.	**Disabled** - Default.
2.	Enabled

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| StrongPassword | Disable, Enable | Yes | Both |

</details>

### System Management Password Access Control ###

![](./img/tp_smpaccesscontrol.png)

<details><summary>System Management Password Control</summary>

 Whether to allow System Management Password to have the same authority as Supervisor Password to control System Management Password.

Possible options:

1.	**Off** – Default.
2.	On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| SystemManagementPasswordControl | Disable, Enable | Yes | Both |

</details>

<details><summary>Power-On Password Control</summary>

 Whether to allow System Management Password to have the same authority as Supervisor Password to control Power-On Password.

Possible options:

1.	**Off** - Default.
2.	On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| PowerOnPasswordControl | Disable, Enable | Yes | Both |

</details>

<details><summary>Storage Password Control</summary>

When enabled, allows System Management Password to have a same authority as Supervisor Password to control NVMe Password.

Possible options:

1.	**Off** - Default.
2.	On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| StorageDiskPasswordControl | Disable, Enable | Yes | Both |

</details>

<details><summary>Hard Disk Password Control</summary>

 Whether to allow System Management Password to have the same authority as Supervisor Password to control Hard Disk Password.

Possible options:

1.	**Off** - Default.
2.	On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| HardDiskPasswordControl | Disable, Enable | Yes | Both |

</details>

<details><summary>BIOS Setup Configurations</summary>

 Whether to allow System Management Password to have the same authority as Supervisor Password to control BIOS setup items.

Possible options:

1.	**Off** - Default.
2.	On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
   |:---|:---|:---|:---|
| BIOSSetupConfigurations | Disable, Enable | Yes | Both |

</details>

<hr />

### Types of Passwords

**Supervisor Password (SVP)**

Protects the system information stored in UEFI BIOS.

**_Entering the SVP_**

When entering the UEFI BIOS menu, enter the correct supervisor password in the window prompted.

!> If the user presses `Enter`, the password prompt will be skipped, but then most of the system configuration options in UEFI BIOS will be unavailble.

 **_Setting the SVP_**

The supervisor password can be set only through the UEFI BIOS menu.

Once it is in place, then it can be modified using Windows Management Instrumentation (WMI) with the Lenovo client-management interface.

**_Overriding the POP_**

The supervisor password overrides the power-on password (POP).

If you have set both the supervisor password and power-on password, you can use the supervisor password to access your computer when you turn it on.
<hr>

**The System Management Password (SMP)**

Also protects the system information stored in UEFI BIOS like a supervisor password, but it has lower authority by default.

**_Setting the SMP_**

The system management password can be set through the UEFI BIOS menu or through Windows Management Instrumentation (WMI) with the Lenovo client-management interface.

**_Overriding the SVP_**

You can enable the system management password to have the same authority as the supervisor password to control security-related features.
<hr>

**Power-On Password**

When enabled, Power-On Password prevents unauthorized users from booting your computer.
<hr>

**ATA / NVMe Password**

Also known as Hard Disk Password (HDP).

Lenovo BIOS supports both ATA and NVMe storage and the displayed BIOS setting changes depending on the attached storage device.

The NVMe (nonvolatile memory express) password prevents unauthorized access to the data on the storage drive. When an NVMe password is set, you are prompted to type a correct password each time you try to access the storage drive. The system also supports creating **dual passwords** for an Admin and another User.
