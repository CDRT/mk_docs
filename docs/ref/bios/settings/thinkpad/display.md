# Display Settings #

![](./img/tp_display.png)

<details><summary>Boot Display Device</summary>

Whether native ThinkPad LCD, or an external display attached to USB Type-C connector or HDMI connector, will be used for boot.

Possible options:

1.	**ThinkPad LCD** - Default.
2.	External Display

?>  If multiple displays are attached, the boot screen appears on the first recognized one.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| BootDisplayDevice | LCD, ExternalDisplay | No | Both |

</details>

<details><summary>Graphics Device</summary>

Whether, if the system includes a discrete graphics adapter, both the integrated and the discrete graphics adapters are available to the OS, or only the discrete graphics adapter.

Possible options:

1.	**Hybrid Graphics** - Default.
2.	Discrete Graphics

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| GraphicsDevice | SwitchableGfx, DiscreteGfx | No | Both |

</details>

<details><summary>Total Graphics Memory</summary>

**Intel-based machine**

How much total memory to allocate for Intel (R) internal graphics device to share.

Possible options:

1.	**256 MB** - Default. 
2.	512 MB

!> If 512 MB is selected, the maximum usable memory may be reduced on 32-bit OS.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| TotalGraphicsMemory | 256MB, 512MB | No | Intel |

**AMD-based machine**

How much memory to allocate for UMA (Unified Memory Architecture) frame buffer.

Possible options:

1.	**Auto** - Default.
2. 1GB
3. 2GB
4. 4GB
5. 8GB

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| UMAFramebufferSize | Auto, 1GB, 2GB, 4GB, 8GB | No | AMD |

</details>

<details><summary>Boot Time Extension</summary>

Amount of time to extend the boot process, in seconds.

Possible options:

1.	**Disabled** - Default
2.	1 second
3.	2 seconds
4.	3 seconds
5.	5 seconds
6.	10 seconds

!> The System cannot detect some external monitors during boot because they need a few seconds to be ready. Try this option if the monitor being used does not display the boot screen.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| BootTimeExtension | Disable, 1, 2, 3, 5, 10 | No | Both |

</details>

<details><summary>ePrivacy Lock</summary>

Whether to set Privacy Guard always on.

!> If switched on, prevents the user from disabling it.

?> If switched off, can be toggled any time with hotkey `Fn` + `D`.

Options:

1.  **Off** - Default.
2.  On.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ePrivacyLock | Disable,Enable | Yes | both |


</details>
