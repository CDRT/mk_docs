# Automatic Power On

![Automatic Power On](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_automatic_power_on.PNG)

Wake on LAN
:  Controls the wake up event from onboard LAN and PCI LAN.

    Options:

    1.  **Enabled** - Default.
    2.  Disabled - disables Wake on LAN.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WakeonLAN | Primary, Automatic, Disabled | yes |

Wake from Serial Port Ring
:  
    Select whether to enable Wake from Serial Port Ring.

    Options:

    1. **Enabled** - Default.
    2. Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WakefromSerialPortRing | Primary, Automatic, Disabled | yes |

Wake Up on Alarm
:  Options to turn on your system on a specific day of the month, specific day of the week, or daily at a given time.

    A single wake up event, or series of alarm events, can also be defined.

    !!! note ""
        - Selecting `User Defined` enables the `User Defined Alarm` settings.
        - Values in these fields may be overwritten by the operating system.

    Options:

    1.  **Disabled** - Default.
    2.  User Defined - a series of alarm events.
    3.  Single Event
    4.  Daily Event
    5.  Weekly Event

Startup Sequence
:  Select the startup sequence after a Wake Up on Alarm event.

    Options:

    1.  **Primary** - enables primary startup sequence. Default.
    1.  Automatic - disables automatic selection of startup sequence.
    1.  Boot Order.
    1.  Network Group.
    1.  Storage Group.
    1.  SATA 1.
    1.  SATA 2.
    1.  SATA 3.
    1.  SATA 4.
    1.  M.2 Drive 1.
    1.  M.2 Drive 2.
    1.  PCIe Drive 1.
    1.  PCIe Drive 2.
    1.  VMD.
    1.  USB HDD.
    1.  USB CDROM.
    1.  Network 1. 
    1.  Network 2.
    1.  Network 3. 
    1.  Network 4.
    1.  Network 5. 
    1.  Network 6.
    1.  Network 7.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | StartupSequence | Primary, Automatic, etc | yes_no |

Alarm Time (HH : MM : SS)
:  Specify the time when the system is to wake up.

    Hours / minutes / seconds format.

Alarm Date (MM / DD / YYYY)
:  Specify the precise date in month / day / year format.

Alarm day of week
:  
    Options:

    1. **Sunday** - Default.
    2. Monday.
    3. Tuesday.
    4. Wednesday.
    5. Thursday.
    6. Friday.
    7. Saturday.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | AlarmDayofWeek  | Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday | yes |

User Defined Alarm
:  ![User-defined Alarm](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_user_defined_alarm.PNG)

    Select the day(s) of the week when the system is to wake up. Each {Weekday} (Sunday to Saturday) has its own setting.

    {Weekday}
      
      Options:

    1.  **Disabled** - disables wake-up. Default.
    2.  Enabled - enables wake-up.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | UserDefinedAlarmFriday | Disabled, Enabled | yes |

    !!! note ""
        The WMI setting name for the wake-up timer week shown here is for Friday. For the other weekdays replace `Friday` with the weekday's name.

    User Defined Alarm Time (HH : MM : SS)
    :  Specify the time when the system is to wake up.
