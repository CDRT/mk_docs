# CPU Setup #

![](./img/tc_cpu_setup.png)
![](./img/tc_cpu_setup_2.png)

<details><summary>EIST Support</summary>

EIST (Enhanced Intel SpeedStep(R) Technology) dynamically adjusts processor voltage and core frequency, to decrease average power consumption and heat production.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| EISTSupport | Disabled, Enabled | yes |



</details>

<details><summary>Intel(R) Speed Shift Technology</summary>

Intel(R) Speed Shift Technology is an energy efficient method of frequency
control by the hardware rather than relying on OS control.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SpeedShiftTechnology | Disabled, Enabled | yes |


</details>

<details><summary>Intel(R) Hyper-Threading Technology</summary>

Intel(R) Hyper-Threading Technology allows multiple logical processors within the same processor core to share execution resources and cache hierarchy.

Options:

1. **Enabled** - Default.
2. Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| HyperThreadingTechnology | Disabled, Enabled | yes |


</details>

<details><summary>Core Multi-Processing</summary>

Whether all CPU (multi-)cores are available to the OS, or only one core.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| CoreMultiProcessing | Enabled, Disabled | yes |


</details>


<details><summary>Intel(R) Virtualization Technology</summary>

Intel(R) Virtualization Technology multiple applications and operating systems to run simultaneously in independent partitions.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| VirtualizationTechnology | Disabled, Enabled | yes |


</details>



<details><summary>VT-d Feature</summary>

VT-d provides improved isolation of I/O resources for greater reliability, security, and availability.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| VTdFeature | Disabled, Enabled | yes |


</details>

<details><summary>IOMMU</summary>

Intel input/output memory management unit

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| IOMMU | Disabled, Enabled | yes |

</details>

<details><summary>TxT</summary>

Trusted Execution Technology (TxT) provides hardware-based mechanisms to protect against software-based attacks, and protect data stored or created on the client.

Options:

1.  **Enabled** - Default.
2.  Disabled - disables TxT.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| TXTFeature | Disabled, Enabled | yes |


</details>

<details><summary>C1E Support</summary>

Enhanced C1 state (C1E) is where the processor is not executing instructions (but can return to an executing state immediately), to reduce power consumption.

Options:

1.  **Enabled** - Default.
2.  Disabled - disables C1E Support.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| C1ESupport | Disabled, Enabled | yes |


</details>

<details><summary>C State Support</summary>

Select supported CPU power management status to minimize the idle power consumption of processor.

Options:

1. C1 - C1 only
1. C1C3 - C1 and C3
1. C1C3C6 - C1,C3 and C6
1. C1C3C6C7 - C1,C3,C6 and C7
1. C1C3C6C7C8 - C1,C3,C6,C7 and C8
1. **C1C3C6C7C8C10 - C1,C3,C6,C7,C8 and C10** - Default.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| CStateSupport | C1, C1C3, C1C3C6, C1C3C6C7, C1C3C6C7C8, C1C3C6C7C8C10 | yes |


</details>

<details><summary>Turbo Mode</summary>

Turbo Mode allows the processor to assess its own thermals, current, and power, to calculate a dynamic upper limit on its frequency benefit.

Options:

1. **Enabled** - Default.
2. Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| TurboMode | Disabled, Enabled | yes |


</details>

<details><summary>CPU ID</summary>

Displays the processor ID.

<!-- NO WMI -->


</details>

<details><summary>Microcode Revision (MM/DD/YYYY)</summary>

CPU microcode revision.

<!-- NO WMI -->


</details>
