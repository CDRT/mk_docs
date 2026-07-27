# Intel(R) Manageability

## General

[More information at Intel.com](https://software.intel.com/sites/manageability/AMT_Implementation_and_Reference_Guide/default.htm)

### **Intel(R) Manageability Control**

!!! warning "Attention"
    Setting `Intel(R) Manageability Control` to `Disabled`:

    1. If system is provisioned, MEBx will be unprovisioned first.

        When MEBx prompts for unprovisioning, you should press `Yes`.

    2. Manageability functions will be disabled. You can enter BIOS to re-enable Intel(R) Manageability.

    When changing the setting from `Enabled` to `Disabled`, after saving and exiting Setup, you need to unplug the AC power cord and plug it in again.

Possible options:

1. **Enabled** - Default.
2. Disabled

### **Intel(R) Manageability Reset**

Return Intel(R) Manageability settings to default configuration.

!!! warning "Attention"
    The MEBx password will also be reset.

Possible options:

1. **Enabled** - Default.
2. Disabled

### **Intel(R) MEBx**

Press `Enter` to enter Intel (R) MEBx (Management Engine BIOS Extension).

[More information at Intel.com](https://www.intel.com/content/www/us/en/support/articles/000020917/software/manageability-products.html)

### **ME Firmware Version (display only)**

Displays the firmware version.

### **Manageability Type (display only)**

Displays the manageability type.

### **USB Provisioning**

Possible options:

1. **Enabled** - Default.
2. Disabled - disables USB provisioning.

| WMI Setting name | Values | Locked by SVP |
| :--- | :--- | :--- |
| USBProvisioning | Disabled, Enabled | Yes |

## SOL Configuration

### **Console Type**

Select the specified console type.

Possible options:

1. **VT100+** - Default.
2. VT100
3. VT100-8bit
4. PC-ANSI-7bit
5. PC-ANSI
6. VT-UTF8
7. ASCII
