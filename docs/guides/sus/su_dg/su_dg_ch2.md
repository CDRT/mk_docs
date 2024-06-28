# 2 Installation

## 2.1 Installing System Update

This chapter provides the installation instructions and requirements for System Update.

### 2.1.1 Installation Requirements

System Update supports the following operating systems:

- Microsoft® Windows® 7 32 &amp; 64 bit
- Windows 10 64-bit
- Windows 11 64-bit

!!! note
	System Update is qualified and supported on Windows 7, Windows 10 and Windows 11. System Update is not qualified and supported on Windows 8/8.1. If End User decides to install System Update on Windows 8/8.1 it may work without issue and may be used as is, but Lenovo makes no representations about this and has not tested such installation and such installation would not be supported. If having System Update is important to End User Lenovo recommends changing to a Windows version where it is qualified and supported.

System Update requires Microsoft .NET Framework 4.5.2 or a later version. A compatible version of .NET Framework can be downloaded from the following Microsoft website:

[https://dotnet.microsoft.com/download](https://dotnet.microsoft.com/download){:target="_blank"}

### 2.1.2 Languages

System Update supports all NLS (National Language Support) language packs. In normal cases, System Update loads the language pack set in the LanguageOverride field. That is, at startup, System Update checks the Windows registry for a valid language override code in the LanguageOverride field. If the language override code in the LanguageOverride field is valid and the language pack is available on the system, System Update will load the language pack corresponding to the language override code specified in the LanguageOverride field and display the rest of the session in that language.

The registry location for the LanguageOverride field is:

```Registry
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\System Update\LanguageOverride
```

The following table presents the languages and the corresponding language override codes for System Update.

<center>

| **Language** | **Identifier** | **Language Override Code** |
| --- | --- | --- |
| Danish | 1030 | DA |
| Dutch (standard) | 1043 | NL |
| English | 1033 | EN |
| Finnish | 1035 | FI |
| French | 1036 | FR |
| German | 1031 | DE |
| Italian | 1040 | IT |
| Japanese | 1041 | JP |
| Korean | 1042 | KO |
| Norwegian (Bokmal) | 1044 | NO |
| Portuguese (Brazilian) | 1046 | PT |
| Spanish | 1034 | ES |
| Swedish | 1053 | SV |
| Simplified Chinese | 2052 | CHS |
| Traditional Chinese | 1028 | CHT |

_Table 2-1. System Update language codes_
</center>

The following are scenarios in which System Update will load the substitute NLS language pack:

- **_Loading the language pack set in the Windows Regional and Language Options settings_**: If the LanguageOverride field is empty or with an invalid value, or the value specified in the LanguageOverride field is not installed on the system, System Update will get the language override code of the operating system set in the Regional and Language Options settings. If System Update successfully loads the language pack corresponding to the language set in the Regional and Language Options settings, System Update will display the rest of the session in that language.
- **_Loading the language pack set in the DefaultLanguage field_**: If the language pack corresponding to the language set in the Regional and Language Options settings is not available on the system, System Update will attempt to get the default language that has been set in the DefaultLanguage field when the end user used the System Update installer and selected a language during the installation. System Update will load the language pack corresponding to the default language set in the DefaultLanguage field, and display the rest of the session in that language. If the 8 System Update Solution Deployment Guide language pack corresponding to the default language set in the DefaultLanguage field is on the system, System Update will load the default language pack and display the rest of the session. The registry location for the DefaultLanguage field is:

	```Registry
	HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\System Update\DefaultLanguage 
	```

- **_Loading the US English language pack_**: If the DefaultLanguage field is empty or contains an invalid value, or if the language pack corresponding to the default language set in the DefaultLanguage field is not on the system, the default language will not be used. System Update will attempt to load the US English language pack. If the US English language pack is not on the system, an error message will be displayed, saying &quot;System Update has found a critical problem and must close.&quot; This error message is in the US English language.

### 2.1.3 Installation Command Lines

System Update can be installed manually by executing the installation package downloaded from Lenovo. System Update can also be installed silently with the following command line:

```CMD
C:\\[System Update installation file name].exe /VERYSILENT /NORESTART
```

To install System Update silently and control where the installation package extracts to, use the following command:

```CMD
C:\\[System Update installation file name].exe /VERYSILENT /NORESTART /DIR="C:\tvsu\temp"
```

System Update is installed to the following folder:

```CMD
%ProgramFiles%\Lenovo\System Update
```

System Update supports the following installation scenarios:

- Clean installation: System Update will be installed with default preferences
- Upgrade or over-installation (earlier version already exists): The installation program will remove the older version and install the current version. Preferences will be preserved.

An installation log file, _tvsusetup.log_, will be automatically generated and stored in the _%temp%_ directory. The location and filename of the log file can be controlled by command line parameter also:

```CMD
C:\\[System Update installation file name].exe /VERYSILENT /NORESTART /LOG=c:\tvsu.log
```

### 2.1.4 Uninstalling System Update

System Update can be uninstalled by using the **Add or Remove Programs** applet located in the Windows operating system. After the uninstall is complete, all program files and settings are deleted.

Alternatively, a command-line can be used to perform a silent uninstall. To silently uninstall System Update, use the following command:

```CMD
[Your install dir]\unins000.exe /verysilent /norestart
```

### 2.1.5 Updating System Update

System Update includes a mechanism by which it will update itself whenever a newer version is released. System Update checks for a newer version before performing a search for updates each time it is launched. If a newer version is found, it will prompt to update itself before proceeding and will guide the user through the update process.

It is recommended to keep System Update running on the most current version; however, if this feature needs to be disabled it can be done by editing the registry. To disable this feature, do the following to clear the registry value:

1. Using regedit.exe, navigate to the following registry entry:

	```Registry
	HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\System Update\Preferences\UCSettings\HTTPSHelloSettings\ServerName
	```

2. Delete the ServerName string value, for example:

	```URL
	https://download.lenovo.com/ibmdl/pub/pc/pcbs/agent/ 
	```

3. Click **OK**.

## 2.2 Installing Thin Installer

Thin Installer is provided as an installation package which simply extracts the Thin Installer source files to C:\Program Files (x86)\Lenovo\ThinInstaller. The process does not create any registry entries and does not install any services. The Thin Installer folder can simply be copied to target devices and executed by command line.

### 2.2.1 Installation Requirements

Thin Installer is supported on the following operating systems:

- Windows 10 64 bit
- Windows 7 32 &amp; 64 bit

Thin Installer requires Microsoft .NET Framework version 4.5.2 or higher. A compatible version of .NET Framework can be downloaded from the following Microsoft website:

[https://dotnet.microsoft.com/download](https://dotnet.microsoft.com/download){:target="_blank"}

### 2.2.2 Removing Thin Installer

No registry keys or temporary files relating to Thin Installer are created when the program finishes installing update packages. Therefore, to uninstall Thin Installer, you only need to delete the folder containing Thin Installer and all its related files.

## 2.3 Installing Update Retriever

Update Retriever is intended to be installed on an administrator's system and is not installed on the fleet of client computers.

### 2.3.1 Installation Requirements

Update Retriever is supported on the following operating systems:

- Windows 7
- Windows 8.1
- Windows 10
- Windows Server 2012
- Windows Server 2016
- Windows Server 2019

Update Retriever requires Microsoft .NET Framework version 4.5.2 or higher. A compatible version of .NET Framework can be downloaded from the following Microsoft website:

[https://dotnet.microsoft.com/download](https://dotnet.microsoft.com/download) 

### 2.3.2 Languages

The following table presents the languages supported by Update Retriever and their corresponding language override codes:

<center>

| **Language** | **Identifier** | **Language Override Code** |
| --- | --- | --- |
| English | 1033 | EN |
| French | 1036 | FR |
| German | 1031 | DE |
| Japanese | 1041 | JP |
| Simplified Chinese | 2052 | CHS |

_Table 2-2. Update Retriever language codes_

</center>

The registry location for the **LanguageOverride** field for a 32-bit machine is:

```Registry
HKEY_LOCAL_MACHINE\SOFTWARE\Lenovo\Update Retriever\LanguageOverride
```

The registry location for the **LanguageOverride** field for a 64-bit machine is:

```Registry
HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Lenovo\Update Retriever\LanguageOverride
```

### 2.3.3 Installation Command Lines

Update Retriever can be installed manually by executing the installation package downloaded from Lenovo. Update Retriever can also be installed silently with the following command line:

```CMD
c:\\[Update Retriever installation file name].exe /VERYSILENT /NORESTART
```

To silently extract to a specific folder followed by an installation, use the DIR parameter. For example:

```CMD
[Update Retriever installation file name].exe /VERYSILENT /NORESTART /DIR="C:\temp"
```

The installation log file contains information that can be used to debug installation problems. For Update Retriever, the log file name is _tvursetup.log_.

If you install the program by double-clicking the setup.exe file, the log file will be automatically generated and stored in the _%temp%_ directory.

If you want to install the program silently and generate installation log files, use the following command:

```CMD
[Update Retriever installation file name].exe /VERYSILENT /NORESTART /LOG=c:\tvur.log
```

If a previous version of Update Retriever is already installed, the following pop-up is displayed. In order to download the newest version of Update Retriever, the use must click **Yes**. After selecting **Yes** , to uninstall the existing version of Update Retriever, a window will appear asking for install instructions. Please proceed with install instructions.The administrator will NOT lose any of their previous downloads, update packages, machines, or any information in Update Retriever or its repository. Everything that was displayed and available in the existing version of Update Retriever, will be in the new version that is being installed **.**

<center>

![](https://cdrt.github.io/mk_docs/img/guides/su/img2-1.png)

_Figure 2-1. Removing existing version of Update Retriever to download the newest version._

</center>

### 2.3.4 Uninstall Update Retriever

Update Retriever can be uninstalled by using the Add or Remove Programs applet in Windows operating systems. After the uninstall is complete, all program files and settings are deleted. Alternatively, you can use command-lines to perform a silent uninstall. To silently uninstall Update Retriever, use the following command-line:

```CMD
[Your install dir]\unins000.exe /verysilent /norestart
```
