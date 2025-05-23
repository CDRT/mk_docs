# Deploying with Microsoft Configuration Manager (MEMCM)

Dock Manager is provided as an executable.  Here's an example of how to deploy with Microsoft Endpoint Manager Configuration Manager (ConfigMgr) using the Application model.

In the console, navigate to the **Software > Application Management > Applications** node and click **Create Application** in the ribbon bar.

Tick the **Manually specify the application information** radio button, click **Next**

![ApplicationInformation](https://cdrt.github.io/mk_docs/img/guides/dm/image1.PNG)

Specify information about the app, click **Next**

![ApplicationInformation](https://cdrt.github.io/mk_docs/img/guides/dm/image2.PNG)

Enter Software Center details, click **Next**

![SoftwareCenter](https://cdrt.github.io/mk_docs/img/guides/dm/image3.PNG)

Set the deployment type to **Script Installer** and click **Next**

![ScriptInstaller](https://cdrt.github.io/mk_docs/img/guides/dm/image4.PNG)

Set the deployment type name and click **Next**

![DeploymentType](https://cdrt.github.io/mk_docs/img/guides/dm/image5.PNG)

Enter the content location path to the Dock Manager executable

Install command:

```
"dock_manager_setup.exe" /VERYSILENT
```

Uninstall command:

```
unins000.exe /SILENT
```

Uninstall start in:

```
%ProgramFiles%\Lenovo\Dock Manager
```

![Detection Rule](https://cdrt.github.io/mk_docs/img/guides/dm/image6.PNG)

Set the detection rule setting type to **Registry**

Hive: **HKLM**

Key:

```
SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DockManager_is1
```

Value:

```
DisplayVersion
```

Data Type: **String**

Tick the radio button for **This registry setting must satisfy the following rule...**
Operator: **Equals**
Value:

```
1.0.0.125
```

![User Experience Settings](https://cdrt.github.io/mk_docs/img/guides/dm/image7.PNG)

Set the installation behavior to **Install for system** and logon requirement to " **Whether or not a user is logged on** ".

Add any installation requirements such as Operating system is One of Windows 10 (64-bit)

![Installation Requirements](https://cdrt.github.io/mk_docs/img/guides/dm/image8.PNG)

Complete the deployment type and App wizards.  Deploy to a Device Collection.

## Deploying with Microsoft Intune

Using the Win32 Content Prep [Tool](https://github.com/Microsoft/Microsoft-Win32-Content-Prep-Tool), convert the Dock Manager installer to an .intunewin format.  A sample command would look like this:

```
IntuneWinAppUtil.exe -c "C:\IntuneWin\DM\" -s "dock_manager_setup.exe" -o "C:\IntuneWin\output\" -q
```
![Log](https://cdrt.github.io/mk_docs/img/guides/dm/image9.PNG)

Login to the Endpoint admin center [portal](https://endpoint.microsoft.com/#blade/Microsoft_Intune_DeviceSettings/AppsWindowsMenu/windowsApps) to create a new Windows app and select the **Windows app (Win32)** type.

Select the **dock_manager_setup.intunewin** app package file.

Enter required and optional information about the app

![Edit application](https://cdrt.github.io/mk_docs/img/guides/dm/image10.PNG)

Enter the Install command

```
dock_manager_setup.exe /VERYSILENT
```

and Uninstall command

```
%ProgramFiles%\Lenovo\Dock Manager\unins000.exe /SILENT
```
![Edit application](https://cdrt.github.io/mk_docs/img/guides/dm/image11.PNG)

Set the requirements.  You can take it a bit further with a detection script to check if a supported dock is currently connected to the system.  Here's a sample PowerShell script

```powershell
# Check for Thunderbolt 3 Dock Gen 2
$dock = Get-WmiObject -Class Win32_PnPEntity | Where-Object { $_.DeviceID -like 'USB\VID_2109&PID_8887*' }
if ($dock) {
    Write-Output "Thunderbolt 3 Dock Detected!"
}
else {
    Exit 1
}
```
![Edit application](https://cdrt.github.io/mk_docs/img/guides/dm/image12.PNG)

Enter the detection rules to verify the current version of Dock Manager is installed

Key path:

```
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\DockManager_is1
```

Value name: **DisplayVersion**

Detection method: **String comparison**

Operator: **Equals**

Value: **1.0.0.125**

![Detection Rule](https://cdrt.github.io/mk_docs/img/guides/dm/image13.PNG)

Finish out the wizard and assign to a group.

## WMI Classes

You can [extend hardware inventory](https://docs.microsoft.com/en-us/mem/configmgr/core/clients/manage/inventory/extend-hardware-inventory)  in Config Manager to collect the data written by Dock Manager on your clients by importing the provided .mof file below:

[Download](https://download.lenovo.com/cdrt/blog/ConfigMgr-MOF-DockManager.zip)

An example from Resource Explorer

![WMI](https://cdrt.github.io/mk_docs/img/guides/dm/image14.PNG)

## Reporting

Example of what can be gathered using SSRS

![SSRS](https://cdrt.github.io/mk_docs/img/guides/dm/image15.PNG)

!!! info
    Sample report can be downloaded [here](https://download.lenovo.com/cdrt/docs/LenovoDockManager.zip). Update the Data Source properties for your environment.
