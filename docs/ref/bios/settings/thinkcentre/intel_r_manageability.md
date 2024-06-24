# Intel(R) Manageability

![Intel Manageability](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_intel_r_manageability.PNG)

 [More information at Intel.com](https://software.intel.com/sites/manageability/AMT_Implementation_and_Reference_Guide/default.htm)

Intel(R) Manageability Control
:  
    Options:

    1. **Enabled** - Default.
    2. Disabled.

    Setting Intel(R) Manageability Control to "Disabled":

    1. If system is provisioned, MEBx will be unprovisioned first.

    !!! note ""
    When MEBX prompt unprovisioning, you should press YES.

    2. Manageability functions will be disabled
    You can enter BIOS to re-enable Intel(R) Manageability.

    !!! note ""
    When changing the setting from “Enabled” to “Disabled”, after saving and exiting SETUP, need to unplug the AC power cord and plug it in again.

Intel(R) Manageability Reset
:  Return Intel(R) Manageability settings to default configuration.

    Options:

    1. **Enabled** - Default.
    2. Disabled.

    !!! note ""
        the MEBx password will also be reset.

Intel(R) MEBx
:  Press `Enter` to enter Intel (R) MEBx (Management Engine BIOS Extension).
    [More information at Intel.com](https://www.intel.com/content/www/us/en/support/articles/000020917/software/manageability-products.html)

ME Firmware Version (display only)
:  Displays the firmware version.

Manageability Type (display only)
:  Displays the manageability type.

USB Provisioning
:  
    Options:

    1.  **Enabled** - Default.
    2.  Disabled - disables USB provisioning.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | USBProvisioning | Disabled, Enabled | yes |

SQL Configuration
:  
![SQL Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_sql_configuration.PNG)

Console Type
:  
    Options:
    1. VT100.
    1. VT100-8bit.
    1. PC-ANSI-7bit.
    1. PC-ANSI.
    1. **VT100+** - Default.
    1. VT-UTF8.
    1. ASCII.
