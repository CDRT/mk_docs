# Memory Configuration #

<!-- TODO: Volatile Memory Mode had a confirmed description ("Configure the memory map to support Crow Pass") but no options — "1LM / Memory Mode" is a guess. fADR Support was name-only — description/options are my own general knowledge. DRAM Encryption, DRAM Eyescan, DRAM RAPID-K Enable, DRAM Voltage Level: PGX_GB10 only, names only, no options/description/WMI at all — added as bare entries pending real data. -->

![Memory Config](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_memconfig_px1.PNG)

MRC Promote Warnings
:	Determines if MRC warnings are promoted to system Level.

	Options:

	1. **Disabled** – Default.
	2. Enabled.




Attempt Fast Boot
:	
	Options:

	1. **Enabled** – Default. Portions of memory reference code will be skipped when possible to increase boot speed on warm boots.
	2. Disable - Disables this feature.



Attempt Fast Cold Boot
:	Options:

	1. **Enabled** – Default. P Portions of memory reference code will be skipped when possible to increase boot speed on cold boots.
	2. Disable - Disables this feature.



## Memory Map ##

Volatile Memory Mode
:	Configures the memory map to support Crow Pass (Intel(R) Optane(TM) persistent memory).

	Options:

	1. **1LM** – Default.
	2. Memory Mode.


fADR Support
:	Whether to enable fADR (fast Asynchronous DRAM Refresh), which flushes the CPU's write pending queue to memory on a power-loss event without requiring the full ADR hardware flow.

	Options:

	1. **Enabled** – Default.
	2. Disabled.


## Platform Configuration (PGX_GB10) ##

DRAM Encryption
:	Whether to enable DRAM encryption.

	Options:

	1. **Disabled** – Default.
	2. Enabled.


DRAM Eyescan
:	Whether to enable DRAM eye-scan diagnostics.

	Options:

	1. **Disabled** – Default.
	2. Enabled.


DRAM RAPID-K Enable
:	Whether to enable DRAM RAPID-K.

	Options:

	1. **Disabled** – Default.
	2. Enabled.


DRAM Voltage Level
:	Sets the DRAM voltage level.


## Memory Topology ##

![Memory Topology](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_memtopologysnip.jpg)

<!--![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img
   /ts_memtopology.png)-->
