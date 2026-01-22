# Hard Disk Password

![Hard Disk Password](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_hard_disk_password.PNG)

One setting per drive. Total number of drives depends on model.

All of the following passwords default to `Disabled`.

A Hard Disk Password prevents unauthorized users from accessing the data from the hard disk.

In addition to the User Password, a optional Master Password can be used to recover the disk if the user password is lost.

!!! note ""
    If several disks are present, we recommend setting all Hard Disk Passwords to the same.

M.2 Drive {Number} Password
:  
    Options:

    1. **Disabled** - Default.
    1. Single Password
    1. Dual Password (Admin + User)

PCIe Drive {Number} Password
:  
    Options:

    1. **Disabled** - Default.
    1. Single Password
    1. Dual Password (Admin + User)

SATA Drive {Number} Password
:  
    Options:

    1. **Disabled** - Default.
    1. Single Password
    1. Dual Password (Master + User)

Require HDP on System Boot
:  Whether to require Hard Disk Password (HDP) at boot.

    Options:

    1.  **Auto** - HDP will be required if the Hard Disk is in lock status when the system starts from the full off, hibernate or restart state. Default.
    2.  Power On - HDP will be required when the system starts from the full off or hibernate state.
    3.  No - HDP will not be required. However, HDP will be required when the hard disk is attached to a different system.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | RequireHDPonSystemBoot| No, Auto, Power On | yes |

Block SID Authentication
:  
    Options:

    1.  **Enabled** - TCG Storage device will block attempts to authenticate the SID authority until a subsequent device power cycle occurs. Default.
    2.  Disabled - Allow SID authentication in TCG Storage device at the next system boot only, not all subsequent boots.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | BlockSIDAuthentication | Enabled, Disabled | yes |

Security Erase HDD Data
:  ![security Erase](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_security_erase_hdd_data.PNG)

    This feature will securely erase the selected HDD.
