# Storage Setup #

![](./img/tc_storage_setup.png)

<details><summary>SATA Controller</summary>

Options:

1. **Enabled** – Default.
2. Disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SATAController | Disabled, Enabled | Yes | Both |
</details>


<details><summary>SATA Drive {X}</summary>

Options:

1. **Enabled** – Default.
2. Disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SATADriveX | Disabled, Enabled | Yes | Both |

!!! info ""
    In the WMI class name, X represents the drive number.
</details>


<details><summary>M.2 Drive {X}</summary>

Options:

1. **Enabled** – Default.
2. Disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| M.2DriveX | Disabled, Enabled | Yes | Intel |

!!! info ""
    In the WMI class name, X represents the drive number.
</details>

<!--<details><summary>MCIO Drive {X}-{Y}</summary>

Options:

1. **Enabled** – Default.
2. Disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| MCIODriveXY | Disabled, Enabled | Yes | Intel |

!!! info ""
    In the WMI class name, X & Y represents the drive number.
</details>

<details><summary>SATA Drive * Hot-Plug Support</summary>
Options:

1. Enabled.
2. **Disabled** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SATADriveXHotPlugSupport | Disabled, Enabled | Yes | Both |

!!! info ""
    In the WMI class name, X represents the drive number.
</details>

<details><summary>Configure Storage as</summary>
Mode Options:

1. **AHCI** – Default.
2. RAID

!!! info ""
   Device driver support is required for AHCI or RAID.
Depending on how the hard disk image was installed, changing
this setting may prevent the system from booting.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ConfigureStorageas | AHCI, RAID | Yes | Intel |

</details>

![](./img/ts_storagesetup_px_2.png)

<details><summary>Configure SATA as</summary>

!!! info ""
   Device driver support is required for AHCI or RAID.
Depending on how the hard disk image was installed, changing
this setting may prevent the system from booting.

Options:

1. **AHCI** – Default.
2. RAID

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| ConfigureSATAas | AHCI, RAID | Yes | Both |
</details>
-->

<details><summary>Configure Storage as</summary>
Adds a delay before the first access of a hard disk by the system
software. Some hard disks hang if accessed before they have
initialized themselves. This delay ensures the hard disk has
initialized after power up, prior to being accessed.

Options:

1. **AHCI** – Default.
2. RAID

!!! info ""
   Device driver support is required for AHCI or RAID.
Depending on how the hard disk image was installed, changing
this setting may prevent the system from booting.

</details>

<details><summary>Hard Disk Pre-delay</summary>
Adds a delay before the first access of a hard disk by the system
software. Some hard disks hang if accessed before they have
initialized themselves. This delay ensures the hard disk has
initialized after power up, prior to being accessed.

Options:

1. **Disabled** – Default.
2. 3 Seconds
3. 6 Seconds
4. 9 Seconds
5. 12 Seconds
5. 15 Seconds
6. 21 Seconds
7. 30 Seconds

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| HardDiskPre-delay | Disabled, 3 Seconds, 6 Seconds, 9 Seconds, 12 Seconds, 15 Seconds, 21 Seconds, 30 Seconds | Yes | Both |
</details>
