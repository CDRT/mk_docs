# Lenovo Client Scripting Module

## Overview

The Lenovo Client Scripting Module is a PowerShell Module containing numerous cmdlets which provide useful information or simplified actions that can be leveraged in day to day management of Lenovo commercial PCs (ThinkPad, ThinkCentre, ThinkStation).

The Lenovo Client Scripting Module requires 64-bit PowerShell v5.1 or higher and runs on Windows 10 and Windows 11.

??? note "What's New"

    ### June 11, 2025:  Version 2.3.0

    - Added Get-LnvUpdateNotification, Get-LnvMTOSList, Add-LnvMTOS, Remove-LnvMTOS cmdlets. These allow you to create a list of Machine Type + OS combinations you care about and keep track of what updates have been added to their System Update catalogs since the last time you checked.
    - Added Get-LnvWUFriendlyName cmdlet that provides a list of the drivers and firmware installed by Windows Update with their associated Device Names to make it easier to tell what Windows Update is providing.
    - Added -DeltaUpdate option to Get-LnvUpdatesRepo which will allow you to just download new updates to an existing repository.
    - Fixed error handling when system does not have a battery in Get-LnvBatteryInfo.

    ### February 26, 2025:  Version 2.2.0

    - Added Find-LnvHSAPack cmdlet.  This cmdlet lets you see what HSA packs have been released for a specified Machine Type.
	- Added Release Date to the return from Find-LnvUpdate.
	- Added DownloadPath parameter to Get-LnvDriverPack so you can control where the package is downloaded to.
	- Fixed issue that occurs if a driver pack for the OS Build Version specified is not found in Get-LnvDriverPack.
	- Changed to display size in MB in Get-LnvUpdatesRepo.
	- Added CloudRepo as a switch parameter for Get-LnvUpdatesRepo to generate the repository as a Lenovo Cloud repository (the update packages are left on Lenovo's site).
	- Fixed an issue with Get-LnvUpdatesRepo if ran without specifying -WindowsVersion.

    ### December 11, 2024:  Version 2.1.0

    - Now available in the PowerShell Gallery. Use ```Install-Module -Name Lenovo.Client.Scripting``` to install from the gallery.
    - Added Find-LnvTool to get URL and version information for the installer packages of our tools:
        - Dock Manager
        - System Update
        - Thin Installer
        - Update Retriever
    - Added option to specify "Latest" as OSBuildVersion on Get-LnvDriverPack to get the latest version pack for the -WindowsVersion specified.
    - Added -DownloadPath option to Get-LnvDriverPack; will download to $env:TEMP if not specified.
    - Added -ListAll option to Find-LnvUpdate to get an object containing all the available updates based on any filtering parameters used. Can then use foreach to loop through each item and access the attributes returned for each update.
    - now leveraging BITS Transfers for downloads of package files in Get-LnvDriverPack, Get-LnvUpdate and Get-LnvUpdatesRepo
    - Get-LnvAvailableBiosVersion received several improvements:
        - Improved handling when the BIOS update is not found in the Win11 catalog but is in the Win10 catalog.
        - Added -DownloadPath to specify where to download the update package if -Download is used. If not specified, the update will be downloaded to the $env:TEMP folder.
        - Added the release date when showing a newer version is available.

    ### November 7, 2024:  Version 2.0.0

    - Changed name to Lenovo.Client.Scripting to avoid confusion with Lenovo Device Manager product and to provide consistency with other PowerShell modules. The version is reset 1.0.0. This version supersedes all prior versions of the Lenovo Device Management Module (LDMM). Prior versions of LDMM should be removed from devices.

    - Added new cmdlet Get-LnvBiosInfo and Find-LnvBiosInfo which return an object containing details about the BIOS for the running device or device specified by Machine Type or BIOS code, respectively.

    - Added new cmdlet Get-LnvWarranty which returns the details collected by Commercial Vantage in WMI. Commercial Vantage is required and must be configured in group policy to enable writing the warranty information to WMI.

    - Made several fixes to Get-LnvUpdatesRepo. The ScanOnly option is no longer available as it will not work with Thin Installer. Added -PackageList as a parameter to specify a string of specific updates, by Package ID, which should be included in the repository.

## Installing Lenovo Client Scripting Module

As of December 16, 2024, version 2.1.0 of the module is published in the PowerShell Gallery so it can easily be installed with the Install-Module command. To install from the PowerShell Gallery, simply run

``` PowerShell
Install-Module -Name Lenovo.Client.Scripting -Force
```

The module itself is currently available for manual download here: [Lenovo.Client.Scripting_2.3.0.zip](https://download.lenovo.com/cdrt/tools/Lenovo.Client.Scripting_2.3.0.zip)

The zip file contains the module folder, Lenovo.Client.Scripting, which contains the Lenovo.Client.Scripting.psm1 and Lenovo.Client.Scripting.psd1 files plus the Public and Private sub-folders containing individual PowerShell scripts for the various functions. To manually install the module, there are two locations that the module folder can be copied to:

1. Per User:  %UserProfile%\Documents\WindowsPowerShell\Modules
1. All Users:  %ProgramFiles%\WindowsPowerShell\Modules

To ensure the module is loaded it is recommended that you first remove the LnvDeviceManagementModule first:

``` PowerShell
PS C:\> Remove-Module LnvDeviceManagement
```

Then import the Lenovo.Client.Scripting module:

``` PowerShell
PS C:\> Import-Module Lenovo.Client.Scripting -Force
```

## Cmdlet Reference

### Add-LnvMTOS

: #### Description
    Stores list of available updates, based on machine type and OS input, into an updates database file (lnvUpdatesDatabase.json). The database consists of Machine Type, OS, CRC, and Available Updates. The updates come from the System Update catalog for the machine type & OS combination.

    This cmdlet will populate the database file with the specified MT, OS and a list of the current updates available in that model's catalog. The database file will be saved by default to ProgramData\Lenovo\ClientScriptingModule unless the Path parameter is otherwise specified. If the updates database file does not exist, one will be created.

    #### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| OS | String ("Win10","Win11")| True |
	| ListPath | String | False |

    ##### MachineType

    Must be the four-character machine type of the model.

    ##### OS

    Must be one of "Win10" or "Win11". Can use tab-complete to select.

    ##### ListPath

    A valid path to the folder where the lnvUpdatesDatabase.json file will be stored. The default path if not specified will be C:\ProgramData\Lenovo\ClientScriptingModule\. This will allow for monitoring separate collections of machine types if needed.

### Add-LnvSUCommandLine

: #### Description

	Cmdlet to set Admin command line Windows Registry settings for Lenovo System Update.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Search | String | True |
	| Action | String | True |
	| Scheduler | Int | False |
	| IncludeRebootPackages | String | False |
	| PackageTypes | String | False |
	| NoReboot | False | Switch |
	| NoIcon | Switch | False |
	| RebootPrompt | Switch | False |
	| Repository | String | False |
	| ExportToWmi | Switch | False |

	##### Search

	Must be one of the following values [C, R, A].

	##### Action

	Must be one of the following values [DOWNLOAD, INSTALL, LIST].

	##### IncludeRebootPackages

	Must be one of the following values [1, 3, 4, 5], or multiple values separated with a comma.

	##### PackageTypes

	Must be one of the following values [0, 1, 2, 3, 4], or multiple values separated with a comma.

	##### Repository

	Must be a local folder path, a UNC file share path, or a URL to a web-hosted repository.

	##### ExportToWmi

    Adds the -exporttowmi parameter to the command line to ensure the history of updates processed is collected in the custom WMI class under root\Lenovo\Lenovo_Updates

	!!! note
	    Read messages to determine the result of the script working.

### Add-LnvSULogging

: #### Description

	This cmdlet sets the appropriate registry key to cause the System Update Add-in to perform logging during update sessions. If neither the -Enable or -Disable switches are specified, then logging will be ENABLED.

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Enable | Switch | False |
	| Disable | Switch | False |

	#### Example

	```Add-LnvSULogging -Enable```

	!!! note
	    When logging is enabled a restart may be required and the log file will be located at ```%ProgramData%\Lenovo\Vantage\AddinData\LenovoSystemUpdateAddin\logs```

### Export-LnvUpdateRetrieverConfig

: #### Description

	Generates a .reg file containing an export of the Update Retriever settings found at:

	```HKLM\Software\Wow6432Node\Lenovo\Update Retriever\Preferences\UserSetting\General```

	These settings include the local repository path that was last used and the list of models in the Systems list that can be searched for in Update Retriever. Specify the output file name without an extension.  If an extension other than .reg is specified it will be ignored and the output file will have a .reg extension.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Outfile | String | True |

	#### Example

	```Export-LnvUpdateRetrieverConfig -Outfile C:\users\admin\Downloads\urconfig```

### Find-LnvBiosCode

: #### Description

	Shows results for search string representing model friendly name or machine type. The BIOS code is the first four characters of the BIOS image name. It is a useful data point for uniquely targeting a model.

    !!! note
        When specifying the friendly model name, it may be necessary to remove any reference to the generation in order to find the desired model because the representation of the generation may vary. By not specifying the generation as in the second example below, the results will contain a list of all the generations.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| ModelName | String | True |

	#### Example

	```Find-LnvBiosCode -ModelName 'ThinkPad X13 Yoga Gen 4'```

	```Find-LnvBiosCode 'ThinkPad X13 Yoga'```

	```Find-LnvBiosCode 21F3```

### Find-LnvBiosInfo

: #### Description

	Returns table results for search string representing model friendly name or bios code. Only one is required. The parameter name and value must be specified in order to distinguish which is being searched. The returned BIOS information includes the BIOS code, available version, url to updated executable, link to readme file, and list of CVEs.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| ModelName | String | True |
	| BiosCode | String | True |

	#### Example

	```Find-LnvBiosInfo -MachineType '21DD'```

	```Find-LnvBiosInfo -BiosCode 'n3je'```

### Find-LnvDockModel

: #### Description

	- The first four characters of the dock product number is the machine type.
	- This command returns the dock model name by searching for the machine type.
	- The -Details switch controls whether the full dock details are displayed.
	- If -Details is not specified then only the dock name will be returned.
	- If -Details is provided then the PnP IDs for the USB Billboard device and the audio device will be shown. These can be used when targeting laptops that have this dock attached.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| Details | Switch | False |

	#### Example

	```Find-LnvDockModel -MachineType 40AN -Details```

### Find-LnvDriverPack

: #### Description

	Returns a list of the available driver packs for the machine type specified which includes the OS and the OS build version, the CRC of the pack, and the URL to the package executable. The OS will be "win10" or "win11" and the OS build version will be the four character designator like "21H2" or "22H2".

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |

	#### Example

	```Find-LnvDriverPack -MachineType 21DD```

	```Find-LnvDriverPack 21DD```

	```$url = (Find-LnvDriverPack -MachineType 21DD | Where-Object { (($_.OS -eq 'win10') -and ($_.version -eq '21H2')) }).'#text'```

		OUTPUTS:
		An object consisting of "os", "version", "crc", or "#text" elements where
		"#text" represents the URL to the package executable file.

	!!! note
		The Where-Object cmdlet can be used to filter on OS and version to return just one URL.  The URL is in the '#text' field of the returned object.

### Find-LnvHSAPack

: #### Description

	Returns a list of the available HSA packs for the machine type specified which includes the OS and the OS build version, the CRC of the pack, and the URL to the package executable. This cmdlet does not implement an OS filter; however, you may specify -Latest to get the most current HSA pack for the specified Machine Type.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| Latest | Switch | False |

	#### Example

	```Find-LnvDriverPack -MachineType 21DD```

	```Find-LnvDriverPack -MachineType 21DD -Latest```

	```$url = (Find-LnvHSAPack -MachineType 21DD | Where-Object { (($_.OS -eq 'win10') -and ($_.version -eq '21H2')) }).'#text'```

	!!! note
		The output will be an object consisting of "os", "version", "crc", and "#text" elements where
		"#text" represents the URL to the package executable file.

### Find-LnvMachineType

: #### Description

	By specifying a search string representing model friendly name, this cmdlet will return the possible machine types that match. Most models have more than one possible machine type. Providing a more detailed model name to search for will help reduce the number of results returned.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| ModelName | String | True |

	#### Example

	```Find-LnvMachineType -ModelName 'ThinkPad P1 Gen 5'```

	```Find-LnvMachineType -ModelName 'ThinkPad P1 '```

	!!! note
		A space after the model name such as 'ThinkPad P1 ' will limit the search to ThinkPad P1 models and not include ThinkPad P15 or ThinkPad P16 models. Likewise, use 'ThinkPad X1 ' to search for ThinkPad X1 Carbon and Yoga models and exclude ThinkPad X13 models.

### Find-LnvModel

: #### Description

	This cmdlet returns the friendly model name that will be found in WMI on a device with the specified machine type. This is useful in cases where a management portal may display the 10 character machine type model number and the user needs to know the model name of that device.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |

	#### Example

	```Find-LnvModel 21DD```

	```Find-LnvModel -MachineType 21DD```


	!!! note
	    The output will also show the other machine types associated with this model.

### Find-LnvTool

: #### Description

    This script provides details about the current software tools provided by Lenovo, including version and URL to the latest installer package.

    #### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Tool | String | True |
	| Url | Switch | False |

    The -Tool parameter supports tab completion and must be one of the following strings:
    "DockManager",
    "SystemUpdate",
    "ThinInstaller",
    "UpdateRetriever"

    #### Example

    ```Find-LnvTool -Tool UpdateRetriever -Url```

    !!! note
        If the -Url parameter is not specified then an object containing the full set of details will be returned which include: name, sha256, version, '#text' (which is the URL to the installer package)

### Find-LnvUpdate

: #### Description

	This script allows users to search for updates for a specified machine type.

	- Defaults to Windows 10 updates. WindowsVersion parameter is currently limited to 10 or 11 and can be populated with tab completion.
	- Requires users to enter at least a machine type
	- Can be called without identifiers so long as you use the right order
	- PackageType can be:

	    - 1: Application
	    - 2: Driver
	    - 3: Bios
	    - 4: Firmware

	- RebootType can be:

	    - 1: Forced reboot (update itself initiates the reboot)
	    - 3: Requires reboot (Thin Installer/System Update/CV initiates the reboot)
	    - 4: Forces shutdown (update itself initiates shutdown)
	    - 5: Delayed forced reboot (used for firmware, Thin Installer/System Update/CV will enforce reboot with dialog displaying count-down timer)

	- Severity can be:

	    - 1: Critical
	    - 2: Recommended
	    - 3: Optional

	!!! note
	    9 can be used for these three parameters to represent 'All'. Multiples can be combined by separating with comma, for example:  "2,3,4" or "1,5" or "1,2"

	Find-LnvUpdate displays a grid-view of the results by default. A single selected update can be returned when the grid-view is closed. Therefore, execute the following to display the search results and then capture the selected update object:

	```PS C:\> $update = Find-LnvUpdate -MachineType 21DD -WindowsVersion 11```

	Then it is possible to view the attributes of the update like this:

	``` PowerShell
	PS C:\> $update

			ID          : n3jw603w
			Name        : Qualcomm Bluetooth Driver - 11 (21H2 or later)
			Category    : Bluetooth and Modem
			Version     : 2.0.0.488
			PackageType : 2
			Reboot      : 3
			Severity    : 1
			Descriptor  : https://download.lenovo.com/pccbbs/mobiles/n3jw603w_2_.xml
			PackageExe  : https://download.lenovo.com/pccbbs/mobiles/n3jw603w.exe
	```

	It is then possible to get the package executable or the package descriptor like this:

	```PS C:\> start $update.Descriptor```

    Find-LnvUpdate can also be called with the -ListAll parameter which will return an object list of the found updates. This can be set to a variable to allow the list to be iterated through using a foreach loop.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| PackageType | String | False |
	| RebootType | String | False |
	| Severity | String | False |
	| WindowsVersion | String | False |
	| PackageID | String | False |
    | ListAll | Switch | False |

	#### Example

	```Find-LnvUpdate -MachineType 21DD -PackageType 2 -RebootType 1 -WindowsVersion 11```

	```Find-LnvUpdates 21DD 2```

	```Find-LnvUpdate 21DD -PackageType 2 -ListAll```

### Get-LnvAvailableBiosVersion

: #### Description

	If you specify a machine type, the cmdlet will return the version of the  currently available BIOS update. If no machine type is specified, the cmdlet will use the running system's machine type and will compare the version of the currently available update to the version of the system and return an alert if the update is newer.

	The -Download switch can be used to trigger the download of the current update in either case. -DownloadPath can be used to specify where to store the update package. If not specified, it will be stored in the $env:TEMP folder.

	The -Readme switch will download and display the readme for the BIOS update.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | False |
	| WindowsVersion | String | False |
    | ReadMe | Switch | False |
	| Download | Switch | False |
    | DownloadPath | String | False |


	!!! note
		WindowsVersion is strictly optional as generally one BIOS update package is released for both Windows 10 and Windows 11. If not specified and a BIOS update is not found in the Win11 catalog, the Win10 catalog will also be checked.

	#### Example

	```Get-LnvAvailableBiosVersion -MachineType 21DD -WindowsVersion 10 -Download -ReadMe```

### Get-LnvBatteryInfo

: #### Description

      This cmdlet will return a list of custom objects which represent each battery in the system. For systems with more than one battery, you can iterate through the list to get the details for each battery. This cmdlet uses the deprecated Get-WmiObject due to a compatibility issue with Get-CimInstance and the Win32_Battery class.

    #### Example

    ```
        $ Get-LnvBatteryInfo

        InstanceName        : ACPI\PNP0C0A\0_0
        DeviceName          : 5B11H56411
        DesignedCapacity    : 86000
        Manufacturer        : Celxpert
        FullChargedCapacity : 85690
        Location            : Front
        DesignVoltage       : 15440
        RemainingCapacity   : 85580
        PowerOnline         : True
        Charging            : False
        Discharging         : False
        Voltage             : 17215
        ChargeRate          : 0
        DischargeRate       : 0
    ```

### Get-LnvBiosCode

: #### Description

	  This cmdlet will read the BIOS image name from the device and return the first four characters which can be used as the BIOS code in targeting actions to the model uniquely.


	#### Example

	```Get-LnvBiosCode```

### Get-LnvBiosInfo

: #### Description

	This cmdlet will read the BIOS image name from the device and return an object of bios information such as as the BIOS version, bios code, link to executable, link to readme, and list of CVEs unique to the targeting machine.

	#### Example

    ```
        $ Get-LnvBiosInfo

        Version          : 1.10
        VersionString    : N47ET21W (1.10 )
        ImageCode        : N47E
        AvailableVersion : 1.10.1.08
        UpdateUrl        : https://download.lenovo.com/pccbbs/mobiles/n47uj05w.exe
        ReadmeUrl        : https://download.lenovo.com/pccbbs/mobiles/n47uj05w.html
        CVEs             :
        PasswordsSet     : 0: No BIOS Password Set
    ```

### Get-LnvBiosPasswordsSet

: #### Description

	This cmdlet gets the BIOS password state of the system and interprets it to return the set of passwords set on the device. If the -Number switch is used, then the PasswordState number will be returned instead.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Number | Switch | False |

	!!! warning
	    THIS CMDLET REQUIRES ADMIN RIGHTS TO EXECUTE. Make sure the PowerShell session is running with elevated privileges.

### Get-LnvBiosUpdateUrl

: #### Description

	This command will return the URL to the current BIOS update package for either the specified machine type or for the machine type of the device running the command.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | False |

	#### Example

	```Get-LnvBiosUpdateUrl -MachineType '21AH'```

	```Get-LnvBiosUpdateUrl```

	!!! note
		The device must be a Lenovo ThinkPad, ThinkCentre, or ThinkStation.

### Get-LnvBiosVersion

: #### Description

	Returns the BIOS version in the specified format.

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Format | String/Decimal | False |

	!!! note
		String  : Returns the full string value of SMBIOSBIOSVersion
	    Decimal : Returns a standard version string in the format of n.nn

	#### Example

	```Get-LnvBiosVersion -Format 'decimal'```

	```Get-LnvBiosVersion```

	!!! note
	    This function handles the different methods used to express the BIOS version between ThinkPad and ThinkCentre/ThinkStation. Desktop BIOS will show build number in hex and the 'decimal' format will convert to a standard version string format.

	!!! note
	    If no Format is specified, the function will return the full string of the SMBIOSBIOSVersion value.

### Get-LnvCVE

: #### Description

	Returns a list of the CVE identifiers that are listed as addressed
	vulnerabilities in the current BIOS update for the specified system. A machine
	type can be passed as a parameter.  If no parameter is specified, the machine
	type of the running system will be used. CVE Data may not be available for all
	machine types.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | False |

	#### Example

	```Get-LnvCVE -MachineType 21DD```

	```Get-LnvCVE```

### Get-LnvDriverPack

: #### Description

	This cmdlet will download the SCCM Driver Pack based on the specified machine type, OS and OS build version. Tab completion can be used to select the OS build version in the correct format. The cmdlet will download the file to the env:TEMP folder by default. The path can be set with the -DownloadPath parameter.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| WindowsVersion | String | True |
	| OSBuildVersion | String | True |
    | DownloadPath | String | False |

	#### Example

	```Get-LnvDriverPack -MachineType 21DD -WindowsVersion 10 -OSBuildVersion 22H2```

    !!! note
        The -OSBuildVersion parameter can accept 'Latest' to specify that the latest pack for the specified -WindowsVersion should be downloaded. This cmdlet now uses BITS Transfer to download the pack.

### Get-LnvMachineType

: #### Description

	Returns the 4 character machinetype of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvMachineType```

### Get-LnvModelName

: #### Description

	Returns the model name of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvModelName```

### Get-LnvMTOSList

: #### Description

    Returns the list of Machine Types + OS pairs in the lnvUpdatesDatabase.json file

    #### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| ListPath | String | False |

    ##### ListPath

    Path to the lnvUpdatesDatabase.json file. Default if not specified will be C:\ProgramData\Lenovo\ClientScriptingModule.

    #### Example

    ```Get-LnvMTOSList```

### Get-LnvProductNumber

: #### Description

	Returns the full 10-character product number of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvProductNumber```

### Get-LnvSerial

: #### Description

	Returns the serial number of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvSerial```

### Get-LnvUpdate

: #### Description

	This script allows users to search for updates that will be downloaded to a folder of their choice.

	- Defaults to Windows 10 updates and a repo folder in downloads if you do not specify
	- Requires users to enter at least a machine type
	- Can be called without identifiers so long as you use the right order
	- If a repository folder is specified that doesn't exist the script will create it
	- PackageType can be:

	    - 1: Application
	    - 2: Driver
	    - 3: Bios
	    - 4: Firmware

	- RebootType can be:

	    - 1: Forced reboot (update itself initiates the reboot)
	    - 3: Requires reboot (Thin Installer/System Update/CV initiates the reboot)
	    - 4: Forces shutdown (update itself initiates shutdown)
	    - 5: Delayed forced reboot (used for firmware, Thin Installer/System Update/CV will enforce reboot with dialog displaying count-down timer)

	- Severity can be:

	    - 1: Critical
	    - 2: Recommended
	    - 3: Optional

	!!! note
	    9 can be used for these three parameters to represent 'All'

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| WindowsVersion | String | False |
	| RepositoryFolder | String | False |
	| PackageType | String | False |
	| RebootType | String | False |
    | Csv | Switch | False |
    | Expand | Switch | False |

	#### Example

	```Get-LnvUpdate -MachineType 20E4 -WindowsVersion 10 -RepositoryFolder "C:\repository" -PackageType 1```

	```Get-LnvUpdate 20E4 10 "C:\repository"```

	```Get-LnvUpdate -MachineType "20E6" -RepositoryFolder "C:\repository"```

    !!! note
        The -Csv parameter will cause a CSV file to be created in the repository folder listing the updates downloaded. The -Expand parameter will cause each update downloaded to be extracted into a subfolder named using the Package ID of the update.

### Get-LnvUpdatesNotification

: #### Description

    This cmdlet will present a list of any new updates that have been added to the tracked System Update catalogs.  The list is created using the Add-LnvMTOS cmdlet which is also used to add additional models. When this cmdlet runs, it will identify any catalogs which have a different CRC than what was previously seen the last time this cmdlet was executed. Those catalogs with a different CRC will be processed to get a list of new updates. Once all catalogs are processed, the list of new updates, displayed per model, will be returned in a grid-view by default. If you select an update in the grid-view and click OK, the readme for that update will be opened. You can get the full list of new updates directly without the grid-view by specifying the -ListAll parameter. If you are maintaining more than one list you can specify the -ListPath to select the appropriate folder containing the desired lnvUpdatesDatabase.json file.

    #### Parameters

    | Parameter | Type | Mandatory |
	| --- | --- | --- |
	| ListPath | String | False |
    | ListAll | Switch | False |

    **ListPath**

    Path to the folder containing the lnvUpdatesDatabase.json file to use.

    **ListAll**

    Show the full list at the command prompt instead of displaying a grid-view.

    #### Example

    ```Get-LnvUpdatesNotification -ListAll```

### Get-LnvUpdatesRepo

: #### Description

	For instances where Update Retriever cannot be used to create the local repository or where full automation of the repository creation is desired. This PowerShell script can be customized and executed on a regular basis to get the latest update packages.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| RepositoryPath | String | True |
	| MachineType | String | False |
	| WindowsVersion | String | False |
	| PackageTypes | String | False |
	| RebootTypes | String | False |
	| RT5toRT3 | Switch | False |
	| PackageList | String | False |
	| CloudRepo | Switch | False |

	**RepositoryPath**

	Must be a fully qualified path to the folder where the local repository will be saved. Must be surrounded by single quotes.

	**WindowsVersion**

	Must be a string of '10' or '11'. The default if no value is specified will
	be determined by the OS of the device the script is running on.

	**PackageTypes**

	Must be a string of Package Type integers separated by commas and surrounded by single quotes. The possible values are:

	- 1: Application
	- 2: Driver
	- 3: Bios
	- 4: Firmware

	The default if no value is specified will be all package types.

	**RebootTypes**

	Must be a string of integers, separated by commas, representing the different boot types and surrounded by single quotes:

	- 1: Forced reboot (update itself initiates the reboot)
	- 3: Requires reboot (Thin Installer/System Update/CV initiates the reboot)
	- 4: Forces shutdown (update itself initiates shutdown)
	- 5: Delayed forced reboot (used for firmware, Thin Installer/System Update/CV will enforce reboot with dialog displaying count-down timer)

	The default if no value is specified will be all RebootTypes.

	**RT5toRT3**

	Specify this parameter if you want to convert Reboot Type 5 (Delayed Forced Reboot) packages to be Reboot Type 3 (Requires Reboot). Only do this in task sequence scenarios where a Restart can be performed after the Thin Installer task. Use the -noreboot parameter on the Thin Installer command line to suppress reboot to allow the task sequence to control the restart.

	!!! warning
        This parameter can only be used when **Thin Installer** will be processing the updates in the repository because changing the reboot type will break the XML digital signature. When using version **1.04.02.00024** or later of Thin Installer, you must also specify the **-ignorexmlsignature** to ensure Thin Installer does not skip the updates that have been altered.

	**PackageList**

	Specify a list of updates by their package IDs which can be obtained using Update Retriever. One or more updates can be specified, separated by a comma.

    **CloudRepo**

	Specify this parameter to cause the local repository to be created as a "Lenovo Cloud repo" which means the update package itself will be left on Lenovo's servers and only the package descriptor XML and any external detection routines will be downloaded.

	#### Example

	``` PowerShell
	Get-LnvUpdatesRepo -RepositoryPath 'C:\Program Files (x86)\Lenovo\ThinInstaller\Repository' -PackageTypes '1,2' -RebootTypes '0,3'
	```

	``` PowerShell
	Get-LnvUpdatesRepo -RepositoryPath 'Z:\21DD' -PackageTypes '1,2,3' -RebootTypes '0,3,5' -RT5toRT3 -CloudRepo
	```

### Get-LnvWarranty

: #### Description

	Returns the devices available warranty status. This requires that Commercial Vantage be installed and configured through group policy to write warranty information to WMI.

	#### Parameters

	None

	#### Example

	```Get-LnvWarranty```

### Get-LnvWUFriendlyName

: #### Description

    This cmdlet will return a list of drivers and firmware that were applied by Windows Update and will show the title used by Windows Update and the more useful friendly name used by Lenovo. This cmdlet will also return the version and install date of the driver or firmware that was applied by Windows Update. The output will only include information about drivers that
    are currently active. Windows Update History may show multiple entries for the same driver or firmware, but this cmdlet will only return the most recent version of each driver or firmware. It will also only return information about drivers for components currently attached and not for components that have been removed or are not currently attached.

    *** ATTRIBUTION ***
    This cmdlet is based on the work of Trevor Jones and the original can be found on his blog at [smsagent.blog](https://smsagent.blog/2023/07/07/translating-windows-update-driver-names-to-friendly-driver-names/)

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| GridView | Switch | False |
    | SortbyInstallDate | Switch | False |

    **GridView**

    If specified, the output will be displayed in an Out-GridView window.

    **SortbyInstallDate**

    If specified, the output will be sorted by InstallDate instead of WUName.

    #### Example

    ```Get-LnvWUFriendlyNames -GridView -SortbyInstallDate```

### Remove-LnvMTOS

: #### Description

    This cmdlet removes models and their updates from the machine updates database (lnvUpdatesDatabase.json) based on specified Machine Type and OS parameters. This cmdlet requires the appropriate parameters such as machine type, os, and path. If the ListPath is not specified the default path will be searched. If specified MT+OS pair is found in the database file, it will be removed. If the MT+OS pair is not found, it will return a message indicating that no machine was found with the specified criteria.

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Path | String | True |

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
    | OS | String | True |
    | ListPath | String | True |

    **MachineType**

    The four-character Machine Type to search for (e.g., "21DD").

    **OS**

    The operating system to search for. Use tab complete to select from OS options ("Win10", "Win11").

    **ListPath**

    Set the file path where the json file is stored. Or it will searh by default at "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json."

    #### Example

    ```Remove-LnvMTOS -MachineType 11W2 -OS Win11 -Path "C:\ProgramData\Lenovo\ClientScriptingModule\lnvUpdatesDatabase.json"```

### Show-LnvApplicableUpdate

: #### Description

	Read an Update_ApplicabilityRulesTrace.txt from Thin Installer or ApplicabilityRulesTrace.txt from Lenovo System Update and show list of package IDs that are applicable.  This output string can be passed to the Get-LnvUpdatesRepo cmdlet in the -PackageList parameter to create a local repository of just the specified updates.

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
    | Path | String | True |

    **Path**

    The full path to the Update_ApplicabilityRulesTrace.txt or ApplicabilityRulesTrace.txt file to be read.

	#### Example

	```Show-LnvApplicableUpdate -Path 'c:\Program Files (x86)\Lenovo\Thin Installer\logs\Update_ApplicabilityRulesTrace.txt'```
