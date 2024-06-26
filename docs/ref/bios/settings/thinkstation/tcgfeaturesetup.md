# TCG Feature Setup Settings #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_tcgfeaturesetup.png)

TCG Security Device State
:	Shows TCG (Trusted Computing Group) Security Device State.

	View only.

	Possible values: 

	1. Discrete TPM 2.0
	2. Firmware TPM 2.0

	


TCG Security Device
:	Select the type of TCG Security Device:

	1. Firmware TPM 
	2. **Discrete TPM** – Default.

	!!! note ""
		Selecting a different option requires additional confirmation.

	!!! note ""
		Before changing the TCG Security Device, all TPM related applications must be disabled, otherwise you may not be able to access your data.


	


Security Chip 2.0
:	Whether to enable TCG security feature.

	Options:

	1. **Enabled** - Default. 
	2. Disabled.

	!!! note ""
		When set to `Disabled`, then TxT will be set to `Disabled` automatically and `Clear TCG Security Feature` becomes unavailable. 

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SecurityChip | Disabled, Enabled | yes | Both |




Clear TCG Security Feature
:	Available only when `Security Chip 2.0` is `Enabled`.<br>

	!!! note ""
		If set to `Yes`, any data in TPM will be cleared.

	One of two options:

	1.  Yes.
	2. **No** – Default.




Physical Presence for Clear
:	Whether confirmation of a user’s physical presence is needed when clearing the security chip.

	!!! note ""
		When `Enabled`, the system will display a user confirmation screen when clearing.

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PhysicalPresenceforClear | Disabled, Enabled | yes | Both |
