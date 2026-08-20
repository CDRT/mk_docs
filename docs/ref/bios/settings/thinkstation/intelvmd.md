# Intel(R) VMD Technology

<!-- TODO: "MCIO Hot Plug" was listed by name only in the spec, no description/options/WMI. The description and Enable/Disable options below are my own inference, not confirmed. -->

## General

Enable the VMD(Volume Management Device) technology to support configure PCIe storages to VROC (Virtual RAID on CPU) feature.

### **M.2 Slot{X}**

Enable/Disable Intel(R) Volume Management Device Technology on M.2 Slot1.

!!! warning "Attention"
    X represents the slot number, 1 to 3.

Possible options:

1. **PCIe** – Default.
2. VMD

### **PCIe Slot{X}**

Enable/Disable Intel(R) Volume Management Device Technology on PCIe Slot1.

!!! warning "Attention"
    X represents the slot number, 1 to 9.

Possible options:

1. **PCIe** – Default.
2. VMD

### **MCIO Slot{X}-{Y}**

Enable/Disable Intel(R) Volume Management Device Technology on MCIO Slot1-1.

!!! warning "Attention"
    X & Y represent the slot numbers, 1 and 2 (interchangeably).

Possible options:

1. **PCIe** – Default.
2. VMD

### **MCIO Hot Plug**

Whether to enable hot-plug support for MCIO drives.

Possible options:

1. **Disabled** – Default.
2. Enabled
