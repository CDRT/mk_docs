# Network Setup Settings #

<!-- TODO (new-settings pass, unconfirmed — verify against an actual build before publishing):
- Proxy URL, BIOS Cloud Upgrade, Client CA Configuration: spec gave the name only (Proxy URL, Client CA Configuration) or name + Enable/Disable options with no WMI/description (BIOS Cloud Upgrade). Descriptions are my own inference — Client CA Configuration's especially, which I wrote by analogy to the neighboring (confirmed) "Server CA Configuration" entry rather than from any Client CA-specific spec text.
- Every **bold**/Default flag added in this pass is my own guess; no default is marked anywhere in the source data.
-->

![Netwrok Setup](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_networksetup.PNG)

## General

Onboard Ethernet Controller
:	Whether to enable the Onboard Ethernet Controller.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	!!! note ""
		When `Disabled`:<br>    •`PXE IPV4 Network Stack` setting becomes unavailable<br>    •`PXE IPV6 Network Stack` setting becomes unavailable

	!!! note ""
		Intel only: if `Disabled`, Intel(R) AMT functions are disabled.

	!!! note ""
		AMD only: if `Disabled`, DASH functions will be disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| OnboardEthernetController | Disabled, Enabled | yes | Both |


Onboard 10G Ethernet Controller
:	Whether to enable the onboard 10G Ethernet controller.

	!!! note ""
		Only available on models equipped with an onboard 10G Ethernet controller.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| Onboard10GEthernetController | Disabled, Enabled | yes | Both |


Onboard 2.5G Ethernet Controller
:	Whether to enable the onboard 2.5G Ethernet controller.

	!!! note ""
		Only available on models equipped with an onboard 2.5G Ethernet controller.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| Onboard25GEthernetController | Disabled, Enabled | yes | Both |


Wireless LAN Access
:	Whether Wireless LAN will be available in OS.

	Options:

	1. **Enabled** - Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| WirelessLANAccess | Disabled, Enabled | yes | Both |


Wireless LAN PXE boot
:	Whether to support wireless LAN PXE (Pre-boot Execution Environment) boot or HTTPs boot.

	!!! note ""
		This works by loading the Wireless LAN (Local Area Network) UNDI (Universal Network Driver Interface) Driver.

	1. Enabled.
	2. **Disabled** – Default.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| WirelessLANPXE | Disabled, Enabled  | yes | Both |


## Wireless Certified Information

Wireless device information. View only.
:
	!!! note ""
		Applicable only for platforms which have WLAN implemented.

<!-- NO WMI -->

PXE IPV4 Network Stack
:
	Options:

	1. **Enabled** – Default.
	2. Disabled

	!!! note ""
		Unavailable if `Onboard Ethernet Controller` is set to `Disabled`.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PXEIPV4NetworkStack | Disabled, Enabled | yes | Both |


PXE IPV6 Network Stack
:
	Options:

	1. **Enabled** – Default.
	2. Disabled

	!!! note ""
		Unavailable if `Onboard Ethernet Controller` is set to `Disabled`.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PXEIPV6NetworkStack | Disabled, Enabled | yes | Both |


PXE Option ROM
:	Whether to load the onboard PXE (Pre-boot Execution Environment) option ROM, allowing the system to boot from a server image.

	!!! note ""
		Hidden if the BIOS doesn't support legacy mode.

	Options:

	1. **Enabled** – Default.
	2. Disabled.


UEFI IPv4 Network Stack
:	Enables the use of IPv4 for network booting, and adds IPv4 PXE boot to the boot menu.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| UefiIpV4NetworkStack | Disable, Enable | yes | Both |


UEFI IPv6 Network Stack
:	Enables the use of IPv6 for network booting, and adds IPv6 PXE boot to the boot menu.

	Options:

	1. **Enabled** – Default.
	2. Disabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| UefiIpV6NetworkStack | Disable, Enable | yes | Both |


PXE Boot Wait Time
:	Select the PXE (Pre-boot Execution Environment) boot wait time before starting PXE boot.

	Options:

	1. **1 Second** – Default.
	2. 5 Seconds.
	3. 10 Seconds.
	4. 30 Seconds.
	5. 60 Seconds.
	6. 120 Seconds.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| PxeBootWaitTime | 1 Second, 5 Seconds, 10 Seconds, 30 Seconds, 60 Seconds, 120 Seconds | yes | Both |


TFTP Window Size
:	Specify the MTFTP window size used by the UEFI PXE driver.

	Options:

	1. **1** – Default.
	2. 2.
	3. 3.
	4. 4.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| TftpWindowSize | 1, 2, 3, 4 | yes | Both |


Proxy Support
:	Whether to enable proxy support for network operations such as HTTPs Boot.

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ProxySupport | Disabled, Enabled | yes | Both |


Proxy URL
:	The URL of the proxy server to use.

	!!! note ""
		Only available when `Proxy Support` is `Enabled`.


