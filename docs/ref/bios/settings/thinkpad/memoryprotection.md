# Memory Protection Settings

### **Execution Prevention**

If your OS supports Data Execution Prevention, this setting can prevent virus/worm attacks that create memory buffer overflows by running code where only data is allowed.

!!! warning "Attention"
    Reset to `Off` if your required applications cannot run.

Possible options:

1. On
2. **Off** – Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| DataExecutionPrevention | Disable, Enable | Yes | Both |

### **Intel(R) Total Memory Encryption**

Protects DRAM data from physical attacks.

!!! warning "Attention"
    Impacts when `On`:

    - System memory tools, such as memtest86 and Lenovo Diagnostic-Memory test, will not work correctly.
    - System performance will degrade by estimated 3-5%.

Possible options:

1. On
2. **Off** – Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| TotalMemoryEncryption | Disable, Enable | Yes | Intel |

### **Transparent Secure Memory Encryption (TSME)**

AMD's equivalent of Intel (R) Total Memory Encryption. Encrypts DRAM data to protect against physical attacks.

Possible options:

1. **On** – Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| TSME | Disable, Enable | Yes | AMD |
