---
title: Dock Manager Deployment Guide
description: Deploy Dock Manager with Microsoft Configuration Manager and Microsoft Intune, including installation commands, detection rules, and WMI integration
---

# Dock Manager Deployment Guide

## Quick Start

Choose your deployment method:

- **[ConfigMgr Deployment](#deploying-with-configmgr)** – Deploy using Microsoft Configuration Manager Application model
- **[Intune Deployment](#deploying-with-microsoft-intune)** – Deploy using Microsoft Intune Win32 apps
- **[Advanced Configuration](#advanced-configuration)** – WMI inventory, custom reporting, and detection scripts

## Before You Begin

### Requirements

- **Dock Manager installer** – `dock_manager_setup.exe` (available from [Lenovo Support](https://support.lenovo.com/us/en/solutions/ht037099#dm))
- **Operating System** – Windows 10/11 (64-bit)
- **Admin access** – Required to create applications and deployment rules

### Key Information

!!! note "Version Numbering"
    The version `1.0.0.125` shown in examples is a sample. Always substitute your current or target Dock Manager version in detection rules.

## Deploying with ConfigMgr

Dock Manager is provided as an executable. Deploy it using the ConfigMgr Application model with the steps below.

### Quick Reference

| Phase | Steps | Time |
|-------|-------|------|
| **Setup & Preparation** | Create application, configure app details, select deployment type | ~2 min |
| **Configuration** | Set install/uninstall commands, define detection rules, add requirements | ~5 min |
| **Deployment** | Deploy to device collection | ~1 min |

### Setup & Preparation

#### Step 1: Create Application

In the ConfigMgr console, navigate to **Software > Application Management > Applications** and click **Create Application** in the ribbon bar.

Tick the **Manually specify the application information** radio button and click **Next**.

![ConfigMgr Application wizard showing application information step](https://cdrt.github.io/mk_docs/img/guides/dm/image1.PNG)

#### Step 2: Enter Application Details

Specify information about the app and click **Next**.

![ConfigMgr Application wizard showing application details entry](https://cdrt.github.io/mk_docs/img/guides/dm/image2.PNG)

Enter Software Center details and click **Next**.

![ConfigMgr Application wizard showing Software Center details configuration](https://cdrt.github.io/mk_docs/img/guides/dm/image3.PNG)

#### Step 3: Configure Deployment Type

Set the deployment type to **Script Installer** and click **Next**.

![ConfigMgr Application wizard showing Script Installer deployment type option](https://cdrt.github.io/mk_docs/img/guides/dm/image4.PNG)

Set the deployment type name and click **Next**.

![ConfigMgr Application wizard showing deployment type name entry](https://cdrt.github.io/mk_docs/img/guides/dm/image5.PNG)

### Configuration

#### Step 4: Configure Installation Commands

Enter the content location path to the Dock Manager executable.

**Install command:**

```
"dock_manager_setup.exe" /VERYSILENT
```

**Uninstall command:**

```
unins000.exe /SILENT
```

**Uninstall start in:**

```
%ProgramFiles%\Lenovo\Dock Manager
```

#### Step 5: Set Detection Rules

![ConfigMgr showing detection rule registry path configuration](https://cdrt.github.io/mk_docs/img/guides/dm/image6.PNG)

Configure the detection rule with the following settings:

| Setting | Value |
|---------|-------|
| Setting type | Registry |
| Hive | HKLM |
| Key | `SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DockManager_is1` |
| Value | `DisplayVersion` |
| Data Type | String |
| Operator | Equals |
| Version | `1.0.0.125` |

!!! note "Version String"
    Substitute `1.0.0.125` with your current deployed version or target version.

#### Step 6: Configure Requirements

![ConfigMgr Application wizard showing User Experience settings step](https://cdrt.github.io/mk_docs/img/guides/dm/image7.PNG)

Set the installation behavior to **Install for system** and logon requirement to **Whether or not a user is logged on**.

Add operating system requirements (e.g., Windows 10/11 64-bit):

![ConfigMgr Application wizard showing operating system requirements](https://cdrt.github.io/mk_docs/img/guides/dm/image8.PNG)

### Deployment

#### Step 7: Deploy to Collection

Complete the deployment type and application wizards. Deploy the application to a Device Collection.

## Deploying with Microsoft Intune

Deploy Dock Manager using Microsoft Intune Win32 app management. Follow the steps below to package and deploy the application.

### Quick Reference

| Phase | Steps | Time |
|-------|-------|------|
| **Setup & Preparation** | Package installer, create Win32 app | ~3 min |
| **Configuration** | Add app details, install commands, requirements, detection rules | ~5 min |
| **Deployment** | Assign to user/device groups | ~1 min |

### Setup & Preparation

#### Step 1: Package the Installer

Use the Win32 Content Prep [Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool) to convert the Dock Manager installer to .intunewin format:

```
IntuneWinAppUtil.exe -c "C:\IntuneWin\DM\" -s "dock_manager_setup.exe" -o "C:\IntuneWin\output\" -q
```

![Win32 Content Prep Tool console output showing successful packaging](https://cdrt.github.io/mk_docs/img/guides/dm/image9.PNG)

#### Step 2: Create Windows App in Intune

Log in to the Endpoint Admin Center [portal](https://endpoint.microsoft.com/#blade/Microsoft_Intune_DeviceSettings/AppsWindowsMenu/windowsApps) and create a new Windows app.

Select **Windows app (Win32)** as the app type and upload the **dock_manager_setup.intunewin** package file.

### Configuration

#### Step 3: Configure Application Details

Enter required and optional information about the app:

![Microsoft Intune app creation wizard showing application information step](https://cdrt.github.io/mk_docs/img/guides/dm/image10.PNG)

#### Step 4: Configure Installation Commands

Enter the install and uninstall commands:

**Install command:**

```
dock_manager_setup.exe /VERYSILENT
```

**Uninstall command:**

```
%ProgramFiles%\Lenovo\Dock Manager\unins000.exe /SILENT
```

![Microsoft Intune app creation wizard showing install and uninstall command configuration](https://cdrt.github.io/mk_docs/img/guides/dm/image11.PNG)

#### Step 5: Set Device Requirements

Configure operating system and device requirements based on your environment.

![Microsoft Intune app creation wizard showing device requirements and detection script](https://cdrt.github.io/mk_docs/img/guides/dm/image12.PNG)

!!! info "Optional: Device Detection Script"
    To ensure Dock Manager is only deployed to devices with compatible docks, you can add a custom detection script. See [Device Detection Script](#optional-device-detection-script) below.

#### Step 6: Configure Detection Rules

Set up detection rules to verify the correct version of Dock Manager is installed:

| Setting | Value |
|---------|-------|
| Key path | `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DockManager_is1` |
| Value name | `DisplayVersion` |
| Detection method | String comparison |
| Operator | Equals |
| Value | `1.0.0.125` |

![Microsoft Intune detection rule configuration showing registry path and version matching](https://cdrt.github.io/mk_docs/img/guides/dm/image13.PNG)

!!! note "Version String"
    Replace `1.0.0.125` with your current or target Dock Manager version.

### Deployment

#### Step 7: Assign to Groups

Complete the app creation wizard and assign the application to user or device groups.

### Optional: Device Detection Script

To deploy Dock Manager only to devices with supported Lenovo docks, add this PowerShell script as a requirement or detection script:

```powershell
# Check for Thunderbolt 3 Dock Gen 2
$dock = Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.DeviceID -like 'USB\VID_2109&PID_8887*' }
if ($dock) {
    Write-Output "Thunderbolt 3 Dock Detected!"
    exit 0
}
else {
    exit 1
}
```

**Common Dock IDs:**

| Dock Model | USB VID/PID |
|------------|------------|
| Thunderbolt 3 Dock Gen 2 | `USB\VID_2109&PID_8887*` |
| Thunderbolt 3 Dock | `USB\VID_2109&PID_0503*` |
| USB-C Dock Gen 2 | `USB\VID_17EF&PID_1060*` |
| USB-C Dock | `USB\VID_17EF&PID_A387*` |

Contact [Lenovo Support](https://support.lenovo.com) for additional dock IDs.

## Advanced Configuration

### WMI Hardware Inventory Integration

Extend hardware inventory in ConfigMgr to collect Dock Manager data from your clients. You can import the provided .mof file to add custom WMI classes to inventory:

**Download MOF file:** [ConfigMgr-MOF-DockManager.zip](https://download.lenovo.com/cdrt/blog/ConfigMgr-MOF-DockManager.zip)

**Steps:**
1. Download and extract the MOF file
2. Navigate to **Administration > Client Settings** in ConfigMgr
3. Configure **Hardware Inventory** and add the Dock Manager classes
4. Deploy the updated client settings

**Example Resource Explorer view:**

![WMI data displayed in ConfigMgr Resource Explorer](https://cdrt.github.io/mk_docs/img/guides/dm/image14.PNG)

### Custom Reporting

Use SQL Server Reporting Services (SSRS) to create reports on Dock Manager deployment and firmware status:

![Sample SSRS report showing Dock Manager firmware versions and status](https://cdrt.github.io/mk_docs/img/guides/dm/image15.PNG)

!!! info "Sample Report Template"
    A sample SSRS report template is available for download: [LenovoDockManager.zip](https://download.lenovo.com/cdrt/docs/LenovoDockManager.zip)
    
    After downloading, update the Data Source properties to connect to your ConfigMgr database.

## Next Steps

After deployment, refer to the following resources:

- **[Managing Dock Manager with Intune](dm_manage_intune.md)** – Configure advanced policies and scheduling using ADMX templates
- **[Dock Manager Troubleshooting](dm_troubleshooting.md)** – Troubleshoot common deployment and scheduling issues
- **[Dock Manager FAQ](dock_manager_faq.md)** – Find answers to frequently asked questions
