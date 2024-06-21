# Video Setup Settings

![Video Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/videosetup.png)

<details><summary>Select Active Video</summary>

!!! note ""
    The Select Active Video setting will vary depending on if the platform is Intel or AMD. Select the appropriate platform below for the details.

<details><summary>Select Active Video - Intel(R)</summary>

Select primary video device that will be used for graphic output. If "Auto" is selected, system will prioritize video devices as following sequence:
PEG (PCI-e Graphics Device)
IGD (Internal Graphics Device)

Options:

1. **Auto** – Default. Prioritizes video devices as follows:<br>
    a. PEG<br>
    b. IGD<br>
2. IGD – Internal Graphics Device will be used.
3. PEG – PCI-e Graphics Device will be used.

!!! note ""
    If CPU does not support integrated graphics, there will be no `IGD` option.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SelectActiveVideo | IGD, PEG, Auto | yes | Intel |

</details>

<details><summary>Select Active Video - AMD</summary>

Select primary video device for graphics output.

!!! note ""
    If selected slot video device fails to initialize, `Auto` mode follow the order: <br> <br> Slot 3, 1, 5, 4, 2, 6

Options:

1. Slot1(PEG)
1. Slot2(PEG)
1. Slot3(PEG)
1. Slot4(PEG)
1. Slot5(PEG)
1. Slot6(PEG)
1. **Auto** - Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| SelectActiveVideo | ISlot1(PEG), Slot2(PEG),Slot3(PEG), Slot4(PEG), Slot5(PEG), Slot6(PEG), Auto | yes | AMD | 

</details>

</details>

<details><summary>Pre-Allocated Memory Size</summary>

Allocate memory in the IGD (Internal Graphics Device).

Options:

1. **32 MB** – Default.
2. 64 MB
3. 128 MB

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| Pre-AllocatedMemorySize | 32 MB, 64 MB, 128 MB | yes | Both |
</details>

<details><summary>Total Graphics Memory</summary>

Allocate total memory which graphics device shares.

Optional:

1. 128 MB
2. 256 MB
3. **Maximum** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| TotalGraphicsMemory | 128 MB, 256 MB, Maximum | yes | Both |
</details>
