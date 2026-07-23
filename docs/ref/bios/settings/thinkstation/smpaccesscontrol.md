# System Management Password Access Control Settings #

<!-- TODO:
- BIOS Setup Configuration Control & Storage Password Control: Default guessed for both (Disabled) — not marked in the source data.
-->

![SMP Access Control](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_smpaccesscontrol.png)

Access Security Settings
:	Whether to allow SMP (System Management Password) to have the same authority as SVP (Supervisor Password) to control security settings.

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| AccessSecuritySettings | Disabled, Enabled | yes | Both |



Remote Set SMP
:	Whether an SVP (Supervisor Password) is needed to set SMP (System Management Password) via WMI (Windows Management Instrumentation).

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| RemoteSetSMP | Disabled, Enabled | yes | Both |



BIOS Setup Configuration Control
:	Whether SMP (System Management Password) has authority to change BIOS setup configuration settings.

	Options:

	1. **Disabled** – Default.
	2. Enabled.



Storage Password Control
:	Whether SMP (System Management Password) has authority to control storage (Hard Disk) password settings.

	Options:

	1. **Disabled** – Default.
	2. Enabled.
