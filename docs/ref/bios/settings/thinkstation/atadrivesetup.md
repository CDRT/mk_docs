# ATA Drive Setup Settings

## General

!!! warning "Attention"
    The number of ATA drives may vary depending on model.

### **SATA Controller**

Whether to enable or disable the SATA controller.

!!! warning "Attention"
    When SATA Controller is disabled, the following settings become unavailable:

    - SATA Drive (drives 1 to 5)
    - SATA Drive * Hot-Plug Support
    - Configure SATA as

Possible options:

1. **Enabled**. Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SATAController | Disabled, Enabled | Yes | Both |

### **SATA Drive {X}**

Whether to enable each SATA Drive numbered {X}:

!!! warning "Attention"
    Unavailable if `SATA Controller` is set to `Disabled`.

Possible options:

1. **Enabled**. Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SATADriveX | Disabled, Enabled | Yes | Both |

!!! warning "Attention"
    In the WMI class name, X represents the drive number.

### **SATA Drive * Hot-Plug Support**

Whether the hot-plug port is enabled.

!!! warning "Attention"
    Unavailable if `SATA Controller` is set to `Disabled`.

Possible options:

1. Enabled
2. **Disabled** - Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SATADrivexHotPlugSupport | Disabled, Enabled | Yes | Both |

!!! warning "Attention"
    `x` is the port number. May vary depending on model.

### **Configure SATA as**

SATA configuration mode.

!!! warning "Attention"
    - The AHCI and RAID options require additional confirmation.
    - If you change the SATA mode to `AHCI` you may not boot the system due to the failure of Intel(R) RST with Intel(R) Optane (RAID) function.
    - Do not disable SATA drives in RAID mode. Otherwise you may not boot the system due to the failure of RAID function.
    - Device driver support is required for `AHCI` or `RAID` or Intel(R) RST with Intel(R) Optane.
    - Depending on how the hard disk image was installed, changing the setting may prevent the system from booting.

Possible options:

1. **AHCI** – Default.
2. Intel(R) RST with Intel(R) Optane
3. RAID

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ConfigureSATAas | AHCI, Intel(R) RST with Intel(R) Optane, RAID | Yes | Both |

## Intel(R) Rapid Storage Technology

!!! warning "Attention"
    Only appears when the item `Configure SATA as` is set to `Intel(R) RST with Intel(R) Optane`.

For each disk listed, shows information including:

- Port
- Model Number
- Serial Number
- Size
- Status
- Controller Type
- Controller Interface

### **Hard Disk Pre-delay**

Add a delay before the first access of a hard disk by the system software.

Some hard disks hang if accessed before they have initialized themselves.

This delay ensures the hard disk has initialized after power up, prior to being accessed.

Possible options:

1. **Disabled** – Default.
2. 3 Seconds
3. 6 Seconds
4. 9 Seconds
5. 12 Seconds
6. 15 Seconds
7. 21 Seconds
8. 30 Seconds

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| HardDiskPre-delay | Disable, 3 Seconds, 6 Seconds, 9 Seconds, 12 Seconds, 15 Seconds, 21 Seconds, 30 Seconds | Yes | Both |
