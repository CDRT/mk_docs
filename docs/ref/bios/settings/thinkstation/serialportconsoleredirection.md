# Serial Port Console Redirection #

![Serial Port](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_serialport.PNG)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_serialportconsoleredirection.png)-->

Console Redirection
:	
	Options:

	1.  **Disabled** - Default.
	2.  Enabled.
	

## Console Redirection Settings

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_consolerd1.PNG)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_consolerd2.PNG)

<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_consoleredirectionsettings.png)-->

Terminal Type
:	
	Options:

	1. VT100
	1. VT100+
	1. VT-UTF8
	1. **ANSI** - Default.

	!!! note ""
		The following emulation types are available. <br> ANSI: Extended ASCII char set. <br> VT100: ASCII char set. <br> VT100+: Extends VT100 to support color, function keys, etc. <br> VT-UTF8: Uses UTF8 encoding to map Unicode chars onto 1 or more bytes.<br> 

<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ConsoleRedirection | setting_values | yes_no | both | -->



Bits per second
:	Select serial port transmission speed. The speed must be matched on the other side. Long or noisy lines may require lower speeds.

	Options:

	1. 9600
	1. 19200
	1. 38400
	1. 57600
	1. **115200**

	<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| BitsPerSecond | setting_values | yes_no | both | -->



Data Bits
:	
	Options:

	1. **8** - Default.
	1. 7

	<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| DataBits | setting_values | yes | AMD | -->



Parity
:	Send parity bit with the data bits to detect some transmission errors.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled.

	!!! note ""
		Details below. <br> Even: parity bit is 0 if the num of 1's in the data bits is even. <br> Odd: parity bit is 1 if the num of 1's in the data bits is odd. <br> Mark: parity bit is always 1. <br> Space: Parity bit is always 0. <br> 

	!!! note ""
		Mark and Space Parity do not allow for error detection.  They can be used as an additional data bit.

	<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ParityMode | setting_values | yes | AMD | -->



Stop Bits
:	Stop bits indicate the end of a serial data packet. (A start bit indicates the beginning). The standard setting is 1 stop bit. Communication with slow devices may require more than 1 stop bit.

	Options:

	1.  **1** - Default.
	2.  2.

	<!-- | WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| StopBits | setting_values | yes | AMD | -->



Flow Control
:	Flow control can prevent data loss from buffer overflow. When sending data, if the receiving buffers are full, a 'stop' signal can be sent to stop the data flow. Once the buffers are empty, a 'start' signal can be sent to re-start the flow. Hardware flow control uses two wires to send start/stop signals.

	Options:

	1.  **None** - Default.
	2.  Hardware RTS/CTS
	

VT-UTF8 Combo Key Support
:	Enables VT-UTF8 Combination Key Support for ANSI/VT100 terminals.

	Options:

	1.  **Enabled** - Default.
	2.  Disabled
	

Recorder Mode
:	With this mode enabled only text will be sent. This is to capture Terminal data.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled
	

Resolution 100x31
:	Enables or disables extended terminal resolution.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled


Legacy OS Redirection Resolution
:	On Legacy OS, the Number of Rows and Columns supported redirection.

	Options:

	1.  **80x24** - Default.
	2.  80x26


Putty KeyPad
:	Select FunctionKey and KeyPad on Putty.

	Options:

	1.  **VT100** - Default.
	2.  Linux
	3.  XTERMR5
	4.  SCO
	5.  ESCN
	6.  VT401


Redirection After BIOS POST
:	The Settings specify if BootLoader is selected then Legacy console redirection is disabled before booting to Legacy OS. Default value is Always Enable which means Legacy console Redirection is enabled for Legacy OS.

	Options:

	1.  **Always Enable** - Default.
	2.  BootLoader

