# Network Setup Settings

## General

### **Onboard Ethernet Controller**

Whether to enable the Onboard Ethernet Controller.

!!! warning "Attention"
    When `Disabled`:

    - `PXE IPV4 Network Stack` setting becomes unavailable.
    - `PXE IPV6 Network Stack` setting becomes unavailable.
    - Intel only: Intel(R) AMT functions are disabled.
    - AMD only: DASH functions will be disabled.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| OnboardEthernetController | Enabled, Disabled | Yes | Both |

### **Onboard 10G Ethernet Controller**

Whether to enable the onboard 10G Ethernet controller.

!!! warning "Attention"
    Only available on models equipped with an onboard 10G Ethernet controller.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| Onboard10GEthernetController | Enabled, Disabled | Yes | Both |

### **Onboard 2.5G Ethernet Controller**

Whether to enable the onboard 2.5G Ethernet controller.

!!! warning "Attention"
    Only available on models equipped with an onboard 2.5G Ethernet controller.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| Onboard25GEthernetController | Enabled, Disabled | Yes | Both |

### **Wireless LAN Access**

Whether Wireless LAN will be available in OS.

Possible options:

1. **Enabled** - Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WirelessLANAccess | Enabled, Disabled | Yes | Both |

### **Wireless LAN PXE boot**

Whether to support wireless LAN PXE (Pre-boot Execution Environment) boot or HTTPs boot.

This works by loading the Wireless LAN (Local Area Network) UNDI (Universal Network Driver Interface) Driver.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WirelessLANPXE | Disabled, Enabled | Yes | Both |

## Wireless Certified Information

Wireless device information. View only.

!!! warning "Attention"
    Applicable only for platforms which have WLAN implemented.

### **PXE IPV4 Network Stack**

!!! warning "Attention"
    Unavailable if `Onboard Ethernet Controller` is set to `Disabled`.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PXEIPV4NetworkStack | Enabled, Disabled | Yes | Both |

### **PXE IPV6 Network Stack**

!!! warning "Attention"
    Unavailable if `Onboard Ethernet Controller` is set to `Disabled`.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PXEIPV6NetworkStack | Enabled, Disabled | Yes | Both |

### **PXE Option ROM**

Whether to load the onboard PXE (Pre-boot Execution Environment) option ROM, allowing the system to boot from a server image.

!!! warning "Attention"
    Hidden if the BIOS doesn't support legacy mode.

Possible options:

1. **Enabled** – Default.
2. Disabled

### **UEFI IPv4 Network Stack**

Enables the use of IPv4 for network booting, and adds IPv4 PXE boot to the boot menu.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UefiIpV4NetworkStack | Enable, Disable | Yes | Both |

### **UEFI IPv6 Network Stack**

Enables the use of IPv6 for network booting, and adds IPv6 PXE boot to the boot menu.

Possible options:

1. **Enabled** – Default.
2. Disabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| UefiIpV6NetworkStack | Enable, Disable | Yes | Both |

### **PXE Boot Wait Time**

Select the PXE (Pre-boot Execution Environment) boot wait time before starting PXE boot.

Possible options:

1. **1 Second** – Default.
2. 5 Seconds
3. 10 Seconds
4. 30 Seconds
5. 60 Seconds
6. 120 Seconds

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| PxeBootWaitTime | 1 Second, 5 Seconds, 10 Seconds, 30 Seconds, 60 Seconds, 120 Seconds | Yes | Both |

### **TFTP Window Size**

Specify the MTFTP window size used by the UEFI PXE driver.

Possible options:

1. 1
2. 2
3. 3
4. **4** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| TftpWindowSize | 1, 2, 3, 4 | Yes | Both |

### **Proxy Support**

Whether to enable proxy support for network operations such as HTTPs Boot. Availability of this setting depends on model.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ProxySupport | Disabled, Enabled | Yes | Both |

### **Proxy URL**

The URL of the proxy server to use.

!!! warning "Attention"
    Only available when `Proxy Support` is `Enabled`.

### **Wireless Auto Disconnection**

Whether to automatically disconnect the wireless LAN connection when an Ethernet cable is connected to the system.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| WirelessAutoDisconnection | Disabled, Enabled | Yes | Both |

### **HTTPs Support**

Enable/Disable IPv4 and IPv6 HTTPs Boot network stack.

