# ATA Drive Setup #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_ata_drive_setup.png)

<details><summary>SATA Controller</summary>

Serial AT Attachment (SATA) drive access.

Options:

1.  **Enable** - Default.
2.  Disable.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SATAController | Disabled, Enabled | yes |

!!! note ""
    If the `SATA Controller` is set to `Disabled`, then `Configure SATA as` and `SATA Drive {Number}` will be hidden.


</details>

<details><summary>SATA DRIVE {Number}</summary>

One of the (Serial AT Attachment) Drives. Total number of drives depends on model.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SATADrive1 | Disabled, Enabled | yes |

!!! note ""
    The WMI setting name for Drive 1 is shown. Other drives follow the pattern `SATADrive#` where `#` is the number of the drive.


</details>

<details><summary>Configure SATA As</summary>

Configure the SATA (Serial AT Attachment) drive controller.

!!! note ""
    Device driver support is required  for AHCI or Intel(R) RST with Intel(R) Optane.

!!! note ""
    Depending on how the hard disk image was installed, changing this setting may prevent the system from booting.

Options:

1.  **AHCI** - enables AHCI (Advanced Host Controller Interface). Default.
2.  Intel (R) RST with Intel (R) Optane mode - enables RST (Rapid Storage Technology).
3.  RAID - enables RAID. <!-- MODEL: M70S Gen3 only-->

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| ConfigureSATAas  | AHCI, Intel(R) RST with Intel(R) Optane, [RAID] | yes |


</details>


<details><summary>Hard Disk Pre-Delay</summary>

Ensures the hard disk has initialized after power up, prior to being accessed. This avoids the disk hanging because of access by the OS before initialization.

Options:

1.  **Disabled** - Default.
2.  3 - 30 seconds - enables delay, in increments of 3 seconds up 15, then 21 or 30.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| HardDiskPre-delay | Disabled, 3 Seconds, 6 Seconds, 9 Seconds, 12 Seconds, 15 Seconds, 21 Seconds, 30 Seconds | yes |


</details>
