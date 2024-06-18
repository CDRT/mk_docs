# Network Setup #

![](./img/tc_network_setup_1.png)

<details><summary>Onboard Ethernet Controller</summary>

Options:

1.  **Enabled** - Default.
2.  Disabled.

!!! info ""
    Setting to `Disabled` also disables all [Intel (R) AMT](https://software.intel.com/sites/manageability/AMT_Implementation_and_Reference_Guide/default.htm) related functions.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| OnboardEthernetController | Disabled, Enabled | yes |


</details>

<details><summary>Wireless LAN Access</summary>

Controls access to WiFi.

Options:

1.  **Enabled** - Default.
2.  Disabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| WirelessLANAccess | Disabled, Enabled | yes |


</details>

<details><summary>Wireless LAN PXE boot</summary>

Whether to load Wireless LAN UNDI Driver to support wireless LAN PXE boot or HTTPS boot.

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| WirelessLANPXE | Disabled, Enabled | yes |


</details>


<details><summary>Wireless Auto Disconnection</summary>

Disable wireless LAN when onboard Ethernet is connected.

1.  **Disabled** - Default.
2.  Enable.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| WirelessAutoDisconnection | Disabled, Enabled | yes |


</details>

### Wireless Certified Information (display only) ###
<!-- SIMULATOR DOES NOT SUPPORT -->

<details><summary>PXE IPV4 Network Stack</summary>

Options:

1. **Disabled** - Default.
2. Enabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| PXEIPV4NetworkStack | Disabled, Enabled | yes |


</details>


<details><summary>PXE IPV6 Network Stack</summary>

Options:

1.  **Disabled** - Default.
2.  Enabled.

| WMI Setting name | Values | Locked by SVP |
|:---|:---|:---|
| PXEIPV6NetworkStack | Disabled, Enabled | yes |


</details>

<details><summary>HTTPS Support</summary>

IPV4 and IPV6 boot support.

Options:

2.  **Disabled** - Default.
1.  Enabled.

<!-- NO WMI -->


</details>


<details><summary>HTTPS Boot</summary>

Custom HTTPS boot.

Options:

1.  **Disabled** - Default.
2.  Enabled.

!!! info ""
    If enabled, `HTTPs Boot Configuration` and `Tls Auth Configuration` will be shown.

<!-- NO WMI -->

</details>

<details><summary>Lenovo Cloud Services</summary>

Whether `Lenovo Cloud` will be selected in boot menu, to boot from Lenovo Cloud server directly.

1.  **Disabled** - Default.
2. Enabled.

<!-- NO WMI -->

</details>

<details><summary>Win VDI Boot</summary>

When enabled, `Win VDI Boot` will be selected in boot menu, to boot from Lenovo Cloud server and load VDI service.

Options:

1. **Disabled** - Default.
2. Enabled.

<!-- NO WMI -->


</details>

## HTTPs Boot Configuration  ##

![](./img/thinkcentre_https_boot_configuration.png)

Create a new boot option based on a HTTPS URL.

!!! info ""
    Only one configuration can be entered at a time. The configuration will take effect after a system reboot.

<details><summary>Input the description</summary>

!!! info ""
    Press `Enter` to input a label for the newly created URL and it will be displayed in the boot sequence menu.

<!-- NO WMI -->


</details>

<details><summary>Internet Protocol</summary>

Options:

1.  **Ipv4** - enables IPV4. Default.
2.  Ipv6 - enables IPV6.

<!-- NO WMI -->


</details>

<details><summary>Boot URL</summary>

!!! info ""
    Use the `TLS Auth configuration` to import the CA to support the HTTPs boot 

<!-- NO WMI -->


</details>

### Delete HTTPs Boot Option from List ###

!!! info ""
    Select and press `Enter` to remove an EFI HTTPs boot option.

<!-- NO WMI -->

## TLS Auth Configuration ##


![](./img/thinkcentre_tls_auth_configuration.png)


Server CA configuration (display only).

!!! info ""
    Press `Enter` to select TLS auto configuration for HTTPS boot.

## WiFi Configuration ##

![](./img/tC_wifi_config.png)

<details><summary>Automatic Connection Support</summary>

Automatically connect to WiFi on boot.

Options:

1. **Disabled** - Default.
2. Enabled.

<!-- NO WMI -->


</details>

<details><summary>Current Connection (display only) </summary>

Displays the current WiFi connection.

</details>

<details><summary>Wi-Fi Scan </summary>

!!! info ""
    Press `Enter` to scan the available connections.

</details>

<details><summary>Scanned List (display only) </summary>

Scanned WiFi nodes.

</details>