!!! warning "Attention"
    When `Disabled`, `HTTPs Boot` and `Lenovo Cloud Services` become unavailable. Also unavailable if `Secure Boot` is `Disabled`.

Possible options:

1. **Disabled** – Default.
2. Enabled

### **HTTPs Boot**

This setting controls whether or not the system can boot over HTTPS. When enabled, additional configuration may be required. The HTTPS Boot and related settings are not configurable through WMI. See [Boot Description.](#boot-configuration)

Possible options:

1. **Disabled** – Default.
2. Enabled – the `HTTPs Boot Configuration` and `Tls Auth Configuration` will be shown for custom configuration.

### **Lenovo Cloud Services**

Whether to boot system with `Lenovo Cloud` selected through boot menu, so that BIOS boots to Lenovo Cloud server directly, which provides various cloud services.

!!! warning "Attention"
    Only available if `Secure Boot` is `Enabled`.

Possible options:

1. **Disabled** – Default.
2. Enabled

Once the feature is enabled, then it becomes available for selection in `BIOS -> Startup -> Edit Boot Order`, or `BIOS -> Startup -> Network Boot`, or via F12 Boot Menu. When `Lenovo Cloud Services` booted, then following options will be available for selection:

- **Lenovo Cloud Deploy (ITC)** – sends Factory-Style images to customers for deployment in the field.

Additional information: [Lenovo Cloud Deploy](https://www.lenovoclouddeploy.com/en/auth/welcome).

- **Windows Virtual Desktop (VDI)** – provides the VDI environment to customer. VDI itself must be setup by the customer (IT Admin). If this option is selected, then it will become available as a boot option.

Additional information is available here: [Client Virtualization & Infrastructure Solutions - Lenovo](https://www.lenovo.com/lt/lt/data-center/solutions/client-virtualization) and [Windows Virtual Desktop](https://www.microsoft.com/en-us/microsoft-365/blog/2019/09/30/windows-virtual-desktop-generally-available-worldwide/).

### **Win VDI Boot**

Win VDI (Virtual Desktop Infrastructure) Boot.

Whether to boot the system with `Win VDI Boot` selected through boot menu, so that BIOS boots to Lenovo Cloud server, to load VDI service.

Possible options:

1. **Disabled** – Default.
2. Enabled

### **Reinstall Windows From Cloud**

Whether to enable Microsoft Bare Metal Recovery from the network.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| ReinstallWindowsFromCloud | Disabled, Enabled | Yes | Both |

### **BIOS Cloud Upgrade**

Whether to allow BIOS firmware updates to be retrieved from the cloud.

Possible options:

1. **Disabled** – Default.
2. Enabled

## Boot Configuration

### **Input the description**

Input a label for new created URL, press `Enter`, and it will be displayed in the boot sequence menu.

### **Internet Protocol**

Select Internet Protocol to use for this HTTPs Boot option.

Possible options:

1. **Ipv4** – Default.
2. Ipv6

### **Boot URL**

A new Boot Option will be created according to this Boot URL.

Accepts HTTPs URLs only.

!!! warning "Attention"
    Use `Tls Auth Configuration` to import the CA (Certificate Authority) to support the HTTPs boot.

### **Custom URL**

Whether to enable entering a custom Boot URL, instead of a default.

Possible options:

1. **Disabled** – Default.
2. Enabled

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
| :--- | :--- | :--- | :--- |
| CustomUrl | Disable, Enable | Yes | Both |

### **Delete HTTPs Boot Option from List**

The list of HTTPs Boot options.

Select and press `Enter` to remove an EFI HTTPs boot option.

## Tls Auth Configuration

### **Server CA Configuration**

Press `Enter` to configure Server CA (Certificate Authority) for HTTPs Boot.

!!! warning "Attention"
    Visible only if `HTTPs Boot` has `Enabled` status.

### **Client CA Configuration**

Press `Enter` to configure the Client CA (Certificate Authority) for HTTPs Boot.

## Wifi Configuration

### **Automatic Connection Support**

Whether to enable or disable automatic Wifi connection on every boot.

Possible options:

1. **Disabled** - Default.
2. Enabled

## Current Connection

View only.

Shows Connection State, if the device is connected to a Wi-Fi network, or `No Connection.`

## Wi-Fi Scan

Press `Enter` to scan the available connections.

## Scanned List

Scanned Wi-Fi nodes for selection to connect.
