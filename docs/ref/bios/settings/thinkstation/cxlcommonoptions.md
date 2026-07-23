# CXL Common Options

<!-- TODO (new page, unconfirmed):
- Compute Express Link: WMI name and Enable/Disable options confirmed from the spec's "New WMI" reference sheet; description is from that sheet too.
- CXL ASPM, CXL Encryption, and the whole CXL vLSM Power Management group (Cache-Mem.L1/L2, IO.L1/L2): spec had bare names only, no description/options/WMI for any of them. The Enable/Disable options and descriptions are my own inference (assumed to follow the same pattern as the confirmed Compute Express Link toggle), not sourced. No WMI table added for these since no WMI name was ever confirmed.
- No default is marked anywhere in the source data for any of these settings — every **bold**/Default flag on this page is my own guess.
-->

## General

Select this option to configure your system's CXL (Compute Express Link).

### **Compute Express Link**

Enables Compute Express Link (CXL).

Possible options:

1. **Disable** – Default.
2. Enable

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ComputeExpressLink | Enable, Disable | Yes | Intel |

### **CXL ASPM**

Configures Active State Power Management (ASPM) for CXL links.

Possible options:

1. **Disable** – Default.
2. Enable

### **CXL Encryption**

Whether to enable encryption for CXL traffic.

Possible options:

1. **Disable** – Default.
2. Enable

## CXL vLSM Power Management

Configures the low-power link states for the CXL virtual Link State Machine (vLSM), separately for the CXL.io and CXL.cache/CXL.mem protocols.

### **CXL.Cache-Mem.L1**

Possible options:

1. **Disable** – Default.
2. Enable

### **CXL.Cache-Mem.L2**

Possible options:

1. **Disable** – Default.
2. Enable

### **CXL.IO.L1**

Possible options:

1. **Disable** – Default.
2. Enable

### **CXL.IO.L2**

Possible options:

1. **Disable** – Default.
2. Enable
