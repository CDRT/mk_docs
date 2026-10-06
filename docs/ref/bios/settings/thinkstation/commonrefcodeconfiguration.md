# Common RefCode Configuration

## AMD version

### **MMIO Above 4G Limit**

Set PCIe device aperture range to Auto/40/42/44/46/48 bits limit.

Possible options:

1. **Auto** - Default. Keeps the platform default settings.
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
| NUMA | Auto, NPS1, NPS2, NPS4 | Yes | AMD |

## Intel(R) version

Displays and provides options to change the Common RefCode settings.

### **NUMA**

Enable or Disable Non Uniform Memory Access (NUMA).

Possible options:

1. **Enabled** - Default.
2. Disabled

### **Virtual NUMA**

Divide physical NUMA nodes into evenly sized virtual NUMA nodes in ACPI table. This may improve Windows performance on CPUs with more than 64 logical processors.

Possible options:

1. **Disabled** - Default.
2. Enabled

<!--
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
-->
