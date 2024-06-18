# Introduction

This document will provide collected details about the various Lenovo docks that use USB, USB-C, OneLink or Thunderbolt ports for connectivity to the PC. The intended audience for this document is the IT Administrator tasked with deploying these devices into their enterprise environment. Details will include specifications, driver deployment, firmware updates and hints/tips for managing and using these docks.

## Overview and General Information

You can use the navigation menu on the left side of this page to find:

- **Current driver links for your dock**
- **List of ports available on your dock**
- **Display capabilities for your dock**

Also in this document you will find information that affects deployment options for the dock that you are using, which include:

- **BIOS options that affect the dock that your organization is using**
- **Deployment specific information for your dock**
- **Does your dock support PXE booting?**
- **What (if any) configuration is necessary for PXE**

## General Deployment Information

The information below pertains to deploying Windows 7 and Windows 10 on Lenovo’s enterprise class Think branded laptops using Lenovo's docking solutions. Each family of docks has at least one corresponding Ethernet adapter or Ethernet + video adapter. The basic information in this guide applies to those devices as well.

!!! info ""
   With modern docking solutions, it is critical to the docking experience to ensure several components on the attached system are up to date. Therefore it is important to focus on these other components as well as the individual dock firmware and drivers when deploying and maintaing these solutions. To simplify finding the appropriate content use the [Docking tab on the Driver and Software Matrix for Admins](https://download.lenovo.com/cdrt/tools/drivermatrix/dm_2.html#Docking).

The base process for deployments via the Lenovo docks and dongles all require:

   1. Latest BIOS/UEFI system firmware on the target laptop
    - System BIOS updates available for each model at [Lenovo Support](https://support.lenovo.com/us/en/)
    - If you are interested in deploying BIOS updates during deployment, a guide on configuring and deploying BIOS can be found [here](https://bit.ly/CDRT-BIOS).
   2. Latest Intel ME firmware and software
    - Intel ME is often overlooked as a contributing component in the docking experience.
    - Depending on the target system, some Intel ME firmware updates may not support unattended deployment.
   3. Appropriate Thunderbolt Port Firmware for ThinkPad models with Thunderbolt 3 port(s)
    - **Appropriate updates for each model referenced** [on this page](https://support.lenovo.com/us/en/solutions/HT508988).
    - Depending on the target system, unattended deployment may not be supported
   4. Latest Firmware applied to the dock
    - Use the [Dock Reference Guide](https://pcsupport.lenovo.com/us/en/solutions/pd014572) to locate appropriate dock firmware updates
    - **Dock firmware update packages designed for enterprise deployments can also be found** [here](https://pcsupport.lenovo.com/us/en/downloads/DS540663).
   5. Appropriate WinPE network driver in your boot image for the specific dock
    - See Deployment Recipe for the appropriate dock below
   6. Appropriate Lenovo Software for your specific dock
    - See Deployment Recipe for the appropriate dock below

This document may make references to deployment tools such as Microsoft’s System Center Configuration Manager (SCCM) and Microsoft Deployment Toolkit (MDT). However, the overall concepts should apply to most Operating System Deployment (OSD) tools in use today.

Use the table below to find the appropriate WinPE driver for your dock:

| Docks                                                                                                                                                                                          | WinPE Driver       |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------|
| USB-C Dock<br/>  USB-C Travel Hub<br/>  Thunderbolt Dock<br/>  Hybrid USB-C with USB-A Dock<br/>  OneLink Dock<br/>  OneLink+ Dock<br/>  OneLink+ to RJ45 Adapter<br/>  3-in-1 ThinkPad<br/> OneLink Adapter <br/> USB 3.0 Ethernet Adapter <br/>USB-C to Ethernet Adapter  | [Realtek USB Driver](https://pcsupport.lenovo.com/us/en/downloads/ds504778) |
| USB 3.0 Basic Dock<br/>  USB 3.0 Pro Dock<br/>  USB 3.0 Ultra Dock                                                                                                                                       | [DisplayLink Driver](https://pcsupport.lenovo.com/solutions/HT104480) |

You will also need the appropriate driver for the version of Windows (links provided below in deployment recipe table for each dock) that you are deploying.

| MDT                                                                                                                                                                                                                       | SCCM                                                                                                                                                                                                                      |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Make sure the driver is included in the  "Out of box" driver folder for your specific  system. If you are utilizing an alternate driver  deployment method make sure to include the  RealTek USB driver in your solution. | Make sure the driver is included in the  "Driver Package" for your specific system.  Again, if you are utilizing an alternate  method of driver deployment make sure to  include the Realtek USB driver in your solution. |

## Using Docking WMI Queries

Each USB Dock or Cable Dock listed below has one or more WMI queries to assist with identifying a dock during deployment. These queries will allow an administrator to apply the correct docking solution driver installation package to a system. The provided PNPIDs can be utilized in a query against the Win32_PNPEntity class in the Root\cimv2 namespace while the dock is attached to the system. Since certain Ethernet devices may appear on multiple dock models, the preferred component to target is the Billboard Device which will appear under Universal Serial Bus devices in Device Manager whenever a dock is attached. The hardware ID of this device will be unique per dock model.

An example of the query for a ThinkPad Thunderbolt 3 Essential Dock using the DeviceID of the Billboard device would look like:

PowerShell:

```powershell
Get-CimInstance -Namespace ROOT\CIMv2 -ClassName Win32_PNPEntity | Where-Object {$_.DeviceID -LIKE "USB\VID_17EF&PID_308D"}
```

WQL*:

```wql
SELECT * FROM Win32_PNPEntity WHERE DeviceID LIKE "USB\\VID_17EF&PID_308D"
```

!!! info ""
   WQL requires a second “\” character to escape the first “\” character so it is processed as part of the search string.

### Deployment Related BIOS Settings

As each new Intel chipset is released the new capabilities of each platform are reflected through changes in available BIOS settings. Below are the deployment related settings for three previous Intel chipset platforms that will affect deploying via Lenovo docking solutions.

#### Broadwell

Intel 5th generation processors with CPU designation i3-5xxx, i5-5xxx, i7-5xxx

- USB 3.0 supported on all Broadwell models.

!!! info ""
    If you are deploying via one of our USB 3.0 docks, the default setting of "Auto" for USB 3.0 Mode should allow you to successfully deploy Windows 7, Windows 8.1. and Windows 10.

- OneLink/OneLink+ docks supported only on models with either OneLink or OneLink+ port.

!!! info ""
    There are no Default BIOS settings that affect OneLink and OneLink+ docks.

![USB 3.0](https://cdrt.github.io/mk_docs/img/guides/docks/img1.PNG)

#### Skylake

Intel 6th generation processors with CPU designation i3-6xxx, i5-6xxx, i7-6xxx

- USB 3.0 docks supported on all Skylake systems.
- OneLink+ docks supported on models with OneLink+ port.  

![MAC Address Passthru](https://cdrt.github.io/mk_docs/img/guides/docks/img2.PNG)

| Skylake Exceptions |           |               |                          |
|--------------------|-----------|---------------|--------------------------|
| Model              | USB-C     | Thunderbolt 3 | MAC Address Pass-Through |
| ThinkPad 13        | Supported | Not Supported | * Supported              |
| ThinkPad P50       | Supported | Supported     | Not Supported            |
| ThinkPad P70       | Supported | Supported     | Not Supported            |

!!! alert ""
    Requires BIOS R0CET28W – Ver. 1.16 or newer for Mac Address Pass-Through

On ThinkPad 13 systems, when MAC Address PassThrough is Enabled you will still need the Realtek NIC driver as it is actually "cloning" (or passing through) the laptop's built-in Intel NIC card's MAC Address. OSD deployments in SCCM are generally targeted to the "unknown computers" collection which is determined by MAC Address up to version 1610 which allows you to Manage Duplicate Identifiers. Whether you have configured SCCM to use an alternate Identifier or not, MAC Address Pass-Through setting allows you to use the same dock for multiple deployments over time. This setting is also suggested for pushing software updates because it will allow management of the system even when it is not docked.

#### Kaby Lake

Intel 7th generation processors with CPU designation i3-7xxx, i5-7xxx, i7-7xxx

- USB 3.0 docks supported on all Kaby Lake systems.
- USB-C docks supported on Kaby Lake systems with USB-C or Thunderbolt ports.
- Thunderbolt 3 docks supported on systems with Thunderbolt ports.

When MAC Address PassThrough is Enabled you will still need the Realtek NIC driver as it is actually "cloning" (or passing through) the laptop's built-in Intel NIC card's MAC Address. OSD deployments in SCCM are generally targeted to the "unknown computers" collection which is determined by MAC Address up to version 1610 which allows you to Manage Duplicate Identifiers. Whether you have configured SCCM to use an alternate Identifier or not MAC Address Pass-Through setting allows you to use the same dock for multiple deployments over time. This setting is also suggested for pushing software updates etc. Because it will allow management of the system even when it is not docked.  

![MAC Address Passthru](https://cdrt.github.io/mk_docs/img/guides/docks/img4.PNG)

!!! info ""
    Power Pass-Through on Skylake ThinkPad 13 is not supported with USB-C dock. The dock will charge the system with the supplied power adapter but you cannot power the system on or off via the dock's power switch.

## ThinkPad Universal Thunderbolt 4 Dock (40B0)

The ThinkPad® Universal Thunderbolt™ 4 Dock (40B0) is engineered to expand into new horizons. Bringing forth the next generation of Intel® Thunderbolt™ technology, packed with game-changing features like support for 8K @ 30 Hz display, Intel® vPro® functionality support (*1), smart remote manageability, and dynamic power charging up to 100W. The ThinkPad Universal Thunderbolt™ 4 Dock truly is the pinnacle of premium docking.

### Features

- One Cable. All Your Needs: A single Thunderbolt™ cable is all you need to take your productivity to new heights. Adding an 8K @ 30 Hz display or up to four 4K @ 60 Hz displays, lightning-fast 40 Gbps transfer speeds, vPro® pass-through support, and enhanced dynamic power charging up to 100W. You can do it all with the ThinkPad® Universal Thunderbolt™ 4 Dock.
- Compatibility. Made Limitless: Freedom is the key to productivity. That’s why we’ve engineered the ThinkPad Thunderbolt™ 4 Dock to be limitlessly adaptable — supporting up to 100W PD and unrivaled performance on all Thunderbolt™ 3 and 4, USB 4, and USB-C Windows-based systems (*2).
- Remote Management. But Smarter: Remote dock management just got a whole lot smarter. Thanks to Lenovo Dock Manager and our latest hardware, firmware updates can be done without any end-user interruption, which means productivity is never compromised.

**Notes**:

1. Intel® Active Management Technology capable with select 11th Generation Intel® Core™ vPro® processor-based PCs only.
2. Lenovo USB-C & Thunderbolt™ Docks function with notebooks that support industry standard USB-C Alt-Mode or Thunderbolt™ protocols through their Type-C™ port. Lenovo USB-C and Thunderbolt™ Docks support additional features, such as MAC address passthrough, WOL and mirrored power button, on most Lenovo ThinkPad notebooks, but such features may not be available on certain other Lenovo notebooks or non-Lenovo branded notebook systems.

[>> More Information & Drivers](https://support.lenovo.com/us/en/solutions/pd500503)

![](https://cdrt.github.io/mk_docs/img/guides/docks/utbt4-2.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/utbt4-3.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622)

### Connectivity

>Front ports:<br/>
>
> - 1 USB 3.0<br/>
> - 1 Thunderbolt<br/>
> - 1 3.5mm Audio Headphone/Mic combo jack<br/>
>
>Rear ports:<br/>
>
> - 3 USB 3.0 <br/>
> - 2 DisplayPort 1.4<br/>
> - 1 HDMI 2.1<br/>
> - 1 Thunderbolt - To Computer with power<br/>
> - 1 Thunderbolt - To device<br/>
> - 1 Ethernet<br/>
> - 1 135W AC power input<br/>

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="11" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="4" class="tdDT">
<h5>Query: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">PCI\VEN_8086&DEV_5502 </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_30BB</td>
</tr>
<tr>
<td class="tdDT">Billboard </td>
<td class="depTableFont">USB\VID_17EF&PID_30B5</td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/accessories/pd500503" target="_blank">https://pcsupport.lenovo.com/accessories/pd500503</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/accessories/pd500503" target="_blank">https://pcsupport.lenovo.com/accessories/pd500503</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD deployment<br></td>
</tr>
</tr>
</td></tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application ( tbt4_grdockdriver_v1006.exe /VERYSILENT ) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence ( tbt4_grdockdriver_v1006.exe /VERYSILENT )
<br> <b>*Restart required*</b> </td>
</tr>
</table>

## ThinkPad Thunderbolt 3 Essential Dock (40AV0135)

The Lenovo Thunderbolt 3 Essential Dock (40AV), powered by Intel’s Thunderbolt 3 technology, is designed to boost your productivity with dual 4k displays, blazing-fast 10Gbps data rates, and a range of optimized ports. A single 65W power cable connected to a Thunderbolt or USB-C notebook is all you need to get to work.

### Features

- Single Cable Convenience: One cable connection delivers data, display and power to USB-c or Thunderbolt systems
- High Performance: Enjoy Dual 4K displays and blazing-fast 10Gbps data transfer rates with Intel Thunderbolt 3 technology inside
- Enterprise IT ready: Advanced network security and management features as PXE boot, WOL and MAC address pass thru on selected ThinkPad Notebooks.

[>> More Information & Drivers](https://support.lenovo.com/us/en/solutions/pd500373)

![](https://cdrt.github.io/mk_docs/img/guides/docks/tbe1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/tbe2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Lenovo%20Thunderbolt%203%20Essential%20Dock)

### Connectivity

>Front ports:<br/>
>
> - 1 USB 3.0<br/>
> - 1 Thunderbolt 3<bt/>
> - 1 Headphone/Mic<br/>
>
>Rear ports:<br/>
>
> - 1 USB 3.0 with full-time power<br/>
> - 1 DisplayPort<br/>
> - 1 HDMI<br/>
> - 1 Thunderbolt 3 - To Computer with power<br/>
> - 1 Thunderbolt 3<br/>
> - 1 Ethernet<br/>

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="11" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="4" class="tdDT">
<h5>Query: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_3082 </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_3092&MI_00</td>
</tr>
<tr>
<td class="tdDT">Billboard </td>
<td class="depTableFont">USB\VID_17EF&PID_308D</td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/solutions/ht101981" target="_blank">https://pcsupport.lenovo.com/us/en/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href=https://pcsupport.lenovo.com/downloads/DS542694" target="_blank">https://pcsupport.lenovo.com/us/en/downloads/ds542694-driver-for-windows-10-64-bit-lenovo-thunderbolt-3-essential-dock</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD deployment<br></td>
</tr>
</tr>
</td></tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (tbt_es_dock_driver_v1006.exe /VERYSILENT) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence (tbt_es_dock_driver_v1006.exe /VERYSILENT)
<br> <b>*Restart required*</b> </td>
</tr>
</table>

## ThinkPad Thunderbolt 3 Workstation Dock (40AN0170, 40AN0230) / ThinkPad Thunderbolt 3 Dock Gen 2 (40AN0135)

This Intel® Thunderbolt™ Chipset powered Thunderbolt Dock Gen 2 (40AN) invented to boost productivity with extended compatibility on both USB-C and Thunderbolt enabled laptop. Expand your horizons with multiple 4K displays, and transfer files at record speed. It’s everything you need to enhance your creativity and efficiency today. Maximize Your Productivity with a Thunderbolt 3 Dock. Powerful, versatile and incredibly fast!

### Features

- Expand compatibility on USB-C and Thunderbolt systems
- Dual UHD Displays provide the best video experience
- Enhanced performance with professional video solution and exclusive network manageability

[>> More Information & Drivers](https://pcsupport.lenovo.com/us/en/solutions/pd500265)

![](https://cdrt.github.io/mk_docs/img/guides/docks/twd1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/twd2.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/twd3.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Thunderbolt%203%20Workstation%20Dock%20Gen%202)

### Connectivity

>Front ports:
>
> - 1 USB 3.0
> - 1 Thunderbolt 3
> - 1 Headphone/Mic
>
>Rear ports:
>
> - 4 USB 3.0 - 1 with full-time power
> - 2 DisplayPort
> - 2 HDMI
> - 1 Thunderbolt - To Computer with power
> - 1 Ethernet

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="11" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="4" class="tdDT">
<h5>Query: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_3082 </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_3083 </td>
</tr>
<tr>
<td class="tdDT">Billboard </td>
<td class="depTableFont">USB\VID_2109&PID_8887</td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/solutions/ht101981" target="_blank">https://pcsupport.lenovo.com/us/en/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/us/en/downloads/DS505148" target="_blank">https://pcsupport.lenovo.com/us/en/downloads/DS505148</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/us/en/downloads/DS540663" target="_blank">https://pcsupport.lenovo.com/us/en/downloads/DS540663</a><br>We do not recommend deploying firmware updates during OSD deployment<br></td>
</tr>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>&nbsp;&nbsp;&nbsp;As Application(thinkpad_tbt3_gen2_ws_dock_driver_10016.exe /VERYSILENT/NORESTART) <br><br>
<b>SCCM</b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence (thinkpad_tbt3_gen2_ws_dock_driver_10016.exe /VERYSILENT/NORESTART)
<br> <b>*Restart required*</b> </td></tr>
</table>

## ThinkPad Thunderbolt 3 Dock (PN 40AC0135)

The ThinkPad Thunderbolt 3 Dock is an unmatched docking solution powered by Intel Thunderbolt 3 technology. All together 13 ports available enables you to connect all your devices while rapidly charging your system via the USB Type-C port. It delivers conclusive 4K video performance with lightning fast data transfer. Having your most productive and space saving workstation as simple as connecting your notebook or tablet to the ThinkPad Thunderbolt 3 Dock.

[>> More Information & Drivers](https://support.lenovo.com/accessories/ACC100356)

![](https://cdrt.github.io/mk_docs/img/guides/docks/t3d1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/t3d2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Thunderbolt%203%20Workstation%20Dock)

### Connectivity

>Front Ports
>
> - 1 USB 3.0
> - 1 Thunderbolt 3
> - 1 Headphone/Mic
>
>Rear
>
> - 4 USB 3.0 - 1 with full-time power
> - 2 DisplayPort
> - 1 HDMI
> - 1 VGA
> - 1 Thunderbolt - To Computer
> - 1 Ethernet

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="11" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="4" class="tdDT">
<h5>Query: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_3069 </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_306A </td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht101981" target="_blank">https://support.lenovo.com/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/us/en/downloads/DS501904" target="_blank">https://pcsupport.lenovo.com/us/en/downloads/DS501904</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD deployment<br><br><a href="https://pcsupport.lenovo.com/us/en/downloads/DS540663" target="_blank">https://pcsupport.lenovo.com/us/en/downloads/DS540663</a></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (thinkpad_thunderbolt-3_dock_and_usb-c_dock_driver_v10017.exe
/VERYSILENT /NORESTART) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence
(thinkpad_thunderbolt-3_dock_and_usb-c_dock_driver_v10017.exe /VERYSILENT /NORESTART)
<br><b> *Restart required*</b></td>
</tr>
</table>

## ThinkPad Universal USB-C Smart Dock (40B20135)

ThinkPad Universal USB-C Smart Dock (40B2) is designed to enhance everyday productivity. The Lenovo™ ThinkPad® Universal USB-C Smart Dock (40B2) is at the cutting edge of our new series of docks offering a smarter way to work. A bridge to a more intelligent future, the dock features a rich array of data, display, and power ports, including universal USB-C compatibility, while driving incredible performance for commercial users and a secure cloud-based management solution for IT managers. And it’s all powered by Microsoft Azure Sphere.

### Features

- One Cable For All Your Needs: Get more from your workday by adding 11+ expansion possibilities in a single quick-release cable for maximum efficiency. Expand your creative potential with access to multiple 4K monitors, and blazing-fast data transfers with USB-C and USB-A. Plus, rapid-charging for your laptops up to 100W so you can remain energized at all time.
- Universal Dock Compatibility: Boost the value of your investment with the broad compatibility of the ThinkPad Universal USB-C Smart Dock. Supporting both Thunderbolt™ 3 and 4, USB 4™ and USB-C, and extended compatibility in a Multi-OS environment;
- Streamlined Dock Management: Break free from the old docking paradigm and streamline your management workflow with a range of time-saving innovations. With the ThinkPad Universal USB-C Smart Dock, you can remotely update its firmware without a connected PC, remotely manage ports, conduct data analytics, utilize diagnostic tools, and keep your system safe with Microsoft Azure Sphere security solution.

[>> More Information & Drivers](https://support.lenovo.com/us/en/accessories/acc500253)

![](https://cdrt.github.io/mk_docs/img/guides/docks/uusbcsd1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/uusbcsd2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Hybrid%20Dock)

### Connectivity

> Front ports:
>
> - 1 USB 3.0
> - 1 USB-C
> - 1 3.5mm Audio Headphone/Mic combo jack
>
> Rear ports:
>
> - 2 USB 3.2 Gen 2
> - 2 USB 2.0
> - 2 DisplayPort
> - 1 HDMI
> - 1 Thunderbolt - To Computer with power
> - 1 Ethernet
> - 1 135W AC power input

### Deployment

<table class="deploymentTable">
<tr>
<td class="tdDT" rowspan="12" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
</tr>
<tr>
<td rowspan="5" class="tdDT">
<h5>Query: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_0BDA&PID_8153</td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_30B0&MI_00 </td>
</tr>
<tr>
<td class="tdDT">Billboard </td>
<td class="depTableFont">USB\VID_17EF&PID_30CA&MI_00 </td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/accessories/acc500253" target="_blank"> https://pcsupport.lenovo.com/accessories/acc500253</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/accessories/acc500253"
	target="_blank">https://pcsupport.lenovo.com/accessories/acc500253</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br><br><a href="https://pcsupport.lenovo.com/us/en/downloads/DS504448" target="_blank">https://pcsupport.lenovo.com/us/en/downloads/DS504448</a></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application ( u3etn09w.exe /VERYSILENT) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence
(u3etn09w.exe /VERYSILENT)
<br> <b>*Restart required*</b> </td>
</tr>
</table>

## ThinkPad Hybrid USB-C with USB-A Dock (PN 40AF0135)

The ThinkPad Hybrid USB-C with USB-A Dock (40AF) expands the capabilities of most any laptop, new or old, making it perfect for enterprise customers with mixed-PC or shared-desk environments. Featuring enterprise-class manageability like PXE boot and MAC address Pass-through the ThinkPad Hybrid USB-C with USB-A offers three high-speed USB3.1 ports, up to dual UHD 4K resolution and rapid charging on ThinkPad notebooks. And, with the included USB-C to USB-A adaptor it can also provide port replication to non-Lenovo or USB-C notebooks.

[>> More Information & Drivers](https://support.lenovo.com/us/en/solutions/PD500180)

![](https://cdrt.github.io/mk_docs/img/guides/docks/husbca1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/husbca3.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Hybrid%20Dock)

### Connectivity

> - Docking interface: USB-C cable with USB-C to USB-A dongle
> - 2 x DisplayPort, 2 x HDMI
> - 3 x USB-A gen2, 1 x USB-C gen2, 2 x USB2.0
> - 10/100/1000 Gigabit Ethernet
> - 1 x Audio combo Jack

### Deployment

<table class="deploymentTable">
<tr>
<td class="tdDT" rowspan="12" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
</tr>
<tr>
<td rowspan="5" class="tdDT">
<h5>Query: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_A359 </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_6015 </td>
</tr>
<tr>
<td class="tdDT">Display</td>
<td class="depTableFont">USB\VID_17EF&PID_6015 </td>
</tr>
<tr>
<td class="tdDT">Billboard </td>
<td class="depTableFont">USB\VID_17EF&PID_A354 </td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht101981" target="_blank"> https://pcsupport.lenovo.com/us/en/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://support.lenovo.com/us/en/downloads/DS502119"
	target="_blank">https://support.lenovo.com/us/en/downloads/DS502119</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br><br><a href="https://pcsupport.lenovo.com/us/en/downloads/DS504448" target="_blank">https://pcsupport.lenovo.com/us/en/downloads/DS504448</a></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (thinkpad_hybrid_usb-c_with_usb-a_dock_driver_web_v1.0.0.21.exe
/VERYSILENT /NORESTART) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence
(thinkpad_hybrid_usb-c_with_usb-a_dock_driver_web_v1.0.0.21.exe /VERYSILENT /NORESTART)
<br> <b>*Restart required*</b> </td>
</tr>
</table>

## ThinkPad USB-C Dock Gen 2 (PN 40AS0090)

The ThinkPad USB-C Dock Gen 2 (40AS) is the next generation of USB-C one-cable universal docking solutions for ThinkPad devices. The ThinkPad USB-C Dock Gen 2 supports vivid 4K displays or multiple 1080p screens, will charge your notebook, connect legacy USB peripherals, has a wired network port, and will rapidly charge your mobile devices.

[>> More Information & Drivers](https://support.lenovo.com/us/en/solutions/ACC500106)

![](https://cdrt.github.io/mk_docs/img/guides/docks/usbc2g1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/usbc2g2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#USB-C%20dock%20Gen%202)

### Connectivity

>Front Ports:
>
> - 1 USB 3.1
> - 1 USB-C
> - 1 Headphone / Mic
>
>Rear Ports:
>
> - 2 USB 3.1 – 1 with full time power
> - 2 USB 2.0
> - 2 Display
> - 1 HDMI
> - 1 USB-C – To Computer
> - 1 Ethernet

### Deployment

<table class="deploymentTable">
<tr>
<td class="tdDT" rowspan="11" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
</tr>
<tr>
<td rowspan="3" class="tdDT">
<h5>Query: </h5>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_A387 </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_A396 </td>
</tr>
<tr>
<td class="tdDT">Billboard</td>
<td class="depTableFont">USB\VID_17EF&PID_A38F </td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a
href="https://download.lenovo.com/km/media/attachment/USBCG2.zip" target="_blank">
https://download.lenovo.com/km/media/attachment/USBCG2.zip</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/us/en/downloads/DS539091"
target="_blank">https://pcsupport.lenovo.com/us/en/downloads/DS539091</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br><br><a href="http://pcsupport.lenovo.com/us/en/downloads/DS539092"
target="_blank">http://pcsupport.lenovo.com/us/en/downloads/DS539092</a></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;Deploy as Application:
<br>&nbsp;&nbsp;&nbsp;thinkpad_usb-c_dock_gen2_drivers_v1.0.3.03241.exe /VERYSILENT
/NORESTART <br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy as Package in task
sequence:<br>&nbsp;&nbsp;&nbsp; thinkpad_usb-c_dock_gen2_drivers_v1.0.3.03241.exe
/VERYSILENT /NORESTART
<br> <b>*Restart required*</b> </td>
</tr>
</table>

## ThinkPad USB-C Dock (PN 40A90090)

The ThinkPad USB-C Dock is a new universal docking solution ensuring a productive workstation. Experience all your productivity needs including video, data, and wired network all while delivering continuous power to your laptop via a robust USB Type-C port. Simply connect your laptop or tablet with the dock and boost your productivity in no time. Single UHD display30Hz or dual FHD displays allows you to enjoy a vivid video experience.

[>> More Information & Drivers](https://support.lenovo.com/accessories/ACC100348)

![](https://cdrt.github.io/mk_docs/img/guides/docks/usbc1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/usbc2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#USB-C%20dock)

### Connectivity

> - 3x USB 3.0 – 1 provide always-on mobile device charging
> - 2x USB 2.0
> - 1x USB-C upstream connector
> - 1x VGA
> - 2x DP
> - 1x Gigabit Ethernet
> - 1x Stereo/Mic Combo Port
> - 1 x Security lock slot

### Deployment

<table class="deploymentTable">
<tr>
<td class="tdDT" rowspan="12" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
</tr>
<tr>
<td rowspan="3" class="tdDT">
<h5>WMI PNP Query String: </h5>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_3062 </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_3063 </td>
</tr>
<tr>
<td class="tdDT">Billboard</td>
<td class="depTableFont">USB\VID_17EF&PID_3060 </td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht101981"
target="_blank"> https://support.lenovo.com/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/downloads/DS501902"
target="_blank">https://pcsupport.lenovo.com/downloads/DS501902</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br><br><a href="https://support.lenovo.com/us/en/downloads/DS501903"
target="_blank">https://support.lenovo.com/us/en/downloads/DS501903</a></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (thinkpad_thunderbolt-3_dock_and_usb-c_dock_driver_v10017.exe
/VERYSILENT /NORESTART) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence
(thinkpad_thunderbolt-3_dock_and_usb-c_dock_driver_v10017.exe /VERYSILENT /NORESTART)
<br> <b>*Restart required*</b> </td>
</tr>
</table>

## ThinkPad OneLink+ Dock (PN 40A40090)

The ThinkPad OneLink+ Dock, powered by Lenovo’s revolutionary OneLink+ technology transforms your new ThinkPad into a full featured machine in the office or at home. Not only does the new convenient OneLink+ connector deliver super-fast data transfers with USB 3.0 and up to Ultra High Definition (UHD) video but it also charges your notebook, cell phone and tablet while you work or play!

Unlike USB docks the OneLink+ Dock delivers video with no compression, no drivers and no impact on image quality and notebook performance. Simply connect your notebook with the ThinkPad OneLink+ Dock and get connected to power, Internet and workplace accessories through a convenient single connector. Expect nothing short of outstanding value with connections for two external displays, a keyboard, a mouse, and a printer. It also comes with a ThinkPad 90w slim tip AC Adapter.

The docking station comes equipped with a stereo/microphone combination audio port and 2x USB 3.0 ports on the front panel with one of those as an “always (power) on” port for mobile device charging. The rear panel has 2x USB 2.0 ports and 2x USB 3.0 ports, allowing for maximum device connectivity. The OneLink+ dock also comes with a 10/1000 Gigabit Ethernet port, one VGA port, and two DisplayPort 1.2 ports for up to 3 video outputs* with a maximum 4k2k resolution (3840 x 2160). For security, the dock can be secured via a cable lock.

[>> More Information & Drivers](https://support.lenovo.com/solutions/acc100252)

![](https://cdrt.github.io/mk_docs/img/guides/docks/olp2.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/olp1.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#OneLink+%20Dock)

### Connectivity

> - 4x USB 3.0 – 1 provide always-on mobile device charging
> - 2x USB 2.0
> - 1x OneLink+ upstream connector
> - 2x DP
> - 1x VGA
> - 1x Gigabit Ethernet
> - 1x Stereo/Mic Combo Port
> - 1 x Security lock hole
> - 1x DC in

### Deployment

<table class="deploymentTable">
<tr>
<td class="tdDT" rowspan="11" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
</tr>
<tr>
<td rowspan="2" class="tdDT">
<h5>WMI PNP Query String: </h5>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_3054</td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_3055 </td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht101981"
target="_blank"> https://support.lenovo.com/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/documents/ACC100252"
target="_blank">https://pcsupport.lenovo.com/documents/ACC100252</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br><br><a href="https://pcsupport.lenovo.com/documents/ACC100252"
target="_blank">https://pcsupport.lenovo.com/documents/ACC100252</a></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (tp_onelink_driver.exe
/VERYSILENT /NORESTART) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence
(tp_onelink_driver.exe /VERYSILENT /NORESTART)
<br> <b>*Restart required*</b> </td>
</tr>
</table>

## ThinkPad OneLink Pro Dock (PN 4X10E52935)

The ThinkPad OneLink Pro Dock, powered by Lenovo’s revolutionary OneLink technology transforms your new ThinkPad into a full featured machine in the office or at home. Unlike USB docks the OneLink Pro Dock delivers video with no compression, no drivers and no impact on image quality and notebook performance. Simply connect your notebook into the ThinkPad Pro Dock and get connected to power, Internet and workplace accessories through a convenient single connector. Expect nothing short of outstanding value with an included ThinkPad 90w slim tip AC Adapter, connections for two external displays, a keyboard, a mouse and a printer. The docking station comes equipped with a stereo/microphone combination audio port and 2x USB 3.0 ports on the front panel, one of the USB port is always-power on for mobile device charging. Meanwhile, the rear panel has 2x USB 2.0 ports and 2x USB 3.0 ports, allowing for maximum device connectivity. The pro dock also comes with a 10/1000 Gigabit Ethernet port and a DisplayPort 1.2 for full dual video output with a maximum resolution of 2560 x 1600. For security, the dock can be secured via a cable lock.

[>> More Information & Drivers](https://support.lenovo.com/solutions/pd029981)

![](https://cdrt.github.io/mk_docs/img/guides/docks/olpro1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/olpro2.png)

### Display Capabilities

Maximum resolution of 1920x1200 supported if second monitor is attached to DVI output. Full Dual video output is supported on ThinkPads with DisplayPort 1.2. 

ThinkPads with DisplayPort 1.1(ThinkPad Edge E431/E531/S431/S531) have some limitations with video output configurations.

Gigabit Ethernet by USB, installing a driver may be required.

### Connectivity

>Front ports:
>
> - 2x USB 3.0 (One with Always-On Mobile Device Charging) - Ideal for use with memory keys, hard drives and other quick access devices.
> - Stereo / Mic Combo Audio Port
>
>Rear ports:
>
> - 2x USB 2.0 - Ideal for most USB devices, including printers, keyboards, and mice.
> - 2x USB 3.0 – great for backup hard drives and other high speed USB accessories which you usually leave at your desk
> - DisplayPort with maximum resolution 2560x1600*
> - DVI-I with maximum 1920x1200 resolution and DVI to VGA adapter included in the box
> - Gigabit Ethernet (10/100/1000) with Boot over LAN support on selected systems**
> - Gigabit Ethernet (10/100/1000) with Boot over LAN support on selected systems**
> - Cable lock slot for physical security on the side of the ThinkPad OneLink dock
> - Includes 90W AC adapter (slim tip) to support charging your notebook

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="10" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="3" class="tdDT">
<h5>WMI PNP Query String: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17EF&PID_304F </td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_304E </td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht101981"
target="_blank">https://support.lenovo.com/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/pd029981"
target="_blank">https://support.lenovo.com/solutions/pd029981</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br><br><a href="https://support.lenovo.com/id/en/solutions/pd029981"
target="_blank">https://support.lenovo.com/id/en/solutions/pd029981</a>
<a href=""></a>
</td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (tp_onelink_driver.exe -s) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence
(tp_onelink_driver.exe -s)</td>
</tr>
</table>

## ThinkPad OneLink Dock (PN 4X10A06077)

The dock is a portable expansion module that enables you to easily connect your notebook computer to the Ethernet and multiple devices, such as a High Definition Multimedia Interface (HDMI) monitor or projector, a headset and microphone combo jack, and Universal Serial Bus (USB) devices. It provides two USB 3.0 connectors for higher bandwidth and better performance, and two USB 2.0 connectors for common USB devices. The dock also supports Gigabit Ethernet speed when you connect it to networks.

[>> More Information & Drivers](https://pcsupport.lenovo.com/accessories/PD026944)

![](https://cdrt.github.io/mk_docs/img/guides/docks/ol1.png)

[User Guide](https://download.lenovo.com/pccbbs/options/tp_onelink_dock_ug_en_sp40a02137.pdf)

### Display Capabilities

**Extend Mode:** When the dock is in extended mode, it splits your display across two monitors. Your notebook computer monitor becomes the primary display and the external monitor becomes the secondary display. By default, the external monitor display is on the right side of the notebook computer monitor display.

In extend mode, you can drag and drop windows from one display to the other. Also, you can increase your productivity by doing the following:

- Reading emails on one display and opening the attachments on the other
- Expanding a spreadsheet across two displays
- Increasing your work area by putting all the palette and toolbars on the other display when you are doing graphics editing
- Keeping the desktop on one display and watching videos on the other

**Mirror Mode:** When the dock is in mirror mode, it clones your notebook computer screen to the external monitor. The dock automatically selects the settings (screen resolution, color quality, and refresh rate) for the external monitor, which will enable the best resolution on your notebook computer.

**Single-display Mode:** When the dock is in a single-display mode, it enables you to show your desktop on only one screen.

### Connectivity

>Front Ports
>
> - 2x USB 3.0 (One with Always-On Mobile Device Charging) - Ideal for use with memory keys, hard drives and other quick access devices
> - Stereo / Mic Combo Audio Port
>
>Rear Ports
>
> - 2x USB 2.0 - Ideal for most USB devices, including printers, keyboards, and mice
> - HDMI - support maximum resolution up to 1920 x 1200@60hz.
> - Gigabit Ethernet (10/100/1000)
> - DC Power
>
>Cable lock slot for physical security on the side of the ThinkPad OneLink dock

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="10" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht101981"
target="_blank">https://support.lenovo.com/solutions/ht101981</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/accessories/PD026944"
target="_blank">https://pcsupport.lenovo.com/accessories/PD026944</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br><br>
<a href=""></a>
</td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">No</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (tp_onelink_driver.exe -s) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence
(tp_onelink_driver.exe -s)</td>
</tr>
</table>

## ThinkPad USB 3.0 Ultra Dock (PN 40A80045)

The ThinkPad USB 3.0 Ultra Dock is an universal USB docking solution that not only delivers a premium display experience (up to 4k2k resolution via DP port), but also provides quick and easy connection to all the workspace peripherals you use every day. Simply plug in a single USB 3.0 cable into your Lenovo PC for instant access to up to two external monitors, USB ports, Gigabit Ethernet, headphones/speakers, USB printers, scanners, keyboard, mouse and so on for daily use. The Dock can also charge your mobile devices via two USB ports that are always powered. Dock requires included AC power adapter to operate.

[>> More Information & Drivers](https://pcsupport.lenovo.com/solutions/acc100183)

![](https://cdrt.github.io/mk_docs/img/guides/docks/usb3u1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/usb3u2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Ultra%20Docking)

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="18" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td colspan="2" class="tdDT">
<h5>WMI PNP Query String: </h5>
</td>
<td class="depTableFont">USB\VID_17E9&PID_4340&REV_0101 - USB Composite Device</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht104480"
target="_blank">https://support.lenovo.com/solutions/ht104480</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/solutions/acc100183"
target="_blank">https://pcsupport.lenovo.com/solutions/acc100183</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;&nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (generic_displaylink_driver_for_usb_docks_and_adapters_v9333240.exe -silent) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence (generic_displaylink_driver_for_usb_docks_and_adapters_v9333240.exe
-silent)</td>
</tr>
</table>

## ThinkPad USB 3.0 Pro Dock (PN 40A70045)

The ThinkPad USB 3.0 Pro Dock delivers a professional universal USB docking solution with fast USB 3.0 ports and digital video ports for quick and easy connection to all the workspace peripherals you use every day. Simply plug in a single USB 3.0 cable into your Lenovo PC for instant access to up to two external monitors, Gigabit Ethernet, headphones/speakers, USB printers, scanners, keyboard, mouse and so on for daily use. The Dock can also charge your mobile device via an always powered USB port. Dock requires included AC power adapter to operate.

[>> More Information & Drivers](https://support.lenovo.com/solutions/acc100184)

![](https://cdrt.github.io/mk_docs/img/guides/docks/usb3pro1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/usb3pro2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Pro%20Docking)

### Connectivity

> - 3x USB 3.0 – 1 provides always-on mobile device charging
> - 2x USB 2.0
> - 1x USB 3.0 upstream connector
> - 1x DVI
> - 1x DP
> - 1x Gigabit Ethernet
> - 1x Combo audio Port
> - 1 x Security lock hole

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="18" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td colspan="2" class="tdDT">
<h5>WMI PNP Query String: </h5>
</td>
<td class="depTableFont">USB\VID_17E9&PID_433F&REV_0101
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht104480"
target="_blank">https://support.lenovo.com/solutions/ht104480</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/acc100184"
target="_blank"> https://support.lenovo.com/solutions/acc100184</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes &nbsp;&nbsp;
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (generic_displaylink_driver_for_usb_docks_and_adapters_v9333240.exe -silent) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbsp;Deploy As Package in task sequence (generic_displaylink_driver_for_usb_docks_and_adapters_v9333240.exe
-silent)</td>
</tr>
</table>

## ThinkPad USB 3.0 Basic Dock (PN 40AA0045)

Transform any notebook into the heart of your office, instantly connecting mice, keyboards, printers, a monitor & mobile devices, all with a single cable using the ThinkPad USB 3.0 Basic Dock. It delivers the power of SuperSpeed USB 3.0 and high-performance HD video in one convenient, amazingly affordable docking station. The use of one single USB cable reduces annoying cable clutter on your desk. The ThinkPad USB 3.0 Basic Dock also lets you charge a mobile device, even when your notebook is away. The dock comes with 2 x USB 3.0 ports which are ideal for connecting memory keys, hard drives and other accessory devices. It features 2 x USB 2.0 ports for connecting all of your typical office peripherals such as printers and keyboards. It includes 1 x Stereo / Mic Combo Audio Port, Gigabit Ethernet (10/100/1000) connectivity and a cable lock slot for physical security. There is a DVI slot on the rear of the docking station. DVI to VGA adapter is included.

[>> More Information & Drivers](https://support.lenovo.com/solutions/acc100315)

![](https://cdrt.github.io/mk_docs/img/guides/docks/usb3b2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Baisc%20Dock)

### Connectivity

>Front ports:
>
> - 2x USB 3.0 (One with Always-On Mobile Device Charging) - Ideal for use with memory keys, hard drives and other quick accessdevices.
> - Stereo / Mic Combo Audio Port
>
>Rear ports:
>
> - 2x USB 2.0- Ideal for most USB devices, including printers, keyboards, and mice.
> - 1x DVI
> - Includes DVI to VGA adapter
> - Gigabit Ethernet (10/100/1000)
> - Power In

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="18" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="3" class="tdDT">
<h5>WMI PNP Query String: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">USB\VID_17E9&PID_431F&MI_05
</td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17E9&PID_431F&MI_02</td>
</tr>
<tr>
<td class="tdDT">Display</td>
<td class="depTableFont">USB\VID_17E9&PID_431F&MI_00</td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/ht104480"
target="_blank">https://support.lenovo.com/solutions/ht104480</a></td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://support.lenovo.com/solutions/acc100315"
target="_blank">https://support.lenovo.com/solutions/acc100315</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont">We do not recommend deploying firmware updates during OSD
deployment<br></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (deploy as hardware app in task sequence)<br>
&nbsp;&nbsp;&nbsp;As Application (generic_displaylink_driver_for_usb_docks_and_adapters_v9333240.exe -silent) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbspDeploy As Package in task sequence (generic_displaylink_driver_for_usb_docks_and_adapters_v9333240.exe -silent)
</td>
</tr>
</table>

## Dock/Port Comparison

<table class="PDComparisonTable">
<tr>
<th colspan="2"></th>
<th>ThinkPad Thunderbolt 3 Essential Dock</th>
<th>ThinkPad Thunderbolt 3 Workstation Dock / ThinkPad Thunderbolt 3 Dock Gen 2</th>
<th>ThinkPad Thunderbolt 3 Dock</th>
<th>ThinkPad Hybrid USB-C with USB-A Dock</th>
<th>ThinkPad USB-C Dock (Gen1 & Gen2)</th>
<th>ThinkPad OneLink Plus Dock</th>
<th>ThinkPad OneLink Pro Dock</th>
<th>ThinkPad OneLink Dock</th>
<th>ThinkPad USB 3.0 Ultra Dock</th>
<th>ThinkPad USB 3.0 Pro Dock</th>
<th>ThinkPad Basic USB 3.0 Dock</th>
</tr>
<tr>
<th rowspan="5">USB Connection</th>
</tr>
<tr>
<th>Thunderbolt 3</th>
<td>2</td>
<td>1</td>
<td>1</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th>USB-C</th>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>1</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th>USB 3.0</th>
<td>2</td>
<td>4+1</td>
<td>4+1</td>
<td>2+1</td>
<td>2+1</td>
<td>3+1</td>
<td>3+1</td>
<td></td>
<td></td>
<td></td>
<td>1+1</td>
</tr>
<tr>
<th>USB 2.0</th>
<td></td>
<td></td>
<td></td>
<td>2</td>
<td>2</td>
<td>2</td>
<td>2</td>
<td></td>
<td></td>
<td></td>
<td>2</td>
</tr>
<tr>
<th rowspan="4">Connection to Comp</th>
<th>Thunderbolt 3</th>
<td>1</td>
<td>1</td>
<td>1</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<tr>
<th>USB-C</th>
<td></td>
<td></td>
<td>1</td>
<td></td>
<td>1</td>
<td>1</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th>OneLink / OneLink Pro</th>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1 - OL Plus</td>
<td>1 - OL</td>
<td>1 - OL</td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th>USB 3.0 </th>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td>1</td>
<td>1</td>
</tr>
</tr>
<tr>
<th rowspan="1">Audio</th>
<th>Headphone/ Microphone</th>
<td>1</td>
<td></td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
</tr>
<tr>
<th rowspan="4">Video</th>
<th>HDMI</th>
<td>1</td>
<td>2</td>
<td>1</td>
<td>2</td>
<td>1<br>(Gen2 only)</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<tr>
<th>Display</th>
<td>1</td>
<td>2</td>
<td>2</td>
<td>2</td>
<td>2</td>
<td>2</td>
<td>1</td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th>DVI</th>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
<td>1</td>
<td></td>
<td></td>
<td></td>
<td>1</td>
</tr>
<tr>
<th>VGA</th>
<td></td>
<td></td>
<td>1</td>
<td></td>
<td>1 (Gen1 only)</td>
<td>1</td>
<td></td>
<td></td>
<td></td>
<td></td>
<td></td>
</tr>
</tr>
<tr>
<th rowspan="2">Ethernet</th>
<th>10/100/1000</th>
<td>1</td>
<td>2</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<td>1</td>
<tr>
<th>PXE Capable</th>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td>No</td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
</tr>
</tr>
</table>

# Known Issues

**ThinkPad USB 3.0 Dock Tips**: https://support.lenovo.com/us/en/solutions/ht078725

**USB-C**:  https://support.lenovo.com/us/en/solutions/HT504163

## ThinkPad Ultra Docking Station (40AJ0135)

ThinkPad® Ultra Docking Station (40AJ) provides a docking experience for Large Enterprise ThinkPad customers. The innovative side connector, designed exclusively for ThinkPad notebooks, provides a driver-free way to connect conveniently and securely to a range of USB accessories and external displays, while rapid charging support and a mirrored power button make going mobile even easier. It supports: PXE boot, Wake-on-LAN, and MAC address pass-through, simplifying asset management for IT managers.

[>> More Information & Drivers](https://support.lenovo.com/us/en/solutions/pd500173-thinkpad-ultra-docking-station-overview-and-service-parts)

![](https://cdrt.github.io/mk_docs/img/guides/docks/uds1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/uds2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Ultra%20Docking)

### Connectivity

>Ports:
>
> - 4 USB 3.1
> - 2 USB-C
> - 2 DisplayPort
> - 1 HDMI
> - 1 Ethernet
> - 1 Headphone/Mic

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="10" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="3" class="tdDT">
<h5>WMI PNP Query String: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">None</td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_306F&MI_00</td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont">None</td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/downloads/DS502204"
target="_blank">https://pcsupport.lenovo.com/downloads/DS502204</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/downloads/DS540663"
target="_blank">https://pcsupport.lenovo.com/downloads/DS540663<br></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (extract the .zip file and import into the Out-of-Box
Drivers node for the required models)<br> &nbsp;&nbsp;&nbsp;As Application (setup.exe
-silent) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbspDeploy As Package in task sequence (extract the .zip
file and import into the driver packages for the needed models)</td>
</tr>
</table>

## ThinkPad Pro Docking Station (40AH0135)

ThinkPad® Pro Docking Station (40AH) provides a docking experience for Large Enterprise ThinkPad customers. The innovative side-connector, designed exclusively for ThinkPad notebooks, provides a driver-free way to connect conveniently and securely to a range of USB accessories and external displays, while rapid charging support and a mirrored power button make going mobile even easier. Designed for large enterprise environments, ThinkPad Docking Stations support PXE boot, Wake-on-LAN, and MAC address pass-through, simplifying asset management for IT managers.

[>> More Information & Drivers](https://support.lenovo.com/us/en/solutions/pd500174)

![](https://cdrt.github.io/mk_docs/img/guides/docks/pds1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/pds2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Pro%20Docking)

### Connectivity

>Ports:
>
> - 2 USB 3.1
> - 2 USB 2.0
> - 1 USB-C
> - 1 DisplayPort
> - 1 Ethernet
> - 1 Headphone/Mic

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="10" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="3" class="tdDT">
<h5>WMI PNP Query String: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">None</td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_306F&MI_00</td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont">None</td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/downloads/DS502204"
target="_blank">https://pcsupport.lenovo.com/downloads/DS502204</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/downloads/DS540663"
target="_blank">https://pcsupport.lenovo.com/downloads/DS540663<br></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (extract the .zip file and import into the Out-of-Box
Drivers node for the required models)<br> &nbsp;&nbsp;&nbsp;As Application (setup.exe
-silent) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbspDeploy As Package in task sequence (extract the .zip
file and import into the driver packages for the needed models)</td>
</tr>
</table>

## ThinkPad Basic Docking Station (PN 40AG0135)

ThinkPad® Basic Docking Station (40AG) provides a docking experience for Large Enterprise ThinkPad customers. The innovative side-connector, designed exclusively for ThinkPad notebooks, provides a driver-free way to connect conveniently and securely to a range of USB accessories and external displays, while rapid charging support and a mirrored power button make going mobile even easier. It supports: PXE boot, Wake-on-LAN, and MAC address pass-through, simplifying asset management for IT managers.

[>> More Information & Drivers](https://support.lenovo.com/us/en/solutions/pd500172)

![](https://cdrt.github.io/mk_docs/img/guides/docks/bds1.png)
![](https://cdrt.github.io/mk_docs/img/guides/docks/bds2.png)

[Display Capabilities](https://support.lenovo.com/us/en/solutions/pd029622#Basic%20Docking)

### Connectivity

>Ports:
>
> - 2 USB 3.1
> - 2 USB 2.0
> - 1 DisplayPort
> - 1 VGA
> - 1 Ethernet
> - 1 Headphone/Mic

### Deployment

<table class="deploymentTable">
<td class="tdDT" rowspan="10" style="width:15%">
<h5 align="center">Deployment (MDT & SCCM)</h5>
</td>
<tr>
<td rowspan="3" class="tdDT">
<h5>WMI PNP Query String: </h5>
<tr>
<td class="tdDT">Ethernet </td>
<td class="depTableFont">None</td>
</tr>
<tr>
<td class="tdDT">Audio</td>
<td class="depTableFont">USB\VID_17EF&PID_306F&MI_00</td>
</tr>
</td>
</tr>
<tr rowspan="1">
<td rowspan="4" class="tdDT">
<h5>Driver(s): </h5>
<tr>
<td class="tdDT">WinPE </td>
<td class="depTableFont">None</td>
</tr>
<tr>
<td class="tdDT">Windows</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/downloads/DS502204"
target="_blank">https://pcsupport.lenovo.com/downloads/DS502204</a></td>
</tr>
<tr>
<td class="tdDT">Firmware</td>
<td class="depTableFont"><a href="https://pcsupport.lenovo.com/downloads/DS502204"
target="_blank">https://pcsupport.lenovo.com/downloads/DS540663<br></td>
</tr>
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>PXE Capable: </h5>
</td>
<td class="depTableFont">Yes
</td>
</tr>
<tr>
<td colspan="2" class="tdDT">
<h5>Driver Deployment: </h5>
</td>
<td class="depTableFont"><b>MDT</b> (extract the .zip file and import into the Out-of-Box
Drivers node for the required models)<br> &nbsp;&nbsp;&nbsp;As Application (setup.exe
-silent) <br><br>
<b>SCCM </b><br> &nbsp;&nbsp;&nbspDeploy As Package in task sequence (extract the .zip
file and import into the driver packages for the needed models)</td>
</tr>
</table>

## Side-connected Docks/Port Comparison

<table class="PDComparisonTable">
<tr>
<th colspan="2"></th>
<th>ThinkPad Ultra Docking Station</th>
<th>ThinkPad Pro Docking Station</th>
<th>ThinkPad Basic Docking Station</th>
</tr>
<tr>
<th rowspan="5">USB Connection</th>
</tr>
<tr>
<th>Thunderbolt 3</th>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th>USB-C</th>
<td>2</td>
<td>1</td>
<td></td>
</tr>
<tr>
<th>USB 3.0</th>
<td>3+1</td>
<td>3</td>
<td>2</td>
</tr>
<tr>
<th>USB 2.0</th>
<td></td>
<td>1+1</td>
<td>1+1</td>
</tr>
<tr>
<th rowspan="1">Audio</th>
<th>Headphone/ Microphone</th>
<td>1</td>
<td>1</td>
<td>1</td>
</tr>
<tr>
<th rowspan="4">Video</th>
<th>HDMI</th>
<td>1</td>
<td></td>
<td></td>
<tr>
<th>Display</th>
<td>2</td>
<td>2</td>
<td>1</td>
<tr>
<th>DVI</th>
<td></td>
<td></td>
<td></td>
</tr>
<tr>
<th>VGA</th>
<td>1</td>
<td></td>
<td>1</td>
</tr>
</tr>
<tr>
<th rowspan="2">Ethernet</th>
<th>10/100/1000</th>
<td>1</td>
<td>1</td>
<td>1</td>
<tr>
<th>PXE Capable</th>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
<td><a href="https://support.lenovo.com/us/en/accessories/um006391" />Yes</a></td>
</tr>
</tr>
</table>
