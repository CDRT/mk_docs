# Common RefCode Configuration

<!-- TODO:
-NUMA Nodes's WMI table lists Values: NPS1, NPS2, NPS4, Auto, which doesn't match its own options (Enabled/Disabled) at all. I replaced the possible options but I don't know what the default it. I assumed Auto.
- The ThinkStation spec only listed these six item names (Virtual NUMA, MMCFG Base/Size, MMIO High Base/Granularity Size, MMIO Low Size reserved for DMI) with no descriptions, options, or WMI names at all. The descriptions below are my own explanation of what these standard UEFI/PCIe terms generally mean, not sourced from the spec — and no options/values are given anywhere because none were confirmed. Please verify. -->

## AMD version

### **MMIO Above 4G Limit**

Set PCIe device aperture range to Auto/40/42/44/46/48 bits limit.

Possible options:

1. **Auto**. Keeps the platform default settings. - Default.
2. 40
3. 42
4. 44
5. 46
6. 48

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| MmioAbove4GLimit | Auto, 40, 42, 44, 46, 48 | Yes | AMD |

### **NUMA Nodes**

Whether to enable Non-Uniform Memory Access (NUMA).

Possible options:

1. **Auto** - Default.
2. NPS1
3. NPS2
4. NPS4

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| NUMA | NPS1, NPS2, NPS4, Auto | Yes | AMD |

## Intel(R) version

Displays and provides options to change the Common RefCode settings.

### **Virtual NUMA**

Whether to enable virtual NUMA (Non-Uniform Memory Access) node reporting.

### **MMCFG Base**

Base address of the MMCFG (Memory Mapped Configuration) space, used for PCIe extended configuration access.

### **MMCFG Size**

Size of the MMCFG (Memory Mapped Configuration) space.

### **MMIO High Base**

Base address of the high (above 4G) MMIO (Memory-Mapped I/O) region.

### **MMIO High Granularity Size**

Granularity (alignment) size used when allocating the high MMIO region.

### **MMIO Low Size reserved for DMI**

Amount of low MMIO address space reserved for the DMI (Direct Media Interface) link.
