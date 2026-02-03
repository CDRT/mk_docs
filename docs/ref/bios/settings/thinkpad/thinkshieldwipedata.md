# ThinkShield Wipe System Data

Wipe Data in Bulk
: This will Permanently delete all data including:

    - System Firmware Settings
    - TPM
    - Fingerprint
    - WWAN
    - Haptics Touchpad
    - Internal Storage (HDD/SSD)

    After selecting item, the system will automatically reboot.

    Options:

    1. **No** - Default.
    2. Yes

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WipeDataInBulk |  |  |  |

## Wipe Specified Data

System Firmware Settings
:  If selected, the following items will be included in the deletion:

    - Lenovo BIOS Setting
    - Secure Boot Keys
    - Boot Order
    - BIOS Log
    - BIOS Passwords
    - BIOS Certificates
    - FirmwareShield Provisioning Data
    - ECFW Settings
    - CSME Settings

    Options:

    1. **Keep** - Default.
    2. Permanently Delete

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WSD_SystemFirmwareSettings |  |  |  |

TPM
:  If selected, the encryption keys will be included in the deletion.

    Options:

    1. **Keep** - Default.
    2. Permanently Delete

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WSD_TPM |  |  |  |

Fingerprint
:  If selected, fingerprint data will be included in the deletion.

    !!! note ""
        I/O Port > Fingerprint Reader is disabled. To delete Fingerprint Reader data, please enable it first.

    Options:

    1. **Keep** - Default.
    2. Permanently Delete

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WSD_Fingerprint |  |  |  |

WWAN
:  If selected, eSIM for WWAN will be included in the deletion.

    !!! note ""
        I/O Port > WWAN is disabled. To delete WWAN data, please enable it first.

    !!! note ""
        If I/O Port > WWAN is On. If the SKU does not support WWAN, this item is hidden.

    Options:

    1. **Keep** - Default.
    2. Permanently Delete

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WSD_WWAN |  |  |  |

Haptics Touchpad
:  If selected, User data within Haptics Touchpad will be included in the deletion.

    Options:

    1. **Keep** - Default.
    2. Permanently Delete

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WSD_HapticsTouchpad |  |  |  |

Internal Storage (HDD/SSD)
:  If selected, Internal Storage (HDD/SSD) will be included in the deletion.

    !!! note ""
        ThinkShield secure wipe > ThinkShield secure wipe in App Menu is disabled. To delete Interna; Storage (HDD/SSD) data, please enable it first.

    Options:

    1. **Keep** - Default.
    2. Wipe Disk

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WSD_InternalStorage0 |  |  |  |

Wipe Selected Data
:  Permanently delete selected data.

    Options:

    1. **No** - Default.
    2. Yes

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | WipSelectedData |  |  |  |

Reset System Factory Defaults
: This option is used clear all the data stored in UEFI system. It does not affect the SSD storage data. After selecting this item, the system will automatically reboot and reset to factory default settings.
Note: System will be reboot, permanently clear all stored data, and reset to factory default settings. Absolute Persistence Module Permanent Disabled and Intel AMT Control Permanent Disabled settings will not reset.
