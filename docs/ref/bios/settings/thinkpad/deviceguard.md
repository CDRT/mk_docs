# Device Guard Settings

![](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_deviceguard.png)

Device Guard
:  Whether to enable Microsoft (R) Device Guard.

    !!! note ""
        To configure Device Guard, Supervisor Password must be set.

    !!! note ""
        Device Guard is no longer available as a BIOS Setting starting with 2023 products.

    Possible options:

    1. **Off** - Default.
    2. On

    !!! note ""
        When enabled, Intel Virtualization Technology, Intel VT-d Feature, Secure Boot and OS Optimized Defaults are automatically enabled.

    !!! note ""
        Boot Order is restricted to customer image only.

    !!! note ""
        This option requires additional confirmation.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | DeviceGuard | Disable, Enable | Yes | Intel |
