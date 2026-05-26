# Configuration

Lenovo understands that some features of Commercial Vantage may not be appropriate for end users in a managed corporate environment. Therefore, most features of Commercial Vantage can be hidden or disabled so that your end users cannot access them. There are two ways to configure Commercial Vantage:

!!! warning "Enabling Logging"
    Due to requirements from the Lenovo Product Security team, logging is not enabled by default. To enable logging, set the following registry values to "Trace":
    ```registry
    [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\VantageService\FileLogger]
    "LenovoVantageShell"="Trace"
    "AllLogs"="Trace"
    ```

    Logs can be found in subfolders for each component under: `%ProgramData%\Lenovo\Vantage\Logs\`

    For the System Update Addin, the logs will be in the `LenovoSystemUpdateAddin` subfolder.

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

## Feature Configuration

### Sample Configuration

The sample configuration (**sample-policy-config.reg**) is provided as a registry export file which can be used as-is. The .reg file can be imported to your target systems during deployment, as part of **setup-commercial-vantage.bat**. In this sample, the following policies are pre-configured:

- Hide the &quot;Support&quot; section
- Hide the &quot;WiFi Security&quot; feature
- Automatically accept the End User License Agreement (EULA)
- Write the system warranty information to WMI

You can deploy any available policy setting in this way by following the Registry instructions above.

### System Update

#### Automatic Updates

By default, the System Update feature of Commercial Vantage automatically installs the following updates on a weekly schedule:

- All "Critical" updates (BIOS, firmware, drivers, and software)
- All "Recommended" driver updates (not BIOS, firmware, or software)

These automatic updates can be disabled in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> System Update -> Auto Update**. Or, you can use the **VantageDisableAutomaticSystemUpdates.reg** file which is included in the deployment package.

You can configure the types of updates that get installed automatically in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> System Update -> Configure System Update**. For example, you can choose to install _only_ driver and software updates, and not any BIOS or firmware updates. Or you can install all critical and recommended updates.

#### Update History

The System Update feature of Commercial Vantage writes update history to WMI (in the ROOT\LENOVO namespace). The Lenovo\_Updates class will contain each applicable package ID for that specific model, along with the Severity, Status, Title, and Version.

#### Update Repository

By default, the System Update feature of Commercial Vantage searches the Lenovo repository of updates. If you prefer, you can create your own repository of updates and configure Vantage to use this repository instead. This is configured in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> System Update -> System Update Repository**. You can point to a local folder (such as c:\myRepository), a mapped drive (such as m:\myRespository) or a UNC path (such as \\\\myServer\myRepository).

!!! note
    With version 10.2208.22.0 the repository path can now also be specified as a URL path to an accessible cloud storage location.

See here for more information about using Update Retriever to create your own custom repository of updates:

- [Download Lenovo Tools for Admins](https://support.lenovo.com/us/en/solutions/ht037099)
- [System Update Suite Product Guide](/guides/sus/su_dg/su_dg_ch3/#33-update-retriever)

### WMI Data Collection

#### Warranty Information

You can use Commercial Vantage to write the system warranty information to WMI (in the ROOT\Lenovo namespace) by setting the policy in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> Warranty**. The Lenovo\_WarrantyInformation class stores SerialNumber, Product, StartDate, EndDate, LastUpdateTime and the reference of each purchased warranty, while Lenovo\_WarrantyElement stores the details of these purchased warranties.

#### Battery Information

On ThinkPads, you can use Commercial Vantage to write the battery information to WMI (in the ROOT\Lenovo namespace) by setting the policy in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> Device Settings -> Power**. The Lenovo\_Battery class stores the same information about the battery that you can see in the Commercial Vantage application.

!!! question "Need help?"
    Have questions or need help with other configurations? Reach out on the [Lenovo Enterprise Client Management forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg).

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

## Microsoft Intune

This section presents the policies found in the Commercial Vantage ADMX template, along with the OMA-URIs which can be used to configure the application on Intune managed clients.

For steps on how to create and deploy Commercial Vantage as a Win32 app, reference this [page](https://blog.lenovocdrt.com/deploying-commercial-vantage-with-intune).

!!! note ""
    If new policies have been introduced, you will need to ingest the updated ADMX file contained in the Commercial Vantage Enterprise Package zip file and replace your existing policies in Intune with new ones created after ingesting the new ADMX file.

!!! note ""
    Introduced in the [2208](https://learn.microsoft.com/mem/intune/fundamentals/whats-new-archive#import-create-and-manage-custom-admx-and-adml-administrative-templates) Intune Service release, you can import, create, and manage custom ADMX and ADML administrative templates.

!!! warning "ADMX Upload Error"
    If you receive the below error when uploading the ADMX, you will need to upload the [Windows.admx](https://www.microsoft.com/download/details.aspx?id=106254) first, then retry uploading the Commercial Vantage ADMX.

    ![img](https://cdrt.github.io/mk_docs/img/cv/admx_upload_error.jpg)

!!! info "OMA-URI Values"
    Unless additional data parameters are noted, all policies in this section accept the following values:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Dashboard

??? note "Turn off Dashboard"
    **Description**: When this policy is enabled, the Dashboard feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~8EB4B7362B69050BFD52D7A0636C0562/26EB604F31FEA5A31B30EE1DA8B6774D
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Give Feedback"
    **Description**: When this policy is enabled, the Give Feedback feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~8EB4B7362B69050BFD52D7A0636C0562~3DD3DE15E0C7A9EB9EF9D505E92E74B1/392FE587856B9D466DE27527614D5EE2
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Device

The following top-level policies control entire sections of the Device page.

??? note "Turn off Device Settings"
    **Description**: When this policy is enabled, the Device Settings feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB/AD7C83D4D02A207DE73A16DBA3E41299
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off System Update"
    **Description**: When this policy is enabled, the System Update feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB/47CE09B9482EAC9FD541B9E673E25EBC
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off My Device"
    **Description**: When this policy is enabled, the My Device feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB/536EE0FCEA046E2AE885243C193998DD
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### Device Settings

??? note "Turn Off Smart Assist"
    **Description**: When this policy is enabled, the Smart Assist feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD/48D766A8D16EA17A7C0BA73A8A8FD521
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### Display and Camera

??? note "Turn off Camera"
    **Description**: When this policy is enabled, the Camera features of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~253B0EFA38D70AA281E219F0608579F7/2E012166F382F702A96FACF6CB2AD9BF
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Display"
    **Description**: When this policy is enabled, the Display features of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~253B0EFA38D70AA281E219F0608579F7/7EFB17AA327FB4413D8CFBC79A7BC0DC
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### Input and Accessories

??? note "Turn off Intelligent Keyboard"
    **Description**: When this policy is enabled, the Intelligent Keyboard feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~8B4FEEBFA703E3CDB065A0BC9F60E2B8/C9E7C956C24B3611C29FF18FD27B5817
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### Microphone

??? note "Turn off Microphone Settings"
    **Description**: When this policy is enabled, the Microphone Settings features of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~BA6F60313310EFF34E59B7FAB53CF7B0/5FD85C9FE3983DEF5D98453B5A1A31BE
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Smart Noise Cancelling"
    **Description**: Turns off and hides the Smart noise cancelling feature. When enabled, any prior noise cancelling settings are reset to default. When disabled, the feature is visible and users can update settings through Commercial Vantage.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~BA6F60313310EFF34E59B7FAB53CF7B0/772EAFEFB12384522846346824FA2EF4
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### Power

??? note "Turn off Battery health"
    _Added in version 20.2506.39.0_

    **Description**: When enabled, the battery health status will be hidden.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/08BBF44CA2CC0873631A35AF193B452B
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off DPM Power Settings"
    _Added in version 10.2104_

    **Description**: When enabled, the Desktop Power Manager Power Settings will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/114BBBE0F57582EEBF1ACE595FDDFD92
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Global Power Management"
    _Added in version 10.2407.66_

    **Description**: When enabled, Global Power Management (Intelligent Cooling/Intelligent Cooling Engine) will be hidden. When disabled or not configured, it will be shown.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/1A406616747B4AEEB4184F7408D8C182
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Battery temperature"
    _Added in version 20.2506.39.0_

    **Description**: When enabled, the battery temperature section will be hidden.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/3EAD4546EEBB230B32DFBB487C7E5EA0
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Standby Settings"
    _Added in version 10.2104_

    **Description**: When enabled, the Standby Settings feature will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/BFDBD5BBEE7822675EC26177C62820D6
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off At a glance"
    _Added in version 20.2506.39.0_

    **Description**: When enabled, the At a glance section will be hidden.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/D8B285396E09B47C7853FC260DA26E49
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Power Settings"
    **Description**: When enabled, the Power Settings of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/DAFCD675AF1BF429DDE3C7DBA278F84D
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Energy Star"
    _Added in version 10.2104_

    **Description**: When enabled, the Energy Star features will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/EC7DDEAF97A500A0EE95864114E7CD52
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Battery Settings"
    _Added in version 10.2104_

    **Description**: When this policy is enabled, the Battery Settings features of Commercial Vantage will be turned off.

    Battery percentage for starting and stopping charge threshold can only be set in increments of 5. Any value input will be rolled to next increment of 5.

    If an IT Admin sets a "Start Charging" greater than "Stop Charging", Vantage will ignore "Start Charging" set by Admin and will "Start Charging" at 5% less than "Stop Charging".
    Ex: IT Admin sets "Start Charging" = 60 and "Stop Charging" = 50. Then, Vantage will "Start Charging" at 45 since "Stop Charging" = 50

    If checkbox to "Automatically set the start charging" is checked by IT Admin, Vantage will ignore "Start Charging" set by Admin and will "Start Charging" at "Stop Charging" minus 5.
    Ex: If checkbox selected and "Stop Charging" is set to 90, then "Start Charging" is set to 85.

    When the toggle to "Automatically Set Threshold" is on, then Battery Threshold "Start" cannot be set.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/1B92BAC1630DE2689D54D68B7EC60A78
    ```

    !!! info "GUID Reference"
        30B3EB897294AF0A770737E004CCE7B0 = Enable custom battery threshold settings<br>
        4B9DE8D61B215393ED7255D0719FA5FA = Threshold Start<br>
        2FE339B04615BBA5C913F45FB6A1B34D = Threshold Stop<br>
        51A1765894644A2F58B9AF5EE7F65922 = Auto Start Charging

    **Values**:
    ```xml
    <enabled/>
    <data id="30B3EB897294AF0A770737E004CCE7B0" value="true"/>
    <data id="4B9DE8D61B215393ED7255D0719FA5FA" value="60"/>
    <data id="2FE339B04615BBA5C913F45FB6A1B34D" value="80"/>
    <data id="51A1765894644A2F58B9AF5EE7F65922" value="false"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Write Battery Information to WMI"
    _Added in version 10.2109_

    **Description**: This policy setting allows Commercial Vantage to write the computer battery information into the Lenovo Namespace WMI table. If you enable it, the battery information will be written to WMI.

    ![battery info](https://cdrt.github.io/mk_docs/img/cv/battery_info.png)

    This policy setting allows the Administrator to configure the schedule type, schedule day, and schedule time for writing the computer battery information to WMI. The Schedule type value should be a number (0-2), where 0 means daily, 1 means weekly, 2 means monthly.

    If the Schedule type value is set to 0, the Schedule day value should be set to 0 (and this value will be ignored). If the Schedule type is set to 1, the Schedule day value should be a number (0-6), where 0 means Sunday, 1 means Monday, 2 means Tuesday...

    If the Schedule type is set to 2, the Schedule day value should be a number (-1 or 1-31), where -1 means the last day of the month, 1 means the first day of the month, 2 means the second day of the month...

    The Schedule time value format should be HH:mm:ss. For example, 18:30:00 represents 6:30 PM.

    If you disable or do not configure this policy setting, the battery information will not be written to WMI.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/B01A9475F26627063E7913B9D74C9658
    ```

    !!! info "GUID Reference"
        ADE41242A9F8CE596481FE945E5FE5D8 = Schedule Type<br>
        F04F922293A120999D4EB95012CA0C64 = Schedule Day<br>
        AC72B4BC066D807C760A11748C39F451 = Schedule Time

    **Values**:
    ```xml
    <enabled/>
    <data id="ADE41242A9F8CE596481FE945E5FE5D8" value="1"/>
    <data id="F04F922293A120999D4EB95012CA0C64" value="1"/>
    <data id="AC72B4BC066D807C760A11748C39F451" value="10:00:00"/>
    ```
    ```xml
    <disabled/>
    ```

