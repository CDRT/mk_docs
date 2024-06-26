# Storage Setup #

![Storage Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_storagesetup_p3twr1.PNG)

<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_storagesetup_p3twr2.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_storagesetup_px1.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_storagesetup_px2.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_storagesetup_p3twr_1.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_storagesetup_p3twr_2.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_storagesetup_px_1.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_storagesetup_px_2.png)-->

SATA Controller
:	
	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SATAController | Disabled, Enabled | Yes | Both |



SATA Drive {X}
:	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SATADriveX | Disabled, Enabled | Yes | Both |

	!!! note ""
		In the WMI class name, X represents the drive number.



M.2 Drive {X}
:	
	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| M.2DriveX | Disabled, Enabled | Yes | Intel |

	!!! note ""
		In the WMI class name, X represents the drive number.


MCIO Drive {X}-{Y}
:	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| MCIODriveXY | Disabled, Enabled | Yes | Intel |

	!!! note ""
		In the WMI class name, X & Y represents the drive number.


SATA Drive * Hot-Plug Support
:	
	Options:

	1. Enabled.
	2. **Disabled** – Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SATADriveXHotPlugSupport | Disabled, Enabled | Yes | Both |

	!!! note ""
		In the WMI class name, X represents the drive number.


Configure Storage as
:	
	Mode Options:

	1. **AHCI** – Default.
	2. RAID

	!!! note ""
	   Device driver support is required for AHCI or RAID.
	Depending on how the hard disk image was installed, changing
	this setting may prevent the system from booting.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ConfigureStorageas | AHCI, RAID | Yes | Intel |



![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_storagesetup_px_2.PNG)

Configure SATA as
:	
	!!! note ""
	    Device driver support is required for AHCI or RAID. Depending on how the hard disk image was installed, changing this setting may prevent the system from booting.

	Options:

	1. **AHCI** – Default.
	2. RAID

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ConfigureSATAas | AHCI, RAID | Yes | Both |


Hard Disk Pre-delay
:	Adds a delay before the first access of a hard disk by the system software. Some hard disks hang if accessed before they have initialized themselves. This delay ensures the hard disk has initialized after power up, prior to being accessed.

	Options:

	- **Disabled** – Default.
	- 3 Seconds
	- 6 Seconds
	- 9 Seconds
	- 12 Seconds
	- 15 Seconds
	- 21 Seconds
	- 30 Seconds

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| HardDiskPre-delay | Disabled, 3 Seconds, 6 Seconds, 9 Seconds, 12 Seconds, 15 Seconds, 21 Seconds, 30 Seconds | Yes | Both |





<!--
### Intel(R) VMD Technology ###
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_intelvmd_1.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_intelvmd_2.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_intelvmd_3.png)

Enable the VMD(Volume Management Device) technology to 
support configure PCIe storages to VROC(Virtual RAID on 
CPU) feature. -->

<!-- More options for users: (Display image here?)
would these be more dropdown subheaders? or do we make it another page
look at atadriversetup for ex on how they did it
EX: M.2 Slot 1, M.2 Slot 2, M.2 Slot3
	PCIe Slot1, etc -->



