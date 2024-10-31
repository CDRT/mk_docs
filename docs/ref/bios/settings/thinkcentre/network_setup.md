# Network Setup

![Network Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_network_setup_1.PNG)

Onboard Ethernet Controller
:  
    Options:

    1. **Enabled** - Default.
    2. Disabled.

    !!! note ""
        Setting to `Disabled` also disables all [Intel (R) AMT](https://software.intel.com/sites/manageability/AMT_Implementation_and_Reference_Guide/default.htm) related functions.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | OnboardEthernetController | Disabled, Enabled | yes |

Wireless LAN Access
:  Controls access to WiFi.

    Options:

    1. **Enabled** - Default.
    2. Disabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WirelessLANAccess | Disabled, Enabled | yes |

Wireless LAN PXE boot
:  Whether to load Wireless LAN UNDI Driver to support wireless LAN PXE boot or HTTPS boot.

    Options:

    1. **Disabled** - Default.
    2. Enabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WirelessLANPXE | Disabled, Enabled | yes |

Wireless Auto Disconnection
:  Disable wireless LAN when onboard Ethernet is connected.

    1. **Disabled** - Default.
    2. Enable.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | WirelessAutoDisconnection | Disabled, Enabled | yes |

Wireless Certified Information
:  Display only

PXE IPV4 Network Stack
:  
    Options:

    1. **Disabled** - Default.
    2. Enabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | PXEIPV4NetworkStack | Disabled, Enabled | yes |

PXE IPV6 Network Stack
:  
    Options:

    1. **Disabled** - Default.
    2. Enabled.

    | WMI Setting name | Values | Locked by SVP |
    |:---|:---|:---|
    | PXEIPV6NetworkStack | Disabled, Enabled | yes |

HTTPS Support
:  IPV4 and IPV6 boot support.

    Options:

    1. **Disabled** - Default.
    1. Enabled.

HTTPS Boot
:  Custom HTTPS boot.

    Options:

    1. **Disabled** - Default.
    2. Enabled.

    !!! note ""
        If enabled, `HTTPs Boot Configuration` and `TLS Auth Configuration` will be shown.

Lenovo Cloud Services
:  Whether `Lenovo Cloud` will be selected in boot menu, to boot from Lenovo Cloud server directly.

    Options:

    1. **Disabled** - Default.
    2. Enabled.

Win VDI Boot
:  When enabled, `Win VDI Boot` will be selected in boot menu, to boot from Lenovo Cloud server and load VDI service.

    Options:

    1. **Disabled** - Default.
    2. Enabled.

HTTPs Boot Configuration
:  
    ![HTTPS Boot Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/thinkcentre_https_boot_configuration.png)

    Create a new boot option based on a HTTPS URL.

    !!! note ""
        Only one configuration can be entered at a time. The configuration will take effect after a system reboot.

    Input the description
    :  Press `Enter` to input a label for the newly created URL and it will be displayed in the boot sequence menu.

    Internet Protocol
    :  
            

        Options:

        1. **Ipv4** - enables IPV4. Default.
        2. Ipv6 - enables IPV6.

    Boot URL
    :  
        Use the `TLS Auth configuration` to import the CA to support the HTTPs boot 

    Delete HTTPs Boot Option from List
    :  Select and press `Enter` to remove an EFI HTTPs boot option.

<!-- NO WMI -->

## TLS Auth Configuration

![TLS Auth Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/thinkcentre_tls_auth_configuration.png)

Server CA configuration (display only).

!!! note ""
    Press `Enter` to select TLS auto configuration for HTTPS boot.

## WiFi Configuration

![WiFi Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkcentre/img/tc_wifi_config.PNG)

Automatic Connection Support
:  Automatically connect to WiFi on boot.

    Options:

    1. **Disabled** - Default.
    2. Enabled.

Current Connection (display only)
:  Displays the current WiFi connection.

Wi-Fi Scan
:  Press `Enter` to scan the available connections.

Scanned List (display only)
:  Scanned WiFi nodes.
