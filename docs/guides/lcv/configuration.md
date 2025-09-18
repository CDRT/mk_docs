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

- **Script name**: *Set-CommercialVantagePolicies.ps1*

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
