# Advanced

## Intel(R) version

### **WHEA Support**

Enable or Disable Windows Hardware Error Architechture.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WHEASupport | Disabled, Enabled | Yes | Intel |

### **Data Execution Prevention**

Whether to enable Data Execution Prevention (DEP).

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DataExecutionPrevention | Enable, Disable | Yes | Both |

### **Intel(R) Total Memory Encryption**

Intel(R) Total Memory Encryption(TME) is a technology that encrypts data written to system memory to protect DRAM data from physical attacks.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| IntelTotalMemoryEncryption | Disabled, Enabled | Yes | Intel |

### **Intel(R) SIPP Support**

Intel(R) Stable Image Platform Program (SIPP) aligns and stabilizes key Intel platform components, enabling a predictable transition from one technology generation to the next.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| IntelSIPPSupport | Disabled, Enabled | Yes | Intel |

### **Intel(R) Thunderbolt**

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| IntelThunderboltTechnology | Enabled, Disabled | Yes | Intel |

### **Dust Shield Alert**

If the Dust Shield is not cleaned then it will lose its effectiveness and the machine may overheat.

Possible options:

1. **Disabled** – Default. The user is not reminded to clean the Dust Shield.
2. Enabled - The user is reminded to clean the Dust Shield.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DustShieldAlert | Disabled, Enabled | Yes | Intel |

### **Intel(R) DPTF Support**

Intel(R) Dynamic Platform and Thermal Framework (DPTF) assists with managing power to the CPU vs temperature, keeping CPU temperature down while still delivering good performance.

!!! warning "Attention"
    This feature is optional, so may not be available on all models.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| IntelDPTFSupport | Disabled, Enabled | Yes | Intel |

### **Available system Memory**

Displays the amount of system memory available.

View only.

### **Watchdog Timer**

Whether to enable the platform watchdog timer.

Possible options:

1. **Disabled** – Default.
2. Enabled
