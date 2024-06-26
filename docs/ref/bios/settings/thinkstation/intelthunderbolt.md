# Intel(R) Thunderbolt Settings #

![Intel Thunderbolt](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_intelthunderbolt2.PNG)

Intel Thunderbolt Technology
:	
	!!! note ""
		Cable standard combining data, video, and power.

	Options:

	1. Enabled – Intel(R) Thunderbolt technology is enabled.
	2. **Disabled** – Default.

	More information at Intel.com and Intel websites: [Thunderbolt Technology](https://www.intel.com/content/www/us/en/architecture-and-technology/thunderbolt/overview.html), [Thunderbolt Technology for Developers](https://www.intel.com/content/www/us/en/architecture-and-technology/thunderbolt/thunderbolt-technology-developer.html) , [Thunderbolt Solution Briefs](https://www.thunderbolttechnology.net/tech).

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| IntelThunderboltTechnology | Disabled, Enabled | yes | Intel |
	

Security Level
:	Whether to require user confirmation of connections, and for which devices.  These settings are not exposed through WMI.

	Options:

	1. **No Security** – Default. Automatically connect devices plugged into the Thunderbolt port.
	2. User Authorization - Approval is required for any new devices connected to the Thunderbolt port.
	3. Secure Connect - The Thunderbolt adapter port will only allow connection to devices that have been configured with a shared key.
	4. Display Port only - Automatically connect to Display Port devices only. No Thunderbolt adapter or PCIe devices are allowed to connect.

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


Wake From Thunderbolt Devices
:	
	Options:

	1. **Enabled** – Default.
	2. Disabled

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


SwSMI Support
:	
	Options:

	1. **Enabled** – Default.
	2. Disabled

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


Notify Support
:	
	Options:

	1. **Enabled** – Default.
	2. Disabled

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


Ignore Thunderbolt Option ROM
:	
	Options:

	1. **Enabled** – Default.
	2. Disabled

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
-->
