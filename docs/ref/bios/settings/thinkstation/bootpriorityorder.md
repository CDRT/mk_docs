# Boot Priority Order

<!-- TODO: Add/Delete Boot Option and Boot Order Lock added from spec, PGX_GB10/Cathaya only (no corroboration from other platforms). Descriptions are from spec; no WMI confirmed for Add/Delete Boot Option. -->

### **UEFI Boot Options**

The ordered list of currently defined boot priority order.

- User Up and Down arrows to select a device.
- `+` and `-` move the device up or down.
- `x` excludes/includes the device to boot.

Possible items on the list depends on the machine configuration.

For every item on the list system shows:

`[Device Type] [Device Model Number]`

### **Excluded from boot priority order**

Shows the items which are excluded from boot priority order.

Can be empty, if there are no excluded items.

### **Add Boot Option**

Add a new EFI boot option to the boot order.

### **Path for boot option**

Enter the path to the boot option, in the format `fsx:\path\filename.efi`.

### **Boot option File Path**

File path for the newly created boot option.

### **Create**

Creates the newly formed boot option.

### **Delete Boot Option**

Remove an EFI boot option from the boot order.

### **Boot Order Lock**

Whether the boot order can be changed.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| BootOrderLock | Disable, Enable | Yes | Both |
