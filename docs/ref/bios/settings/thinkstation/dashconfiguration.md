# DASH Configuration #

![](./img/ts_amd_dashconfiguration.png)

<details><summary>DASH Support</summary>

Options:

1. **Disabled** - Default.
2. Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| DASHSupport | Disabled, Enabled | yes | AMD |

</details>

### Console Redirection Settings ###


<details><summary>Console Redirection </summary>

Options:

1. Enabled
1. **Disabled** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ConsoleRedirection | Disabled, Enabled | yes | AMD |

</details>
<details><summary>Console Redirection Terminal Type</summary>

?> The following emulation types are available. <br> ANSI: Extended ASCII char set. <br> VT100: ASCII char set. <br> VT100+: Extends VT100 to support color, function keys, etc. <br> VT-UTF8: Uses UTF8 encoding to map Unicode chars onto 1 or more bytes.<br>

Options:

1. VT100
1. VT100+
1. VT-UTF8
1. **ANSI** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ConsoleRedirectionTerminalType | VT100, VT100+, VT-UTF8, ANSI | yes | AMD |

</details>

<details><summary>Bits Per Second</Summary>

Options:

1. 9600
1. 19200
1. 38400
1. 57600
1. **115200** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| BitsPerSecond | 9600, 19200, 38400, 57600, 115200 | yes | AMD |

</details>

<details><summary>Data Bits</Summary>

Options:

1. 7
1. **8** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| DataBits | 7, 8 | yes | AMD |

</details>

<details><summary>Parity Mode</Summary>

A parity bit can be sent with the data bits to detect some transmission errors.

- Even: parity bit is 0 if the number of 1's in the data bits is even.
- Odd: parity bit is 1 if the number of 1's in the data bits is odd.
- Mark: parity bit is always 1.
- Space: Parity bit is always 0.

Mark and Space Parity do not allow for error detection.  They can be used as an additional data bit.

Options:

1. **None** - Default.
1. Even
1. Odd
1. Mark
1. Space

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ParityMode | None, Even, Odd, Mark, Space | yes | AMD |

</details>

<details><summary>Stop Bits</Summary>

Options:

1. **1** - Default.
1. 2

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| StopBits | 1, 2 | yes | AMD |

</details>

<details><summary>Flow Control</Summary>

Options:

1. Hardware RTS/CTS
1. **None** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| FlowControl | Hardware RTS/CTS, None | yes | AMD |

</details>

<details><summary>VT UTF8 Combo Key Support</Summary>

Options:

1. Disabled
1. **Enabled** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| VTUTF8ComboKeySupport | Disabled, Enabled | yes | AMD |

</details>

<details><summary>Recorder Mode</Summary>

Options:

1. Disabled
1. **Enabled** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| RecorderMode | Disabled, Enabled | yes | AMD |

</details>

<details><summary>Resolution 100x31</Summary>

Options:

1. **Disabled** - Default.
1. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| Resolution100x31 | Disabled, Enabled | yes | AMD |

</details>

<details><summary>Legacy OS Redirection Resolution</Summary>

On Legacy OS, specifies the number of Columns and Rows supported in the console redirection.

Options:

1. **80x24** - Default.
1. 80x20

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| LegacyOSRedirectionResolution | 80x24, 80x20 | yes | AMD |

</details>

<details><summary>Putty KeyPad</Summary>

Select FunctionKey and KeyPad on Putty

Options:

1. **VT100** - Default.
1. Linux
1. XTERMR6
1. SCO
1. ESCN
1. VT401

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PuttyKeyPad | VT100, Linux, XTERM6, SCO, ESCN, VT401 | yes | AMD |

</details>

<details><summary>Redirection After BIOS POST</Summary>

This setting specifies if BootLoader is selected then Legacy console redirection is disabled before booting to Legacy OS.

Default value is Always Enable which means Legacy console Redirection is enabled for Legacy OS.

Options:

1. **Always Enable** - Default.
1. BootLoader

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| RedirectionAfterBIOSPOST | Always Enable, BootLoader | yes | AMD |

</details>
