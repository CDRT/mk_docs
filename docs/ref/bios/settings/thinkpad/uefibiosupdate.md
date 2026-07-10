# UEFI BIOS Update Option Settings

![UEFI BIOS Update](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_uefibiosupdate.png)

Flash BIOS Updating by End-Users
:  Whether UEFI BIOS can be updated without entering supervisor password.

    Possible options:

    1. Off
    2. **On** – Default.

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | BIOSUpdateByEndUsers | Disable, Enable | Yes | Both |

Secure RollBack Prevention
:  Whether to prevent flashing to older version of UEFI BIOS.

    !!! note ""
        Defaults to `On` for shipping, if `OS Optimized Defaults` has value `On`. 

    Possible options:

    1. **Off** – Default at initial boot at factory.
    2. On

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | SecureRollBackPrevention | Disable, Enable | Yes | Both |

Windows UEFI Firmware Update
:  Whether to allow Windows UEFI Firmware Update.

    Possible options:

    1. **On** – Default.
    2. Off

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WindowsUEFIFirmwareUpdate | Disable, Enable | Yes | Both |
