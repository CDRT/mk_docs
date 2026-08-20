# Parallel Port Setup Settings

### **Parallel Port Address**

Whether the Parallel Port will be seen by the OS.

!!! warning "Attention"
    If `Disabled`, the `Parallel Port Mode`, `EPP Version` and `Parallel Port IRQ` settings will become unavailable.

Possible options:

1. **378** – Default.
2. 278
3. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ParallelPortAddress | 378, 278, Disabled | Yes | Both |

### **Parallel Port Mode**

Change the Parallel Port Mode. EPP (Enhanced Parallel Port) and ECP (Extended Capabilities Port) are two modes to transmit data by Parallel Port. EPP is more commonly used than ECP.

Possible options:

1. **ECP+EPP** – Default.
2. ECP
3. EPP

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ParallelPortMode | ECP+EPP, ECP, EPP | Yes | Both |

### **ECP Mode DMA Channel**

Selects the DMA (Direct Memory Access) channel used when the parallel port is in ECP mode.

!!! warning "Attention"
    Only available when `Parallel Port Mode` uses ECP.

Possible options:

1. **DMA3** – Default.
2. DMA1

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| EcpModeDmaChannel | DMA3, DMA1 | Yes | Both |

### **EPP Version**

Sets the Enhanced Parallel Port version to use.

!!! warning "Attention"
    Differences between the two versions may affect the operation of devices.

Possible options:

1. **1.9** – Default.
2. 1.7

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| EPPVersion | 1.9, 1.7 | Yes | Both |

### **Parallel Port IRQ**

Select the IRQ (interrupt request) for the parallel port.

Possible options:

1. **IRQ7** – Default.
2. IRQ5

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ParallelPortIRQ | IRQ7, IRQ5 | Yes | Both |
