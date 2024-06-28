# Security #

![Secuirty](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_security_1.PNG)

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

Supervisor Password
:	The supervisor password (SVP) protects the system information stored in UEFI BIOS.

	!!! note ""
		When entering the UEFI BIOS menu, enter the correct supervisor password in the window prompted. You also can press Enter to skip the password prompt. However, you cannot change most of the system configuration options in UEFI BIOS.

	!!! note ""
		**The supervisor password can be set only through the UEFI BIOS menu**. Once it is in place, then it can be modified Windows Management Instrumentation (WMI) with the Lenovo client-management interface.

	If you have set both the supervisor password and power-on password, you can use the supervisor password to access your computer when you turn it on.

	!!! note ""
		The supervisor password overrides the power-on password.

	View only.

	Shows the current password state.

	Possible values:

	1. Not Installed
	2. Installed

	

Power-On Password
:	Power-On Password prevents unauthorized users from booting your computer.

	View only.

	Shows the current password state.

	Possible values:

	1. Not Installed
	2. Installed



System Management Password
:	The system management password (SMP) protects the system information stored in UEFI BIOS like a supervisor password, but it has lower authority by default.

	!!! note ""
		The system management password can be set through the UEFI BIOS menu or through Windows Management Instrumentation (WMI) with the Lenovo client-management interface. You can enable the system management password to have the same authority as the supervisor password to control security-related features.

	View only.

	Shows the current password state.

	Possible values:

	1. Not Installed
	2. Installed



Set Supervisor Password
:	Set, change or delete the Supervisor Password (SVP).<br>

	!!! note ""
		To delete Supervisor Password, enter blank fields for each new password line item.

	Parameters:
	1. [ Enter New Password ]
	2. [ Confirm New Password ]
	3. < Actions >:<br>
		a. **Save** – default<br>
		b. Cancel



Set Power-On Password
:	Set, change or delete the Power-On Password.

	!!! note ""
		To delete Power-On Password, enter blank fields for each new password line item.

	Parameters:
	1. [ Enter New Password ]
	2. [ Confirm New Password ]
	3. < Actions >:<br>
		a. **Save** – default<br>
		b. Cancel



Set System Management Password
:	Set, change or delete the System Management Password (SMP).

	!!! note ""
		To delete System Management Password, enter blank fields for each new password line item.

	Parameters:
	1. [ Enter New Password ]
	2. [ Confirm New Password ]
	3. < Actions >:<br>
		a. **Save** – default<br>
		b. Cancel



Windows UEFI Firmware Update
:	
	Options:

	1. **Enabled** – allow Windows UEFI firmware update. Default.
	2. Disabled – BIOS will skip Windows UEFI firmware update.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| WindowsUEFIFirmwareUpdate | Disabled, Enabled | yes | Both |


Smart USB Protection
:	Smart USB Protection blocks copying data from the computer to the USB storage device in Windows.

	Options:

	1. **Disabled** – the user can copy data from and to USB storage device. Default. 
	2. Read Only – the user can copy data from USB storage device to the Computer but not from the computer to USB storage device.
	3. No Access – the user cannot use USB storage device in OS.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SmartUSBProtection | Disabled, Read Only, No Access | yes | Both |


secure wipe
:	Whether to display the `secure wipe` option on the F12 BIOS Startup Menu. Users can select this option to securely erase HDD data.

	Options:

	1. Enabled.
	2. **Disabled** – Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| securewipe | Disabled, Enabled | yes | Intel |


Computrace
:	Settings for Absolute Persistence Module.

	!!! note ""
		Absolute(c) is a service designed to help track devices and provide recovery services in the event a device is lost or stolen. Once installed, the Absolute agent communicates with the Absolute Monitoring Center and programmed intervals to provide the tracking service. By installing the agent and activating the service, you consent to the transmission of information between your device and the Absolute Monitoring Center. For customers who have purchased the Absolute service, the firmware Persistence Module checks for the presence and health of Absolute on boot, and restores the functionality in case of agent removal or tampering. Absolute and Persistence are registered trademarks of Absolute Software Corporation.

	![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_computrace.png)

