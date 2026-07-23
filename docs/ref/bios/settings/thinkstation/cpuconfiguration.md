# CPU Configuration

### **Processor ID**

View only.

### **Processor Frequency**

View only.

### **Microcode Revision**

View only.

### **L1 Cache RAM**

View only.

### **L2 Cache RAM**

View only.

### **L3 Cache RAM**

View only.

### **Processor Version**

View only.

### **AMD Secure Virtual Machine**

Whether to enable AMD Virtualization Technology.

!!! warning "Attention"
    AMD Virtualization Technology on-chip features enable AMD PRO-based clients to run multiple operating systems and applications on a single machine.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AMDSecureVirtualMachine | Disable, Enable | Yes | AMD |

### **IOMMU**

AMD input/output memory management unit.

Possible options:

1. Enabled
2. Disabled
3. **Auto** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| IOMMU | Auto, Disable, Enable | Yes | AMD |

### **AMD Memory Guard**

AMD Memory Guard provides real time encryption to system memory to help protect against physical attacks.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AMDMemoryGuard | Disable, Enable | Yes | AMD |

### **CPB Mode**

Core Performance Boost (CPB) allows the processor to dynamically control and adjust its operating frequency to increase performance when needed and maintain lower power and thermal characteristics during normal operation.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| CPBMode | Disable, Enable | Yes | AMD |

### **C State Support**

Whether to enable CPU power management state to minimize idle power consumption of the processor.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| CStateSupport | Disable, Enable | Yes | AMD |

### **CPU C6 report**

Whether to enable CPU C6 report to OS.

!!! warning "Attention"
    Recommended to be Enabled.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| CPUC6Report | Disable, Enable | Yes | AMD |

<!-- TODO: For all three settings below (Simultaneous Multithreading, Kernel DMA Protection, Pre-boot DMA Protection), the spec confirmed the setting name and Enable/Disable options, but no description was given for any of them, and no WMI name for Simultaneous Multithreading or Pre-boot DMA Protection specifically (Kernel DMA Protection's WMI name came from the separate "New WMI" reference sheet, so that one is higher-confidence). The descriptions are my own general knowledge of these features, not sourced from the spec. -->

### **Simultaneous Multithreading**

Whether to enable Simultaneous Multithreading (SMT), which allows multiple logical processors to run on each physical CPU core.

Possible options:

1. **Enabled** - Default.
2. Disabled

### **Kernel DMA Protection**

Whether to enable Kernel DMA Protection, which uses the input/output memory management unit (IOMMU) to help block DMA (Direct Memory Access) attacks via hot-pluggable devices, such as Thunderbolt or USB4 ports.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| KernelDmaProtection | Disable, Enable | Yes | AMD |

### **Pre-boot DMA Protection**

Whether to enable DMA (Direct Memory Access) protection during pre-boot (before the operating system loads).

Possible options:

1. **Enabled** - Default.
2. Disabled
