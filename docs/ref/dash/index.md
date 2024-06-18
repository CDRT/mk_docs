# AMD DASH Deployment Guide

## What is DASH?

DASH (Desktop and mobile Architecture for System Hardware) is a secure out-of-band and remote client management standard. Out-of-band management tasks include powering a system on when it is powered off and obtaining asset and health information when the operating system is not available.

DASH was developed and released by the DMTF (Distributed Management Task Force). DASH profile specification source material can be found at [DMTF - Management Profiles](http://www.dmtf.org/standards/profiles)

For more information refer to [DMTF - Desktop and Mobile Architecture for System Hardware](https://www.dmtf.org/standards/dash)

AMD Management Console can be downloaded here: [Tools for DMTF DASH](https://developer.amd.com/tools-for-dmtf-dash/). It can be installed on any Windows workstation or Windows Server OS to use for monitoring and managing the client systems.

## System Requirements

DASH capable client computer systems require DASH be enabled and configured. These settings are not engaged by default. Equipment manufacturers provide the tools and processes to configure DASH. System administrators will need to verify the steps required for their specific hardware.

Operating Systems

- Windows 7 (32 and 64 bit)
- Windows 8 (32 and 64 bit)
- Windows 8.1 (32 and 64 bit)
- Windows 10 (32 and 64 bit)
- Windows Server 2008 R2 (64 bit)
- Windows Server 2012 (64 bit)
- Windows Server 2012 R2
- Windows Server 2016
- Windows Server 2019

**AMC** (AMD Management Console) requires a minimum of 1 GB Disk space and 4 GB RAM. It supports DASH 1.2.

!!! info ""
   If you have AMC already installed, you will first have to uninstall that version before installing the latest version of AMC.

Lenovo AMD ThinkPad and ThinkCentre models support management via DASH and ethernet utilizing AMD Management Console, the DASH CLI, or the AMPS Management Plug-in for SCCM (more than 500 clients). These applications all use the Realtek DASH Controller.

The appropriate Realtek DASH Controller, along with all the latest drivers and firmware updates, can be found by searching for your system name or serial number at [https://pcsupport.lenovo.com](https://pcsupport.lenvo.com/).

![pcsupport.lenovo.com](https://cdrt.github.io/mk_docs/img/dash/1.png)

## Installation

### Installing AMC

This chapter provides the installation instructions and requirements for AMC.

### Installation Requirements

Use the _AMC-setup-[version]-AMD.exe_ to install AMC. Detailed instructions and release notes can be found in the installation directory, which by default is _C:\Program Files (x86)\AMD Management Console\docs_.

!!! info ""
   If you have an old AMC version installed, you first must uninstall that version before installing the latest version of AMC.

### Authentication

When the AMC Console is launched the first time, you will be prompted to proceed to configuration. Alternatively, you can later access these settings via the **Configuration** tab in the upper right of the AMC Management Console.

The AMC console configuration supports up to three authentication entries. Each credential entry requires a unique Authentication Identifier and Schema. AMC has support for two types of authentication schemas: Digest and Active Directory.

At least one authentication entry must be configured before a client system can be discovered. If there is more than one credential, AMC will try each credential in sequential order.

![configuration tab](https://cdrt.github.io/mk_docs/img/dash/2.png)

![configuration window](https://cdrt.github.io/mk_docs/img/dash/3.png)

For the changes to take effect, click **Validate** and then click **Save.**

# Enabling DASH on client systems

DASH capable systems must first have DASH enabled in the BIOS. Next, the Windows software must be configured.

Prerequisites:

- DASH firmware enabled
- Windows DASH client software
- The latest DASH console tool, which can be found [here.](https://developer.amd.com/tools-for-dmtf-dash/)

!!! info ""
   DashConfig, an AMD tool, is packaged with AMC and can be used for configuration. Refer the release notes of DASH Config tool or see [Provisioning tools for DASH standalone systems](https://community.amd.com/t5/amd-manageability-community-tkb/provisioning-tools-for-dash-standalone-systems/ta-p/420927)

Two different DashConfig tools are available: DashConfig for Broadcom and DashConfigRT for Realtek. All Lenovo systems will require the DASHConfigRT tool.

## DASH setup

### Enable DASH in BIOS

It is recommended to check that the most recent BIOS has been applied to the system.  The most recent system BIOS can be found at [https://pcsupport.lenovo.com/](https://pcsupport.lenovo.com/).

 1. First boot into system BIOS and locate **DASH Configuration** under Security.

    ![BIOS - DASH Configuration](https://cdrt.github.io/mk_docs/img/dash/4-dash.jpg)

 2. **DASH Configuration** - Set DASH to Enabled

    ![DASH Support setting](https://cdrt.github.io/mk_docs/img/dash/5-dash.jpg)

 3. **RealTek LAN Controller** - Reset the DASH Credentials under RealManage Setup. These credentials are used for Digest Authentication of the management service to the client.  You may need to scroll down to see **Realtek Manage Setup**.

  !!! info ""
   The default credentials are Administrator/Realtek. *Both* username and password are case sensitive.

   ![RealManage Setup](https://cdrt.github.io/mk_docs/img/dash/6-dash.png)

   ![Username and Password management](https://cdrt.github.io/mk_docs/img/dash/7-dash.png)

 4. Save and exit the BIOS

### Windows DASH client software
The Realtek DASH Windows software can be found at [https://pcsupport.lenovo.com/](https://pcsupport.lenovo.com/). Locate the support page for a specific model and select the **Drivers &amp; Software** menu item on the left side of the page. Select **Manual Update** and browse to **Networking: LAN (Ethernet)**.

Documentation for attended and unattended installation will be available with the application download in the installation directory. The default installation location is _C:\Program Files (x86)\AMD Management Console._

![Drivers & Software - Manual Updates](https://cdrt.github.io/mk_docs/img/dash/8-dash.png)

# AMC Client Management

## Overview

AMC supports the following DASH functionality :

- Discovery
- Power state management
- Boot – several options
    - USB Redirection
    - KVM Redirection
    - Text Redirection
- Inventory / Health information
- Firmware Update
- Alerts

!!! info ""
   Before performing a discovery operation, make sure that the authentication details are correct. Refer to [Authentication](#authentication).

## Discovery

AMC can only discover systems that have hardware which supports the DMTF management specification. Through discovery, AMC determines if a system supports DASH and what features are accessible. On successful discovery, the system is added to the &quot;All Systems&quot; group and inventory is performed on that system.

AMC supports four methods of discovery, which are described below.

!!! info ""
   Discovery requests are queued. If a user chooses Active Directory discovery, then tries to do any of the other types of discovery, the other  discovery will be done after Active Directory discovery completes.

 ![Discovery criteria window](https://cdrt.github.io/mk_docs/img/dash/9-dash.png)

### Hostname

Hostname discovery requires functioning, accurate DNS.

### IP Address

AMC will query that address and find out if that system is manageable or not.

### IP Subnet

AMC will scan each IP address in that range and find out if the system with that IP address is manageable by AMC or not.

### Active Directory

Each system in the domain is checked for AMD manageability when AMPS is first installed. After installation, system discovery can be done manually or on a schedule. (See [Authentication](#authentication) section above.)

## Power

AMC can be used to monitor, report, and manage the power state of client systems remotely.

### Power States

The table below lists all supported power states.

!!! info ""
   All the power state transitions cannot be requested remotely. The subset of the below list will be visible to the user based on the target computer system&#39;s capabilities.

| **Power State** | **State Number** | **Friendly Name** | **Description** | **Corresponding ACPI State** |
| --- | --- | --- | --- | --- |
| Power On | 2 | On/Power On | Initiate the transition of the system to full on state. | G0/S0 |
| Sleep – Light | 3 | Sleeping Lightly/Sleep Light | Initiate the transition of the system to standby or sleep state. | G1/S1 or G1/S2 |
| Sleep- Deep | 4 | Sleeping/Sleep | Initiate the transition of the system to standby or sleep state. | G1/S3 |
| Power Cycle (Off Soft) | 5 | Immediate Power Reset | Transition the system to off state, followed by a transition to on state. | G2/S5 then G0/S0 |
| Power Off – Hard | 6 | N/A | Initiate the transition of the system to power off state | G3 |
| Hibernate | 7 | Hibernating/Hibernate | Transition the system to hibernation state. – write system context to non-volatile storage, power off the system and devices. | G1/S4 |
| Power Off – Soft | 8 | Off/Immediate Power Off | Initiate the transition of the system to off state, in which the system consumes a minimal amount of power. | G2/S5 |
| Power Cycle (Off Hard) | 9 | N/A | Transition the system to power off state, followed by a transition to on state | G3 to G0/S0 |
| Power Off - Soft Graceful | 12 | Off/Shutdown | Perform an orderly transition to power off state, in which the system consumes a minimal amount of power | G2/S5 |
| Power Off - Hard Graceful | 13 | N/A | Perform an orderly transition to power off state in which the power consumption is zero except for the real-time clock. | G3 |
| Power Cycle (Off – Soft Graceful) | 15 | Restart | Perform an orderly transition of the system to power off state, in which the system consumes a minimal amount of power, followed by a transition to on state | G2/S5 to G0/S0 |
| Power Cycle (Off - Hard Graceful) | 16 | N/A | Transition the system to power off state, , in which the power consumption is zero except for the real-time clock, followed by a transition to on state | G3 to G0/S0 |
| Diagnostic Interrupt (NMI) | 11 | Immediate Diagnostic Interrupt | Assert an NMI on the system. |
| Master Bus Reset | 10 | Immediate Warm Reset | Perform hardware reset on the system. |
  
### Power Operation on a Single System

1. Right click on the specific system on which the power operation is to be performed.
2. Select **Power** from the menu. You will get the Power screen.
3. The **Power Screen** will show:
- The system name against which you are going to perform the power operation,
- The current power state of the system.
- The list of power states which the system can accept from its current state is shown in the &#39;select power state to apply&#39; drop down list.
4. To start the transition of the system to the new power state, click **Apply**.
5. The result of the operation will be displayed. Click **Finish** to close the Power window.

![ Power operation on single system](https://cdrt.github.io/mk_docs/img/dash/10-dash.png)
  
### Power Operation on a Group

![Power management on Group.](https://cdrt.github.io/mk_docs/img/dash/11-dash.png)

## DASH Tasks

### Boot

A boot configuration specifies the order of boot devices. A computer system can have one or more boot configurations.

AMC&#39;s Boot task shows all the boot configurations available for the system being managed. For each boot configuration, it shows the current boot order and allows the user to modify the boot order. AMC only informs the present value of the setting data (will it be used for next boot, will it be used only for next boot, will it not be used for next boot) but does not allow the user to modify this.

To manage Boot settings:

 1. Select the target system.

 2. Either right click on the system and select the **Boot** menu item or click on the ribbon icon **Boot**.

 3. The Boot Screen appears and displays a drop-down list with all the boot configurations available for the system.

      - Settings information for the selected boot configuration from the drop-down list:

         > This boot configuration will be used during next boot.
        >
         > This boot configuration will not be used during next boot.
        >
         > This boot configuration will be used only for next boot

     - The current boot order for the selected boot configuration from the drop-down list.

 4. Select the required boot configuration from the **Name** drop down list.

 5. Check the box for **Change boot order** check box if the boot order needs to be changed.

 6. Move the Boot Devices to the &#39;New boot order&#39; list box in the order required.

 8. Click the **Next** button to have the new boot order take effect. The result screen will show the result, e.g. &#39;boot order was successfully changed&#39;.

 9. Close the power screen by clicking **Close**.

![ Boot Configuration](https://cdrt.github.io/mk_docs/img/dash/12-dash.png)
  
### Text Redirection

Text redirection provides BIOS-assisted console and keyboard redirection to a remote computer terminal. Boot progress, BIOS setup screen, command line OS or command line diagnostic console text are redirected to the AMC terminal. Text redirection can be set to use either Telnet or SSH

To use text redirection:

1. Select the desired system.
2. Either right click on the system and select **Text**  **Redirection** menu item or click on the text portion of ribbon icon **Redirection**.

![Redirection on AMC toolbar](https://cdrt.github.io/mk_docs/img/dash/13-dash.png)

3. The **Text Redirection** Screen appears and shows:

   - Drop down list with available protocols for text redirection, SSH and Telnet respectively. (SSH is the default.)
   - The Name of the Service that runs on the system to redirect the text.
   - The port through which the text will be redirected.
   - The information/status is stated – e.g., Support for OTP (one time password)

3. Select the required protocol from the drop-down list.
4. Click **Connect**. If the connection is successful, the text redirection screen will close, and the terminal console screen will appear.

![Text Redirection dialog](https://cdrt.github.io/mk_docs/img/dash/14-dash.png)

![Successful redirected telnet login](https://cdrt.github.io/mk_docs/img/dash/15-dash.png)

To manage the BIOS remotely using text redirection:

  1. Select a system for which you want to view and manage the BIOS.
  2. Perform steps 2 to 5 above to open a terminal console to receive the redirected text from the system.
  3. Click on **Power** icon and select **graceful power**  **cycle** option in the available power states.
  4. Click **Apply** to change the power state. The AMC terminal screen will receive the boot screen remotely and return keystrokes from the AMC System.

### USB Redirection

USB Redirection provides a virtual USB device which reads data from a remote image file.

This allows the BIOS to boot from a remote ISO image. The ISO Image file must be available at C:/AMC-ISO on the management server.

AMC has its own ISO webserver. Use AMC to initiate an action to attach the managed systems&#39; USB to a remote URL. This operation can be performed against a single system or on a group of systems. Place ISOs in C:/AMC-ISO and http://xxx.xx.xxxx:3274/ can be used as USB URL (e.g. http://10.10.10.2:3274/dos.iso.)

![USB Redirection](https://cdrt.github.io/mk_docs/img/dash/38-dash.png)
  
### Boot to Text Image Feature

The AMC Boot to Text Image feature provides an environment where user can boot the managed system to a user defined text based remote image (e.g. .iso image).

### Boot to BIOS with KVM Profile

**Boot to BIOS** implements the DMTF DASH KVM profile so the user to boot the managed system to the BIOS setup screen, and remotely connect to the BIOS screen via the VNC viewer. Through the VNC viewer, the user can access the BIOS screen and interact with mouse and keyboard.

To boot to BIOS:

1. Select the target system you wish to boot into BIOS KVM profile
2. Either right click on the system and select **Boot to BIOS** menu item or click on the ribbon icon **Boot to BIOS** image.
3. When the user starts the **Boot to BIOS** workflow by clicking the Start button, the following tasks are initiated:
    - KVM enable command is sent to the managed system.
    - The managed system is rebooted.

![boot to BIOS](https://cdrt.github.io/mk_docs/img/dash/39-dash.png)

After the managed system boots to BIOS setup screen and the VNC server is ready, VNC viewer is launched.

!!! info ""
   When the VNC Viewer is closed, the managed system is rebooted.

### Remote Access

The AMC **Remote Access** feature provides support for launching of In-band KVM and Remote Desktop tools.

To use In-band KVM feature, ensure the relevant Windows driver package released by the network interface provider is installed on the DASH system.

![remote access on toolbar](https://cdrt.github.io/mk_docs/img/dash/40-dash.png)

## Client Configuration - DASHConfigRT

**DASHConfigRT** is an AMD tool packaged with **AMC**, used to script DASH configuration. The instructions and tool will be in the installation folder, which by default is _C:\Program Files (x86)\AMD Management Console\DASHConfigRT._

!!! info ""
    _DASHConfigRT.exe_ is the Realtek-specific version of this tool. The name &quot;DASHConfig&quot; is commonly used to reference the tool regardless of version.

### How DASHConfigRT works

**DASHConfigRT** interacts with Windows Management Instrumentation, or WMI. The management agent talks to the DASH firmware and configures the changes provided by the IT administrator in an XML file.

!!! info ""
   User must provide the configuration inputs in the XML file

### Tasks Supported in DASHConfigRT Tool

- Enable/Disable DASH management controller
- Set HTTP/HTTPS ports
- Set digital certificates
- Limit discovery (disable HTTP except for discovery)
- Create digest user accounts
- Assign roles
- Active Directory Provisioning
- Security Identifier (SID) configuration
- AD password

### DASHConfigRT Tool

DASHConfig provides six case-sensitive parameters ( –v, -xf, -dxf, -mif and –help ) that are defined in the following table.

| Parameter | Description |
| --- | --- |
| -v | Displays the DASHConfig version information to the console |
| -xf | Represents the XML file parameter that informs the tool of the location of the XML file used to provision a DASH-capable system.|
| -dxf | Instructs the DASHConfig utility to delete the provisioning XML file after processing has been completed. |
| -mif | Instructs the DASHConfig utility to create a Microsoft installation status MIF file on exit. This is for integration into Microsoft Configuration Manager. |
| -help | This parameter will print out short help documentation about the command line parameters to the console. |

### Example Config.xml

        <?xml version="1.0" encoding="utf-8"!!! info ""
   
        <DASHPROVISIONSETTINGS>
          <MANAGEMENTTARGET>
          <GLOBAL>
                  <HTTPS>
                    <ENABLESUPPORT>true</ENABLESUPPORT>
                     <TCPIPPORT>664</TCPIPPORT>
                  </HTTPS>
                  <HTTP>
                    <ENABLESUPPORT>true</ENABLESUPPORT>
                    <TCPIPPORT>623/TCPIPPORT>
                  </HTTP>
          </GLOBAL>
          <USERS>
                  <USER>
                    <USERID>Administrator</USERID>
                    <PASSWORD>password</PASSWORD>
                    <ENABLE>true</ENABLE>
                    <ROLES>
                    <ROLE>Administrator Role</ROLE>
                    </ROLES>
                  </USER>
                </USERS>
          </MANAGEMENTTARGET>
        </DASHPROVSIONSETTINGS>

### XML Nodes List

  | \<DASHPROVISIONSETTINGS\> | Root node |
| --- | --- |
| \<USERID\> | Provides the name of the account to be created |
| \<PASSWORD\> | Password for specified account |
| \<ENABLE\> | Newly created user account enabled: false = offline, true = enabled |
| \<ROLES\> | Defines the roles (privileges) given to the newly created user account. Up to 3 roles can be defined for a particular user account. |
| \<ROLE\> | 3 acceptable values: Administrator (full control), Operator (can invoke operations), and Read Only |
| \<ACTIVEDIRECTORY\> | Required if provisioning Active Directory support |
| \<ENABLESUPPORT\> | Required if Active Directory support is provisioned false = disabled, true = enabled. |
| \<ACTIVEDIRECTORY\_SPNACCOUNT\> | Name string of the Active Directory user account whose SPN property has been updated to include the target&#39;s service principal name (SPN) |
| \<SPNACCOUNT\_PASSWORD\> | Active Directory stored password for the user account defined by the \<ACTIVEDIRECTORY\_SPNACCOUNT\> node. |
| \<ACTIVEDIRECTORY\_GROUPS\> | There is a limit of 3provisioned groups on any single management target because a DASH Role can only be associated to a single Active Directory group and are only 3 defined roles. |
| \<ACTIVEDIRECTORY\_GROUP\> | Required, if the \<ACTIVEDIRECTORY\_GROUPS\> node is included in the XML provisioning file. |
| \<GROUPNAME\> | Necessary if any Active Directory group(s) are to be provisioned on the management target. |
| \<OBJECTSID\> | Security descriptor string in the standard string representation (S-R-I-S-S) for the Active Directory User Group defined by the \<GROUPNAME\> node. |
| \<ROLES\> | Defines the role(s) (privileges) given to the associated Active Directory group. Up to 3 roles can be defined for a particular Active Directory group. !!! info ""
    The individual DASH roles can only be associated to a single Active Directory group. |
| \<ROLE\> |  Required. Currently there are only 3 acceptable values: Administrator Role, Operator Role and Read Only Role. Administrators have full control over the management target and its settings. Operators can invoke operational methods. |

## Health

AMC collects and displays sensors of managed computer systems. Administrators can configure alerts and subscribe to notifications.

### Monitor the health of system:

1. Select the target system
2. Either right click on the system and select **System Health** menu item or click on the**System Health** ribbon icon.

![Ribbon Health Icon](https://cdrt.github.io/mk_docs/img/dash/16-dash.png)

![System Health Menu option](https://cdrt.github.io/mk_docs/img/dash/17-dash.png)

 The **Health** screen will show a tree view of all the sensors and fans in the system in each node.

  ![Health Inventory](https://cdrt.github.io/mk_docs/img/dash/18-dash.png)

### Subscribe/ Unsubscribe to Alerts

!!! info ""
   The port used for alerts should be configured during AMPS installation.**

The types of alerts are platform, boot progress and lifecycle events such as temperature alerts, fan failure, chassis intrusion, and BIOS boot failure. AMC shows available alerts that the managed system can send and available alerts that the managed system is already subscribed to.

To subscribe to Alerts / modify the subscribed Alerts:

1. Select the target system.
2. Either right click on the system and select **Alerts** menu item or click on the ribbon icon **Alerts**.

- The Alert Screen will be displayed
- Available filters as a list box in the left. This is a list of events that this system can send.

- Subscribed filters as a list box in the right. This is a list of events for which the Subscription is already in place.

![Available and subscribed alerts](https://cdrt.github.io/mk_docs/img/dash/19-dash.png)

## System Properties

For AMC, System Properties are:

- Discovery Port
- MAC Address
- Authentication type
- Username
- Transport protocol
- Transport Port

To view a specific system's properties, right click the system and select **Properties** from the menu.

![System Properties ](https://cdrt.github.io/mk_docs/img/dash/20-dash.png)

## AMC Inventory

Select desired system to see inventory details in the **Inventory** area below the computer system inventory. (See Figure 20.) The asset and inventory information displayed are identity of the system, physical assets, processor, system Configuration Manager, Ethernet port, BIOS, OS and DASH.

![AMC Inventory](https://cdrt.github.io/mk_docs/img/dash/21-dash.png)

## Group Management

### Create and Delete Groups

After discovery, all the DASH capable systems are added to the default group **All Systems**. New groups can be added to the computer groups list by right clicking on the **Computer Groups** menu item and selecting **Add Group** or by clicking on the **Add** menu item under **Group** ribbon icon

![add group](https://cdrt.github.io/mk_docs/img/dash/45-dash.png)

Groups can be deleted by right clicking the relevant group and selecting **Delete Group** or by selecting the **Delete** menu item under **Group** ribbon icon.

### Add / Remove systems to Groups

To add systems to any group, right click on the group to which systems are to be added and select **Add systems** in the menu and select the systems from the new screen. Click on Ok.

![add to group](https://cdrt.github.io/mk_docs/img/dash/44-dash.png)

# AMD Management Plugin for SCCM (AMPS)

## Overview

## Prerequisites and System Requirements

- SPN must be configured in AD
- Authentication must be configured
- Systems BIOS must be DASH enabled
- Third party software (Windows) for network adapters should be installed and working.

## Installing and Uninstalling AMPS

You can deploy AMPS in three possible scenarios:

 1. AMPS with Configuration Manager Console and Standalone Site Server: In this scenario, the Configuration Manager Site server and the console are on the same system. Install AMPS on this system that has both the Site server and console.
 2. AMPS with Configuration Manager Console: In this scenario, the MEM site server and MEM console are on two different systems. Therefore, you need to install AMPS twice, once on the site server system and once on the MEM console system. First, complete installation of plugin on the site server and then install the plugin on the console system. Plugin software automatically guides and lets you install only the required components on each system (site server and console).

 3. AMPS with CAS (Central Administration Site): Here, the IT infrastructure will have CAS and one or more primary sites, along with optional secondary sites.

!!! info ""
   The DASH Plug-in help file provides detailed information on support for role-based authorization in DASH Plug-in. The default location for the help file and other supporting material is located at _C:\Program Files (x86)\AMD Management Plugin for SCCM\doc_

## Installing/Upgrading AMPS

### AMPS deployment in CAS

In CAS infrastructure at least one primary site server must be configured.

It will take few minutes for the configuration settings to propagate in CAS infrastructure. If the settings are not updated, check if replication status is good in **Monitoring / Overview / Site Hierarchy** in Console.

### Installing/Upgrading AMPS

To install/upgrade the DASH plug-in either infrastructure type:

 1. Use the _AMPS-[version]-AMD.exe_ installer.
 2. Follow the steps in the Install wizard to complete installation.

### Uninstalling AMPS

You can uninstall AMPS using **Programs and Features** in **Control Panel**.

Alternatively,

1. Run the _AMPS-[version]-AMD.exe_ installer
2. Click the **Remove** button to uninstall the plugin

## Configure AMPS to work with Active Directory

This section offers a brief description of how to create the necessary SPN account.

Authentication must be configured in both Active Directory and in the DASH targets. Active Directory authentication with the DASHConfigRT utility provides greater security to administrators performing DASH operations, as only authorized users can communicate with assigned DASH targets.

### Create DASH SPN User account

As domain administrator, use ADUC to create a new user account in the Users node, named &quot;DASHSPN&quot; or something similar in accordance with your organization&#39;s naming conventions.

### Add SPNs for DASH systems

Under the **Properties** for the new &quot;DASHSPN&quot; user, select **Attribute Editor**

Select the **servicePrincipalName** attribute item, click **Edit** and add two values for each DASH system which will use AD authentication:

- _HTTP/[MachineName]_
- _HTTP_/[_FQDN]_

![SPN user account attribute](https://cdrt.github.io/mk_docs/img/dash/22-dash.png)

!!! info ""
   For a large group of DASH systems, it is faster to use the SETSPN utility in a script or batch file:

When using the [Setspn](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-R2-and-2012/cc731241(v=ws.11)#:~:text=To%20reset%20the%20default%20SPN%20values%2C%20use%20the,You%20receive%20confirmation%20if%20the%20reset%20is%20successful.) utility use the following two command lines for each client:

        Setspn –S -U HTTP/MACHINENAME spnacctname
        Setspn –S -U HTTP/FQDN spnacctname

### Create DASH Admins group in Active Directory and obtain SID

To manually create the Security group and obtain the SID:

1. Create a security group for DASH Administrators, named &quot;DASH Admins&quot; or another name suitable to your policies.
2. Under **Properties** for the new group, select the **Attribute Editor** tab.
3. Scroll down the **Attributes** list box until you find the **objectSID** attribute item.
4. Record the security ID string in the value field for the **objectSID** attribute.

![object SID in DASH Admins group Properties](https://cdrt.github.io/mk_docs/img/dash/23-dash.png)

Alternatively, you can obtain the SID using PowerShell:

      Get-ADGroup -Identity [DASHADMINS]| select SID

### Add user(s) to the created group

Under the **Properties** of the SPN user account created, open **Member Of** tab and add the newly created DASH Administrators group.

Also add the domain user accounts that require access to the DASH Systems to the new &quot;DASHAdmins&quot; security group.

### Use DASHConfigRT.exe to add the configured parameters to DASH systems

#### Update the DASHConfig provisioning XML file for distribution:

 1. Make a backup copy of the _DASHConfig.xml_ file located at _C:\Program Files (x86)\AMD Management Console\DASHConfigRT._
 2. Edit _DASHConfig.xml._ to add the information from the previous steps and save the file:

- ACTIVEDIRECTORY\_SPNACCOUNT
- SPNACCOUNT\_PASSWORD
- ACTIVEDIRECTORY\_GROUP
- OBJECTSID

#### Example Config.xml
        <?xml version="1.0" encoding="utf-8"!!! info ""
   
        <DASHPROVISIONSETTINGS>
          <MANAGEMENTTARGET>
          <GLOBAL>
            <HTTPS>
                 <ENABLESUPPORT>true</ENABLESUPPORT>
                 <TCPIPPORT>664</TCPIPPORT>
           </HTTPS>
            <HTTP>
                <ENABLESUPPORT>true</ENABLESUPPORT>
                <TCPIPPORT>623</TCPIPPORT>
            </HTTP>
            </GLOBAL>
          <USERS>
             <USER>
                <USERID>Administrator</USERID>
                <PASSWORD> [Administrator Password]</PASSWORD>
                <ENABLE>true</ENABLE>
                <ROLES>
                    <ROLE>Administrator Role</ROLE>
                </ROLES>
              </USER>
          </USERS>
        	<ACTIVEDIRECTORY>
                <ENABLESUPPORT>true</ENABLESUPPORT>
	  	          <ACTIVEDIRECTORY_SPNACCOUNT> [DASH SPN Account] </ACTIVEDIRECTORY_SPNACCOUNT>
               <SPNACCOUNT_PASSWORD> [Password] </SPNACCOUNT_PASSWORD>
	  	    <ACTIVEDIRECTORY_GROUPS>
			       <ACTIVEDIRECTORY_GROUP>
		  	        <GROUPNAME> [DASH Admins Group] </GROUPNAME>
                <OBJECTSID>S-1-5-21-0123456789-0123456789-0123456789-1118<OBJECTSID>
		          	  <ROLES>
			              <ROLE>Administrator Role<ROLE>
			           </ROLES>
              </ACTIVEDIRECTORY_GROUP>  
	          </ACTIVEDIRECTORY_GROUPS>
          </ACTIVEDIRECTORY>
          </MANAGEMENTTARGET>
         </DASHPROVISIONSETTINGS>
		
### Run DASHConfig utility on DASH managed system

The **DASHConfig/DASHConfigRT** utility can run on DASH systems manually or you can use Configuration Manager to run the script.
### Configuration Manager DASH Plugin settings

The **DASH Configuration** node allows you to configure for Authentication, Management Port, Management Transport, and DASH Wake-Up. Before performing any DASH operation on the client device, configure DASH with correct Authentication, Management Port and Management Transport.

## Authentication

AMPS supports two types of authentication schemes: Digest and Active Directory.

AMPS supports up to 3 authentication entries. Each authentication entry has the components:
- an authentication identifier, which must be unique
- an authentication scheme (digest or Active Directory)
- corresponding credentials

### Configure Authentication for AMPS

To configure Active Directory authentication using Configuration Manager console, navigate to **Administration/DASH Management/DASH Configuration** :

1. Right click the server listed and select **Properties**
2. Under **Authentication Schemas**, add a unitque _Auth Identifier_ set to schema _Active Directory_
3. Enter the DASH systems domain user and password created earlier.
4. Click **OK**.

![AMPS Authentication](https://cdrt.github.io/mk_docs/img/dash/41-dash.png)

## Management and Transport Ports
AMPS can communicate with the managed DASH computer systems on either HTTP or HTTPS.

!!! info ""
   The default port for HTTP is 623 and HTTPS is 664.

###  Alerts Event Port

The Alerts event reporting port should be configured during the installation process of AMPS. The port number entered during installation is visible in the Configuration screen ( **Administration/DASH Management/DASH Configuration** ).

![Alerts Event Port](https://cdrt.github.io/mk_docs/img/dash/24-dash.png)

### Wakeup during Package Deployment

The **DASH Wakeup** functionality enables Configuration Manager to use secure DASH commands and Wake-on-LAN to power up systems.

The Wake-on-LAN packet is not guaranteed to wake all the devices in the collection. This is the purpose of the DASH power on operation provided by the AMPS.

To configure the DASH Wakeup feature, perform the following steps:

- Ensure that a working **authentication scheme** is in place (See [Authentication](#configure-authentication-for-amps) section above)

- In the **DASH Configuration** screen select the **DASH Wakeup** check box, if already not selected.
- In the **Software Deployment Package,** be sure to enable the Wake-on-LAN option and set a valid future schedule when creating the software deployment package for a device collection.

### Auto Discovery

If the **DASH Auto Discover** check box is selected, a new device added to Configuration Manager is checked for DASH support automatically.

  ![DASH Auto Discover](https://cdrt.github.io/mk_docs/img/dash/26-dash.png)

### Create the DASHConfig Software Package

The steps to create the software package are as follows:

 In the Configuration Manager console navigate to **Software Library \&gt; Application Management \&gt;** right click **Package** node \&gt; **Create Package**

 In Create **Package and Program Wizard** enter the following information:

- Name: DASHConfigRT
- Version: x.x.x.x
- Manufacturer: AMD
- Language: English

 Next, on the **Data Source** page

- Select &quot;This package contains source files&quot;
- Source Folder: Enter the directory on the site server where the DASHConfigRT files are stored.
- Next, select Standard Program – Create a Program for a client computer

 Next, complete the **Standard Program** information:

- Name: DASHConfigRT
- Command: DASHConfigRT.exe -xf:Config.xml -dxf -mif
- Run: Normal
- Run with Administrative Rights

!!! info ""
   For details of all the command options refer to the **DASHConfigRTguide.pdf** located at _C:\Program Files (x86)\AMD Management Plugin for SCCM\DASHConfigRT_

1. Next, accept the defaults on the **Requirements** page
2. Next, verify the information in the **Summary** and click Next, thenClose
3. Right click on the newly created DASHConfig Package and select **Properties**.
4. On the **Data Access** tab, check &quot;Copy the content in this package to a package share on distribution points.&quot;
5. On the **Distribution Settings** tab
    - Set the Distribution Priority to High
    - Check &quot;Distribute the content for this package to preferred distribution points,&quot; and select &quot;Automatically download content when packages are assigned to distribution points.&quot;

## Distribute the DASHConfig Software Package

To distribute the software package:

 In the Configuration Manager console navigate to **Software Library \&gt; Application Management**

 1. Click on the **Package** node and select the DASHConfig Package
 2. Right click the DASHConfig package and select **Deploy** to launch the deploy software wizard.
 3. On the **Content** page, Verify the distribution point is added, if not click on the **Add** button and add manually
 4. Next, **Schedule** the deployment as needed and click Next
 5. Specify the **User Experience** and other installation behavior according to your organization&#39;s needs
 6. Select the **Deployment Option** s to &quot;Download content from distribution point and run locally.&quot;

 7. Next, verify the information in the **Summary**
 2. Next, you should receive a **Confirmation** page indicating &quot;The Deploy Software Wizard completed successfully&quot; and you can close the Wizard.
 3. To get status, check the Configuration Manger System Status logs and the execmgr.log file in the DASH machine&#39;s _C:\Windows\System32\CCM\Logs_ folder. Alternatively, you can check the package&#39;s folder for the DASHConfig.log file.

### Manually run DASHConfigRT

The DASHConfigRT utility must be run locally with administrative privileges.

Steps to run DASHConfigRT on one system:

 1. From an administrative command prompt, navigate to the directory with the DASHConfigRT executable and provisioning XML.

 2. Invoke DASHConfigRT using following command line:

        DASHConfigRT -xf:DASHConfig.xml -dxf -mif 

!!! info ""
   The optional _-dxf_ switch deletes the Config.xml file, whih is recommended as the file includes the password. The _-mif_ parameter
The -mif parameter creates a Microsoft installation status MIF file on exit.

## Performing DASH Operations

The AMPS installation creates a collection node called **All DASH Capable Systems**. This collection contains all the devices which are DASH capable, once discovered.

Devices in **All DASH Capable Systems** support the following DASH operations:

- Discovery
- Power Control
- Boot Control
- Text Redirection
- USB Redirection
- Alerts
- Inventory
- Log Entry
- Boot to Text Image
- Firmware Update
- Boot to BIOS( KVM Profile)
- KVM Redirection

### Discovering a collection

The AMPS Discover feature allows you to automatically discover the DASH capable systems within a collection.

To discover DASH capable client systems in a collection, perform the following steps:

 1. Expand the **Assets and Compliance/Device Collections** node.
 In the right pane, list of all the collections appears.
 2. Right-click the collection in which you want to discover all the DASH capable systems.
 The shortcut menu appears.
 3. In the shortcut menu, Point to **DASH** and then click **Discover**.

 4. The **Discover Collection** dialog box appears
     ![Discovery Dialog](https://cdrt.github.io/mk_docs/img/dash/27-2-dash.png)

5. To discover DASH capable systems in the collections, click the **Yes** button.

### Discovering a Device

This feature enables you to discover a single DASH capable system.

To discover an individual DASH capable system, perform the following steps:

 1. Expand the **Assets and Compliance/Devices/All Systems** node.
 2. Expand the **Devices** node and click **All Systems**.
 3. In the right pane, right-click the device for which you want to discover DASH.
 4. In the shortcut menu, point to **DASH** and then click **Discover**.

### Power Control

AMPS allows you to control the power state of a group of systems in a given collection.

To control the power state of a collection node, perform the following steps:

 1. Expand the **Assets and Compliance** node.
 2. Expand the **Overview** node and click **Device Collections** or an **individual device**.
 In the right pane, the list of all the available collections appears.
 3. Right-click the collection for which you want to initiate power control.
 4. In the shortcut menu, select **DASH** and then click **Power Control**.
 5. The **Power Control** on Collection dialog box appears

![DASH Device actions](https://cdrt.github.io/mk_docs/img/dash/27-dash.png)

!!! info ""
   See [Power States](#power-states) for PC supported power states table.

### Scheduled Power Control

To power on all the systems in a Collection at a specific time on a one-time or recurring schedule, perform the following steps:

1. Open the **Power Control** feature screen
2. Click the **Schedule** button.
3. Configure the schedule as desired and click **OK,** then **Apply,** then **Close.**

![DASH Power schedule](https://cdrt.github.io/mk_docs/img/dash/28-dash.png)

### Boot Control
  
#### Text Redirection

Text Redirection provides BIOS-assisted console and keyboard redirection to a remote computer terminal. This includes Boot progress, BIOS setup screen, command line OS or command line diagnostic program screens.

A client system can redirect its console text to the AMPS provided console using either Telnet or SSH.

Follow these steps to use Text Redirection using AMPS:

1. In Configuration Manager navigate to **Assets and Compliance** \&gt; **Overview** \&gt; **Devices** \&gt; **All Systems** node.
2. Expand the **Devices** node and click **All Systems**.
3. In the right pane, right-click the device on which you want to perform Text Redirection.
4. In the shortcut menu that appears, select **DASH** , then **Text Redirection**.
Alternatively, on the Configuration Manager ribbon, select the **DASH** tab, then **Text Redirection**.

![DASH tab with DASH Ribbon](https://cdrt.github.io/mk_docs/img/dash/29-dash.png)

 The **Text Redirection** Screen appears and shows:

   1. Drop down list with available protocols for text redirection, SSH and Telnet respectively. (SSH is the default.)
   2. The Name of the Service that runs on the system to redirect the text.
   3. The port through which the text will be redirected.
   4. The information/status is stated – e.g., Support for OTP (one time password)

  ![Text Redirection](https://cdrt.github.io/mk_docs/img/dash/42-dash.png)

#### USB-Redirection

USB Redirection provides a Virtual USB device which reads data from a remote image file, allowing the BIOS to boot from a remote image file such as _.iso_. See also [USB Redirection](#usb-redirection) above.

The ISO image file must be available as a _http_ web URL.

To initiate a USB redirection for a system, perform the following steps:

 1. In Configuration Manager navigate to **Assets and Compliance\Overview \Devices\All Systems** node. Expand the **Devices** node and click **All Systems**.
 2. In the right pane, right-click the device on which you want to perform USB redirection.
 3. In the shortcut menu that opens, point to **DASH** and then click **USB Redirection**.
The **USB Redirection** screen appears and displays the following:

    - The name of the system for whose USB, AMPS is going to attach the remote URL
    - The URL that has to be attached to the systems USB.
     If the USB is already attached to the remote URL,then the attached URL is displayed , and the option to edit the URL field is grayed out. You can disconnect the attached USB by clicking the **Disconnect** button on the screen.
    - If the USB is not attached, you can replace/update any existing URL or enter a new valid URL and click the **Connect** button

![USB Redirection](https://cdrt.github.io/mk_docs/img/dash/43-dash.png)

 4. To close the USB Redirection screen, click the **Close** button.

### Boot to Text Image

See [Boot to Text Image](#boot-to-text-image-feature)section above. The steps are identical in AMD Management Console and AMPS.

### Boot to BIOS (KVM Profile)

See [Boot to BIOS [KVM Profile]](#boot-to-bios-with-kvm-profile) section above. The steps are identical in AMD Management Console and AMPS.

### KVM Redirection

The steps are identical in AMD Management Console and AMPS.

### Inventory

Configuration Manager shows the Information that it collects about the managed device in the **Resource Explorer** window. Information collected by the AMPS plugin also ends up in the Resource explorer. DASH inventory is displayed in the path **SystemName\Hardware**.

Inventory is successful after successful client push, and can also be initiated manually. DASH inventory is populated using out-of-band DASH protocol.

To collect inventory, perform the following steps:

1. In the Configuration Manager console, navigate to **Assets and Compliance\Overview\Devices\All Systems**
2. In the right pane, right-click the device on which you want to collect the inventory.

3. In the shortcut menu select **DASH,** then click **Inventory.** Alternatively, click the DASH toolbar button to initiate the inventory

![Device Inventory dialog](https://cdrt.github.io/mk_docs/img/dash/30-dash.png)

 4. A confirmation should appear. Click **OK**.

### Log Entry

The managed DASH systems maintain log file for all events that are generated.

To view the log entry of a managed device:

 1. In the Configuration Manager console, navigate to **Assets and Compliance\Overview\Devices\All Systems**.
 In the right pane, right-click the device where you want to view the log.
 2. The shortcut menu is displayed. In the shortcut menu, point to **DASH** and then click **Log Entry**. The log entry screen appears.
The Log Entry screen displays the latest 20 log entries.
 3. Use the **Next** and **Previous** navigation buttons to view additional log entries. Double click an entry to launch the **Status Message Detail** window for that entry.

![DASH Log](https://cdrt.github.io/mk_docs/img/dash/31-dash.png)
  
### Firmware Update

AMPS allow you update the firmware for an individual system or a Collection.

To update the firmware on a system/collection, perform the following steps:

1. Expand **Assets and Compliance\Overview\Devices** or **Device Collections** node.
2. In the right pane, the list of systems or all the available collections appears.
3. Right-click the target. The shortcut menu appears.
4. In the shortcut menu, select **DASH** and then click **Firmware Upgrade**.
5. The **Firmware Update** dialog box appears.  In the Firmware Upgrade dialog box, select the **Software Module** from the drop-down list. The default (and only available) Software module is **Management Controller Firmware**.
'Schedule Time' can be immediate, or you can set a scheduled time.
6. The grid in the **Firmware Upgrade** windows lists the firmware URLs of the devices. Use the (+) and (-) buttons below the list to add and remove firmware URLs.
7. Select the checkboxes next to the devices or collections you wish to update and click on the **Apply** button. The firmware update executes at once.

 ![Firmware Update](https://cdrt.github.io/mk_docs/img/dash/37-dash.png)

### Alerts

AMPS can subscribe or unsubscribe to alerts generated by the managed systems.

The types of alerts are Platform, Boot Progress, and Lifecycle Events (temperature alerts, fan failure, chassis intrusion, and BIOS boot failure).

#### To configure alerts:

 1. Navigate to **Assets and Compliance/Overview/All Systems**
 2. In the right pane, right-click the device on which you want to perform Alert configuration.
The shortcut menu appears.
 3. In the shortcut menu, point to **DASH** and then click **Alerts**.

Alternatively, click the ribbon icon **Alerts**.

![DASH Alerts on toolbar](https://cdrt.github.io/mk_docs/img/dash/32-dash.png)

 4. AMPS shows the list of available alerts and currently subscribed alerts. Adjust the subscribed alerts using the left-right arrow buttons and click **Apply.**

 ![Manage subscribed alerts](https://cdrt.github.io/mk_docs/img/dash/33-dash.png)

## Role Based Administration

AMPS extends the Configurations Manager&#39;s security model to define which groups of users can perform DASH tasks and which groups of users can modify the DASH configuration.

### Security Role

**Security Role** defines the Configuration Manager administrative users&#39; job functions. Configuration Manager provides several built-in roles which perform functions such as Software Update Manager for managing software updates, and Full Administrator and Remote Tools Operator for performing restrictive DASH operations.

- **Full Administrators** possess all permissions in Configuration Manager. The administrative user who first creates a new Configuration Manager installation is associated with this security role, all scopes, and all collections. All DASH operations can be performed by users having Full Administrator role.

- **Operations Administrator** - AMPS allows Operation Administrators users to run all out of band DASH tasks, except the DASH Configuration operation, which can only be performed by the Full Administrator Role user.

- **Remote Tools Operator** - Administrative users associated with this role can run Remote Control, Remote Assistance and Remote Desktop from the Configuration Manager console. AMPS allows Remote Tools Operator users to run all out of band management operations such as DASH tasks, except the DASH Configuration operation which can only be performed by the Full Administrator Role user.

### Security Rights for DASH Operations

The User collection that can access a device collection can be viewed by navigating to **Assets and Compliance** \&gt; **Overview** \&gt; **Device Collections**. Right click on an instance like &quot;Windows 10 DASH systems&quot; and select **Properties** , then **Security.**

| **DASH Task** | **Right** | **Granted actions** |
| --- | --- | --- |
| Discover | Create, Modify, and Read Resource | Identify whether a system is DASH-capable or not. Get version information and the profiles supported. |
| Power | Read Resource | Obtain current system power state |
| Use Remote Tools | Change system power state |
| Boot | Read resource | Obtain boot order information. |
| Use Remote Tools | Change system boot order |
| Inventory | Read Resource | Obtain hardware inventory |
| KVM, USB, and Text Redirection | Read Resource and Use Remote Tools | Redirect BIOS screen, boot to remote ISO image. |
| Alerts/Events | Read Resource and Use Remote Tools | Subscribe and unsubscribe to all or selected event alerting. |
| Account Management | Read Resource | View list of digest accounts on DASH-capable system. |
| Use Remote Tools | Modify the digest account on DASH-capable system. |
| Firmware Upgrade | Read Resource | View list of firmware Images |
| Use Remote Tools | Add\Modify the list of firmware images |
| Log Entry | Read Resource | Obtain hardware inventory of the system. |
| Boot to Text Image | Read Resource | View list of remote ISO images |
| Use Remote Tools | Flash Image then Redirect to Text BIOS |
| Boot to BIOS | Read Resource | View list of KVM Redirection Instances to boot to BIOS |
| Use Remote Tools | Reboot the System and Redirect BIOS screen |

### Security rights defined for DASH settings

The security rights model applies for modifying DASH settings in the **DASH Configuration** window in the Configuration Manager Console.

The DASH settings that can be changed in the **DASH Configuration** window are:

- Modify digest and active directory authentication
- Modify HTTP/HTTPS settings
- Change DASH port numbers
- Enable/Disable DASH Auto Discovery and DASH wakeup

![DASH Configuration](https://cdrt.github.io/mk_docs/img/dash/46-dashConfig.png)

The **Full Control** security right allows Read or Modify on Site class or Site class instance control. Full Control can modify and save all settings and user security rights assignments.

The **Read** security right allows the user to open the DASH Configuration window and view the settings. The user cannot save the settings.

The **Modify** Security right allows the user to open the DASH Configuration windows, modify, and save the settings.

Navigate to **Administration\Overview\Site Configuration\Sites** to check this setting.

In AMPS, the administrator has the option to either enable or disable the user permission checking feature. This is a global setting and affects all users.

!!! info ""
   Only users with Full Administrator rights can modify and save the DASH Configuration window.

### Security Scope

Security scopes limit administrative users&#39; access to specific secured objects. While security roles grant the class level permission to the user such as &quot;Read Applications&quot;, security scopes grant instance level permission for _which_ applications they can read.  Refer to Configuration Manager documentation for more information. Security scopes are not considered for either DASH tasks or DASH configuration changes.

A **Collection** is the group of devices or users the administrative user can manage. For performing DASH tasks, the **Remote Tool Operator** role users must have access to the collection. Users with **Full Administrator** role have access to all collections.

## DASH Scheduled Tasks

### Schedule DASH Tasks

The following DASH tasks can be scheduled using AMPS:

- Discovery on collection task
- Power on collection task
- Firmware upgrade on collection task

The **Schedule** button is provided on supported screens. When a user clicks **Schedule** , the **DASH Task Scheduler** screen launches.

![DASH Task Scheduler](https://cdrt.github.io/mk_docs/img/dash/34-dash.png)
  
### View DASH Scheduled Tasks

The **DASH Scheduled Tasks** console enables you to view, as well as disable/enable or delete all the scheduled DASH tasks.

To view the scheduled DASH tasks:

 1. Navigate to the **Administration** tab in Configuration Manager.

 2. Click **Overview/DASH Management/DASH Scheduled Tasks**

 3. Select the target server and click **Properties**

![Accessing DASH Scheduled Tasks](https://cdrt.github.io/mk_docs/img/dash/35-dash.png)

## DASH Reports

**DASH Reports** gets deployed toConfiguration Manager reports during installation of AMPS provided the site server has the Reporting services point role. It is deployed in following path:

_Reportserver/Reports/browse/ConfigMgr/SiteCode/DASH Reports_

If there is a custom deployment or the reports are not present after install, the reports are available in _.rpl_ to import from _C:\Program Files (x86)\AMD Management Plugin for SCCM\SCCMReports._

## Status Monitoring

AMPS Status message in **Monitoring** category of Configuration Manager allows user to view all logged messages.

![AMPS Status](https://cdrt.github.io/mk_docs/img/dash/36-dash.png)

# Troubleshooting
## Troubleshooting DASH Operations

| **Screen** | **Error** | **Remediation** |
| --- | --- | --- |
| Configuration | The authentication account was not found. | Check authentication accounts |
| |The configuration was not updated since one or more of the tranpsort parameters is invalid. | Check HTTP input port value |
| |The configuration was not updated since one or more of the authentication parameters is invalid. | Check input credentials properly |
| |The configuration was not updated since one or more of the setting(s) is invalid. | Check input credentials properly |
|| The domain user name or password is incorrect. | Check Domain username and password correctly. |
| Power | Power task on the system failed. | While doing power operation based on selected power state failed please retry again or please check your credentials once again |
| |Power task on the group failed. | Supported power status not available in selected group of  target machines or please check your credentials once again(ex: power OFF, power ON, Sleep, Hibernate etc.) |
| |No power state available. | Supported power status not available in selected target machine(ex: power OFF, power ON, Sleep, Hibernate etc.) |
|| Unauthorized. Verify authentication credentials or port configuration. | Please check the credentials |
| Boot Config | No boot configuration instances found. | Boot configuration instances are not found in selected target, please verify the target once |
| |Changed Boot order had failed. | Changing boot order on selected target is failed please retry again |
|| Default configuration failed. | Changing default configuration on selected target is failed please retry again |
| |Object reference not set to an instance of object | When Boot Config profile has not devices listed. The NIC vendor has not added Devices in Boot config. |
|| Boot config failed. | Please check the credentials |
| |Boot config enumeration failed. | Please check the credentials |
| |Boot config change boot order failed. | Error ocurred while changing Boot order please retry again. |
| |Next configuration failed. | Changing next configuration on selected target is failed please retry again |
| Text Redirection | End the existing session and try again. | Please close the current Putty window. |
|| Verify if the system supports Text Redirection and try again. | Text Redirection not supported by selected target or please verify your credentials once |
|| Text redirection failed. Verify if the system supports text redirection and try again. | When there are no instances in text redirection. This message is seen. If the platform claims support for Text redirection, at least one instance needs to be supported. Please contact the NIC vendor for a fix to this issue |
| |No text redirection instance found. | Text Redirection not enabled on the selected target machine |
| USB Redirection | Verify if the system supports USB Redirection and try again. | Selected target not supports USB Redirection or please verify your credentials once |
|| No USB Redirection instance found. | USB Redirection not enabled on the selected target |
|| Already USB Redirected, either Modify or Disconnect. | USB Redirection already enabled in the selected target you may disconnect it or you can modify it. |
|| No USB Redirection instance found. | USB Redirection not enabled on the selected target |
|| USB Redirection failed. | Check input credentials properly and check whether target suppots USB Rdirection |
||USB Redirection disconnect failed. | Error ocurred while disconecting USB attached on target device please retry again. |
|| Length of URI specified is beyond allowed limit | Check Image URL properly and try again |
| |USB Redirection connect failed. | Error while attaching USB file on target . Please retry again |
|| Verify if URL exists. | May be Entered URL doesn&#39;t exist check again |
| |Text redirection failed. Verify if the system supports text redirection and try again. | When there are no instances in USB redirection. This message is seen. If the platform claims support for USB redirection, at least one instance needs to be supported. Please contact the NIC vendor for a fix to this issue |
| KVM Redirection | System does not support KVM redirection. | KVM redirection not supported by selected target or please verify your credentials once |
|| Supported KVM Redirection Instance not found. | KVM instance not found on the selected target please verify it once |
|| KVM Redirection connect failed. | There is an error while connecting to the target |
|| KVM Redirection timed out. | Time expired while connecting to target |
| |KVM Redirection request aborted. | Connection aborted by the target |
| |Unable to perform operation, Verify if KVM Redirection is supported by the managed system. | Please check the credentials and whether target supports KVM Redirection |
| |Enumeration failed for IP Interface | Check targets suppotrs KVM Extended mode |
| |Unable to connect to AMC Service. | Check your AMC service once, Go to services.msc and check these **AMCAlertservice, AMCDASHService, AMCWebservice** |
| |System Health | System Health information not found. | System health not supported on selected target or please verify your target once |
| Firmware Upgrade | Firmware Upgrade is not supported for this device. | Firmware upgrade not supported on selected target or please verify your credentials once |
|| Firmware Upgrade task failed.. | Firmware upgrade failed on selected target please retry again |
| Log Entry | Log Entry operation failed. | Log Entry not supported on selected target or please verify your credentials once |
| Alerts | No Indication filters were found. | Alerts are not supported on selected target or please verify your credentials once |
| |Indications failed. | Please check the credentials |
| |Subscription of indication failed. | Operation failed on subscribing alerts please retry once again |
|| Unsubscription of indication failed. | Operation failed on Unsubscribing alerts please retry once again |
|| Subscription quota limit is reached. | Alerts subscription limit is reached. |
| |Enumeration of filter collections failed. | Error while getting the alerts list please try again . |
|| Enumeration of subscribed indications failed. | Error while getting the alerts list please try again . |
| |Subscribed filter list had failed. | Operation failed on subscribing alerts please retry once again |
| |Enumeration of subscribed indication failed | When the platform does not support any events for subscription this error can be seen. |
| Boot to Text | Boot To Text Power state change failed. | Please check the credentials |
| |Boot To Text Power task not allowed on localsystem. | Please try Boot To Text on remote system. |
|| Boot To Text Power Management enumeration failed. | Please check the credentials and try again. |
|| Boot To Text USB Instances are not found. | Check whether target supports Boot To Text and retry again |
| |Boot To Text URL diconnect failed. | Error while disconnecting Boot To Text on target, please try again. |
| |Boot To Text URL connect failed. | Error while connecting Boot To Text on target, please try again. |
| |Boot To Text Get instance failed. | Check credentials and try again. |
|| Boot To Text Boot Order change failed. | Error while changing Boot order change. |
|| Boot To Text Boot instances are not found. | Check credentials and try again. |
|| Boot To Text Boot config change boot order failed. | Error while changing Boot order change. |
| |Boot To Text Boot device decription string retrieval failed. | Error while changing Boot order change. |
| |Boot To Text Boot config change order failed. | Error while changing Boot order change. |
| |Boot To Text failed to perform Text Redirection | Check credentials and try again. |
|| Boot To Text Text Redirection Disable failed | Error while disabling Boot To Text on target please try again |
|| Boot To Text failed to perform Text Redirection connect operation | Error while connecting Boot To Text on target please try again |
|| No BootToTextImage data found in the response | Boot text image not supported on selected target or please verify your credentials once |
| |Boot to BIOS | KVM redirection failed. | KVM Redirection failed on selected target please verify your credentials once |
|| System does not support KVM redirection. | Selected target doesn&#39;t supports KVM Redirection please verify your target |
|| Supported KVM Redirection Instance not found. | KVM Instance not found in the selected target |
|| KVM Redirection enumeration failed | Upon enumeration 0 instances are found. Check with NIC vendor if KVM support is added |
| Remote Access | Supported KVM Redirection Instance not found. | Please check target whether it supports In band KVM |
| KVM Redirection enumeration failed | Upon enumeration 0 instances are found. Check with NIC vendor if KVM support is added |

## Troubleshooting KVM issues

| Serial Number | Error code | Friendly Name | Description |
| --- | --- | --- | --- |
| 1 | Error 20 | Key Parse Failed | This error can be seen if some file related to installation has been modified. Issue can be resolved by reinstalling AMC |
| 2 | Error 21 | Connection Failed | This error can be seen if the platform did not successfully connect to the remote system via SSH. Re attempting to connect may resolve issue. If issue persists, please contact platform vendors |
| 3 | Error 22 | Host name not found | This error can be seen if the platform did not allow a socket connection with the client. This issue can occur if IP address changes in KVM session or if the KVM session is not enabled due to SSH failure. Please contact vendor if issue recurs. |
| 4 | Error 23 | Connection Key failed | This error can be seen if the platform did not successfully connect to the SSH connection with the provided key for KVM 1.9 and above. When this error occurs, SSH connection with KVM 1.8 is then attempted for KVM Redirection |
| 5 | Error 24 | Not Supported | This error can be seen when KVM Redirection is not supported on the platform where it was launched |
| 6 | Error 25 | Connection Forcibly Closed | This error can be seen if some activity in the platform forced it to close the connection |

# Resources and Support

More details about AMPS features and AMPS updates can be found at:

Link: [_http://www.amd.com/DASH_](http://www.amd.com/DASH)

DASH Support email: dashsupport@amd.com

!!! info ""
   AMPS is based on the DMTF DASH specification. Some commands might not be supported by a given platform. Check the platform documentation on the DASH support.
