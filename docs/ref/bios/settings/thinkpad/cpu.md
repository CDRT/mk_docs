# CPU Settings

### **Efficient-cores Support**

Whether to enable Efficient-cores support which is available on Intel 12th Generation and later processors.

Possible options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| EfficientCores | Enable, Disable | No | Intel |

### **Intel (R) Hyper-Threading Technology**

Whether to enable additional CPU threads, which appear as additional processors but share some resources with the other threads within a CPU.

!!! warning "Attention"
    When disabled, allows only one thread within each execution core unit.

Possible options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| HyperThreadingTechnology | Enable, Disable | No | Intel |
