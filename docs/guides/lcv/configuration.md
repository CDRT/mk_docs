---
title: Configuration
description: Commercial Vantage configuration methods using Group Policy and registry
---

# Configuration

Lenovo understands that some features of Commercial Vantage may not be appropriate for end users in a managed corporate environment. Most features can be hidden or disabled via Group Policy or registry settings.

!!! warning "Logging Setup"
    By default, logging is disabled. To enable logging, set these registry values to "Trace":
    
    ```registry
    [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\VantageService\FileLogger]
    "LenovoVantageShell"="Trace"
    "AllLogs"="Trace"
    ```
    
    Logs are located in: `%ProgramData%\Lenovo\Vantage\Logs\`
    
    System Update logs: `LenovoSystemUpdateAddin` subfolder

## Quick Start

| Your Environment | Recommended Method | Setup Time |
| --- | --- | --- |
| Domain-joined PCs | [Group Policy](#group-policy) | 5 min |
| Non-domain PCs | [Registry files](#registry) | 10 min |
| OS deployment (ConfigMgr/MDT) | [Registry](#registry) or [ConfigMgr](#configuration-manager) | 15 min |
| Intune managed devices | [Registry](#registry) | 10 min |
| Test single PC | [Registry Editor](#registry) | 5 min |

---

## Configuration Methods

### Group Policy

Recommended for domain-joined PCs.

**Setup:**

1. Add **CommercialVantage.admx** and **CommercialVantage.adml** to your Central Store
   - Location: `C:\Windows\PolicyDefinitions`
2. Edit in Group Policy Editor: **Computer Configuration → Administrative Templates → Commercial Vantage**

For Microsoft documentation on Central Store setup: [Create and manage Group Policy Central Store](https://support.microsoft.com/help/3087759)

??? note "How to export policies as .reg file for deployment"
    
    **Steps:**
    
    1. Copy **CommercialVantage.admx** to `C:\Windows\PolicyDefinitions`
    2. Copy **CommercialVantage.adml** to `C:\Windows\PolicyDefinitions\en-US`
    3. Open **gpedit.msc**
    4. Navigate to **Local Computer Policy → Computer Configuration → Administrative Templates → Commercial Vantage**
    5. Configure desired policy settings
    6. Close Group Policy Editor
    7. Open **regedit.exe**
    8. Navigate to `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Lenovo\Commercial Vantage`
    9. Right-click **Commercial Vantage** and select **Export**
    10. Save the `.reg` file to deploy to other PCs

### Registry

For non-domain or OS deployment scenarios.

**Quick Deployment:**

Use the **VantageDisableAutomaticSystemUpdates.reg** file (included in Enterprise Package) or create your own `.reg` file by following the Group Policy export steps above.

**Registry Path:**
```
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Lenovo\Commercial Vantage
```

**Common Values:**
- `AutoUpdateEnabled` (REG_DWORD): 0 = disabled, 1 = enabled
- `AcceptEULAAutomatically` (REG_DWORD): Auto-accept EULA
- `feature.giveFeedback` (REG_DWORD): Allow feedback submission

---

## Feature Configurations

### System Update – Automatic Updates

By default, Commercial Vantage automatically installs updates on a weekly schedule:
- All "Critical" updates (BIOS, firmware, drivers, software)
- All "Recommended" driver updates

??? note "Configure automatic updates"
    
    **Disable auto-update:**
    
    - **Group Policy:** Computer Configuration → Administrative Templates → Commercial Vantage → Device → System Update → Auto Update
    - **Registry:** Set `AutoUpdateEnabled` to `0` under `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Lenovo\Commercial Vantage`
    - **File:** Use `VantageDisableAutomaticSystemUpdates.reg` (in Enterprise Package)
    
    **Configure update types:**
    
    Edit: **Computer Configuration → Administrative Templates → Commercial Vantage → System Update → Configure System Update**
    
    Options:
    - Install only driver and software updates
    - Install only BIOS and firmware updates
    - Install all critical and recommended updates

### System Update – Custom Repository

Use a custom repository instead of Lenovo's default.

??? note "Configure custom update repository"
    
    **Location:** Group Policy or Registry
    - **Group Policy:** Computer Configuration → Administrative Templates → Commercial Vantage → Device → System Update → System Update Repository
    - **Registry:** `HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Lenovo\Commercial Vantage\RepositoryPath`
    
    **Supported paths:**
    - Local folder: `c:\myRepository`
    - Mapped drive: `m:\myRepository`
    - UNC path: `\\myServer\myRepository`
    - **Cloud storage (v10.2208.22.0+):** HTTPS URL to accessible location
    
    **Create custom repository:**
    - [Download Lenovo Tools for Admins](https://support.lenovo.com/us/en/solutions/ht037099)
    - [System Update Suite Product Guide – Update Retriever](/guides/sus/su_dg/su_dg_ch3/#33-update-retriever)

### System Update – Update History

Commercial Vantage writes update history to WMI (ROOT\LENOVO namespace).

??? note "Query update history"
    
    **WMI Class:** `Lenovo_Updates`
    
    **Available fields:**
    - Package ID (for this model)
    - Severity level
    - Installation status
    - Update title
    - Version number

### Application Features – Show/Hide UI Elements

Hide specific Commercial Vantage features from users.

??? note "Hide or disable features"
    
    **Sample configuration (sample-policy-config.reg):**
    - Hide the "Support" section
    - Hide the "WiFi Security" feature
    - Automatically accept the End User License Agreement (EULA)
    - Write system warranty information to WMI
    
    **Deploy custom configurations:**
    
    1. Configure desired policies in Group Policy Editor (see [Exporting as .reg file](#how-to-export-policies-as-reg-file-for-deployment))
    2. Export to `.reg` file
    3. Import during OS deployment or use Configuration Manager/Intune

### Warranty Information

Write system warranty data to WMI.

??? note "Enable warranty information collection"
    
    **Group Policy:** Computer Configuration → Administrative Templates → Commercial Vantage → Device → Warranty
    
    **WMI Classes:**
    - `Lenovo_WarrantyInformation`: SerialNumber, Product, StartDate, EndDate, LastUpdateTime
    - `Lenovo_WarrantyElement`: Details of purchased warranties

### Battery Information (ThinkPad)

Write battery data to WMI for monitoring.

??? note "Enable battery information collection"
    
    **Group Policy:** Computer Configuration → Administrative Templates → Commercial Vantage → Device → Device Settings → Power
    
    **WMI Class:** `Lenovo_Battery` – Same information displayed in Commercial Vantage application

---

## Deployment Platforms

### Microsoft Configuration Manager

Deploy policies during OS deployment or as ongoing compliance baselines.

??? note "Package/JSON Method"
    
    **Recommended baseline policies included in example.**
    
    **Step 1: Create policies.json**
    
    ```json
    [
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "AcceptEULAAutomatically",
            "Value": "1",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "AutoUpdateEnabled",
            "Value": "0",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "feature.giveFeedback",
            "Value": "1",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "page.hardwareScan",
            "Value": "1",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "TurnOffMetricsCollection",
            "Value": "1",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "RunOnce",
            "Value": "1",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "wmi.warranty",
            "Value": "1",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "page.wifiSecurity",
            "Value": "1",
            "Type": "REG_DWORD"
        },
        {
            "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
            "Name": "page.mySoftware",
            "Value": "1",
            "Type": "REG_DWORD"
        }
    ]
    ```
    
    **Step 2: Create PowerShell script (Set-CommercialVantagePolicies.ps1)**
    
    ```powershell
    $jsonFile = "policies.json"
    $jsonPath = "$PSScriptRoot\$jsonFile"
    $registryPath = "HKLM:\SOFTWARE\Policies\Lenovo\Commercial Vantage"
    
    if (-not (Test-Path $jsonPath))
    {
        Write-Error "JSON file not found at $jsonPath"
        exit 1
    }
    
    if (-not (Test-Path $registryPath))
    {
        $null = New-Item -Path $registryPath -Force -ErrorAction Stop
    }
    
    $registrySettings = Get-Content -Path $jsonPath | ConvertFrom-Json
    
    foreach ($setting in $registrySettings)
    {
        $path = $setting.Path
        $name = $setting.Name
        $value = $setting.Value
        $type = $setting.Type
    
        if (-not (Test-Path $path))
        {
            New-Item -Path $path -Force
        }
    
        Set-ItemProperty -Path $path -Name $name -Value $value -Type $type
        Write-Output "Applied registry setting: Path=$path, Name=$name, Value=$value"
    }
    ```
    
    **Step 3: Create ConfigMgr Package**
    
    1. Go to **Software Library → Application Management → Packages**
    2. Click **Create Package**
    3. Specify **Name** and check **This package contains source files**
    4. Select **Source folder** containing policies.json and script
    5. Select **Do not create a program**
    6. Distribute to **Distribution Points**
    
    **Step 4: Add to OS Deployment Task Sequence**
    
    1. Add **Run PowerShell Script** step after **Setup Windows and Configuration Manager**
    2. Set **Name**: "Set Commercial Vantage Policies"
    3. Check **Select a package with a PowerShell script** and browse to package
    4. Set **Script name**: Set-CommercialVantagePolicies.ps1
    5. Set **PowerShell execution policy**: Bypass

??? note "Configuration Baseline Method"
    
    Deploy ongoing compliance monitoring of Commercial Vantage policies.
    
    **Create Configuration Item:**
    
    1. Go to **Assets and Compliance → Compliance Settings → Configuration Items**
    2. Click **Create Configuration Item**
    3. On **General** page: Enter **Name** and description
    4. Under type: Select **Windows Desktops and Servers (custom)**
    5. On **Supported Platforms**: Select Windows 10 (64-bit), Windows 11 (ARM64, 64-bit)
    6. On **Settings** page: Click **New**
    7. On **General** tab:
       - **Name**: Accept EULA Automatically
       - **Setting type**: Registry value
       - **Data type**: Integer
       - **Hive**: HKEY_LOCAL_MACHINE
       - **Key name**: SOFTWARE\Policies\Lenovo\Commercial Vantage
       - **Value name**: AcceptEULAAutomatically
       - **Check: Create the registry value as a REG_DWORD data type if remediated for noncompliant rules**
    8. On **Compliance Rules** tab: Click **New**
       - **Name**: Accept EULA Automatically
       - **Operator**: Equals
       - **For the following values**: 1
       - **Check: Remediate noncompliant rules when supported**
       - **Check: Remediate noncompliance if this setting is not found**
       - **Noncompliance severity**: Information
    
    **Repeat for each policy in this table:**
    
    | **Policy Name** | **Registry Value Name** |
    | :--- | :--- |
    | Disable Auto Update | AutoUpdateEnabled |
    | Turn Off Give Feedback | feature.giveFeedback |
    | Turn Off Hardware Scan | page.hardwareScan |
    | Turn Off Metrics Collection | TurnOffMetricsCollection |
    | Turn Off My Software | page.mySoftware |
    | Turn Off Run-Once Task | RunOnce |
    | Turn Off Network | page.wifiSecurity |
    | Write Warranty Info to WMI | wmi.warranty |
    
    **Create Configuration Baseline:**
    
    1. Go to **Assets and Compliance → Compliance Settings → Configuration Baselines**
    2. Click **Create Configuration Baseline**
    3. Enter **Name** and description
    4. Under **Configuration data**: Click **Add** → Choose **Configuration Items** → Select your items
    5. **Check: Always apply this baseline even for co-managed clients**
    6. Deploy to a **Device Collection** containing Lenovo Think products

---

!!! question "Need Help?"
    Have questions about configuration? Join the [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg).
