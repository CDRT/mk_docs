# Startup

![Startup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_startup.PNG)

First Boot Device
:  Select the first boot priority group. BIOS will try to boot from this group first before trying the boot order.

    Options:

    1. **Boot Order**. Default.
    1. Network
    1. SATA Drive
    1. M.2 Drive
    1. VMD Drive
    1. USB HDD
    1. USB CDROM

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | Firstbootdevice | Boot Order, Network, SATA Drive, M.2 Drive, VMD Drive, USB HDD, USB CDROM | yes |

First Network Device
:  Select the first boot device from the designated group.

    !!! note ""
        if disabled, the system will try to boot from all the devices in the group.

    Options:

    1. **Disabled** - the system will try to boot from all the devices in the group. Default.
    1. Network1
    1. Network2

USB Boot Support
:  

    Options:

    1. **Enabled** - The system could support boot from USB devices. Default.
    1. Disabled - The system could not support boot from USB devices.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | USBBootSupport | Enabled, Disabled | yes |

Boot Up Num-Lock Status
:  Whether keypad keys will act as numeric keys.

    Options:

    1. **On** - Default.
    1. Off.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | BootUpNumLockStatus | Off, On | yes |

Fast Boot
:  Record the last successful startup state to reduce the POST time at the next startup.

    !!! note ""
        We recommended turning off Fast Boot if you often use CD/DVD or network to load your operating system.

    Options:

    1.  **Enabled** - Default.
    1.  Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | FastBoot | Disabled, Enabled | yes |

Option Keys Display
:  Controls the system software option key prompts (such as the F1 key) when the system is turned on.

    Options:

    1.  **Disabled** - Default.
    2.  Enabled.

    !!! note ""
        Disabling the prompts will not affect the function of a specific key.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | OptionKeysDisplay | Disabled, Enabled | yes |

![Startup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_startup_2.PNG)
