# Commercial Vantage Deployment Guide

!!! note  ""
    Updated: 2023-3-21

!!! warning
    Due to requirements from the Lenovo Product Security team, logging is not enabled by default any longer. To enable logging, set the following registry value to "True": [HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\SystemUpdateAddin\Logs]"EnableLogs"="True"

    Logs can be found in:
    ```%ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs```

## Preface

This guide is intended for skilled IT administrators who are responsible for deploying and configuring **Commercial Vantage** to PCs in their organization.

If you have suggestions, comments, or questions, please talk to us on our forum! A team of deployment engineers (including the author of this document) is standing by, ready to help with any deployment challenges you are facing: [https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01\_eg](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg)

## Deployment

### Commercial Vantage Application

Commercial Vantage is a Windows 10 Modern Application that can be installed directly from the Microsoft Store: [https://www.microsoft.com/store/apps/9NR5B8GVVM13](https://www.microsoft.com/store/apps/9NR5B8GVVM13)

Lenovo also makes available the MSIXBUNDLE (and related files) that can be used for side-loading. This type of installation can be performed using commands provided by Windows 10. For more information, please refer to the following Microsoft documentation: [https://technet.microsoft.com/library/dn376490(v=wps.640).aspx](https://technet.microsoft.com/library/dn376490(v=wps.640).aspx)

### Lenovo System Interface Foundation (LSIF)

By default, Lenovo System Interface Foundation keeps itself up to date with updates from Lenovo servers. These updates include The System Interface Foundation service itself, as well as the plugins which are used to provide specific features within Vantage. Lenovo recommends allowing these kinds of self-updates as we are constantly adding features and improving reliability. However, if you want to disable these updates, you can import the **SifDisableSelfUpdate.reg** registry during your deployment.

The installer for Lenovo System Interface Foundation can be downloaded from here (it is also included in the zip file):

[https://filedownload.lenovo.com/enm/sift/core/System-Interface-Foundation-Update-64.exe](https://filedownload.lenovo.com/enm/sift/core/System-Interface-Foundation-Update-64.exe)

Installation of this package can be performed silently as follows:

```cmd
System-Interface-Foundation-Update-64.exe /verysilent /NORESTART
```

### Lenovo Vantage Service

The installer for Lenovo Vantage Service is included in the zip file. It is installed silently as follows:

```cmd
VantageService.3.6.15.0-lite.exe /verysilent /NORESTART
```

Lenovo provides a batch file, `setup-commercial-vantage.bat`, that deploys the above components. This batch file can be used as-is, or it can be modified to deploy optional configurations as documented in the next chapters.

## Configuration

Lenovo understands that some features of Commercial Vantage may not be appropriate for end users in a managed corporate environment. Therefore, most features of Commercial Vantage can be hidden or disabled so that your end users cannot access them. There are two ways to configure Commercial Vantage:

### Group Policy Administrative Template

If your PCs are joined to a domain, and you are familiar with Group Policy Administrative Templates (admx), you can add **CommercialVantage.admx** and **CommercialVantage.adml** to your Central Store. These files are located in the **Group Policy Settings** folder of the .zip file that includes this document. Then, use the Group Policy Editor to manage:

- **Computer Configuration -> Administrative Templates -> Commercial Vantage**

The settings listed in the Policy Editor allow controlling which parts of the Commercial Vantage User Interface are displayed to the user. For example, you can enable the &quot;Turn off Wifi Security&quot; policy to hide the WiFi Security feature of Commercial Vantage.

For more information about using Group Policy Administrative Templates, please refer to the following Microsoft documentation: [https://support.microsoft.com/help/3087759/how-to-create-and-manage-the-central-store-for-group-policy-administra](https://support.microsoft.com/help/3087759/how-to-create-and-manage-the-central-store-for-group-policy-administra).

### Registry

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

### Features and Sample Configurations

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

This diagram illustrates the System Update workflow in Commercial Vantage

![img](https://cdrt.github.io/mk_docs/img/cv/vantage_su_flow.png)

!!! note  ""
   With version 10.2208.22.0 the repository path can now also be specified as a URL path to an accessible cloud storage location.

See here for more information about using Update Retriever to create your own custom repository of updates: [https://support.lenovo.com/us/en/solutions/ht037099](https://support.lenovo.com/us/en/solutions/ht037099)

### Warranty Information

You can use Commercial Vantage to write the system warranty information to WMI (in the ROOT\Lenovo namespace) by setting the policy in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> Warranty**. The Lenovo\_WarrantyInformation class stores SerialNumber, Product, StartDate, EndDate, LastUpdateTime and the reference of each purchased warranty, while Lenovo\_WarrantyElement stores the details of these purchased warranties.

### Battery Information

On ThinkPads, you can use Commercial Vantage to write the battery information to WMI (in the ROOT\Lenovo namespace) by setting the policy in **Computer Configuration -> Administrative Templates -> Commercial Vantage -> Device -> Device Settings -> Power**. The Lenovo\_Battery class stores the same information about the battery that you can see in the Commercial Vantage application.

Need help with other configurations? Have questions? Reach out to us on our forum! [https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01\_eg](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg)
