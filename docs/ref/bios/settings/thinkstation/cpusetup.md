# CPU Setup - Intel (R) #

<!-- TODO:
- AES-NI, SMX: spec had bare names only, no description/options/WMI. Descriptions and Enable/Disable options are my own general knowledge.
- Enhanced Intel(R) SpeedStep Technology, Hardware P-States, CPU C-State Limit, Energy Efficient Turbo, Energy/Performance Bias Control & Mode: setting name, WMI name, and options confirmed from the spec's "New WMI" sheet, but descriptions are my own writing, not copied from the spec.
- CPU C1 Auto Demotion, CPU C1 Auto Undemotion, C6 Reporting: bare names only, no description/options/WMI. Everything is my own general knowledge.
- Intel(R) Speed Select Technology group (parent toggle, SST-PP, SST-PP Level, Dynamic SST-PP, SST-CP, Configure SST-BF, Activate SST-BF): bare names only, no description/options/WMI for any of them. Most speculative content in this file — verify carefully, including whether the sub-items should have options lists at all.
- Across all of the above: no default value is marked anywhere in the source data — every **bold**/Default flag added in this pass is my own guess, not confirmed.
-->

![CPU Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_cpusetup.PNG)
![CPU Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_cpusetup2.PNG)

<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /cpusetup.png)
I t(https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   hese are amd>
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   (https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   d_cpusetup.png)
![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_amd_cpusetup2.png)
-->

Intel(R) Speed Shift Technology
:	Intel(R) Speed Shift Technology is an energy efficient method of frequency control by the hardware rather than relying on OS control.

	Options:

	1. **Enabled** – Default.
	2. Disabled – Intel(R) Speed Shift Technology is turned off.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SpeedShiftTechnology | Disabled, Enabled | yes | Intel |



Intel(R) Hyper-Threading Technology
:	Intel(R) Hyper-Threading Technology allows multiple logical processors, within the same processor core, to share execution resources and cache hierarchy between logical processors.<br>

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	!!! note ""
		If `TxT` is set to `Enabled`, then this item will always be `Enabled`.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| HyperThreadingTechnology | Disabled, Enabled | yes | Intel |



Core Multi-Processing
:	How many cores are available to the OS.

	Options:

	1. **Enabled** – All CPU cores. Default.
	2. Disabled – Only one core.

	!!! note ""
		If `TxT` is set to `Enabled`, then this item will always be `Enabled`.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| CoreMultiProcessing | Enabled, Disabled | yes | Intel |


Efficient-Cores
:
	Options:

	1. **Enabled** – All CPU cores. Default.
	2. Disabled – Only one core.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| EfficientCores | Enabled, Disabled | yes | Intel |


Intel(R) Virtualization Technology
:	Intel(R) Virtualization Technology allows PC platforms to run multiple applications and operating systems simultaneously in independent partitions, to help to manage and protect the multi-functional capabilities of PCs.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	!!! note ""
		When Intel(R) Virtualization Technology is turned off and the following are set to `Disabled` and cannot be changed:<br>  a. VT-d Feature<br>  b. TxT

	Additional information is available here: [How to enable Virtualization Technology on Lenovo PC computers](https://support.lenovo.com/de/en/solutions/ht500006).

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| VirtualizationTechnology | Disabled, Enabled | yes | Intel |



VT-d Feature
:
	!!! note ""
		VT-d support on Intel platforms provides the capability to ensure improved isolation of I/O resources for greater reliability, security, and availability.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	Additional information is available here: [VT-d Feature](https://www.intel.com/content/www/us/en/search.html?ws=text#q=VT-d%20Feature&sort=relevancy&f:@tabfilter=[Developers]){:target=”_blank”} .

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| VTdFeature | Disabled, Enabled | yes | Intel |



TxT
:
	!!! note ""
		Trusted Execution Technology (TxT) provides hardware-based mechanisms that help protect against software-based attacks and protects the confidentiality and integrity of all data stored or created on the client PC.

	Options:

	1. Enabled
	2. **Disabled** - Default.

	!!! note ""
		If TxT is set to `Enabled`, then the `Security Chip` setting will be set to `Enabled` automatically.

	Additional information is available here: [Intel(R) TXT Overview](https://www.intel.com/content/www/us/en/support/articles/000025873/technologies.html).

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| TXTFeature | Disabled, Enabled | yes | Intel |



IOMMU
:
	!!! note ""
		Intel Input/Output Memory Management Unit (IOMMU) is a hardware component that performs address translation from I/O device virtual addresses to physical addresses. This hardware-assisted I/O address translation improves the system performance within a virtual environment.

	Options:

	1. Enabled.
	2. **Disabled** – Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| IOMMU | Disabled, Enabled | yes | Intel |



C1E Support
:	C1 is a state where the processor is not executing instructions, but can return to an executing state immediately.

	Enhanced C1 state (C1E) provides lower power consumption when the computer is idle.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| C1ESupport | Disabled, Enabled | yes | Intel |



C State Support
:	Supported CPU power management status to minimize the idle power consumption of processor.

	Options:

	1. C1 – C1 only.
	2. C1C3 – C1 and C3.
	3. C1C3C6 – C1, C3 and C6.
	4. C1C3C6C7C8 – C1, C3, C6, C7 and C8.
	5. **C1C3C6C7C8C10** – C1, C3, C6, C7, C8 and C10. Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| CStateSupport | C1, C1C3, C1C3C6, C1C3C6C7, C1C3C6C7C8, C1C3C6C7C8C10 | yes | Intel |


Turbo Mode
:
	!!! note ""
		Turbo Mode allows the processor to assess its own thermals, current and power to come up with a dynamic upper limit on its frequency benefit.

	Options:

	1. **Enabled** –  Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| TurboMode | Disabled, Enabled | yes | Intel |



AES-NI
:	Whether to enable the Advanced Encryption Standard - New Instructions (AES-NI), which accelerate hardware encryption/decryption.

	Options:

	1. **Enabled** – Default.
	2. Disabled.



SMX
:	Safer Mode Extensions (SMX), a set of CPU instructions that support Intel(R) Trusted Execution Technology (TxT).

	Options:

	1. **Enabled** – Default.
	2. Disabled.



Enhanced Intel(R) SpeedStep Technology
:	Enhanced Intel(R) SpeedStep Technology (EIST) allows the operating system to dynamically adjust processor voltage and core frequency, which can decrease power consumption and heat production.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| IntelSpeedStepTechnology | Disabled, Enabled | yes | Intel |



Hardware P-States
:	Sets the P-State (performance state) mode used by the processor.

	Options:

	1. Disabled.
	2. **Native Mode** – Default.
	3. Native Mode with No Legacy Support.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| HardwarePStates | Disabled, Native Mode, Native Mode with No Legacy Support | yes | Intel |



CPU C1 Auto Demotion
:	Whether the processor is allowed to automatically demote from a deeper C-state to C1, based on the idle state history.

	Options:

	1. **Enabled** – Default.
	2. Disabled.



CPU C1 Auto Undemotion
:	Whether the processor is allowed to automatically undo a previous C1 auto demotion, based on the idle state history.

	Options:

	1. **Enabled** – Default.
	2. Disabled.



C6 Reporting
:	Whether to report the C6 CPU power state to the operating system.

	Options:

	1. **Enabled** – Default.
	2. Disabled.



CPU C-State Limit
:	Sets the C-state limit for the processor.

	Options:

	1. **Auto** – Default.
	2. C0/C1 State.
	3. C2 State.
	4. C6 (non-retention) State.
	5. C6 (retention) State.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| CStateLimit | Auto, C0/C1 State, C2 State, C6 (non-retention) State, C6 (retention) State | yes | Intel |



Energy Efficient Turbo
:	Whether the processor's Turbo Mode frequency selection favors energy efficiency over raw performance.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| EnergyEfficientTurbo | Disabled, Enabled | yes | Intel |



Energy / Performance Bias Control
:	Determines who controls the Energy / Performance Bias: the operating system, or the BIOS.

	Options:

	1. **Operating System** – Default.
	2. BIOS.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| EnergyPerformanceBiasControl | Operating System, BIOS | yes | Intel |



Energy / Performance Bias Mode
:	Sets the mode for the Energy / Performance Bias.

	!!! note ""
		Only available when `Energy / Performance Bias Control` is `BIOS`.

	Options:

	1. Performance.
	2. **Balanced Performance** – Default.
	3. Balanced Power.
	4. Power.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| EnergyPerformanceBiasMode | Performance, Balanced Performance, Balanced Power, Power | yes | Intel |



Intel(R) Speed Select Technology
:	Intel(R) Speed Select Technology (Intel(R) SST) is a collection of per-core performance tuning capabilities for Intel(R) Xeon(R) processors, letting the system prioritize frequency, power, or core count for specific workloads.

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	!!! note ""
		Enables the following sub-features, which are only available when `Intel(R) Speed Select Technology` is `Enabled`.



Intel(R) SST-PP (Speed Select Technology - Performance Profile)
:	Whether to enable Intel(R) SST-PP, which allows selection between multiple pre-defined performance/power configurations.



SST-PP Level
:	Selects the active Intel(R) SST-PP performance profile level.



Dynamic SST-PP
:	Whether Intel(R) SST-PP can dynamically switch performance profiles without a reboot.



SST-CP (Speed Select Technology - Core Power)
:	Whether to enable Intel(R) SST-CP, which prioritizes power delivery to designated high-priority cores.



Configure SST-BF
:	Configures which cores are prioritized by Intel(R) SST-BF (Speed Select Technology - Base Frequency).



Activate SST-BF
:	Whether to activate Intel(R) SST-BF, which guarantees a higher base frequency on the cores selected in `Configure SST-BF`.



### CPU ID ###

:	Displays the Processor ID.

	View only.

### Microcode Revision ( MM/DD/YYYY ) ###

:	Displays the CPU Microcode Revision date.

	View only.