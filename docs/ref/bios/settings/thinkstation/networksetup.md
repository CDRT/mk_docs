# Network Setup Settings #

### General ###
![](./img/ts_networksetup.png)
<!--![](./img/networksetup.png)-->

<details><summary>Onboard Ethernet Controller</summary>

Whether to enable the Onboard Ethernet Controller.

Options:

1. **Enabled** – Default.
2. Disabled.

!!! info ""
    When `Disabled`:<br>    •`PXE IPV4 Network Stack` setting becomes unavailable<br>    •`PXE IPV6 Network Stack` setting becomes unavailable

!!! info ""
    Intel only: if `Disabled`, Intel(R) AMT functions are disabled.

!!! info ""
    AMD only: if `Disabled`, DASH functions will be disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| OnboardEthernetController | Disabled, Enabled | yes | Both |
</details>

<details><summary>Wireless LAN Access</summary>

Whether Wireless LAN will be available in OS.

Options:

1. **Enabled** - Default.
2. Disabled.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| WirelessLANAccess | Disabled, Enabled | yes | Both |
</details>

<details><summary>Wireless LAN PXE boot</summary>

Whether to support wireless LAN PXE (Pre-boot Execution Environment) boot or HTTPs boot.

!!! info ""
    This works by loading the Wireless LAN (Local Area Network) UNDI (Universal Network Driver Interface) Driver.

1. Enabled.
2. **Disabled** – Default.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| WirelessLANPXE | Disabled, Enabled  | yes | Both |
</details>

### Wireless Certified Information ###

Wireless device information. View only.

!!! info ""
    Applicable only for platforms which have WLAN implemented.

<!-- NO WMI -->

<details><summary>PXE IPV4 Network Stack</summary>

Options:

1. **Enabled** – Default.
2. Disabled

!!! info ""
    Unavailable if `Onboard Ethernet Controller` is set to `Disabled`.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PXEIPV4NetworkStack | Disabled, Enabled | yes | Both |
</details>

<details><summary>PXE IPV6 Network Stack</summary>

Options:

1. **Enabled** – Default.
2. Disabled

!!! info ""
    Unavailable if `Onboard Ethernet Controller` is set to `Disabled`.

| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
| PXEIPV6NetworkStack | Disabled, Enabled | yes | Both |
</details>

<details><summary>HTTPs Boot</summary>
This setting controls whether or not the system can boot over HTTPS. When enabled, additional configuration may be required. The HTTPS Boot and related settings are not configurable through WMI.

Options:

1. Enabled – the `HTTPs Boot Configuration` and `Tls Auth Configuration` will be shown for custom configuration.
2. **Disabled** – Default.

<!-- 
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  | yes | Both |

NO WMI -->
</details>

<details><summary>Lenovo Cloud Services</summary>

!!! info ""
    Only available if `Secure Boot` is `Enabled`.

Whether to boot system with `Lenovo Cloud` selected through boot menu, so that BIOS boots to Lenovo Cloud server directly, which provides various cloud services.

Options:

1. Enabled.
2. **Disabled** – Default.

!!! info ""
    Once the feature is enabled, then it becomes available for selection in `BIOS -> Startup -> Edit Boot Order`, or `BIOS -> Startup -> Network Boot`, or via F12 Boot Menu.<br><br /> When `Lenovo Cloud Services` booted, then following options will be available for selection:<br />
•**Lenovo Cloud Deploy (ITC)** – sends Factory-Style images to customers for deployment in the field. <br /> Additional information: [Lenovo Cloud Deploy](https://www.lenovoclouddeploy.com/en/auth/welcome).<br /> •**Windows Virtual Desktop (VDI)** – provides the VDI environment to customer. VDI itself must be setup by the customer (IT Admin). If this option is selected, then it will become available as a boot option. <br /><br /> Additional information is available here: [Client Virtualization & Infrastructure Solutions - Lenovo](https://www.lenovo.com/lt/lt/data-center/solutions/client-virtualization) and [Windows Virtual Desktop](https://www.microsoft.com/en-us/microsoft-365/blog/2019/09/30/windows-virtual-desktop-generally-available-worldwide/).

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  | yes | Both |
-->
</details>


<details><summary>Win VDI Boot</summary>

Win VDI (Virtual Desktop Infrastructure) Boot.

Whether to boot the system with `Win VDI Boot` selected through boot menu, so that BIOS boots to Lenovo Cloud server, to load VDI service.

Options:

1. Enabled.
2. **Disabled** – Default.

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->
</details>

### HTTPs Boot Configuration ###

![](./img/httpsbootconfig.png) 

<details><summary>Input the description</summary>

Input a label for new created URL, press `Enter`, and it will be displayed in the boot sequence menu.

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->
</details>

<details><summary>Internet Protocol</summary>

Select Internet Protocol to use for this HTTPs Boot option.

Options:

1. **Ipv4** – Default.
2. Ipv6

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->
</details>

<details><summary>Boot URL</summary>

A new Boot Option will be created according to this Boot URL.

Accepts HTTPs URLs only.

!!! info ""
    Use `Tls Auth Configuration` to import the CA (Certificate Authority) to support the HTTPs boot.

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->
</details>

<details><summary>Delete HTTPs Boot Option from List</summary>

The list of HTTPs Boot options. <br>

Select and press `Enter` to remove an EFI HTTPs boot option.

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->
</details>

### Tls Auth Configuration ###

Visible only if `HTTPs Boot` has `Enabled` status.<br>

Press `Enter` to configure Server CA (Certificate Authority) for HTTPs Boot. 

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->

### Wi-Fi Configuration ###

![](./img/ts_wificonfig.png)

<details><summary>Automatic Connection Support</summary>

Whether to enable or disable automatic Wifi connection on every boot.

1. Enabled
2. **Disabled** - Default.

<!--
| WMI Setting name | Values | SVP / SMP Req'd | AMD/Intel |
|:---|:---|:---|:---|
|  |  |  | Both |
-->
</details>

### Current Connection ###

View only.

Shows Connection State, if the device is connected to a Wi-Fi network, or

`No Connection.`

### Wi-Fi Scan ###

Press `Enter` to scan the available connections.

### Scanned List ###

Scanned Wi-Fi nodes for selection to connect.
