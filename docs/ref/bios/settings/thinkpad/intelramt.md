# Intel(R) AMT Settings

### **Intel (R) AMT Control**

Whether to enable Intel (R) Active Management Technology Control.

!!! warning "Attention"
    `Permanently Disabled` can be selected only once and permanently turns off Intel (R) AMT Control (cannot be reenabled).

    Additional confirmation for this action will be required because it cannot be undone.

Possible options:

1. **Enabled** - Default.
2. Disabled
3. Permanently Disabled

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AMTControl | Disable, Enable | No | Intel |

### **USB Key Provisioning**

Whether to enable USB Key Provisioning.

!!! warning "Attention"
    Active only when ‘Intel (R) ATM Control’ has value ‘Enabled’.

Possible options:

1. **Off** - Default.
2. On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| USBKeyProvisioning | Disable, Enable | Yes | Intel |

### **CIRA Timeout**

Define timeout for Client Initiated Remote Access connection to be established.

Possible options:

1. **0**- use the default timeout of 60 seconds. Default.
2. 255 - wait until the connection succeeds.

### **Console Type**

Select console type.

!!! warning "Attention"
    This console type must match the Intel AMT remote console.

Possible options:

1. **VT100+** - Adds function keys F5 to F14. Default.
2. VT100
3. VT-UTF8 - Adds function key F8
4. PC ANSI
