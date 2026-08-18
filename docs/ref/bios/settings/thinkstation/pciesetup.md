# PCIe Setup

<!-- TODO: Link Training Timeout (uS) disagrees with the same setting in pcieconfiguration.md (AMD version). This file lists two options ("1000" - Default, and "Simulator not support"), while pcieconfiguration.md lists only "1000" with no Default marked and no second option. Both files already flag this setting as unverified independently — reconcile against a real build before publishing. -->

## General

### **Re-Size BAR Support**

If system has Resizable BAR capable PCIe Devices, this option Enables or Disables Resizable BAR Support.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ReSizeBARSupport | Enabled, Disabled | Yes | Both |

### **SR-IOV Support**

If system has SR-IOV capable PCIe Devices, this option Enables or Disables Single Root IO Virtualization Support.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SRIOVSupport | Enabled, Disabled | Yes | Both |

### **ASPM Support**

- **Auto** – Configure ASPM automatically according to what the attached device supports in each PCI Express port.
- **Disabled** – Disable ASPM support of all PCI Express ports.

Possible options:

1. **Disabled** – Default.
2. Auto

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ASPMSupport | Disabled, Auto | Yes | Both |

### **Link Training Timeout (uS)**

Defines number of Microseconds software will wait before polling 'Link Training' bit in Link Status register. Value range from 10 to 10000 uS.

Possible options:

1. **1000** – Default.
2. (any number between 10 and 10000)

## PCIe Slot{X} Configuration

### **PCIe Port**

Select whether to enable or disable this PCIe port.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PCIeSlotXPort | Enabled, Disabled | Yes | Both |

!!! warning "Attention"
    In the WMI class name, X represents the slot number.

### **PCIe Port Bifurcation**

Select PCIe port bifurcation. If select `Auto`, system will auto configure PCIe port bifurcation and auto detect Quad M.2 PCIe Card.

Possible options:

1. **Auto** – Default.
2. x4x4x4x4
3. x8x8
4. x16

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PCIeSlotXBifurcation | Auto, x4x4x4x4, x8x8, x16 | Yes | Both |

!!! warning "Attention"
    In the WMI class name, X represents the slot number.

### **Link Speed**

Select PCIe Link Speed.

Possible options:

1. **Auto** – Default.
2. Gen 1 (2.5 GT/s)
3. Gen 2 (5 GT/s)
4. Gen 3 (8 GT/s)
5. Gen 4 (16 GT/s)

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PCIeSlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s) | Yes | Both |

!!! warning "Attention"
    In the WMI class name, X represents the slot number.

### **Data Link Feature**

Enables the Data Link Feature for this PCIe slot.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PcieSlotXDataLinkFeature | Enable, Disable | Yes | Both |

!!! warning "Attention"
    In the WMI class name, X represents the slot number.

## M.2 Slot{X} Configuration

### **Link Speed**

Select PCIe Link Speed.

Possible options:

1. **Auto** – Default.
2. Gen 1 (2.5 GT/s)
3. Gen 2 (5 GT/s)
4. Gen 3 (8 GT/s)
5. Gen 4 (16 GT/s)
6. Gen 5 (32 GT/s)

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| M2SlotXLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s), Gen 5 (32 GT/s) | Yes | Both |

!!! warning "Attention"
    In the WMI class name, X represents the slot number.

## MCIO Slot{X}-{Y} Configuration

### **Link Speed**

Select PCIe Link Speed.

Possible options:

1. **Auto** – Default.
2. Gen 1 (2.5 GT/s)
3. Gen 2 (5 GT/s)
4. Gen 3 (8 GT/s)
5. Gen 4 (16 GT/s)
6. Gen 5 (32 GT/s)

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| MCIOSlotXYLinkSpeed | Auto, Gen 1 (2.5 GT/s), Gen 2 (5 GT/s), Gen 3 (8 GT/s), Gen 4 (16 GT/s), Gen 5 (32 GT/s) | Yes | Intel |

!!! warning "Attention"
    In the WMI class name, X & Y represents the slot numbers.
