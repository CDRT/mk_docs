# CPU Configuration #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_cpuconfiguration.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_cpuconfiguration2.png)

### Processor ID ###

View only.

### Processor Frequency ###

View only.

### Microcode Revision ###

View only.

### Ll Cache RAM ###

View only.

### L2 Cache RAM ###

View only.

### L3 Cache RAM ###

View only.

### Processor Version ###

View only.

<details><summary>AMD Secure Virtual Machine</summary>

Whether to enable AMD Virtualization Technology.

!!! note ""
    AMD Virtualization Technology on-chip features enable AMD PRO-based clients to run multiple operating systems and applications on a single machine.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| AMDSecureVirtualMachine | Disable, Enable | yes | AMD |

</details>

<details><summary>IOMMU</summary>

AMD input/output memory management unit.

Options:

1. Enabled
1. Disabled
1. **Auto** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| IOMMU | Auto, Disable, Enable | yes | AMD |

</details>

<details><summary>AMD Memory Guard</summary>

!!! note ""
    AMD Memory Guard provides real time encryption to system memory to help protect against physical attacks.

Options:

1. **Disabled** - Default.
2. Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| AMDMemoryGuard | Disable, Enable | yes | AMD |

</details>

<details><summary>CPB Mode</summary>

!!! note ""
    Core Performance Boost (CPB) allows the processor to dynamically control and adjust its operating frequency to increase performance when needed and maintain lower power and thermal characteristics during normal operation.

Options:

1. **Disabled** - Default.
2. Enabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| CPBMode | Disable, Enable | yes | AMD |

</details>

<details><summary>C State Support</summary>

Whether to enable CPU power management state to minimize idle power consumption of the processor.

Options:

1. **Enabled** - Default.
2. Disabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| CStateSupport | Disable, Enable | yes | AMD |

</details>

<details><summary>CPU C6 report</summary>

Whether to enable CPU C6 report to OS.

!!! note ""
    Recommended to be Enabled.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| CPUC6Report | Disable, Enable | yes | AMD |

</details>

