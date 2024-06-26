# Power Settings 

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/power.png)

After Power Loss
:	Whether the system will stay on after AC power is removed and then restored.

	Options:

	1. Power On – select when using a power strip to turn the system on.
	2. Power Off – the system will remain off after power is restored.
	3. **Last State** – the system will return to the previous state. Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| AfterPowerLoss | Power On, Power Off, Last State | yes | Both |




Enhanced Power Saving Mode
:	Whether to enter Enhanced Power Saving Mode during power off, making total power consumption lower.

	Options:

	1. Enabled. 
	2. **Disabled** – Default.

	!!! note ""
		When `Enabled`, only the `Wake Up on Alarm` function is supported. Other wake up functions are not supported. System will not enter `Enhanced Power Saving Mode` if Intel ME (Management Engine) is required to be active in Sx states (aka Sleep states) and host is in AC mode.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| EnhancedPowerSavingMode | Disabled, Enabled | yes | Both |


Smart Power On
:	Whether the user can use `Alt` + `P` to power on if the USB keyboard is plugged in the correct USB port. 

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| SmartPowerOn | Disabled, Enabled | yes | Intel |




## Intelligent Cooling - Intel (R) only
Lenovo's unique system thermal management solution. 

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/intelligentcooling.png)

Performance Mode
:	
	Options:

	1. **Best performance** – the system will run at best system performance with normal acoustic level. Default.
	2. Best experience – the system will run at the best experience with balanced noise and better performance.
	3. Full Speed – all fans in the system will run at full speed. 

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| IntelligentCoolingPerformanceMode | Best Performance, Best Experience, Full Speed | yes | Intel |


## AMD-only features

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_amd_power.PNG)

<!-- PSU Over load Warning


Whether to display a warning (and log if possible) if a Power Supply Unit (PSU) overload condition is detected.

Options:

1.  **Disabled** - Default.
2.  Enabled.


 -->


Quad M.2 PCIe Card Fan Control Stepping
:	Tune the fan speed from low to high for Quad M.2 PCIe card if it is present.

	Options:

	1. **Low Speed** - Default.
	1. Medium Speed
	1. High Speed

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| QuadM2PCIeCardFanControl | Low Speed, Medium Speed, High Speed | yes | AMD |



Fan Control Stepping
:	Tune the Fan speed from low to high.

	Options:

	- **1 - Lower Fan Speed** - Default.
	- 2
	- 3
	- 4
	- 5
	- 6
	- 7 - Higher Fan Speed

	| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| FanControlStepping | 1 - Lower Fan Speed, 2, 3, 4, 5, 6, 7 - Higher Fan Speed | yes | AMD |


