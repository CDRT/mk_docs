# USB Setup Settings

## General

!!! warning "Attention"
    The number of USB ports may vary depending on model.

### **USB Port Access**

Whether to enable USB devices.

!!! warning "Attention"
    When disabled, all other USB settings are removed, except for `USB Enumeration Delay`.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| USBPortAccess | Enabled, Disabled | Yes | Both |

### **Always On USB**

Whether USB ports remain powered for charging when the system is off.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AlwaysOnUsb | Disabled, Enabled | Yes | Both |

### **USB BIOS Support**

Whether USB keyboard and/or USB mouse may be used without device driver support.

Possible options:

1. **Enabled** - Default.
2. Disabled

### **USB Charging Port in S4/S5**

Whether to allow USB charging in hibernation and shutdown states.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| USBChargingPortInS4S5 | Disable, Enable | Yes | AMD |

### **XHCI Hand-off**

Whether USB3 ownership can be handed off to OS driver (not remaining in BIOS).

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| XHCIHandoff | Enable, Disable | Yes | AMD |

## USB hardware delays and time-outs

### **USB Enumeration Delay**

Whether extra delay is added when host performs USB enumeration.

!!! warning "Attention"
    May improve the compatibility of USB device detection but increase POST Time.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| USBEnumerationDelay | Disabled, Enabled | Yes | Intel |

### **USB Transfer Time-out**

The time-out value for Control, Bulk, and Interrupt transfers.

Possible options:

1. 1 sec
2. 5 sec
3. 10 sec
4. **20 sec** - Default.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| USBTransferTimeout | 1 sec, 5 sec, 10 sec, 20 sec | Yes | AMD |

### **Device Reset Time-out**

USB mass storage device `Start Unit` command time-out.

Possible options:

1. 10 sec
2. **20 sec** - Default.
3. 30 sec
4. 40 sec

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DeviceResetTimeout | 10 sec, 20 sec, 30 sec, 40 sec | Yes | AMD |

### **Device Power-up Delay**

Maximum time before device reports itself to the Host Controller.

`Auto` default values:

- Root port: 100 ms
- Hub port: delay taken from hub descriptor

Possible options:

1. **Auto** - Default.
2. Manual

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DevicePowerupDelay | Auto, Manual | Yes | AMD |

### **Front USB Ports**

Whether to enable all Front USB ports and relevant setting fields.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| FrontUSBPorts | Enabled, Disabled | Yes | Both |

### **Media Card Reader**

Whether to enable the Media Card Reader (MCR).

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| MediaCardReader | Enable, Disable | Yes | AMD |

### **MCR USB Header**

Whether the device connected to this USB header has the characteristics of external USB.

Possible options:

1. **Internal** - Default. Select when connected to Media Card Reader (MCR).
2. External - Select when connected to USB Type C port.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| MCRUSBHeader | Internal, External | Yes | AMD |

### **Internal USB3.2 Port**

Whether to enable the internal USB 3.2 port.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| InternalUSB3Port | Enable, Disable | Yes | AMD |

### **Internal USB2.0 Port**

Whether to enable the internal USB 2.0 port.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| InternalUSB2Port | Enable, Disable | Yes | AMD |

### **Rear USB Ports**

Whether to enable or disable all rear USB ports and relevant settings.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| RearUSBPorts | Enabled, Disabled | Yes | Both |

### **USB Port {X}**

{X} is the number of the rear USB port (total number of ports dependent on model).

Possible options:

1. **Enabled** - Default. If `Enabled` is selected in `Rear USN Ports`.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| USBPortX | Enabled, Disabled | Yes | Both |

!!! warning "Attention"
    The WMI setting name in the example above represents the port number. Change the number to that of the desired rear USB port.
