# PCIe Setup #

![PCIe Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_pciesetup_px1.PNG)
![PCIe Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_pciesetup_px2.PNG)


Re-Size BAR Support
:	If system has Resizable BAR capable PCIe Devices, this optionEnables or Disables Resizable BAR Support.
	
	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ReSizeBARSupport  | Enabled, Disabled | Yes | Both |



SR-IOV Support
:	If system has SR-IOV capable PCIe Devices, this option Enables or Disables Single Root IO Virtualization Support.

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SRIOVSupport   | Enabled, Disabled | Yes | Both |
	

ASPM Support
:	
	<Auto> Configure ASPM automatically according to what the
	attached device supports in each PCI Express port
	<Disabled> Disable ASPM support of all PCI Express ports.

	Options:

	1. **Disabled** – Default.
	2. Auto.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ASPMSupport   | Disabled, Auto | Yes | Both | 


Link Training Timeout(uS)
:	Defines number of Microseconds software will wait before polling 'Link Training' bit in Link Status register. Value range from 10 to 10000 uS.

	Options:

	1. **1000** – Default.
	2. Simulator not support.




<!-- Need to add all of the PCIe Slotx Configurations 
These will likely be subheader drop downs
-->
## PCIe Slot{X} Configuration ##

![PCIe Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_pcieslotconfig.PNG)

PCIe Port
:	Select whether to enable or disable this PCIe port.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PCIeSlotXPort | Enabled, Disabled | Yes | Both | 

	!!! note ""
		In the WMI class name, X represents the slot number.




PCIe Port Bifurcationt
:	Select PCIe port bifurcation. If select [Auto], system will auto configurate PCIe port bifurcation and auto detect Quad M.2 PCIe Card.

	Options:

	1. **Auto** – Default.
	2. x4x4x4x4.
	3. x8x8.
	4. x16

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PCIeSlotXBifurcation   | x4x4x4x4, x8x8, x16, Auto | Yes | Both | 

	!!! note ""
		In the WMI class name, X represents the slot number.
	

Link Speed
:	Select PCEi Link Speed.

	Options:

	1. **Auto** – Default.
	2. Gen 1 (2.5 GT/s).
	3. Gen 2 (5 GT/s).
	4. Gen 3 (8 GT/s).
	5. Gen 4 (16 GT/s)

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PCIeSlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s) | Yes | Both | 

	!!! note ""
		In the WMI class name, X represents the slot number.


## M.2 Slot{X} Configuration ##

![M2 Slot Config](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_m2slotconfig.PNG)

Link Speed
:	Select PCIe Link Speed.

	Options:

	1. **Auto** – Default.
	2. Gen 1 (2.5 GT/s).
	3. Gen 2 (5 GT/s).
	4. Gen 3 (8 GT/s).
	5. Gen 4 (16 GT/s)
	6. Gen 5 (32 GT/s)

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| M2SlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s), Gen 5 (32 GT/s) | Yes | Both | 

	!!! note ""
		In the WMI class name, X represents the slot number.


## MCIO Slot{X}-{Y} Configuration ##

![MCIO Slot Config](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_mcioslotconfig.PNG)

Link Speed
:	Select PCIe Link Speed.

	Options:

	1. **Auto** – Default.
	2. Gen 1 (2.5 GT/s).
	3. Gen 2 (5 GT/s).
	4. Gen 3 (8 GT/s).
	5. Gen 4 (16 GT/s)
	6. Gen 5 (32 GT/s)

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| MCIOSlotXYLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s), Gen 5 (32 GT/s) | Yes | Intel | 

	!!! note ""
		In the WMI class name, X & Y represents the slot numbers.

