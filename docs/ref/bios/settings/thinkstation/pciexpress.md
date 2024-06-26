# PCI Express Setup #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_pciexpresssetup.PNG)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_pciexpresssetup_p3twr.png)-->

SR-IOV Support
:	If system has SR-IOV capable PCIe Devices, this option Enables or Disables Single Root IO Virtualization Suppor.
	
	Options:

	1. **Disabled**. Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SRIOVSupport | Enabled, Disabled | Yes | Both |



ASPM Support
:	If system has SR-IOV capable PCIe Devices, this option Enables or Disables Single Root IO Virtualization Support.

	Options:

	1. **Auto**. Default. Configure ASPM automatically according to what the attached device supports in each PCI Express port.
	2. Disabled - Disable ASPM support of all PCI Express ports.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ASPMSupport | Auto, Disabled | Yes | Both |



PCIe 16x Slot Speed
:	Select PCI Express port speed.

	Options:

	1. **Auto**. Default. 
	2. Gen 1
	3. Gen 2
	4. Gen 3
	5. Gen 4

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PCIe16xSlotSpeed | Auto, Gen1, Gen2, Gen3, Gen4 | Yes | Intel |



PCIe 4x Slot Speed
:	Select PCI Express port speed.

	Options:

	1. **Auto**. Default. 
	2. Gen 1
	3. Gen 2
	4. Gen 3
	5. Gen 4

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PCIe4xSlotSpeed | Auto, Gen1, Gen2, Gen3, Gen4 | Yes | Intel |



PCIe 1x Slot 1 Speed
:	Select PCI Express port speed.

	Options:

	1. **Auto**. Default. 
	2. Gen 1
	3. Gen 2
	4. Gen 3

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PCIe1xSlot1Speed | Auto, Gen1, Gen2, Gen3| Yes | Intel |
	