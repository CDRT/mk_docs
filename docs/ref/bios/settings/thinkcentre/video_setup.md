# Video Setup #

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img
   /tc_video_setup.png)

<details><summary>Select Active Video</summary>

The primary video device for graphics output.

Options:

1.  **Auto** - automatic selection of graphics output by the system. Default.
1.  IGD - Select Integrated Graphics Device.
1.  PEG - Select PCIe Graphic.


!!! info ""
    If `Auto` is selected, the system will select a graphics output, **prioritizing PEG**. <br /> 

!!! info ""
    The `IGD` option will not appear if not supported by the CPU.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SelectActiveVideo  | IGD, [PEG], Auto | yes |


</details>

<details><summary>Pre-Allocated Memory Size</summary>

Allocate memory to the IGD (Internal Graphics Device).

Options:

1.  **32MB** - Default.
1.  64MB
1.  96MB
1.  128MB
1.  160MB

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| Pre-AllocatedMemorySize | 32MB, 64MB, 96MB, 128MB, 160MB | yes |


</details>

<details><summary>Total Graphics Memory</summary>

Total memory shared by all graphics devices.

Options:

1.  **Maximum** - enables maximum memory allocation. Default.
2.  128MB.
3.  256MB.

</details>

<details><summary>UMA Frame Buffer Size</summary>

Configure the memory size for internal graphic

Options:

1.  **Auto** - Default.
2.  512MB.
3.  1024MB.
4.  2048MB.

<!-- NO WMI -->

</details>

<details><summary>Dual DisplayPorts</summary>

Dual display ports 1 and 2.

Enable support for MST (multi-stream transport), allowing daisy-chaining of graphics output devices.

Options:

1.  **MST** - Default.
2.  SST (single-stream transport).

<!-- NO WMI -->

</details>
