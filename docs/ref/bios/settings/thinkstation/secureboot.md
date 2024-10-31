# Secure Boot Settings #

![Secure Boot](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_secureboot.png)

## General

System Mode
:	Shows the current system mode.

	View only.

	Possible values:

	1. **Deployed Mode** - Default
	2. Audit  Mode
	3. User Mode
	4. Setup Mode




Secure Boot
:	Secure Boot means that the BIOS will prevent any un-authorized OS from being loaded.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SecureBoot | Disabled, Enabled | yes | Both |
	


Restore Factory Keys
:	Reset Factory Keys will put secure boot into factory defaults.<br>

	!!! note ""
		Requires additional confirmation. 




Reset Platform to Setup Mode
:	Reset to setup mode will move secure boot to setup mode.<br>

	!!! note ""
		Requires additional confirmation.




Enter Audit Mode
:	Enter Audit Mode workflow.

	!!! note ""
		Transition from User to Audit Mode will result in erasing of PK (Platform Key) value.

	!!! note ""
		Requires additional confirmation.




Enter Deployment Mode
:	Transition between User and Deployment modes.

	!!! note ""
		Requires additional confirmation.




Allow Microsoft 3rd Party UEFI CA
:	
	!!! note ""
		If add-on Cards are supported, Microsoft 3rd Party UEFI
	CA will not be removed until load boot loader

	Options:

	1. **Enabled** – Default.  Microsoft 3rd Party UEFI CA will be installed in Secure Boot DB. This device will trust it in Secure Boot.
	2. Disabled - Microsoft 3rd Party UEFI CA will be removed in Secure
	Boot DB.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| AllowMicrosoft3rdPartyUEFICA | Enabled, Disabled	 |  | AMD |



## Key Management

![Key Management](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/securebootkeysmanagement.png)

Platform Key (PK)</summary>
:	
	!!! note ""
		The platform key establishes a trust relationship between the platform owner and the platform firmware. The platform owner enrolls the public half of the key into the platform firmware. The platform owner can later use the private half of the key to change platform ownership or to enroll a Key Exchange Key. 


Key Exchange Key (KEK)</summary>
:	
	!!! note ""
		Key exchange keys establish a trust relationship between the operating system and the platform firmware. Each operating system (and potentially, each 3rd party application that needs to communicate with platform firmware) enrolls a public key into the platform firmware.

	<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |-->



Authorized Signature Database (DB)</summary>
:	
	!!! note ""
		Database keys shows the list of allowed certificates. System will check digital signatures of bootloaders using public keys in the DB. Only software or firmware which has a bootloader signed with a corresponding private key will be allowed to run. 

	<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |-->
	


Forbidden Signature Database (DBX)</summary>
:	
	!!! note ""
		Forbidden Signature Database shows not allowed certificates. System will block any software or firmware signed with a corresponding private key. 

	<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |-->



Authorized TimeStamps (DBt)</summary>
:	
	!!! note ""
		If present, contains the platform-defined secure boot timestamp signature database. This is not used at runtime but is provided in order to allow the OS to recover the OEM's default key setup.

	<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |-->



OsRecovery Signatures (DBr)</summary>
:	
	!!! note ""
		If present, contains the platform-defined secure boot authorized recovery signature database. This is not used at runtime but is provided in order to allow the OS to recover the OEM's default key setup.

	<!--| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |-->
	