# Password Policies Settings #

![Password Policy Settings](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_passwordpolicies.png)

Set Minimum Length
:	
	Options:

	- **Disabled** – passwords can have 1 to 128 characters. Default. 
	- 4 Characters
	- 5 Characters
	- 6 Characters
	- 7 Characters
	- 8 Characters
	- 9 Characters
	- 10 Characters
	- 11 Characters
	- 12 Characters

	!!! note ""
		A minimum length set here applies to <br /> - Supervisor Password (SVP) <br /> - System Management Password (SMP) <br /> - Power-On Password (PoP) <br /> - Hard Disk Password (HDP).

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SetMinimumLength | Disable, 4 Characters, 5 Characters, 6 Characters, 7 Characters, 8 Characters, 9 Characters, 10 Characters, 11 Characters, 12 Characters | yes | Both |


Set Strong Password
:	
	!!! note ""
		A strong password is defined as: <br /> - Upper case, lower case, and numeric characters are all required <br /> -  Special characters are optional <br /> - The minimum length is 8

	Options:

	1. Enabled.
	2. **Disabled** – the minimum length is 1 character. Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SetStrongPassword | Disabled, Enabled | yes | Both |


Keyboard Layout
:	Keyboard layout for password.

	Options:

	1. **English** – Default.
	2. French
	3. German
	4. Chinese

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| KeyboardLayout | English, French, German, Chinese | yes | Both |



BIOS Password At System Boot
:	Whether to prompt for passwords when the system starts from the full off or hibernate state.

	Options:

	1. **Yes** –  Default.
	2. No.

	!!! note ""
		To prevent unauthorized access to the system we recommend to setting user authentication on the OS. 

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| BIOSPasswordAtSystemBoot | No, Yes | yes | Both |



BIOS Password At Reboot
:	Whether to require Power-On Password when system restarts.

	Options:

	1. Yes.
	2. **No** - Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| BIOSPasswordAtReboot | No, Yes | yes | Both |
	

BIOS Password At Boot Device List
:	Whether user is prompted for a password when F12 is pressed during POST (Power On Self Test).

	!!! note ""
		Password prompt requires that Administrator Password is set.

	Options:

	1. Yes.
	2. **No** – Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| BIOSPasswordAtBootDeviceList | No, Yes | yes | Both |



Require SVP when Flashing
:	Whether the Supervisor Password (SVP) is required when updating the system software.

	Options:

	1. Yes.
	2. **No** – Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| RequireSVPwhenFlashing | No, Yes | yes | Both |



POP Changeable by User
:	Whether the Power-On Password (POP) can be changed without Supervisor Password (SVP).

	Options:

	1. **Yes** –  Default.
	2. No – the Power-On Password can only be changed with the SVP.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| POPChangeablebyUser | No, Yes | yes | Both |
	

Allow Jumper Clear SVP
:	Whether to allow the hardware jumper to clear the Supervisor Password.

	!!! note ""
		No action can reset the SVP if user forgets it.

	Options:

	1. **Yes** – Default.
	2. No.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| AllowJumperClearSVP | No, Yes | yes | Both |
	

Password Count Exceeded Error
:	Whether to show the POST 0199 error and prompt for password after three failed attempts.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	!!! note ""
		If `Enabled`, then after 3 attempts with an incorrect password, the system will show a 0199 error. <br /> - User can  bypass the error by pressing F2.  <br /> -  0199 error is still shown. <br /> -  Clear the error condition by pressing F10, or saving the settings after this has been verified, by entering bios with correct SVP. <br /> - If a user attempts to change BIOS settings and uses the wrong password, the system will deny access. <br /> - After a third failed attempt, all other attempts will fail. No further changes can be made, and user needs to reboot.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PasswordCountExceededError | Disabled, Enabled | yes | Both |
