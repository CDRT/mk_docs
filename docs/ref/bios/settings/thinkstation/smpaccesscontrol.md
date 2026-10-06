# System Management Password Access Control Settings

### **Access Security Settings**

Whether to allow SMP (System Management Password) to have the same authority as SVP (Supervisor Password) to control security settings.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AccessSecuritySettings | Disabled, Enabled | Yes | Both |

### **Remote Set SMP**

Whether an SVP (Supervisor Password) is needed to set SMP (System Management Password) via WMI (Windows Management Instrumentation).

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| RemoteSetSMP | Disabled, Enabled | Yes | Both |

### **BIOS Setup Configuration Control**

Whether SMP (System Management Password) has authority to change BIOS setup configuration settings.

Possible options:

1. **Disabled** – Default.
2. Enabled

### **Storage Password Control**

Whether SMP (System Management Password) has authority to control storage (Hard Disk) password settings.

Possible options:

1. **Disabled** – Default.
2. Enabled
