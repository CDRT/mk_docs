# Device Guard Settings #
![](./img/tp_deviceguard.png)

<details><summary>Device Guard</summary>

Whether to enable Microsoft (R) Device Guard.

!> To configure Device Guard, Supervisor Password must be set.

!> Device Guard is no longer available as a BIOS Setting starting with 2023 products.

Possible options:

1.	**Off** - Default.
2.	On

!>  When enabled, Intel Virtualization Technology, Intel VT-d Feature, Secure Boot and OS Optimized Defaults are automatically enabled.

!> Boot Order is restricted to customer image only.

?> This option requires additional confirmation.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| DeviceGuard | Disable, Enable | Yes | Intel |

</details>