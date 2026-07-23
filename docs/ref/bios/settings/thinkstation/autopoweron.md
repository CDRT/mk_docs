# Automatic Power On Settings

<!-- TODO: Boot Device for Wake on LAN: description paraphrased directly from a confirmed spec sentence, but the spec gave no options or WMI name at all, so none are shown here. Confirm whether it actually has a value list (e.g. a device/group picker) before publishing as a plain description-only entry.
-->

## General

### **Wake on LAN**

Wake on LAN (Local Area Network).

Controls the wake up event from onboard LAN (Local Area Network) and PCI (Peripheral Component Interconnect) LAN.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WakeonLAN | Enabled, Disabled | Yes | Both |

### **Boot Device for Wake on LAN**

Controls what device or group is booted when the system is woken by a Wake on LAN (WOL) event.

### **Wake from Serial Port Ring**

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WakefromSerialPortRing | Enabled, Disabled | Yes | Both |

### **Wake Up on Alarm**

Whether to turn on your system one time, repeating on a specific day of the month, or week, or daily.

!!! warning "Attention"
    Values in these fields may be overwritten by the operating system.

Possible options:

1. **Disabled** - Default.
2. Single Event - one time, on the specified day and time.
3. Daily Event - every day, at the specified time.
4. Weekly Event - every week, on the specified day and time.
5. User Defined - enables `User Defined Alarm` group of settings.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WakeUponAlarm | Single Event, Daily Event, Weekly Event, Disabled, User Defined | Yes | Both |

### **Startup Sequence**

Selects which device or group is booted when the system is woken by `Wake Up on Alarm`.

Possible options:

1. **Boot Order** – Default.
2. Network Group
3. Storage Group
4. SATA 1
5. M.2 Drive 1
6. PCIe Drive 1
7. VMD
8. USB HDD
9. USB CDROM
10. Network 1

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| StartupSequence | Boot Order, Network Group, Storage Group, SATA 1, M.2 Drive 1, PCIe Drive 1, VMD, USB HDD, USB CDROM, Network 1 | Yes | Both |

### **Alarm Time (HH : MM : SS)**

Select the exact time for the system to turn on.

!!! warning "Attention"
    Active when `Wake Up on Alarm` has one of the values:

    - Single Event
    - Daily Event
    - Weekly Event

Possible options:

1. **00 : 00 : 00** – Default.
2. HH : MM : SS

    a. HH - Hour: 00 ~ 23

    b. MM - Minute: 00 ~ 59

    c. SS - Second: 00 ~ 59

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AlarmTime | | Yes | Both |

### **Alarm Date (MM/DD/YYYY)**

Select the exact calendar date for the system to turn on.

!!! warning "Attention"
    Active only when `Wake Up on Alarm` has value `Single Event`.

Possible options:

1. **01/01/YYYY** – Default.
2. MM/DD/YYYY:

    a. MM – Months: January to December

    b. DD – Date: 1 ~ 31

    c. YYYY – Year: 1980 ~ 2099

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AlarmDate | | | Both |

### **Alarm Day of Week**

Select the exact week day for the system to turn on.

!!! warning "Attention"
    Active only when `Wake Up on Alarm` has value `Weekly Event`.

Possible options:

1. **Sunday** – Default.
2. Monday
3. Tuesday
4. Wednesday
5. Thursday
6. Friday
7. Saturday

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AlarmDayofWeek | Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday | Yes | Both |

## User Defined Alarm

Settings per {Weekday}.

### **{Weekday}**

Whether the system will turn on automatically on this day of the week.

Possible options:

1. **Off** - Default.
2. On

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UserDefinedAlarmSunday | Disabled, Enabled | Yes | Both |

!!! warning "Attention"
    The WMI setting name shown here is for Sunday. For other week days, change `Sunday` to the desired day of the week.

## User Defined Alarm Time (HH : MM : SS)

Specify the time when the system is to wake up in the format of hh:mm:ss.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UserDefinedAlarmTime | | Yes | Both |
