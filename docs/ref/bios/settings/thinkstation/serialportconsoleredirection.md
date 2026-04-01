# Serial Port Console Redirection #

![Serial Port](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_serialport.PNG)
<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_serialportconsoleredirection.png)-->

Console Redirection
:
    Possible options:

    1.  **Disabled** – Default.
    2.  Enabled.
	

## Console Redirection Settings

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_consolerd1.PNG)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_consolerd2.PNG)

<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /amd_consoleredirectionsettings.png)-->

Terminal Type
:
    Possible options:

    1. VT100
    2. VT100+
    3. VT-UTF8
    4. **ANSI** – Default.

    Details:

    - VT100+: Extends VT100 to support color, function keys, etc.
    - VT-UTF8: Uses UTF8 encoding to map Unicode chars onto 1 or more bytes. 

<!-- | WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| ConsoleRedirection | setting_values | yes_no | both | -->



Bits per second
:	Select serial port transmission speed. The speed must be matched on the other side. Long or noisy lines may require lower speeds.

	Possible options:

	1. 9600
	1. 19200
	1. 38400
	1. 57600
	1. **115200** - Default

	<!-- | WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| BitsPerSecond | setting_values | yes_no | both | -->


Data Bits
:
    Possible options:

	1. **8** – Default.
	1. 7


Parity
:	Send parity bit with the data bits to detect some transmission errors.

	Possible options:

	1.  **Disabled** – Default.
	2.  Enabled.

	!!! note ""
		Details below:
		- Even: parity bit is 0 if the num of 1's in the data bits is even.
		- Odd: parity bit is 1 if the num of 1's in the data bits is odd.
		- Mark: parity bit is always 1.
		- Space: Parity bit is always 0. 

	!!! note ""
		Mark and Space Parity do not allow for error detection.  They can be used as an additional data bit.

	<!-- | WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| ParityMode | setting_values | yes | AMD | -->



Stop Bits
:	Stop bits indicate the end of a serial data packet. (A start bit indicates the beginning). The standard setting is 1 stop bit. Communication with slow devices may require more than 1 stop bit.

    Possible options:

    1.  **1** – Default.
    2.  2

	<!-- | WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| StopBits | setting_values | yes | AMD | -->



Flow Control
:	Flow control can prevent data loss from buffer overflow. When sending data, if the receiving buffers are full, a 'stop' signal can be sent to stop the data flow. Once the buffers are empty, a 'start' signal can be sent to re-start the flow. Hardware flow control uses two wires to send start/stop signals.

    Possible options:

    1.  **None** – Default.
    2.  Hardware RTS/CTS
	

VT-UTF8 Combo Key Support
:	Enables VT-UTF8 Combination Key Support for ANSI/VT100 terminals.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled
	

Recorder Mode
:	With this mode enabled only text will be sent. This is to capture Terminal data.

    Possible options:

    1.  **Disabled** – Default.
    2.  Enabled

Resolution 100x31
:	Enables or disables extended terminal resolution.

    Possible options:

    1.  **Disabled** – Default.
    2.  Enabled


Legacy OS Redirection Resolution
:	On Legacy OS, the Number of Rows and Columns supported redirection.

	Possible options:

    1.  **80x24** – Default.
    2.  80x26


Putty KeyPad
:	Select FunctionKey and KeyPad on Putty.

	Possible Options:

	1.  **VT100** – Default.
	2.  Linux
	3.  XTERMR5
	4.  SCO
	5.  ESCN
	6.  VT401


Redirection After BIOS POST
:	The Settings specify if BootLoader is selected then Legacy console redirection is disabled before booting to Legacy OS. Default value is Always Enable which means Legacy console Redirection is enabled for Legacy OS.

	Possible options:

	1.  **Always Enable** – Default.
	2.  BootLoader







