# Parallel Port Setup Settings #

![Parallel Port Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_parallelportsetup.PNG)


Parallel Port Address
:	Whether the Parallel Port will be seen by the OS.

	!!! note ""
		If `Disabled`, the `Parallel Port Mode`,  `EPP Version` and `Parallel Port IRQ` settings will become unavailable.

	Options:

	1. Disabled.
	2. **378** – Default.
	3. 278

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ParallelPortAddress | 278, 378 | yes | Both |


EPP Version
:	Sets the Enhanced Parallel Port version to use.

	!!! note ""
		Differences between the two versions may affect the operation of devices.

	Options:

	1. **1.9** – Default.
	2. 1.7

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| EPPVersion | 1.7, 1.9  | yes | Both |


Parallel Port IRQ
:	Select the IRQ (interrupt request) for the parallel port.

	Options:

	1. **IRQ7** – Default.
	2. IRQ5

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ParallelPortIRQ | IRQ5, IRQ7 | yes | Both |

