# Video Setup Settings

![Video Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/videosetup.png)

Select Active Video
:	
	!!! note ""
		The Select Active Video setting will vary depending on if the platform is Intel or AMD. Select the appropriate platform below for the details.

	Select Active Video - Intel(R)

	Select primary video device that will be used for graphic output. If "Auto" is selected, system will prioritize video devices as following sequence:
	PEG (PCI-e Graphics Device)
	IGD (Internal Graphics Device)

	Options:

	1. **Auto** – Default. Prioritizes video devices as follows:
		a. PEG
		b. IGD
	2. IGD – Internal Graphics Device will be used.
	3. PEG – PCI-e Graphics Device will be used.

	!!! note ""
		If CPU does not support integrated graphics, there will be no `IGD` option.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| SelectActiveVideo | IGD, PEG, Auto | Yes | Intel |



Select Active Video - AMD
:	Select primary video device for graphics output.

	!!! note ""
		If selected slot video device fails to initialize, `Auto` mode follow the order: Slot 3, 1, 5, 4, 2, 6

	Possible options:

	1. Slot1(PEG)
	2. Slot2(PEG)
	3. Slot3(PEG)
	4. Slot4(PEG)
	5. Slot5(PEG)
	6. Slot6(PEG)
	7. **Auto** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| SelectActiveVideo | Slot1(PEG), Slot2(PEG), Slot3(PEG), Slot4(PEG), Slot5(PEG), Slot6(PEG), Auto | Yes | AMD | 





Pre-Allocated Memory Size
:	Allocate memory in the IGD (Internal Graphics Device).

	Possible options:

	1. **32 MB** – Default.
	2. 64 MB
	3. 128 MB

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| Pre-AllocatedMemorySize | 32 MB, 64 MB, 128 MB | Yes | Both |


Total Graphics Memory
:	Allocate total memory which graphics device shares.

	Possible options:

	1. 128 MB
	2. 256 MB
	3. **Maximum** – Default.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| TotalGraphicsMemory | 128 MB, 256 MB, Maximum | yes | Both |







