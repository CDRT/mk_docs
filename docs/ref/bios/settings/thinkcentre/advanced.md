# Advanced #

![](./img/tc_advanced.png)

<details><summary>Intel(R) Total Memory Encryption</summary>

Intel(R) Total Memory Encryption(TME) is a technology that encrypts
data written to system memory to protect DRAM data from physical
attacks.

Options:

1. **Disabled** - Default.
2. Enabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| IntelTotalMemoryEncryption | Disabled, Enabled | yes |


</details>

<details><summary>Intel (R) SIPP Support</summary>

Intel (R) Stable Image Platform Program aligns and stabilizes key Intel platform components, enabling a predictable transition from one technology generation to the next.

Options:

1. **Enabled** - Default.
2. Disabled - disables SIPP.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| IntelSIPPSupport | Disabled, Enabled | yes |


</details>

<details><summary>Intel (R) Thunderbolt</summary>

Options:

1.  **Disabled** - Default.
2.  Enabled.

<!-- NO WMI -->


</details>


<details><summary>Dust Shield Alert</summary>

The user is reminded to clean the Dust Shield.

Options:

1.  **Enabled** - Default.
1.  Disabled - disables the Dust Shield alert.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| DustShieldAlert | Disabled, Enabled | yes |

!> If the Dust Shield is not cleaned, it will lose its effectiveness and the machine may overheat.


</details>


<details><summary>Intel (R) DPTF Support</summary>

Intel (R) Dynamic Platform and Thermal Framework (DPTF).

IDPTF is a power and thermal management solution, used to resolve fan noise, overheating, and performance-related issues of the system.

Options:

1.  **Enabled** - Default.
2.  Disabled - disables DPTF.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| IntelDPTFSupport | Disabled, Enabled | yes |


</details>

<details><summary>Windows Modern Standby</summary>

[Windows Modern Standby](https://docs.microsoft.com/en-us/windows-hardware/design/device-experiences/modern-standby) is the replacement for the legacy Sleep state.

Options:

1. **Enabled** - Default.
2. Disabled - disables Windows Modern Standby.

<!-- NO WMI-->

<!-- MODEL: NOT M70s-->


</details>

<details><summary>BIOS Self-healing</summary>

Allows the BIOS to automatically attempt to recover a corrupted BIOS without needing a recovery file on external media.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| BIOSSelfHealing  | Enabled, Disabled | no |


</details>
