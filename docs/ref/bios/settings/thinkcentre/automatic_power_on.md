# Automatic Power On

![Automatic Power On](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_automatic_power_on.PNG)

Wake on LAN
:  Controls the wake up event from onboard LAN and PCI LAN.

    Possible options:

    1.  **Enabled** – Default.
    2.  Disabled – disables Wake on LAN.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WakeonLAN | Primary, Automatic, Disabled | Yes |

Wake from Serial Port Ring
:  
    Select whether to enable Wake from Serial Port Ring.

    Possible options:

    1. **Enabled** – Default.
    2. Disabled

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WakefromSerialPortRing | Primary, Automatic, Disabled | Yes |

Wake Up on Alarm
:  Options to turn on your system on a specific day of the month, specific day of the week, or daily at a given time.

    A single wake up event, or series of alarm events, can also be defined.

    !!! note ""
        - Selecting `User Defined` enables the `User Defined Alarm` settings.
        - Values in these fields may be overwritten by the operating system.

    Possible options:

    1.  **Disabled** – Default.
    2.  User Defined – a series of alarm events.
    3.  Single Event
    4.  Daily Event
    5.  Weekly Event

Startup Sequence
:  Select the startup sequence after a Wake Up on Alarm event.

    Possible options:

    1.  **Primary** – enables primary startup sequence. Default.
    2.  Automatic – disables automatic selection of startup sequence.
    3.  Boot Order
    4.  Network Group
    5.  Storage Group
    6.  SATA 1
    7.  SATA 2
    8.  SATA 3
    9.  SATA 4
    10.  M.2 Drive 1
    11.  M.2 Drive 2
    12.  PCIe Drive 1
    13.  PCIe Drive 2
    14.  VMD
    15.  USB HDD
    16.  USB CDROM
    17.  Network 1
    18.  Network 2
    19.  Network 3
    20.  Network 4
    21.  Network 5
    22.  Network 6
    23.  Network 7

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | StartupSequence | Primary, Automatic, etc | Yes/No |

Alarm Time (HH : MM : SS)
:  Specify the time when the system is to wake up.

    Hours / minutes / seconds format.

Alarm Date (MM / DD / YYYY)
:  Specify the precise date in month / day / year format.

Alarm day of week
:  
    Possible options:

    1. **Sunday** – Default.
    2. Monday
    3. Tuesday
    4. Wednesday
    5. Thursday
    6. Friday
    7. Saturday

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

