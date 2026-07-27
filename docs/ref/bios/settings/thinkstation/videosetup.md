# Video Setup Settings

<!-- TODO (new-settings):
- UMA Frame Buffer Size, Dual DisplayPorts, Boot Time Extension: Default guessed for all three — not marked in the source data.
- Primary Video Controller: options confirmed via New WMI (Auto, PCIe Slot 1-8, IGD), no description. Kept separate from the existing Select Active Video - Intel(R) entry since WMI name and slot count differ; may be the same setting on a newer/larger-slot-count platform, not confirmed. A third, 4-slot option list also appears in the raw spec row for this same name — not reconciled.
-->

### **Select Active Video**

!!! warning "Attention"
    The Select Active Video setting will vary depending on if the platform is Intel or AMD. Select the appropriate platform below for the details.

**Intel-based machine**

Select primary video device that will be used for graphic output. If `Auto` is selected, system will prioritize video devices as following sequence:

- PEG (PCI-e Graphics Device)
- IGD (Internal Graphics Device)

!!! warning "Attention"
    If CPU does not support integrated graphics, there will be no `IGD` option.

Possible options:

1. **Auto** – Default. Prioritizes video devices as follows:

    a. PEG

    b. IGD

2. IGD – Internal Graphics Device will be used.
3. PEG – PCI-e Graphics Device will be used.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SelectActiveVideo | IGD, PEG, Auto | Yes | Intel |

**AMD-based machine**

Select primary video device for graphics output.

!!! warning "Attention"
    If selected slot video device fails to initialize, `Auto` mode follow the order: Slot 3, 1, 5, 4, 2, 6

Possible options:

1. **Auto** - Default.
2. Slot1(PEG)
3. Slot2(PEG)
4. Slot3(PEG)
5. Slot4(PEG)
6. Slot5(PEG)
7. Slot6(PEG)

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SelectActiveVideo | Auto, Slot1(PEG), Slot2(PEG), Slot3(PEG), Slot4(PEG), Slot5(PEG), Slot6(PEG) | Yes | AMD |

### **Primary Video Controller**

Selects which graphics controller is used as the primary display device.

Possible options:

1. **Auto** – Default.
2. PCIe Slot 1
3. PCIe Slot 2
4. PCIe Slot 3
5. PCIe Slot 4
6. PCIe Slot 5
7. PCIe Slot 6
8. PCIe Slot 7
9. PCIe Slot 8
10. IGD

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PrimaryVideoController | Auto, PCIe Slot 1, PCIe Slot 2, PCIe Slot 3, PCIe Slot 4, PCIe Slot 5, PCIe Slot 6, PCIe Slot 7, PCIe Slot 8, IGD | Yes | Intel |

### **Shared Display Priority**

Selects which display output has priority when displays are shared.

Possible options:

1. **HDMI** – Default.
2. USB Type C

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SharedDisplayPriority | HDMI, USB Type C | Yes | Both |

### **Pre-Allocated Memory Size**

Allocate memory in the IGD (Internal Graphics Device).

Possible options:

1. **32 MB** – Default.
2. 64 MB
3. 128 MB

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| Pre-AllocatedMemorySize | 32 MB, 64 MB, 128 MB | Yes | Both |

### **Total Graphics Memory**

Allocate total memory which graphics device shares.

Possible options:

1. 128 MB
2. 256 MB
3. **Maximum** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| TotalGraphicsMemory | 128 MB, 256 MB, Maximum | Yes | Both |

### **UMA Frame Buffer Size**

Configures the memory size allocated to the internal (UMA) graphics device.

Possible options:

1. **Auto** – Default.
2. 512 MB
3. 1024 MB
4. 2048 MB

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UmaFrameBufferSize | Auto, 512 MB, 1024 MB, 2048 MB | Yes | AMD |

### **Dual DisplayPorts**

Selects the multi-monitor mode used when multiple displays are connected via DisplayPort.

Possible options:

1. **MST Mode** – Default. Multi-Stream Transport, drives multiple displays from a single DisplayPort output.
2. SST Mode – Single-Stream Transport, one display per DisplayPort output.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DualDisplayPorts | MST Mode, SST Mode | Yes | AMD |

### **Boot Time Extension**

Adds extra delay before boot to give the video device more time to be recognized.

Possible options:

1. **Disable** – Default.
2. 1 Second
3. 2 Seconds
4. 3 Seconds
5. 5 Seconds
6. 10 Seconds

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BootTimeExtension | Disable, 1 Second, 2 Seconds, 3 Seconds, 5 Seconds, 10 Seconds | Yes | AMD |
