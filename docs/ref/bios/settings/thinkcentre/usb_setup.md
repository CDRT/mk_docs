# USB Setup

![USB Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_usb_setup.PNG)

USB Port Access
:  
    Options:

    1.  **Enabled** - Default.
    2.  Disabled - disables USB.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | USBPortAccess | Disabled, Enabled | yes |

USB Bios Support
:  BIOS support for USB mouse and keyboard:

    1.  **Enabled** - Default.
    2.  Disabled.

USB Enumeration Delay
:  Provides extra delay to USB enumeration (detection and recognition of connected USB devices), to improve compatibility.

    !!! note ""
        This may increase POST time.

    1.  Enable.
    2.  **Disabled** - Default.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | USBEnumerationDelay | Disabled, Enabled | yes |

Front USB Ports
:  Affects all of the front USB ports (numbered):

    1.  **Enabled** - Default.
    2.  Disabled - disables front USB ports, numbered.

    !!! note ""
        When `Disabled` is selected, settings for all front USB ports will not be shown.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | FrontUSBPorts | Disabled, Enabled | yes |

USB Port {Number}
:  One of the front USB ports, total number depending on model.

    Options:

    1.  **Enable** - Default.
    2.  Disable.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | USBPort1 | Disabled, Enabled | yes |

    !!! note ""
        The WMI setting name is shown here for USB port 1. For other ports 2-10 replace the 1 with the port number.

Rear USB Ports
:  Affects all of the rear USB ports (numbered):

    1.  **Enabled** - Default.
    2.  Disabled - disables rear USB ports, numbered.

    !!! note ""
        When `Disabled` is selected, settings for all rear USB ports will not be shown.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | RearUSBPorts | Disabled, Enabled | yes |

USB Port {Number / Letter}
:  One of the rear USB ports, total number (and labeling) depending on model.

    Options:

    1.  **Enable** - Default.
    2.  Disable.