Wireless Auto Disconnection
:	Whether to automatically disconnect the wireless LAN connection when an Ethernet cable is connected to the system.

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| WirelessAutoDisconnection | Disabled, Enabled | yes | Both |


HTTPs Support
:	Enable/Disable IPv4 and IPv6 HTTPs Boot network stack.

	!!! note ""
		When `Disabled`, `HTTPs Boot` and `Lenovo Cloud Services` become unavailable. Also unavailable if `Secure Boot` is `Disabled`.

	Options:

	1. **Disabled** – Default.
	2. Enabled.


HTTPs Boot
:	This setting controls whether or not the system can boot over HTTPS. When enabled, additional configuration may be required. The HTTPS Boot and related settings are not configurable through WMI.

	Options:

	1. Enabled – the `HTTPs Boot Configuration` and `Tls Auth Configuration` will be shown for custom configuration.
	2. **Disabled** – Default.

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  | yes | Both |

	NO WMI -->


Lenovo Cloud Services
:
	!!! note ""
		Only available if `Secure Boot` is `Enabled`.

	Whether to boot system with `Lenovo Cloud` selected through boot menu, so that BIOS boots to Lenovo Cloud server directly, which provides various cloud services.

	Options:

	1. Enabled.
	2. **Disabled** – Default.

	!!! note ""
		Once the feature is enabled, then it becomes available for selection in `BIOS -> Startup -> Edit Boot Order`, or `BIOS -> Startup -> Network Boot`, or via F12 Boot Menu.<br><br /> When `Lenovo Cloud Services` booted, then following options will be available for selection:<br />

	- **Lenovo Cloud Deploy (ITC)** – sends Factory-Style images to customers for deployment in the field.

	Additional information: [Lenovo Cloud Deploy](https://www.lenovoclouddeploy.com/en/auth/welcome).

	- **Windows Virtual Desktop (VDI)** – provides the VDI environment to customer. VDI itself must be setup by the customer (IT Admin). If this option is selected, then it will become available as a boot option.

	Additional information is available here: [Client Virtualization & Infrastructure Solutions - Lenovo](https://www.lenovo.com/lt/lt/data-center/solutions/client-virtualization) and [Windows Virtual Desktop](https://www.microsoft.com/en-us/microsoft-365/blog/2019/09/30/windows-virtual-desktop-generally-available-worldwide/).

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  | yes | Both |
	-->



Win VDI Boot
:	Win VDI (Virtual Desktop Infrastructure) Boot.

	Whether to boot the system with `Win VDI Boot` selected through boot menu, so that BIOS boots to Lenovo Cloud server, to load VDI service.

	Options:

	1. Enabled.
	2. **Disabled** – Default.

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


Reinstall Windows From Cloud
:	Whether to enable Microsoft Bare Metal Recovery from the network.

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| ReinstallWindowsFromCloud | Disabled, Enabled | yes | Both |


BIOS Cloud Upgrade
:	Whether to allow BIOS firmware updates to be retrieved from the cloud.

	Options:

	1. **Disabled** – Default.
	2. Enabled.


## Boot Configuration

![Boot Configuration](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/httpsbootconfig.PNG)

Input the description
:	Input a label for new created URL, press `Enter`, and it will be displayed in the boot sequence menu.

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->


Internet Protocol
:	Select Internet Protocol to use for this HTTPs Boot option.

	Options:

	1. **Ipv4** – Default.
	2. Ipv6

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


Boot URL
:	A new Boot Option will be created according to this Boot URL.

	Accepts HTTPs URLs only.

	!!! note ""
		Use `Tls Auth Configuration` to import the CA (Certificate Authority) to support the HTTPs boot.

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


Custom URL
:	Whether to enable entering a custom Boot URL, instead of a default.

	Options:

	1. **Disabled** – Default.
	2. Enabled.

	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	| CustomUrl | Disable, Enable | yes | Both |


Delete HTTPs Boot Option from List
:	The list of HTTPs Boot options. <br>

	Select and press `Enter` to remove an EFI HTTPs boot option.

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


## Tls Auth Configuration ##

:	Visible only if `HTTPs Boot` has `Enabled` status.

	Press `Enter` to configure Server CA (Certificate Authority) for HTTPs Boot.

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->

Client CA Configuration
:	Press `Enter` to configure the Client CA (Certificate Authority) for HTTPs Boot.


## Wifi Configuration

![Wifi Config](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkstation/img/ts_wificonfig.PNG)

Automatic Connection Support
:	Whether to enable or disable automatic Wifi connection on every boot.

	1. Enabled
	2. **Disabled** - Default.

	<!--
	| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
	|:---|:---|:---|:---|
	|  |  |  | Both |
	-->


## Current Connection ##
:	View only.

	Shows Connection State, if the device is connected to a Wi-Fi network, or

	`No Connection.`

## Wi-Fi Scan ##
:	Press `Enter` to scan the available connections.

## Scanned List ##
:	Scanned Wi-Fi nodes for selection to connect.
