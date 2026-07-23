# USB4 Setup

<!-- TODO (new page, unconfirmed):
- Native USB4, FWCM Handoff: spec had bare names only, no description/options/WMI. Enable/Disable options and descriptions are my own inference.
- Discrete USB4 Support: options confirmed per-platform from the spec (Intel: Disabled/PCIe Slot 6; AMD: Disabled/Enabled). Note: the ThinkStation "New WMI" reference sheet marks this same setting name "[Removed]" even though it still appears live in both platforms' menu breadcrumbs in the raw spec rows — a conflict in the source data I did not resolve, just picked the live breadcrumb version.
- ACPI D3 Support, XHCI Port0 Speed: options confirmed from the spec; which option is the default was my own guess in both cases (not marked in the source).
- Discrete USB4 FW Version: confirmed as a view-only field from the spec's "Show Discrete USB4 firmware" phrasing.
-->

## General

### **Native USB4**

Whether to enable the platform's native USB4 controller, as an alternative to a discrete Thunderbolt/USB4 controller.

Possible options:

1. **Disable** – Default.
2. Enable

### **Discrete USB4 Support**

Whether the discrete USB4 controller is enabled, and which PCIe slot it uses.

**Intel-based machine**

Possible options:

1. **Disabled** – Default.
2. PCIe Slot 6

**AMD-based machine**

Possible options:

1. **Disabled** – Default.
2. Enabled

### **ACPI D3 Support**

Selects the ACPI D3 power state supported by the discrete USB4 controller.

Possible options:

1. **Disabled** – Default.
2. D3Hot
3. D3Cold

### **XHCI Port0 Speed**

Selects the link speed for the discrete USB4 controller's xHCI port 0.

Possible options:

1. Gen 1x1
2. Gen 1x2
3. Gen 2x1
4. **Gen 2x2** – Default.

### **FWCM Handoff**

Whether firmware connection manager (FWCM) ownership is handed off to the OS driver.

Possible options:

1. **Disabled** – Default.
2. Enabled

### **Discrete USB4 FW Version**

Displays the firmware version of the discrete USB4 controller.

View only.
