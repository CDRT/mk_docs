# Storage Setup

![Storage Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_storage_setup.PNG)

SATA Controller
:  
    Options:

    1. **Enabled** – Default.
    2. Disabled.

    | WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
    |:---|:---|:---|:---|
    | SATAController | Disabled, Enabled | Yes | Both |

SATA Drive {X}
:  
    Options:

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

Configure Storage as
:  Adds a delay before the first access of a hard disk by the system software. Some hard disks hang if accessed before they have initialized themselves. This delay ensures the hard disk has initialized after power up, prior to being accessed.

    Options:

    1. **AHCI** – Default.
    2. RAID

    !!! note ""
    Device driver support is required for AHCI or RAID.
    Depending on how the hard disk image was installed, changing
    this setting may prevent the system from booting.

Hard Disk Pre-delay
:  Adds a delay before the first access of a hard disk by the system software. Some hard disks hang if accessed before they have initialized themselves. This delay ensures the hard disk has initialized after power up, prior to being accessed.

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
