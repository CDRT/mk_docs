# Intel(R) VMD Technology #
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_intelvmd_1.PNG)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_intelvmd_2.PNG)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_intelvmd_3.PNG)

Enable the VMD(Volume Management Device) technology to 
support configure PCIe storages to VROC(Virtual RAID on 
CPU) feature.

<!-- More options for users: (Display image here?)
would these be more dropdown subheaders? or do we make it another page
look at atadriversetup for ex on how they did it
EX: M.2 Slot 1, M.2 Slot 2, M.2 Slot3
	PCIe Slot1, etc -->

M.2 Slot{X}
:	Enable/Disable Intel(R) Volume Management Device Technologyon M.2 Slot1.

	Options:

	1. **PCIe** – Default.
	2. VMD.

	!!! note ""
		X represents the slot number, 1 to 3.



PCIe Slot{X} 
:	Enable/Disable Intel(R) Volume Management Device Technology on PCIe Slot1.

	Options:

	1. **PCIe** – Default.
	2. VMD.

	!!! note ""
		X represents the slot number, 1 to 9.


MCIO Slot{X}-{Y}
:	Enable/Disable Intel(R) Volume Management Device Technology on MCIO Slot1-1.

	Options:

	1. **PCIe** – Default.
	2. VMD.

	!!! note ""
		X & Y represent the slot numbers, 1 and 2 (interchangeably).


