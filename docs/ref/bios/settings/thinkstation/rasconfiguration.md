# RAS Configuration #

![AMD RAS Config](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_amd_rasconfiguration.PNG)

Post Package Repair (PPR)
:	Whether to enable PPR support hard Post Package Repair.

	!!! note ""
		On detection of runtime correctable memory errors, this allows one row to be swapped with a spare row.  Only one spare row per bank exists, and this repair process is not reversible.

	Options:

	1.  **Enabled** - Default.
	2.  Disabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PostPackageRepair | Disable, Enable | yes | AMD |



Patrol Scrub
:	Patrol scrubbing proactively searches the system memory, repairing correctable errors.

	Options:

	1.  **Disabled** - Default.
	2.  Enabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PatroScrub | Disable, Enable | yes | AMD |



Patrol Scrub Interval
:	Select the number of hours required to complete full scrub.

	Options:

	1. Auto
	1. 1
	1. 4
	1. 8
	1. 16
	1. **24** - Default.
	1. 48

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PatroScrubInterval | Auto, 1, 4, 8, 16, 24, 48 | yes | AMD|



Data Scrambling
:	Data Scrambling improves memory security.

	Options:

	1.  **Enabled** - Default.
	2.  Disabled.

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| DataScrambling | Disable, Enable | yes | AMD |


