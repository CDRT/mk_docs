# Automatic Power On Settings

## General

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/autopoweron.png)

Wake on LAN
:	Wake on LAN (Local Area Network).

	Possible options:

	1. **Enabled** – Default.
	2. Disabled

	!!! note ""
		Controls the wake up event from onboard LAN (Local Area Network) and PCI (Peripheral Component Interconnect) LAN.

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| WakeonLAN | Enabled, Disabled | Yes | Both |


Wake from Serial Port Ring
:	
	Possible options:

	1. **Enabled** – Default.
	2. Disabled

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| WakefromSerialPortRing | Enabled, Disabled | Yes | Both |


Wake Up on Alarm
:	Whether to turn on your system:
	- one time,
	- repeating on a specific day of the month, or week, or
	- daily

	Possible options:

	1. **Disabled** – Default.
	2. Single Event – one time, on the specified day and time.
	3. Daily Event – every day, at the specified time.
	4. Weekly Event – every week, on the specified day and time.
	5. User Defined – enables `User Defined Alarm` group of settings. 

	!!! note ""
		Values in these fields may be overwritten by the operating system. 

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| WakeUponAlarm | Single Event, Daily Event, Weekly Event, Disabled, User Defined | Yes | Both |



Alarm Time ( HH : MM : SS)
:	Select the exact time for the system to turn on.

	Active when `Wake Up on Alarm` has one of the values:

	* Single Event
	* Daily Event
	* Weekly Event

	Possible options:

	1. **00 : 00 : 00** – Default.
	2. HH : MM : SS
		- HH - Hour: 00 ~ 23
		- MM - Minute: 00 ~ 59
		- SS - Second: 00 ~ 59

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| AlarmTime |  | Yes | Both |



Alarm Date (MM/DD/YYYY)
:	Select the exact calendar date for the system to turn on.

	Active only when `Wake Up on Alarm` has value `Single Event`.

	Possible options:

	1. **01/01/YYYY** – Default.
	2. MM/DD/YYYY:
		- MM – Months: January to December
		- DD – Date: 1 ~ 31
		- YYYY – Year: 1980 ~ 2099

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| AlarmDate |  |  | Both |




Alarm Day of Week
:	Select the exact week day for the system to turn on.

	!!! note ""
		Active only when `Wake Up on Alarm` has value `Weekly Event`.

	Possible options:

	1. **Sunday** – Default.
	2. Monday
	3. Tuesday
	4. Wednesday
	5. Thursday
	6. Friday
	7. Saturday

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| AlarmDayofWeek | Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday | Yes | Both |


## User Defined Alarm

![User Defined Alarm](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_userdefinedalarm.PNG)

Settings per {Weekday}.

{Weekday}
:	Whether the system will turn on automatically on this day of the week.

	Possible options:

	1. **Off** – Default.
	2. On

	| WMI Setting name | Values | Locked by SVP | AMD/Intel |
	|:---|:---|:---|:---|
	| UserDefinedAlarmSunday  | Disabled, Enabled | Yes | Both |

	!!! note ""
		The WMI setting name shown here is for Sunday. For other week days, change `Sunday` to the desired day of the week.



## User Defined Alarm Time (HH : MM : SS)

Specify the time when the system is to wake up in the format of hh:mm:ss.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
|:---|:---|:---|:---|
| UserDefinedAlarmTime |  | Yes |






