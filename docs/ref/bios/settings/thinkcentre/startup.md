# Startup

### **First Boot Device**

Select the first boot priority group. BIOS will try to boot from this group first before trying the boot order.

Possible options:

1. **Boot Order** - Default.
2. Network
3. SATA Drive
4. M.2 Drive
5. VMD Drive
6. USB HDD
7. USB CDROM

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| Firstbootdevice | Boot Order, Network, SATA Drive, M.2 Drive, VMD Drive, USB HDD, USB CDROM | Yes |

### **First Network Device**

Select the first boot device from the designated group.

!!! warning "Attention"
    If disabled, the system will try to boot from all the devices in the group.

Possible options:

1. **Disabled** - the system will try to boot from all the devices in the group. Default.
2. Network1
3. Network2

### **USB Boot Support**

Possible options:

1. **Enabled** - The system could support boot from USB devices. Default.
2. Disabled - The system could not support boot from USB devices.

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| USBBootSupport | Enabled, Disabled | Yes |

### **Boot Up Num-Lock Status**

Whether keypad keys will act as numeric keys.

Possible options:

1. **On** - Default.
2. Off

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| BootUpNumLockStatus | On, Off | Yes |

### **Fast Boot**

Record the last successful startup state to reduce the POST time at the next startup.

!!! warning "Attention"
    We recommend turning off Fast Boot if you often use CD/DVD or network to load your operating system.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| FastBoot | Enabled, Disabled | Yes |

### **Option Keys Display**

Controls the system software option key prompts (such as the F1 key) when the system is turned on.

!!! warning "Attention"
    Disabling the prompts will not affect the function of a specific key.

Possible options:

1. **Disabled** - Default.
2. Enabled

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| OptionKeysDisplay | Disabled, Enabled | Yes |
