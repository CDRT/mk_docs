# USB Setup

### **USB Port Access**

Possible options:

1. **Enabled** - Default.
2. Disabled - disables USB.

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| USBPortAccess | Disabled, Enabled | Yes |

### **USB Bios Support**

BIOS support for USB mouse and keyboard.

Possible options:

1. **Enabled** - Default.
2. Disabled

### **USB Enumeration Delay**

Provides extra delay to USB enumeration (detection and recognition of connected USB devices), to improve compatibility.

!!! warning "Attention"
    This may increase POST time.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| USBEnumerationDelay | Disabled, Enabled | Yes |

### **Front USB Ports**

Affects all of the front USB ports (numbered).

!!! warning "Attention"
    When `Disabled` is selected, settings for all front USB ports will not be shown.

Possible options:

1. **Enabled** - Default.
2. Disabled - disables front USB ports, numbered.

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| FrontUSBPorts | Disabled, Enabled | Yes |

### **USB Port {Number}**

One of the front USB ports, total number depending on model.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| USBPort1 | Disabled, Enabled | Yes |

!!! warning "Attention"
    The WMI setting name is shown here for USB port 1. For other ports 2-10 replace the 1 with the port number.

### **Rear USB Ports**

Affects all of the rear USB ports (numbered).

!!! warning "Attention"
    When `Disabled` is selected, settings for all rear USB ports will not be shown.

Possible options:

1. **Enabled** - Default.
2. Disabled - disables rear USB ports, numbered.

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| RearUSBPorts | Disabled, Enabled | Yes |

### **USB Port {Number / Letter}**

One of the rear USB ports, total number (and labeling) depending on model.

Possible options:

1. **Enabled** - Default.
2. Disabled
