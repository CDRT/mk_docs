# Power Settings

## General

### **Intel (R) SpeedStep Technology**

Whether to switch on Intel (R) SteedStep Technology at runtime.

Possible options:

1. **On** – Default.
2. Off

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SpeedStep | Disable, Enable | No | Intel |

### **Scheme for AC**

Select thermal management scheme.

!!! warning "Attention"
    Each scheme affects fan sound, temperature, and performance.

Possible options:

1. **Maximize Performance** - reduces CPU throttling. Default.
2. Balanced - balanced sound, temperature, and performance.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AdaptiveThermalManagementAC | MaximizePerformance, Balanced | No | Both |

### **Scheme for Battery**

Select thermal management scheme.

!!! warning "Attention"
    Each scheme affects fan sound, temperature, and performance.

Possible options:

1. Maximize Performance - reduces CPU throttling.
2. **Balanced** - balanced sound, temperature, and performance. Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AdaptiveThermalManagementBattery | MaximizePerformance, Balanced | No | Both |

### **Intelligent Cooling Boost**

Whether to improve power efficiency by limiting system power based on the selected OS application, when Intelligent Cooling is on.

!!! warning "Attention"
    This feature is Windows only.

    For more details about Intelligent Cooling mode, please refer to Vantage or the user guide.

Possible options:

1. **On** - Default.
2. Off.

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| IntelligentCoolingBoost | Disable, Enable | Yes | Both |

### **CPU Power Management**

Whether to shut down the microprocessor clock automatically when there are no system activities, for power saving.

!!! warning "Attention"
    Normally, it is not necessary to change this setting.

Possible options:

1. **Automatic** - Default.
2. Disabled

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| CPUPowerManagement | Disable, Automatic | No | Both |

### **Power On with AC Attach**

Whether to power on the system when AC is attached.

!!! warning "Attention"
    If the system is in hibernate state, the system resumes upon AC connect.

Possible options:

1. Enabled
2. **Disabled** - Default.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| OnByAcAttach | Disable, Enable | No | Both |

### **Sleep State**

Optimized Sleep States.

!!! warning "Attention"
    - Sleep State for Windows® and versions of Linux are compatible with Suspend-to-Idle.
    - Optimized Sleep State for S3 are not compatible with Suspend-to-Idle.
    - Windows® OS should be used with **Windows** setting only.

    The possible setting values may vary by model and newer systems may not include this setting. Always verify on a targeted system before deploying.

Possible options:

1. **Windows and Linux** - Default.
2. Linux S3

| WMI Setting name | Values | SVP or SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| SleepState | Linux, Windows, Windows10 | Yes | Both |

### **Disable Built-in Battery**

Temporarily disables the battery to service the system.

This option requires additional confirmation.

!!! warning "Attention"
    - After selecting this item, the system will be automatically powered off, ready to be serviced.
    - The battery will be automatically enabled when the AC adapter is reconnected.

## Automatic Power On

### **Wake Up on Alarm**

Define when the system will turn on automatically.

!!! warning "Attention"
    Wake up will only occur on AC power. Values for the `Wake Up on Alarm` group of settings can be overwritten by the operating system.

Possible options:

1. **Disabled** - the system will not turn on automatically. Default.
2. Single Event - the system will turn on one-time on the specified day and time.
3. Daily Event - the system will turn on every day at the specified time.
4. Weekly Event - the system will turn on every week on the specified day and time.
5. User Defined - this option enables ‘User Defined Alarm’ group of settings.

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WakeUponAlarm | Disable, UserDefined, WeeklyEvent, DailyEvent, SingleEvent | Yes | Both |

### **Alarm Date (MM/DD/YYYY)**

Select the exact day for the system to turn on.

!!! warning "Attention"
    Active only when `Wake Up on Alarm` has value `Single Event`.

Possible options:

1. **N/A** – Default.
2. MM/DD/YYYY:

    a. MM – Months: January to December

    b. DD – Date: 1 ~ 31

    c. YYYY – Year: 1980 ~ 2099

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AlarmDate | MM/DD/YYYY | Yes | Both |

### **Alarm Time (HH : MM : SS)**

Select the exact time for the system to turn on.

!!! warning "Attention"
    Active when `Wake Up on Alarm` has one of the values:

    - `Single Event`
    - `Daily Event`
    - `Weekly Event`

Possible options:

1. **N/A** – Default
2. HH : MM : SS

    a. HH - Hour: 00 ~ 23

    b. MM - Minute: 00 ~ 59

    c. SS - Second: 00 ~ 59

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AlarmTime | HH/MM/SS | Yes | Both |

### **Alarm Day of Week**

Select the exact day for the system to turn on.

!!! warning "Attention"
    Active only when `Wake Up on Alarm` has value `Weekly Event`.

Possible options:

1. **N/A** – Default
2. Sunday
3. Monday
4. Tuesday
5. Wednesday
6. Thursday
7. Friday
8. Saturday

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| AlarmDayofWeek | Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday | Yes | Both |

## Automatic Power On - User Defined Alarm

### **Sunday - Saturday**

Whether the system will turn on automatically on this day.

Possible options:

1. **Off** - Default.
2. On

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UserDefinedAlarmSunday | Disable, Enable | Yes | Both |

!!! warning "Attention"
    The WMI setting name shown here is for Sunday. For other days of the week, change `Sunday` to the desired day.

### **User Defined Alarm Time (HH : MM : SS)**

Select the exact time for the system to turn on.

Possible options:

1. HH : MM : SS

    a. HH - Hour: 00 ~ 23

    b. MM - Minute: 00 ~ 59

    c. SS - Second: 00 ~ 59

| WMI Setting name | Values | Locked by SVP | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UserDefinedAlarmTime | HH/MM/SS | Yes | Both |