#### Smart Assist

??? note "Turn off Active Protection System Settings"
    _Added in version 10.2104_

    **Description**: When this policy is enabled, the Active Protection System Settings features of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~CBAB71D9A1E135A0FA3A6EA2DA0C9904/506259864F9C994767F6530DE643B36E
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Intelligent Screen"
    _Added in version 10.2407.66_

    **Description**: When this policy is enabled, the Intelligent Screen features of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~CBAB71D9A1E135A0FA3A6EA2DA0C9904/EEF7C410105EFB7805171740190C6965
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Intelligent Security Settings"
    _Added in version 10.2407.66_

    **Description**: When this policy is enabled, the Intelligent Security Settings features of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~CBAB71D9A1E135A0FA3A6EA2DA0C9904/F849A86B6C88FB37AFB14BAB268A8E2A
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### Dolby Access

??? note "Turn off Dolby Access"
    **Description**: When this policy is enabled, the Dolby Access page will be hidden. The Advanced microphone effects section on the Microphone page will also be hidden.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7F1A82A306BBA4A0AE1E88DACC971B98/5893778C126AECE6153BAC92D216D439
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### Modes

??? note "Turn off Modes"
    _Added in version 10.2407.66_

    **Description**: This policy setting prevents end-users from using the Modes page in My Device. It determines whether the Modes functionality is available in Commercial Vantage and whether users will be able to use Lenovo Desktop Widget. By default, the page is displayed and can be accessed by the end user.

    If you enable this setting, the Modes page will be hidden from Commercial Vantage. The end user will not be able to see the Modes tab in Device Settings or use Lenovo Desktop Widget on the device.

    If you disable or do not configure this setting, the Modes will be displayed and the user will be able to use the Lenovo Desktop Widget.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~DA73FA95EE6D6962459DAFAE9957BA01/6950037C7735BA43482EEC668D0C45DA
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### My Software

