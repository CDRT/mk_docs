# Power #

![](./img/tc_power.png)

<details><summary>After Power Loss</summary>

Whether the system will stay on after AC power is removed and then restored.

?> Select `Power on` if you use a power strip to turn the system on.

Options:

1. **Last State** - return to the previous state. Default.
2.  Power Off - remain off.
3.  Power On - turn on.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| AfterPowerLoss | Power Off, Power On, Last State | yes |



</details>

<details><summary>Enhanced Power Saving Mode</summary>

When enabled,  total power consumption is lower during power off.

?> In Enhanced Power Saving Mode, only the `Wake up on Alarm` function is supported. Other wake-up functions are not. System will not enter `Enhanced Power Saving Mode` if Intel ME is required to be active in Sx states, and host is in AC mode.

Options:

1. **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| EnhancedPowerSavingMode | Disabled, Enabled | yes |


</details>

<details><summary>Smart Power On</summary>

When enabled, the user can use `Alt+P` to power on if a USB keyboard is plugged in the correct USB port.

Options:

1.  **Enabled** - Default.
2.  Disabled - disables Smart Power On.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| SmartPowerOn | Disabled, Enabled | yes |


</details>


