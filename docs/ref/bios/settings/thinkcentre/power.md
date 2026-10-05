# Power

### **After Power Loss**

Whether the system will stay on after AC power is removed and then restored.

!!! warning "Attention"
    Select `Power On` if you use a power strip to turn the system on.

Possible options:

1. **Last State** - Return to the previous state. Default.
2. Power Off - Remain off.
3. Power On - Turn on.

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| AfterPowerLoss | Last State, Power Off, Power On | Yes |

### **Enhanced Power Saving Mode**

When enabled, total power consumption is lower during power off.

!!! warning "Attention"
    In Enhanced Power Saving Mode, only the `Wake up on Alarm` function is supported. Other wake-up functions are not. System will not enter `Enhanced Power Saving Mode` if Intel ME is required to be active in Sx states, and host is in AC mode.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| EnhancedPowerSavingMode | Disabled, Enabled | Yes |

### **Smart Power On**

When enabled, the user can use `Alt+P` to power on if a USB keyboard is plugged in the correct USB port.

Possible options:

1. **Enabled** - Default.
2. Disabled - Disables Smart Power On.

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| SmartPowerOn | Disabled, Enabled | Yes |
