# Configuration

!!! warning
    Due to requirements from the Lenovo Product Security team, logging is not enabled by default any longer. To enable logging, set the following registry value to "True": [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\SystemUpdateAddin\Logs]"EnableLogs"="True"

    Logs can be found in:
    ```%ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs```

Lenovo understands that some features of Commercial Vantage may not be appropriate for end users in a managed corporate environment. Therefore, most features of Commercial Vantage can be hidden or disabled so that your end users cannot access them. There are two ways to configure Commercial Vantage:

## Group Policy Administrative Template

If your PCs are joined to a domain, and you are familiar with Group Policy Administrative Templates (admx), you can add **CommercialVantage.admx** and **CommercialVantage.adml** to your Central Store. These files are located in the **Group Policy Settings** folder of the .zip file that includes this document. Then, use the Group Policy Editor to manage:

- **Computer Configuration -> Administrative Templates -> Commercial Vantage**

The settings listed in the Policy Editor allow controlling which parts of the Commercial Vantage User Interface are displayed to the user. For example, you can enable the &quot;Turn off Wifi Security&quot; policy to hide the WiFi Security feature of Commercial Vantage.

For more information about using Group Policy Administrative Templates, please refer to the following Microsoft documentation: [https://support.microsoft.com/help/3087759/how-to-create-and-manage-the-central-store-for-group-policy-administra](https://support.microsoft.com/help/3087759/how-to-create-and-manage-the-central-store-for-group-policy-administra) .

## Registry

Commercial Vantage can also be configured by importing .reg file(s) to your PCs as you deploy them. You can also create your own .reg file(s) by following these instructions on a test system:

1. Copy **Group Policy Settings\CommercialVantage.admx** to the **C:\Windows\PolicyDefinitions** folder
2. Copy **Group Policy Settings\en-US\CommercialVantage.adml** to the **C:\Windows\PolicyDefinitions\en-US** folder
3. Run gpedit.msc
4. The configuration items are at **Local Computer Policy -> Computer Configuration -> Administrative Templates -> Commercial Vantage**
5. From here, you can configure the policy settings that you want.
6. When you are done changing settings, close the Group Policy Editor, and then run regedit.exe
7. In the Registry Editor, navigate to **Computer\HKEY\_LOCAL\_MACHINE\SOFTWARE\Policies\Lenovo**
8. Right-click on **Commercial Vantage** , and then choose the option to Export
9. Save the registry file to your PC
10. On the PCs where you are deploying Commercial Vantage, import this registry file. This can be done before, during, or after the deployment of Commercial Vantage.

## Features and Sample Configurations

1. **Commercial Vantage – show/hide application features**

The sample configuration (sample-policy-config.reg) is provided as a registry export file which can be used as-is (see Chapter 3). The .reg file can be imported to your target systems during deployment, as part of **setup-commercial-vantage.bat**. In this sample, the following policies are pre-configured:

1. Hide the &quot;Support&quot; section
2. Hide the &quot;WiFi Security&quot; feature
3. Automatically accept the End User License Agreement (EULA)
4. Write the system warranty information to WMI

Again, this is just a sample. You can deploy any available policy setting in this way by following the instructions in Chapter 3.

### System Update – Automatic Updates

By default, the System Update feature of Commercial Vantage automatically installs the following updates on a weekly schedule:

- All "Critical" updates (BIOS, firmware, drivers, and software)
- All "Recommended" driver updates (not BIOS, firmware, or software)

These automatic updates can be disabled in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> System Update -> Auto Update**. Or, you can use the **VantageDisableAutomaticSystemUpdates.reg** file which is included in the deployment packagee.

You can configure the types of updates that get installed automatically in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> System Update -> Configure System Update**. For example, you can choose to install _only_ driver and software updates, and not any BIOS or firmware updates. Or you can install all critical and recommended updates.

### System Update – Update History

The System Update feature of Commercial Vantage writes update history to WMI (in the ROOT\LENOVO namespace). The Lenovo\_Updates class will contain each applicable package ID for that specific model, along with the Severity, Status, Title, and Version.

### System Update – Update Repository

By default, the System Update feature of Commercial Vantage searches the Lenovo repository of updates. If you prefer, you can create your own repository of updates and configure Vantage to use this repository instead. This is configured in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> System Update -> System Update Repository**. You can point to a local folder (such as c:\myRepository), a mapped drive (such as m:\myRespository) or a UNC path (such as \\\\myServer\myRepository).

!!! note
    With version 10.2208.22.0 the repository path can now also be specified as a URL path to an accessible cloud storage location.

See here for more information about using Update Retriever to create your own custom repository of updates:

- [Download Lenovo Tools for Admins](https://support.lenovo.com/us/en/solutions/ht037099)
- [System Update Suite Product Guide](/guides/sus/su_dg/su_dg_ch3/#33-update-retriever)

### Warranty Information

You can use Commercial Vantage to write the system warranty information to WMI (in the ROOT\Lenovo namespace) by setting the policy in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> Warranty**. The Lenovo\_WarrantyInformation class stores SerialNumber, Product, StartDate, EndDate, LastUpdateTime and the reference of each purchased warranty, while Lenovo\_WarrantyElement stores the details of these purchased warranties.

### Battery Information

On ThinkPads, you can use Commercial Vantage to write the battery information to WMI (in the ROOT\Lenovo namespace) by setting the policy in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> Device Settings -> Power**. The Lenovo\_Battery class stores the same information about the battery that you can see in the Commercial Vantage application.

Need help with other configurations? Have questions? Reach out to us on our forum! [https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01\_eg](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg)

## Microsoft Configuration Manager

If policies need to be set in an Operating System Deployment prior to first-logon, reference the example solutions described below.

### Package/JSON

A Package containing a JSON file with the desired policies, which are applied using a PowerShell script.

!!! note
    The policies in this example are a recommended baseline for enterprise customers

1\. Create a file named **policies.json** with the following data and save it to a source location.

```json
[
    {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
        "Name": "feature.giveFeedback",
        "Value": "1",
        "Type": "REG_DWORD"
    },
    {
        "Path": "HKLM:\\SOFTWARE\\Policies\\Lenovo\\Commercial Vantage",
        "Name": "AcceptEULAAutomatically",
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
        "Name": "AutoUpdateEnabled",
        "Value": "0",
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

2\. Create a second file named **Set-CommercialVantagePolicies.ps1** with the following code and save it to the same source location as **policies.json**.

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

3\. In the Configuration Manager console, go to the **Software Library** workspace, expand **Application Management**, and select the Packages node.

4\. In the **Home** tab of the ribbon, in the **Create** group, choose **Create Package**.

5\. On the **Package** page of the **Create Package and Program Wizard**, specify the following information:

- **Name**: Specify a name for the package

- [**x**] **This package contains source files**

- **Source folder**: Specify the location of the source files for the package.

6\. On the **Program Type** page, select **Do not create a program**.

7\. Complete the **Create Package and Program Wizard** and distribute the **Package** to **Distribution Points**.

### Operating System Deployment Task Sequence

Edit the Operating System Deployment task sequence and perform the following:

1\. Add a **Run PowerShell Script** anywhere after **Setup Windows and Configuration Manager**.

2\. Specify the following:

- **Name**: For example, **Set Commercial Vantage Policies**.

- [**x**] **Select a package with a PowerShell script**: Browse to the package created earlier.

- **Script name**: _Set-CommercialVantagePolicies.ps1_

- **PowerShell execution policy**: Bypass

3\. Click **Ok** to apply changes to the task sequence.

### Configuration Item/Baseline

Deploy a Configuration Baseline that contains a predefined configuration item consisting of recommended Commercial Vantage policies to be enabled in an enterprise.

#### Configuration Item

1\. In the Configuration Manager console, go to the **Assets and Compliance** workspace, expand **Compliance Settings**, and select the **Configuration Items** node.

2\. On the **Home** tab of the ribbon, in the **Create** group, select **Create Configuration Item**.

3\. On the **General** page of the wizard, specify a **Name**, and optional description.

4\. Under **Specify the type of configuration item that you want to create**, select **Windows Desktops and Servers (custom)**.

5\. On the **Supported Platforms** page, select:

- **All Windows 10 (64-bit)**

- **All Windows 11 (ARM64)** and **All Windows 11 (64-bit)**

6\. On the **Settings** page, select **New**.

7\. On the **General** tab, provide the following information:

- **Name**: Accept EULA Automatically

- **Setting type**: Registry value

- **Data type**: Integer

- **Hive**: HKEY_LOCAL_MACHINE

- **Key name**: SOFTWARE\Policies\Lenovo\Commercial Vantage

- **Value name**: AcceptEULAAutomatically

- [**x**] **Create the registry value as a REG_DWORD data type if remediated for noncompliant rules**

8\. On the **Compliance Rules** tab, click **New** and provide the following information:

- **Name**: Accept EULA Automatically

- **Operator**: Equals

- **For the following values**: 1

- [**x**] **Remediate noncompliant rules when supported**

- [**x**] **Remediate noncompliance if this setting is not found**

- **Noncompliance severity for reports**: Information

!!! info ""
    Repeat steps 7 and 8 for the following recommended policies

| **Policy Name** | **Value** |
| :--- | :--- |
| Disable Auto Update | AutoUpdateEnabled |
| Turn Off Give Feedback | feature.giveFeedback |
| Turn Off Hardware Scan | page.hardwareScan |
| Turn Off Metrics Collection | TurnOffMetricsCollection |
| Turn Off My Software | page.mySoftware |
| Turn Off Run-Once Task | RunOnce |
| Turn Off Network (previously named Wifi Security) | page.wifiSecurity |
| Write Warranty Info to WMI | wmi.warranty |

#### Configuration Baseline

1\. In the Configuration Manager console, go to the **Assets and Compliance** workspace, expand **Compliance Settings**, and select the **Configuration Baseline** node.

2\. On the **Home** tab of the ribbon, in the **Create** group, select **Create Configuration Baseline**.

3\. On the **General** page of the wizard, specify a **Name**, and optional description.

4\. Under **Configuration data**, click **Add**, choose **Configuration Items**. Select the **Configuration Item** created above and click **Add** to add it to the baseline.

5\. [**x**] Always apply this baseline even for co-managed clients

6\. Deploy the baseline to a **Device Collection** containing Lenovo Think products.
