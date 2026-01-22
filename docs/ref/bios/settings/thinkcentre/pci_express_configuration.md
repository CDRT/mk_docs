# PCI Express Configuration

![PCI Express Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_pci_express_config.PNG)

Peripheral Component Interconnect (PCI) Express configuration.

ASPM support
:  Active-State Power Management (ASPM).

    Options:

    1. **Auto** - Configure ASPM automatically according to what the attached device supports in each PCI Express port. Default.
    2. Disable - Disable ASPM support of all PCI Express ports.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | ASPMSupport | Disabled, Auto | Yes |

## Select PCI Express port speed

PCIe 16x Slot speed
:  
    Options:

    1.  **Auto** - Default.
    2.  Gen 1.
    3.  Gen 2.
    4.  Gen 3.
    5.  Gen 4.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | PCIe16xSlotSpeed | Disabled, Enabled | Yes |

PCIe 8x Slot speed
:  
    Options:

    1.  **Auto** - Default.
    2.  Gen 1.
    3.  Gen 2.
    4.  Gen 3.
    5.  Gen 4.

PCIe 4x Slot speed
:  
    Options:

    1.  **Auto** - Default.
    2.  Gen 1.
    3.  Gen 2.
    4.  Gen 3.
    5.  Gen 4.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | PCIe4xSlotSpeed | Auto, Gen1, Gen2, Gen3 | Yes |

PCIe 1x Slot speed
:  
    Options:

    1.  **Auto** - Default.
    2.  Gen 1.
    3.  Gen 2.
    4.  Gen 3.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | PCIe1xSlotSpeed  | Auto, Gen1, Gen2, Gen3 | Yes |
