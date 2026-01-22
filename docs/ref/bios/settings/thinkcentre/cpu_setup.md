# CPU Setup

![CPU Setup 1](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_cpu_setup.PNG)
![CPU Setup 2](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_cpu_setup_2.PNG)

EIST Support
:  EIST (Enhanced Intel SpeedStep(R) Technology) dynamically adjusts processor voltage and core frequency, to decrease average power consumption and heat production.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | EISTSupport | Disabled, Enabled | yes |

Intel(R) Speed Shift Technology
:  Intel(R) Speed Shift Technology is an energy efficient method of frequency
control by the hardware rather than relying on OS control.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | SpeedShiftTechnology | Disabled, Enabled | yes |

Intel(R) Hyper-Threading Technology
:  Intel(R) Hyper-Threading Technology allows multiple logical processors within the same processor core to share execution resources and cache hierarchy.

    Options:

    1. **Enabled** - Default.
    2. Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | HyperThreadingTechnology | Disabled, Enabled | yes |

Core Multi-Processing
:  Whether all CPU (multi-)cores are available to the OS, or only one core.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | CoreMultiProcessing | Enabled, Disabled | yes |

Intel(R) Virtualization Technology
:  Intel(R) Virtualization Technology multiple applications and operating systems to run simultaneously in independent partitions.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | VirtualizationTechnology | Disabled, Enabled | yes |

VT-d Feature
:  VT-d provides improved isolation of I/O resources for greater reliability, security, and availability.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | VTdFeature | Disabled, Enabled | yes |

IOMMU
:  Intel input/output memory management unit

    Options:

    1.  **Enabled** - Default.
    2.  Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | IOMMU | Disabled, Enabled | yes |

TxT
:  Trusted Execution Technology (TxT) provides hardware-based mechanisms to protect against software-based attacks, and protect data stored or created on the client.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled - disables TxT.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | TXTFeature | Disabled, Enabled | yes |

C1E Support
:  Enhanced C1 state (C1E) is where the processor is not executing instructions (but can return to an executing state immediately), to reduce power consumption.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled - disables C1E Support.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | C1ESupport | Disabled, Enabled | yes |

C State Support
:  Select supported CPU power management status to minimize the idle power consumption of processor.

    Options:

    1. C1 - C1 only
    1. C1C3 - C1 and C3
    1. C1C3C6 - C1,C3 and C6
    1. C1C3C6C7 - C1,C3,C6 and C7
    1. C1C3C6C7C8 - C1,C3,C6,C7 and C8
    1. **C1C3C6C7C8C10 - C1,C3,C6,C7,C8 and C10** - Default.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | CStateSupport | C1, C1C3, C1C3C6, C1C3C6C7, C1C3C6C7C8, C1C3C6C7C8C10 | yes |

Turbo Mode
:  Turbo Mode allows the processor to assess its own thermals, current, and power, to calculate a dynamic upper limit on its frequency benefit.

    Options:

    1. **Enabled** - Default.
    2. Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | TurboMode | Disabled, Enabled | yes |

CPU ID
:  Displays the processor ID.

Microcode Revision (MM/DD/YYYY)
:  CPU microcode revision.
