# Power Settings

## General

### **After Power Loss**

Whether the system will stay on after AC power is removed and then restored.

Possible options:

1. **Last State** – the system will return to the previous state. Default.
2. Power On – select when using a power strip to turn the system on.
3. Power Off – the system will remain off after power is restored.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AfterPowerLoss | Last State, Power On, Power Off | Yes | Both |

### **Sleep State**

Selects the sleep state behavior for the installed operating system.

Possible options:

1. **Windows** – Default.
2. Linux
3. Windows10

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SleepState | Windows, Linux, Windows10 | Yes | Both |

### **Enhanced Power Saving Mode**

Whether to enter Enhanced Power Saving Mode during power off, making total power consumption lower.

!!! warning "Attention"
    When `Enabled`, only the `Wake Up on Alarm` function is supported. Other wake up functions are not supported. System will not enter `Enhanced Power Saving Mode` if Intel ME (Management Engine) is required to be active in Sx states (aka Sleep states) and host is in AC mode.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| EnhancedPowerSavingMode | Disabled, Enabled | Yes | Both |

### **Smart Power On**

Whether the user can use `Alt` + `P` to power on if the USB keyboard is plugged in the correct USB port.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SmartPowerOn | Disabled, Enabled | Yes | Intel |

## Intelligent Cooling - Intel(R) only

Lenovo's unique system thermal management solution.

### **Performance Mode**

Possible options:

1. **Best Performance** – the system will run at best system performance with normal acoustic level. Default.
2. Best Experience – the system will run at the best experience with balanced noise and better performance.
3. Full Speed – all fans in the system will run at full speed.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| IntelligentCoolingPerformanceMode | Best Performance, Best Experience, Full Speed | Yes | Intel |

## AMD-only features

<!-- PSU Over load Warning


Whether to display a warning (and log if possible) if a Power Supply Unit (PSU) overload condition is detected.

Options:

1.  **Disabled** - Default.
2.  Enabled.


 -->

### **Quad M.2 PCIe Card Fan Control Stepping**

Tune the fan speed from low to high for Quad M.2 PCIe card if it is present.

Possible options:

1. **Low Speed** - Default.
2. Medium Speed
3. High Speed

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| QuadM2PCIeCardFanControl | Low Speed, Medium Speed, High Speed | Yes | AMD |

### **Fan Control Stepping**

Tune the Fan speed from low to high.

Possible options:

1. **1 - Lower Fan Speed** - Default.
2. 2
3. 3
4. 4
5. 5
6. 6
7. 7 - Higher Fan Speed

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| FanControlStepping | 1 - Lower Fan Speed, 2, 3, 4, 5, 6, 7 - Higher Fan Speed | Yes | AMD |
