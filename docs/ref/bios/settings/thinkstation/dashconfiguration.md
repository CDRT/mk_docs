# DASH Configuration #

![AMD Dash Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_amd_dashconfiguration.PNG)

DASH Support
:	
	Possible options:

	1. **Disabled** – Default.
	2. Enabled

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| DASHSupport | Disabled, Enabled | Yes | AMD |


## Console Redirection Settings ##

Console Redirection
:	
	Possible options:

	1. Enabled
	2. **Disabled** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| ConsoleRedirection | Disabled, Enabled | Yes | AMD |


Console Redirection Terminal Type
:	
	!!! note ""
		The following emulation types are available:
		- ANSI: Extended ASCII char set.
		- VT100: ASCII char set.
		- VT100+: Extends VT100 to support color, function keys, etc.
		- VT-UTF8: Uses UTF8 encoding to map Unicode chars onto 1 or more bytes.

	Possible options:

	1. VT100
	2. VT100+
	3. VT-UTF8
	4. **ANSI** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| ConsoleRedirectionTerminalType | VT100, VT100+, VT-UTF8, ANSI | Yes | AMD |



Bits Per Second
:	
	Possible options:

	1. 9600
	2. 19200
	3. 38400
	4. 57600
	5. **115200** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| BitsPerSecond | 9600, 19200, 38400, 57600, 115200 | Yes | AMD |



Data Bits
:	
	Possible options:

	1. 7
	2. **8** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| DataBits | 7, 8 | Yes | AMD |



Parity Mode
:	A parity bit can be sent with the data bits to detect some transmission errors.

	- Even: parity bit is 0 if the number of 1's in the data bits is even.
	- Odd: parity bit is 1 if the number of 1's in the data bits is odd.
	- Mark: parity bit is always 1.
	- Space: Parity bit is always 0.

	Mark and Space Parity do not allow for error detection. They can be used as an additional data bit.

	Possible options:

	1. **None** – Default.
	2. Even
	3. Odd
	4. Mark
	5. Space

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| ParityMode | None, Even, Odd, Mark, Space | Yes | AMD |



Stop Bits
:	
	Possible options:

	1. **1** – Default.
	2. 2

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| StopBits | 1, 2 | Yes | AMD |



Flow Control
:	
	Possible options:

	1. Hardware RTS/CTS
	2. **None** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| FlowControl | Hardware RTS/CTS, None | Yes | AMD |



VT UTF8 Combo Key Support
:	
	Possible options:

	1. Disabled
	2. **Enabled** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| VTUTF8ComboKeySupport | Disabled, Enabled | Yes | AMD |



Recorder Mode
:	
	Possible options:

	1. Disabled
	2. **Enabled** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| RecorderMode | Disabled, Enabled | Yes | AMD |



Resolution 100x31
:	
	Possible options:

	1. **Disabled** – Default.
	2. Enabled

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| Resolution100x31 | Disabled, Enabled | Yes | AMD |



Legacy OS Redirection Resolution
:	On Legacy OS, specifies the number of Columns and Rows supported in the console redirection.

	Possible options:

	1. **80x24** – Default.
	2. 80x20

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| LegacyOSRedirectionResolution | 80x24, 80x20 | Yes | AMD |



Putty KeyPad
:	Select FunctionKey and KeyPad on Putty

	Possible options:

	1. **VT100** – Default.
	2. Linux
	3. XTERMR6
	4. SCO
	5. ESCN
	6. VT401

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| PuttyKeyPad | VT100, Linux, XTERM6, SCO, ESCN, VT401 | Yes | AMD |



Redirection After BIOS POST
:	This setting specifies if BootLoader is selected then Legacy console redirection is disabled before booting to Legacy OS.

	Default value is Always Enable which means Legacy console Redirection is enabled for Legacy OS.

	Possible options:

	1. **Always Enable** – Default.
	2. BootLoader

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| RedirectionAfterBIOSPOST | Always Enable, BootLoader | Yes | AMD |