??? note "Turn off My Software"
    **Description**: When this policy is enabled, My Software page will be hidden.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~C5F2E398EC7B34FE44B522453172955A/93F1E6046DD02C5953747188D106EDC8
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

#### System Update

The following policies toggle System Update behavior on or off. For policies with detailed configuration options, see the sections below.

??? note "Test Content Mode"
    _Added in version 2501.15_

    **Description**: When enabled, System Update only processes packages with a Status of "Test" in the local repository. Only effective if a local repository is configured via the System Update Repository policy.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/C6A61B1F0CCC910157C4FD733BBFBA69
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Dock Auto Update"
    _Added in version 10.2407.66_

    **Description**: When enabled (or not configured), Dock Auto Update is turned off. Set to Disabled to allow Commercial Vantage to check for dock firmware updates when a supported dock is attached.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/3D58DE8904B4C497EB9181BEDC868A50
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Turn off Run-Once Task"
    _Added in version 10.2104 v2_

    **Description**: When enabled, the initial check for updates at first launch is turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/41055A4D350BB08B7B35250ABCD2A4B1
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Auto Update"
    **Description**: When enabled, auto update is enabled. When disabled, auto update is disabled. Not configured maintains the last status and can be controlled by the end user. By default, auto update installs critical updates and recommended drivers.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/DE2E5946D5FC36D6F175D99C651F8408
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Company Name"
    _Added in version 2501.15_

    **Description**: Defines the Company Name to be displayed on the System Update dialogs. Excessively long names may be truncated.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/1B712E2FAB2CBBC36596C1D66EEDDFED
    ```

    **Values**:
    ```xml
    <enabled/>
    <data id="2E380F5F44ADD0C3911D0528A5A35CB6" value="Commercial Deployment Readiness Team"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "System Update Configuration"
    **Description**: This policy setting provides the ability for the Administrator to configure the filter of searching updates. If you enable this policy setting, Commercial Vantage will search for updates based on this filter. This policy affects manual update, but if 'Configure Auto System Update' is not configured, it affects both manual and auto update.

    All elements must be specified with a value of either True or False.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/5456F227323F901F6CAF5C2F3F1AC9A5
    ```

    !!! info "GUID Reference"
        602015B22CFEA08C53FEC8C3E81356BF = Critical Applications<br>
        CE7D1526B3D8674705FF75DFF52B4416 = Critical Drivers<br>
        7C75C7AA6FF288235BCA3886FA9A4176 = Critical BIOS<br>
        94803C37291A574BB4CAF4DFAE682CC2 = Critical Firmware<br>
        7326616EB323392D1BB0E6436A4A02AF = Critical Others<br>
        6564E6607DD79991C0A56F009A4102FA = Recommended Applications<br>
        B78D824B47B0EC632B7EDEF30B63E2D9 = Recommended Drivers<br>
        A0DEF98CD96C592582382A3453CB78BA = Recommended BIOS<br>
        8E6885D7C10107B5CD98053B7D8B2A6E = Recommended Firmware<br>
        A45D902F95DDD3B8597B21175A66A804 = Recommended Others<br>
        46302403B9C32072305518FE20DC6720 = Optional Applications<br>
        FDC13AFD3BA418958D122D78105C2F90 = Optional Drivers<br>
        3297105136FCEC5D3432C0FA2FDB73BB = Optional BIOS<br>
        C62002C924CF75712313AC1CF94525AB = Optional Firmware<br>
        9A82A62C3EF3BA2FCC142413A1FAC951 = Optional Others

    **Values**:
    ```xml
    <enabled/>
    <data id="602015B22CFEA08C53FEC8C3E81356BF" value="true"/>
    <data id="CE7D1526B3D8674705FF75DFF52B4416" value="true"/>
    <data id="7C75C7AA6FF288235BCA3886FA9A4176" value="true"/>
    <data id="94803C37291A574BB4CAF4DFAE682CC2" value="true"/>
    <data id="7326616EB323392D1BB0E6436A4A02AF" value="false"/>
    <data id="6564E6607DD79991C0A56F009A4102FA" value="true"/>
    <data id="B78D824B47B0EC632B7EDEF30B63E2D9" value="true"/>
    <data id="A0DEF98CD96C592582382A3453CB78BA" value="true"/>
    <data id="8E6885D7C10107B5CD98053B7D8B2A6E" value="true"/>
    <data id="A45D902F95DDD3B8597B21175A66A804" value="true"/>
    <data id="46302403B9C32072305518FE20DC6720" value="false"/>
    <data id="FDC13AFD3BA418958D122D78105C2F90" value="false"/>
    <data id="3297105136FCEC5D3432C0FA2FDB73BB" value="false"/>
    <data id="C62002C924CF75712313AC1CF94525AB" value="false"/>
    <data id="9A82A62C3EF3BA2FCC142413A1FAC951" value="false"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "System Update Repository"
    **Description**: Defines the location of where System Update will pick up available content. Supports UNC paths or a local drive only.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/7D125BC7E172D57BBD95107ECECB6C0D
    ```

    **Values**:
    ```xml
    <enabled/>
    <data id="7D125BC7E172D57BBD95107ECECB6C0D" value="\\your_repository"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Schedule the Day for Auto Update"
    **Description**: This policy setting provides the ability for the Administrator to configure the day(s) on which Auto Update will occur. This policy will be combined with the configuration of Schedule the Month for Auto Update to determine the exact schedule of Auto Update.

    Either specify specific day(s) of the month or specify a frequency and day of the week.

    If both "Day(s)" and "Frequency/Day of the Week" are specified, "Day(s)" will take precedence and "Frequency/Day of the Week" will be ignored.

    If "Day(s)" is configured, Auto Update will only occur on the specified days. The desired days can be specified by the number of the day in the month, "Last Day" for the last day of the month, or "All" for every day of the month. Multiple days can be separated with semi-colons ( ; ).

    Example for Day(s) input:

    - `All` — Auto Update will occur on all days of the month
    - `1;7;13;25` — will only occur on days 1, 7, 13, and 25
    - `All;1;13;25` — will only occur on days 1, 13, 25 ("All" is ignored)
    - `LastDay` — will only occur on the last day of the month
    - `LastDay;1;13;25` — will only occur on days 1, 13, 25, and the last day

    When Frequency and Days of the Week are configured, a selection must be set for both, otherwise the policy will be ignored.

    Example for Frequency/Days of the Week:

    - If "All" is checked under Frequency and "Friday" is checked under Day of the Week, then Auto Update will occur every Friday.
    - If "First" and "Third" are checked under Frequency and "Tuesday" is checked under Day of the Week, then Auto Update will occur on the first and third Tuesday of each month.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/21E270BB2BEDC888DE041CA38981726B
    ```

    | id | valueName |
    | :--- | :--- |
    | `8954B312E3ABB22A17F7E50723750B80` | All Weeks |
    | `001C72322736D14CFC56E1F4653019F6` | First Week |
    | `806D1BC85455150F0DCD44BDFC9839FA` | Second Week |
    | `0E8030803EB7BFD27581D3A2BEFE771E` | Third Week |
    | `E68FFD0829E277997C8972276A02E92B` | Fourth Week |
    | `AFA05A1BB42D873987FFD971D4B1B6A2` | Last Week |
    | `4BBE69DF32A6A22FDA4FF162C53C7154` | Sunday |
    | `A48090544BD0587769808CA01B8D1670` | Monday |
    | `159A93568F287E05F64F599B64034E2F` | Tuesday |
    | `B2CF1DA1B0B639B6B14ED2CCC1E26B80` | Wednesday |
    | `24E625869762ABC41BA468897B581394` | Thursday |
    | `606C484482FDC09861E8DCFD5EFFBB2A` | Friday |
    | `C6F63436FC3A9ECA03116BB2624763E3` | Saturday |

    **Values**:
    ```xml
    <enabled/>
    <data id="9B56ECD989102ABD1C7FEAF701B20490" value="1"/>
    <data id="8954B312E3ABB22A17F7E50723750B80" value="false"/>
    <data id="001C72322736D14CFC56E1F4653019F6" value="true"/>
    <data id="806D1BC85455150F0DCD44BDFC9839FA" value="false"/>
    <data id="0E8030803EB7BFD27581D3A2BEFE771E" value="true"/>
    <data id="E68FFD0829E277997C8972276A02E92B" value="false"/>
    <data id="AFA05A1BB42D873987FFD971D4B1B6A2" value="false"/>
    <data id="4BBE69DF32A6A22FDA4FF162C53C7154" value="false"/>
    <data id="A48090544BD0587769808CA01B8D1670" value="false"/>
    <data id="159A93568F287E05F64F599B64034E2F" value="true"/>
    <data id="B2CF1DA1B0B639B6B14ED2CCC1E26B80" value="false"/>
    <data id="24E625869762ABC41BA468897B581394" value="false"/>
    <data id="606C484482FDC09861E8DCFD5EFFBB2A" value="false"/>
    <data id="C6F63436FC3A9ECA03116BB2624763E3" value="false"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Schedule the Month for Auto Update"
    **Description**: This policy setting provides the ability for the Administrator to configure the months in which Auto Update will occur. This policy will be combined with the configuration of Schedule the Day for Auto Update to determine the exact schedule of Auto Update.

    You can mark the checkbox that corresponds to the desired month(s). If you click "All" plus other individual months, the individual months will take precedence over "All". If you do not select any months, the policy will be ignored.

    If this policy is enabled, the Run Once task will be disabled automatically.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/5352EE76841C80672B56A0CEDF41837E
    ```

    | id | valueName |
    | :--- | :--- |
    | `B2DD6109EA2E207C836383CECF4A9BEC` | All Months |
    | `ED5C30B56EF8F5365D9C42831CF04BD8` | January |
    | `BF9C2D60C64BF8F3B5099FE91F9B5089` | February |
    | `43C6E71EE827630A483FA7FD7ED57CCF` | March |
    | `9438FDA7478EC6BFD7FAF9C71FE1152B` | April |
    | `7D438E61733F014AD996B137C6250657` | May |
    | `3205471F2D479A66D2E74BD31E8CACCE` | June |
    | `2AA4C9F2C503F923457D404EA7EB6064` | July |
    | `66676FED4BBAFA451F2300EF10644292` | August |
    | `D7FFEA0FD35DA18D6BD5853D1D5D6207` | September |
    | `328D5A4F3EF98FC4FCEE4776C1A2F716` | October |
    | `5EB2B35C9240F82A600E5E6CC701FA89` | November |
    | `DBEC478AFADA88DC29C9BBC5A4AD2A97` | December |

    **Values**:
    ```xml
    <enabled/>
    <data id="B2DD6109EA2E207C836383CECF4A9BEC" value="true"/>
    <data id="ED5C30B56EF8F5365D9C42831CF04BD8" value="false"/>
    <data id="BF9C2D60C64BF8F3B5099FE91F9B5089" value="false"/>
    <data id="43C6E71EE827630A483FA7FD7ED57CCF" value="false"/>
    <data id="9438FDA7478EC6BFD7FAF9C71FE1152B" value="false"/>
    <data id="7D438E61733F014AD996B137C6250657" value="false"/>
    <data id="3205471F2D479A66D2E74BD31E8CACCE" value="false"/>
    <data id="2AA4C9F2C503F923457D404EA7EB6064" value="false"/>
    <data id="66676FED4BBAFA451F2300EF10644292" value="false"/>
    <data id="D7FFEA0FD35DA18D6BD5853D1D5D6207" value="false"/>
    <data id="328D5A4F3EF98FC4FCEE4776C1A2F716" value="false"/>
    <data id="5EB2B35C9240F82A600E5E6CC701FA89" value="false"/>
    <data id="DBEC478AFADA88DC29C9BBC5A4AD2A97" value="false"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Schedule the Time for Auto Update"
    **Description**: This policy setting provides the ability for the Administrator to configure the time for auto updates. For example, 18:30:00 for 6:30 PM.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/5D601BAD50217031B2F5939DF58ED0CE
    ```

    **Values**:
    ```xml
    <enabled/>
    <data id="5D601BAD50217031B2F5939DF58ED0CE" value="10:00:00"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Defer Update"
    _Added in version 10.2104 v2_

    **Description**: This policy setting provides the ability for the Administrator to control how updates can be deferred.

    If you enable this policy, you may configure the number of times the end-user is allowed to defer updates (DeferLimit) and the amount of time for each deferral (DeferTime). If these options are not configured, the end-user may defer unlimited times for 60 minutes each deferral.

    If you disable this policy or the policy is not configured, the end-user may only continue with or cancel the updates. If cancelled, the updates will be presented again at the next scheduled scan.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/6E62038B159F1CC622C1E80F3BD3D1E8
    ```

    | id | valueName |
    | :--- | :--- |
    | `311D60F57C54D2DD03394368BDFCED99` | DeferLimit |
    | `95E579A1A0BABCEDAC4AF1BC81B042F4` | DeferTime |

    **Values**:
    ```xml
    <enabled/>
    <data id="311D60F57C54D2DD03394368BDFCED99" value="4"/>
    <data id="95E579A1A0BABCEDAC4AF1BC81B042F4" value="30"/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Configure Auto System Update"
    _Added in version 10.2407.66_

    **Description**: This policy setting provides the ability for the Administrator to configure the filter of searching updates for auto update specifically. If you enable this policy setting, Commercial Vantage will search for updates based on this filter for auto update. If you disable, Commercial Vantage will search for all available updates. Not configured follows the settings of 'Configure System Update'.

    All elements must be specified with a value of either True or False.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/F3E50D676ED09F059CDA62D68516F80D
    ```

    !!! info "GUID Reference"
        602015B22CFEA08C53FEC8C3E81356BF = Critical Applications<br>
        CE7D1526B3D8674705FF75DFF52B4416 = Critical Drivers<br>
        7C75C7AA6FF288235BCA3886FA9A4176 = Critical BIOS<br>
        94803C37291A574BB4CAF4DFAE682CC2 = Critical Firmware<br>
        7326616EB323392D1BB0E6436A4A02AF = Critical Others<br>
        6564E6607DD79991C0A56F009A4102FA = Recommended Applications<br>
        B78D824B47B0EC632B7EDEF30B63E2D9 = Recommended Drivers<br>
        A0DEF98CD96C592582382A3453CB78BA = Recommended BIOS<br>
        8E6885D7C10107B5CD98053B7D8B2A6E = Recommended Firmware<br>
        A45D902F95DDD3B8597B21175A66A804 = Recommended Others<br>
        46302403B9C32072305518FE20DC6720 = Optional Applications<br>
        FDC13AFD3BA418958D122D78105C2F90 = Optional Drivers<br>
        3297105136FCEC5D3432C0FA2FDB73BB = Optional BIOS<br>
        C62002C924CF75712313AC1CF94525AB = Optional Firmware<br>
        9A82A62C3EF3BA2FCC142413A1FAC951 = Optional Others

    **Values**:
    ```xml
    <enabled/>
    <data id="602015B22CFEA08C53FEC8C3E81356BF" value="true"/>
    <data id="CE7D1526B3D8674705FF75DFF52B4416" value="true"/>
    <data id="7C75C7AA6FF288235BCA3886FA9A4176" value="true"/>
    <data id="94803C37291A574BB4CAF4DFAE682CC2" value="true"/>
    <data id="7326616EB323392D1BB0E6436A4A02AF" value="false"/>
    <data id="6564E6607DD79991C0A56F009A4102FA" value="true"/>
    <data id="B78D824B47B0EC632B7EDEF30B63E2D9" value="true"/>
    <data id="A0DEF98CD96C592582382A3453CB78BA" value="true"/>
    <data id="8E6885D7C10107B5CD98053B7D8B2A6E" value="true"/>
    <data id="A45D902F95DDD3B8597B21175A66A804" value="true"/>
    <data id="46302403B9C32072305518FE20DC6720" value="false"/>
    <data id="FDC13AFD3BA418958D122D78105C2F90" value="false"/>
    <data id="3297105136FCEC5D3432C0FA2FDB73BB" value="false"/>
    <data id="C62002C924CF75712313AC1CF94525AB" value="false"/>
    <data id="9A82A62C3EF3BA2FCC142413A1FAC951" value="false"/>
    ```
    ```xml
    <disabled/>
    ```

#### Warranty

??? note "Hide Warranty Information"
    _Added in version 10.2104_

    **Description**: When enabled, warranty information will be removed from the Commercial Vantage GUI.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~4D633640E5CF3443867C0771CE6106B0/29310C221BB9070F63950B4D1EF6E2FD
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Write Warranty Information to WMI"
    _Added in version 10.2104_

    **Description**: When enabled, warranty information will be written to the Lenovo Namespace WMI table.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~4D633640E5CF3443867C0771CE6106B0/8431B9B72EC21BF09C22F293D7E3F2D5
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### EULA

??? note "Accept EULA Automatically"
    **Description**: Disables the Lenovo End User License Agreement (EULA) and the Lenovo privacy statement pop-up displayed at first launch.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~261C3D29FFEB46D46D29941DC7D22786/01A7464C3D337F1E15D54CA31D7FF83B
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Hardware Scan

??? note "Turn Off Hardware Scan"
    _Added in version 10.2201_

    **Description**: When enabled, the Hardware Scan feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~3BB252355E5322463EC33426BF919239/5A6D93CCF9612C47FFF7FE6C13293CAF
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Metrics

??? note "Turn off Metrics Collection"
    **Description**: When enabled, prevents data collection by Commercial Vantage. No metrics information (e.g., EULA acceptance) will be reported to Lenovo.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~856C8C55266137062827DD27AEDB1FA5/C850CEF61E7247F07CD8519AE87DA2AF
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Network

??? note "Turn Off Network"
    **Description**: _(Previously named Wifi Security)_ When enabled, the Network feature of Commercial Vantage will be turned off.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~D5E41712EF76F886457EC1401FAEEF01/F11439A9B68301F4EC7AF579B71B30DF
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Preference Settings

??? note "Turn off Preference Settings"
    **Description**: When enabled, hides the Preference settings page. Settings on the page will not change.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~A3295309178C5F1CEC24529B03C24C6E/1E4CBA1B408B04FD46F365871B89A237
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

??? note "Lenovo Service Bridge Integration Settings"
    **Description**: Controls Commercial Vantage integration with Lenovo Service Bridge (LSB). When enabled, LSB integration is on and locked. When disabled, LSB integration is off and locked. When not configured, end users can control this from the UI.

    If you enable this policy setting, LSB integration will be enabled and end user will not be able to modify it.

    If you disable this policy setting, LSB integration will be disabled and end user will not be able to modify it.

    If you do not configure this policy setting, end user will be able to control it from the UI.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~A3295309178C5F1CEC24529B03C24C6E~57BCEFF7C7874F4EC6423F75E5CF84B9/FAD50692743BADEBB3D3B7905708B767
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Smart Care

??? note "Turn off Smart Care"
    _Added in version 10.2407.66.0_

    **Description**: When enabled, the Smart Care page will not be displayed and users cannot access Smart Care via Commercial Vantage. When disabled or not configured, Smart Care is shown if the device is connected to the internet.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~BD3A80EB0DDAB86A9E706C6CF8F64037/8E9D639B4B94B49D617C636DDC19B42F
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ```

### Toast Messages

??? note "Turn off Toast Messages"
    **Description**: When enabled, toast messages will not be displayed to end-users. When disabled, toast messages will be displayed to end-users. When not configured, end-users can control this from the UI.

    **OMA-URI**:
    ```
    ./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~827FE50BF937C098237E83855BDE934A/12EA5BA045FD172E4FE8593904E47A4A
    ```

    **Values**:
    ```xml
    <enabled/>
    ```
    ```xml
    <disabled/>
    ``` 
