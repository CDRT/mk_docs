# Boot Priority Order

### **UEFI Boot Options**

The ordered list of currently defined boot priority order.

- Use Up and Down arrows to select a device.
- `+` and `-` move the device up or down.
- `x` excludes/includes the device to boot.

Possible items on the list depends on the machine configuration.

For every item on the list system shows:

`[Device Type] [Device Model Number]`

### First Boot Device

Select the first boot priority group. BIOS will try to boot from the group first before tryin the boot order.

Possible options:

1. **Boot Order** - Default.
2. Network Group
3. Storage Group
4. SATA 1

List of possible options continues for 4 SATA drives, 3 M.2 Drives, 4 MCIO drives, 9 PCIe drives, USB HDD, USB CD, and 15 Network.

### USB Boot Support

Control whether system can boot from USB devices.

Possible options:

1. **Enabled** - Default.
2. Disabled

### Boot Up Num-Lock Status

This field indicates the state of the NumLock feature of the keyboard after Statrtup. If NumLock is "On", the keys on the keypad will act as numeric keys. If NumLock is "Off", the keys on the keypad will act as cursor keys.

Possible options:

1. **On** - Default.
2. Off

### Fast Boot

This feature can record the last successful startup state to reduce the POST time at the next startup. It is recommended to turn off "fast boot" if you often use CD/DVD or network to load your operating system. Select "Enabled" for system to boot faster. Select "Disabled" to switch back to normal boot.

Possible options:

1. **Enabled** - Default.
2. Disabled

### Option Keys Display

Controls the system software option key prompts (such as F1 key) when the system is turned on. Select "Enabled" to display the prompts. Disabling the prompts will not affect the function of a specific key.

Possible options:

1. Enabled
2. **Disabled** - Default.

### **Boot Order Lock**

Whether the boot order can be changed.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BootOrderLock | Disable, Enable | Yes | Both |
