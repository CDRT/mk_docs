# Common RefCode Configuration #

![AMD Common RefCode](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_amd_commonrefcodeconfiguration.PNG)

MMIO Above 4G Limit
:	Set PCIe device aperture range to Auto/40/42/44/46/48 bits limit.

	Possible options:

	1. **Auto** – keeps the platform default settings. Default.
	2. 40
	3. 42
	4. 44
	5. 46
	6. 48

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| MmioAbove4GLimit | Auto, 40, 42, 44, 46, 48 | Yes | AMD |


NUMA Nodes
:	Whether to enable Non-Uniform Memory Access (NUMA).

	Possible options:

	1. **Enabled** – Default.
	2. Disabled

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| NUMA | NPS1, NPS2, NPS4, Auto | Yes | AMD |