Absolute Persistence Version
:	View only.



Absolute Persistence Module
:	Whether to enable the firmware Persistence Module of the optional service from Absolute.<br>

	Options:

	1.	**Enabled** – Default.
	2.	Disabled.
	3.	Permanently Disabled.

	!!! note ""
		Selecting `Permanently Disabled` requires additional confirmation and cannot be done by WMI, because if Computrace activation is permanently disabled, then you can never enable it again. <br> More information on the official site of [Absolute Software Corporation](https://www.absolute.com/partners/device-manufacturers/lenovo/){:target=”_blank”} .

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| AbsolutePersistenceModule | Disabled, Enabled | yes | Both |
	



Device Guard
:	Device Guard enables PCs to be protected against malware by introducing a collective set of restrictions on a device across several technologies.

	Options:

	1. Enabled – CPU Virtualization Technology to be enabled, IOMMU (Intel Input\Output Memory Management Unit), such as Intel VT-d, AMD-Vi to be enabled, TPM to be enabled. 
	Ethernet, USB, CD, and other boot methods to be disabled, only SATA device to be allowed.
	2. **Disabled** – Ethernet, USB, CD, and other boot methods to be enabled. Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| DeviceGuard | Disabled, Enabled | yes | Both |


Electronic Lock
:	Whether to lock the chassis to prevent unauthorized physical access to the system components.

	Options:

	1. Lock. 
	2. **Unlock** – Default. 

	!!! note ""
		The setting is effective on the next startup after BIOS setting is saved. <br /> For more information, please refer to [user manual](https://thinkstation-specs.com/thinkstation/p350-tower/). 

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ElectronicLock | Lock, Unlock | yes | Intel |
	

ThinkShield Passwordless Power-On Authentication
:	Enable or Disable the ThinkShield Passwordless Power-On Authentication and Device Manager.

	Options:

	1. **Enabled** – Default.
	2. Disabled.
	

Cover Tamper Detected
:	Whether to enable Chassis Intrusion Detection, a utility that can tell whether someone has opened the case (intruded into the chassis).

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	!!! note ""
		If chassis tamper occurs, you must enter setup to clear this error.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| CoverTamperDetected | Disabled, Enabled | yes | Both |


Configuration Change Detection
:	Whether the system will notify the user during POST (Power On Self Test), when a device is installed or removed.

	!!! note ""
		This notice can only be cleared by entering BIOS setup, saving, and then exiting.

	Options:

	1. Enabled.
	2. **Disabled** – Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ConfigurationChangeDetection | Disabled, Enabled | yes | Both |


Reset system to Factory Default
:	This option is used clear all data stored in UEFI system. Not affected to storage data. After selecting this item, the system will be automatically reboot, then reset system to factory default
settings.




<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_security.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_security2.png)-->

Set Password Encryption Algorithm
:	Select the encryption algorithm for BIOS Password.

	Options:

	1. **SHA-256 Hash** - Default.
	1. SM3 Hash

	

Custom Password Mode
:	
	<!-- TODO: custom password mode description -->
	Options:

	1.  **Disabled** - Default.
	2.  Enabled.

	<!-- NO WMI -->



Max Password Attempts
:	Set maximum number of  supervisor password attempts from any software on the operating system.

	!!! note ""
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



Password Change Time
:	When to change the supervisor password if it is requested by software on the operating system. This option is used to control the timing to change the supervisor password if it is requested by software on the operating system.

	Options:

	1. **After Reboot** - Default.
	1. Immediately

	<!-- NO WMI -->
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PasswordChangeTime | After Reboot, Immediately | Yes | Both |



Set Minimum Length
:	If a minimum is set, Supervisor Password, System Management Password, Power-On and Hard Disk password lengths must be equal to or longer than that number. Otherwise, they can be 1 to 128 characters.

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



Set Strong Password
:	
	!!! note ""
		Affects: <br> - Supervisor Password <br> - System Management Password <br> - Power-On password <br> - Hard Disk password

	!!! note ""
		For a strong password, length must <br> - be equal to or more than 8 characters <br> - include at least one uppercase character, one lowercase character and one number.

	!!! note ""
		Otherwise, minimum length depends on the minimum password length setting.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SetStrongPassword | Disable, Enable | Yes | Both |



Keyboard Layout
:	Select keyboard layout in pre-OS environment. Does not affect OS.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| KeyboardLayout | English, French, German, Chinese | Yes | Both |



<!--Keyboard Language

Select the keyboard language for password. The default
is English keyboard.

Options:

1.  **English** - Default.
2.  French.
3.	German

-->

Allow Jumper Clear SVP
:	Whether to allow the hardware jumper to clear the Supervisor Password.

	!!! note ""
		No action can reset the SVP if you forget it.

	Options:

	1. **Yes** - Default.
	1. No

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| AllowJumperClearSVP | No, Yes | Yes | Both |

	

Secure Roll Back Prevention
:	Whether flashing BIOS to a previous or current version is prevented.

	Options:

	1. **Yes** - Default.
	1. No

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SecureRollBackPrevention | No, Yes | Yes | Both |



Require SVP when Flashing
:	Whether the supervisor password is required when updating the system firmware.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| RequireSVPwhenFlashing | No, Yes | Yes | Both |



Require POP on System Boot
:	

	Options:

	1.  **Yes** - Default.  The system prompts for passwords when the system starts form the full off or hibernate state.
	2.  No - Passwords are not prompted and continue to boot the
	OS. To prevent unauthorized access to the system, recommended
	to set user authentication on the OS.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| RequireSVPwhenFlashing | No, Yes | Yes | Both |




BIOS Password At System Boot
:	Whether to prompt for passwords when the system starts from the full off or hibernate state.

	!!! note ""
		To prevent unauthorized access to the system, we recommend setting user authentication on the OS.

	Options:

	1. **Yes** - Default.
	1. No

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| BIOSPasswordAtSystemBoot | No, Yes | Yes | Both |



BIOS Password At Reboot
:	Whether the Power-On Password is required when system restarts.

	Options:

	1.  **No** - Default.
	2.  Yes.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| BIOSPasswordAtReboot | No, Yes | Yes | Both |



POP Changeable by User
:	If "No" is selected, the Power-On Password can only be changed by the supervisor password..

	Options:

	1.  **Yes** - Default.
	2.  No.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| POPChangeablebyUser | No, Yes | Yes | AMD |



BIOS Password At Boot Device List
:	Whether the user is prompted for a password when F12 is pressed during POST.

	!!! note ""
		A supervisor password must be set.

	Options:

	1.  **No** - Default.
	2.  Yes.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| BIOSPasswordAtBootDeviceList | No, Yes | Yes | Both |



Smart USB Protection
:	Blocks copying data from the computer to the USB storage device in Windows.

	Options:

	1. **Disabled** - Default. 
	1. Read Only - user can copy data from USB storage device to the computer, but cannot copy data from the computer to USB storage device.
	1. No Access - user cannot use USB storage device in Windows.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SmartUSBProtection | Disable, Read Only, No Access | Yes | Both |



<!-- ### Fingerprint Setup ###

Not supported on P620

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_fingerprintsetup.png)

Preboot Authentication

Whether to enable the fingerprint reader function for entering BIOS passwords.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both |




Erase Fingerprint Data

Whether to clear fingerprint data stored in a fingerprint reader.

Options:

1.  **No** - Default.
2.  Yes.

TODO: confirm WMI
| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| setting_name | setting_values | yes_no | both |


 -->

Password Count Exceeded Error
:	Whether to show the POST 0199 error and prompt for password.

	Options:

	1.  **Enabled** - Default.
	2.  Disabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PasswordCountExceededError | Disabled, Enabled| Yes | Both |

	<!-- TODO: confirm WMI -->


