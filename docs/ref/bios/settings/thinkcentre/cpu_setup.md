# CPU Setup

![CPU Setup 1](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_cpu_setup.PNG)
![CPU Setup 2](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_cpu_setup_2.PNG)

EIST Support
:  EIST (Enhanced Intel SpeedStep(R) Technology) dynamically adjusts processor voltage and core frequency, to decrease average power consumption and heat production.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | EISTSupport | Disabled, Enabled | Yes |

Intel(R) Speed Shift Technology
:  Intel(R) Speed Shift Technology is an energy efficient method of frequency
control by the hardware rather than relying on OS control.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | SpeedShiftTechnology | Disabled, Enabled | Yes |

Intel(R) Hyper-Threading Technology
:  Intel(R) Hyper-Threading Technology allows multiple logical processors within the same processor core to share execution resources and cache hierarchy.

    Possible options:

    1. **Enabled** – Default.
    2. Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | HyperThreadingTechnology | Disabled, Enabled | Yes |

Core Multi-Processing
:  Whether all CPU (multi-)cores are available to the OS, or only one core.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | CoreMultiProcessing | Enabled, Disabled | Yes |

Intel(R) Virtualization Technology
:  Intel(R) Virtualization Technology multiple applications and operating systems to run simultaneously in independent partitions.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | VirtualizationTechnology | Disabled, Enabled | Yes |

VT-d Feature
:  VT-d provides improved isolation of I/O resources for greater reliability, security, and availability.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | VTdFeature | Disabled, Enabled | Yes |

IOMMU
:  Intel input/output memory management unit

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | IOMMU | Disabled, Enabled | Yes |

TxT
:  Trusted Execution Technology (TxT) provides hardware-based mechanisms to protect against software-based attacks, and protect data stored or created on the client.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled – disables TxT.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | TXTFeature | Disabled, Enabled | Yes |

C1E Support
:  Enhanced C1 state (C1E) is where the processor is not executing instructions (but can return to an executing state immediately), to reduce power consumption.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled – disables C1E Support.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | C1ESupport | Disabled, Enabled | Yes |

C State Support
:  Select supported CPU power management status to minimize the idle power consumption of processor.

    Possible options:

    1. C1 – C1 only.
    2. C1C3 – C1 and C3.
    3. C1C3C6 – C1,C3 and C6.
    4. C1C3C6C7 – C1,C3,C6 and C7.
    5. C1C3C6C7C8 – C1,C3,C6,C7 and C8.
    6. **C1C3C6C7C8C10** – C1,C3,C6,C7,C8 and C10. Default.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | CStateSupport | C1, C1C3, C1C3C6, C1C3C6C7, C1C3C6C7C8, C1C3C6C7C8C10 | Yes |

Turbo Mode
:  Turbo Mode allows the processor to assess its own thermals, current, and power, to calculate a dynamic upper limit on its frequency benefit.

    Possible options:

    1. **Enabled** – Default.
    2. Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | TurboMode | Disabled, Enabled | Yes |

CPU ID
:  Displays the processor ID.

Microcode Revision (MM/DD/YYYY)
:  CPU microcode revision.

