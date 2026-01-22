# USB Setup Settings #

![USB Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_usbsetup.PNG)

AMD version of USB Setup
:	
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_amd_usbsetup1.PNG)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_amd_usbsetup2.PNG)


	!!! note ""
		The number of USB ports may vary depending on model.

USB Port Access
:	Whether to enable USB devices.

	!!! note ""
		When disabled, all other USB settings are removed, except for `USB Enumeration Delay`.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| USBPortAccess | Disabled, Enabled | yes | Both |



USB BIOS Support
:	Whether USB keyboard and/or USB mouse may be used without device driver support.

	Options:

	1.  **Enabled** - Default.
	2.  Disabled

	<!-- | WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| USBBIOSSupport |  |  | AMD |
	 -->



USB Charging Port in S4/S5
:	Whether to allow USB charging in hibernation and shutdown states.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| USBChargingPortInS4S5 | Disable, Enable | yes | AMD |



XHCI Hand-off
:	Whether USB3 ownership can be handed off to OS driver (not remaining in BIOS).

	Options:

	1. **Enabled** - Default.
	2. Disabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| XHCIHandoff | Disable, Enable | yes | AMD |



## USB hardware delays and time-outs: ##

USB Enumeration Delay
:	Whether extra delay is added when host performs USB enumeration.

	!!! note ""
		May improve the compatibility of USB device detection but increase POST Time.

	1. Enabled.
	2. **Disabled** - Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| USBEnumerationDelay | Disabled, Enabled | yes | Intel |



USB Transfer Time-out
:	The time-out value for Control, Bulk, and Interrupt transfers.

	Options:

	1. 1 sec
	1. 5 sec
	1. 10 sec
	1. **20 sec** - Default.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| USBTransferTimeout | 1 sec, 5 sec, 10 sec, 20 sec | yes | AMD |


Device Reset Time-out
:	USB mass storage device `Start Unit` command time-out.

	Options:

	1. **Disabled** - Default.
	2. Enabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| DeviceResetTimeout | 10 sec, 20 sec, 30 sec, 40 sec | yes | AMD |



Device Power-up Delay
:	Maximum time before device reports itself to the Host Controller. 

	Options:

	1. **Auto** - Default.
	2. Manual.

	!!! note ""
		`Auto` default values: <br> - Root port: 100 ms <br> - Hub port: delay taken from hub descriptor

	<!-- TODO: clarify hub port -->

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| DevicePowerupDelay | Auto, Manual | yes | AMD |



Front USB Ports
:	Whether to enable all Front USB ports and relevant setting fields.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| FrontUSBPorts | Disabled, Enabled | yes | Both |


Media Card Reader
:	Whether to enable the Media Card Reader (MCR).

	Options:

	1. **Enabled** - Default.
	2. Disabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| MediaCardReader | Disable, Enable | yes | AMD |



MCR USB Header
:	Whether the device connected to this USB header has the characteristics of external USB.

	Options:

	1. **Internal** - Default. Select when connected to Media Card Reader (MCR).
	2  External. Select when connected to USB Type C port.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| MCRUSBHeader | External, Internal | yes | AMD |



Internal USB3.2 Port
:	Whether to enable the internal USB 3.2 port.

	Options:

	1. **Enabled** - Default.
	2. Disabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| InternalUSB3Port | Disable, Enable | yes | AMD |



Internal USB2.0 Port
:	Whether to enable the internal USB 2.0 port.

	Options:

	1. **Enabled** - Default.
	2. Disabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| InternalUSB2Port | Disable, Enable | yes | AMD |



Rear USB Ports
:	Whether to enable or disable all rear USB ports and relevant settings. 

	Options:

	1. **Enabled** –  Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| RearUSBPorts | Disabled, Enabled | yes | Both |


USB Port {X}
:	{X} is the number of the rear USB port (total number of ports dependent on model).

	For each Rear USB Port:

	1. **Enabled**. Default, if `Enabled` is selected in `Rear USB Ports`. 
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| USBPortX | Disabled, Enabled | yes | Both |

	!!! note ""
		The WMI setting name in the example above represents the port number. Change the number to that of the desired rear USB port.


