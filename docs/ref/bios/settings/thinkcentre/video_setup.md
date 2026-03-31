# Video Setup

![Video Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_video_setup.PNG)

Select Active Video
:  The primary video device for graphics output.

    Possible options:

    1.  **Auto** – automatic selection of graphics output by the system. Default.
    2.  IGD – Select Integrated Graphics Device.
    3.  PEG – Select PCIe Graphic.


    !!! note ""
        - If `Auto` is selected, the system will select a graphics output, **prioritizing PEG**.
        - The `IGD` option will not appear if not supported by the CPU.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | SelectActiveVideo  | IGD, [PEG], Auto | Yes |

Pre-Allocated Memory Size
:  Allocate memory to the IGD (Internal Graphics Device).

    Possible options:

    1.  **32MB** – Default.
    2.  64MB
    3.  96MB
    4.  128MB
    5.  160MB

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | Pre-AllocatedMemorySize | 32MB, 64MB, 96MB, 128MB, 160MB | Yes |

Total Graphics Memory
:  Total memory shared by all graphics devices.

    Possible options:

    1.  **Maximum** – enables maximum memory allocation. Default.
    2.  128MB
    3.  256MB

UMA Frame Buffer Size
:  Configure the memory size for internal graphic

    Possible options:

    1.  **Auto** – Default.
    2.  512MB
    3.  1024MB
    4.  2048MB

Dual DisplayPorts
:  Dual display ports 1 and 2.

    Enable support for MST (multi-stream transport), allowing daisy-chaining of graphics output devices.

    Possible options:

    1.  **MST** – Default.
    2.  SST (single-stream transport)

