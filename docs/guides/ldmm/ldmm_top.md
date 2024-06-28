# Lenovo Device Management Module

## Overview

The Lenovo Device Management Module is a PowerShell Module containing numerous cmdlets which provide useful information or simplified actions that can be leveraged in day to day management of Lenovo commercial PCs (ThinkPad, ThinkCentre, ThinkStation).

The Lenovo Device Management Module requires 64-bit PowerShell v5.1 or higher and runs on Windows 10 and Windows 11.

## Installing Lenovo Device Management Module

The module itself is currently available for download here: [ldmm_1.0.0.zip](https://download.lenovo.com/cdrt/tools/ldmm_1.0.0.zip){:target="_blank"} 

The plan is to eventually have it published in the PowerShell Gallery so it can easily be installed with the Install-Module command. For now, the module can be copied to a system and the Import-Module command can be used to install it.

The zip file contains the module folder, LnvDeviceManagement, which contains the LnvDeviceManagement.psm1 and LnvDeviceManagement.psd1 files plus the Public and Private sub-folders containing individual PowerShell scripts for the various functions. To manually install the module, there are two locations that the module folder can be copied to:

1. Per User:  %UserProfile%\Documents\WindowsPowerShell\Modules
1. All Users:  %ProgramFiles%\WindowsPowerShell\Modules

To ensure the module is loaded you will need to Import it first:

``` PowerShell
PS C:\> Import-Module LnvDeviceManagement -Force

PS C:\> Get-Module LnvDeviceManagement

ModuleType Version    Name                                ExportedCommands                                                                                               
---------- -------    ----                                ----------------                                                                                               
Script     1.0.0      LnvDeviceManagement                 {Add-LnvSUCommandLine, Add-LnvSULogging, Export-LnvUpdateRetrieverConfig...}   
```

## Cmdlet Reference

### Add-LnvSUCommandLine
:	
	#### Description

	Run Script to set Admin command line Windows Registry settings for Lenovo System Update.

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

		INPUTS:
		None.

		OUTPUTS:
		System.Int32. 0 - success
		System.Int32. 1 - unsuccess

		Messages:
		[LDA_INFORMATION_%TIMESTAMP%]:
		Script execution started.
		Script execution finished.

		[LDA_ERROR_%TIMESTAMP%]:
		%PARAMETERS_VALIDATION_ERROR_MESSAGE%
		Unexpected error occurred: %POWERSHELL_ERROR_MESSAGE%
		Lenovo System Update was not found at the default installation path.

	!!! note
	    Read messages to determine the result of the script working.

### Add-LnvSULogging
:	
	#### Description

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
:	
	#### Description

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
:	
	#### Description

	Shows results for search string representing model friendly name or machine type. The BIOS code is the first four characters of the BIOS image name. It is a useful data point for uniquely targeting a model.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| ModelName | String | True |

	#### Example

	```Find-LnvBiosCode -ModelName 'ThinkPad X13 Yoga Gen 4'```

	```Find-LnvBiosCode 'ThinkPad X13 Yoga Gen 4'```

	```Find-LnvBiosCode 21F3```

### Find-LnvDockModel
:	
	#### Description

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
:	
	#### Description

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

### Find-LnvMachineType
:	
	#### Description

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
:	
	#### Description

	This cmdlet returns the friendly model name that will be found in WMI on a device with the specified machine type. This is useful in cases where a management portal may display the 10 character machine type model number and the user needs to know the model name of that device.

	#### Parameter

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |

	#### Example

	```Find-LnvModel -MachineType 21DD```
	```Find-LnvModel 21DD```

	!!! note
	    The output will also show the other machine types associated with this model.

### Find-LnvUpdate
:	
	#### Description

	This script allows users to search for updates for a specified machine type.

	- Defaults to Windows 10 updates. WindowsVersion parameter is currently limited to 10 or 11 and can be populated with tab completion.
	- Requires users to enter at least a machine type
	- Can be called without identifiers so long as you use the right order
	- PackageType can be:  <br>
	 1: Application <br>
	 2: Driver <br>
	 3: Bios <br>
	 4: Firmware <br>
	- RebootType can be: <br>
	 1: Forced reboot (update itself initiates the reboot)<br>
	 3: Requires reboot (Thin Installer/System Update/CV initiates the reboot)<br>
	 4: Forces shutdown (update itself initiates shutdown)<br>
	 5: Delayed forced reboot (used for firmware, Thin Installer/System Update/CV will enforce reboot with
	 dialog displaying count-down timer)<br>
	- Severity can be: <br>
	 1: Critical <br>
	 2: Recommended <br>
	 3: Optional <br>

	!!! note
	    9 can be used for these three parameters to represent 'All'. Multiples can be combined by separating with comma, for example:  "2,3,4" or "1,5" or "1,2"

	Find-LnvUpdate displays a grid-view of the results. A single selected update can be returned when the grid-view is closed. Therefore, execute the following to display the search results and then capture the selected update object:

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

	#### Parameters	

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| PackageType | String | False |
	| RebootType | String | False |
	| Severity | String | False |
	| WindowsVersion | String | False |
	| PackageID | String | False |

	#### Example

	```Find-LnvUpdate -MachineType 20C1 -PackageType 2 -RebootType 1 -WindowsVersion 11```

	```Find-LnvUpdates 20C1 2```

	```Find-LnvUpdate 20C1 -PackageType 2```

### Get-LnvAvailableBiosVersion
:	
	#### Description

	If you specify a machine type, the cmdlet will return the version of the  currently available BIOS update. If no machine type is specified, the cmdlet will use the running system's machine type and will compare the version of the currently available update to the version of the system and return an alert if the update is newer. 

	The -Download switch can be used to trigger the download of the current update in either case. 

	The -Readme switch will download and display the readme text file at the end if available.

	#### Parameters	

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | False |
	| WindowsVersion | String | False |
	| Download | Switch | False |
	| ReadMe | Switch | False |

	!!! note
		WindowsVersion is strictly optional as generally one BIOS update package is released for both Windows 10 and Windows 11.

	#### Example

	```Get-LnvAvailableBiosVersion -MachineType 21DD -OS win10 -Download -ReadMe```

### Get-LnvBiosCode
:	
	#### Description

	 This cmdlet will read the BIOS image name from the device and return the first four characters which can be used as the BIOS code in targeting actions to the model uniquely.

	#### Example

	```Get-LnvBiosCode```

### Get-LnvBiosPasswordsSet
:	
	#### Description

	This cmdlet gets the BIOS password state of the system and interprets it to return the set of passwords set on the device. If the -Number switch is used, then the PasswordState number will be returned instead.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Number | Switch | False |

	!!! warning
	    THIS CMDLET REQUIRES ADMIN RIGHTS TO EXECUTE. Make sure the PowerShell session is running with elevated privileges.

### Get-LnvBiosUpdateUrl
:	
	#### Description

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
:	
	#### Description

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
:	
	#### Description

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
:	
	#### Description

	This cmdlet will download the SCCM Driver Pack based on the specified machine type, OS and OS build version. Tab completion can be used to select the OS build version in the correct format. The cmdlet will leverage the default browser for downloading the pack so the user can select the location to save the file to.

	#### Parameters

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | True |
	| WindowsVersion | String | True |
	| OSBuildVersion | String | True |

	#### Example

	```Get-LnvDriverPack -MachineType 21DD -WindowsVersion 10 -OSBuildVersion 22H2```

### Get-LnvMachineType
:	
	#### Description

	Returns the 4 character machinetype of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvMachineType```

### Get-LnvModelName
:	
	#### Description

	Returns the model name of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvModelName```

### Get-LnvProductNumber
:	
	#### Description

	Returns the full 10-character product number of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvProductNumber```

### Get-LnvSerial
:	
	#### Description

	Returns the serial number of the running device.

	#### Parameters

	None

	#### Example

	```Get-LnvSerial```

### Get-LnvUpdate
:	
	#### Description

	This script allows users to search for updates that will be downloaded to a folder of their choice
	- Defaults to Windows 10 updates and a repo folder in downloads if you do not specify
	- Requires users to enter at least a machine type
	- Can be called without identifiers so long as you use the right order
	- If a repository folder is specified that doesn't exist the script will create it
	- PackageType can be:  <br>
	&nbsp;&nbsp; 1: Application <br>
	&nbsp;&nbsp; 2: Driver <br>
	&nbsp;&nbsp; 3: Bios <br>
	&nbsp;&nbsp; 4: Firmware <br>
	- RebootType can be: <br>
	&nbsp;&nbsp; 1: Forced reboot (update itself initiates the reboot) <br>
	&nbsp;&nbsp; 3: Requires reboot (Thin Installer/System Update/CV initiates the reboot) <br>
	&nbsp;&nbsp; 4: Forces shutdown (update itself initiates shutdown) <br>
	&nbsp;&nbsp; 5: Delayed forced reboot (used for firmware, Thin Installer/System Update/CV will enforce reboot with dialog displaying count-down timer)<br>
	- Severity can be:<br>
	&nbsp;&nbsp; 1: Critical <br>
	&nbsp;&nbsp; 2: Recommended <br>
	&nbsp;&nbsp; 3: Optional <br>

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

	#### Example

	```Get-LnvUpdate -MachineType 20E4 -WindowsVersion 10 -RepositoryFolder "C:\repository" -PackageType 1```

	```Get-LnvUpdate 20E4 10 "C:\repository"```

	```Get-LnvUpdate -MachineType "20E6" -RepositoryFolder "C:\repository"```

### Get-LnvUpdatesRepo
:	
	#### Description

	For instances where Update Retriever cannot be used to create the local repository or where full automation of the repository creation is desired. This PowerShell script can be customized and executed on a regular basis to get the latest update packages.

	#### Parameters  

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| MachineType | String | False |
	| OS | String | False |
	| PackageTypes | String | False |
	| RebootTypes | String | False |
	| RepositoryPath | String | True |
	| LogPath | String | False |
	| RT5toRT3 | Switch | False |
	| ScanOnly | Switch | False |

	##### OS  

	Must be a string of '10' or '11'. The default if no value is specified will
	be determined by the OS of the device the script is running on.

	##### PackageTypes   

	Must be a string of Package Type integers separated by commas and surrounded by single quotes. The possible values are:<br>
	&nbsp;&nbsp; 1: Application<br>
	&nbsp;&nbsp; 2: Driver<br>
	&nbsp;&nbsp; 3: BIOS<br>
	&nbsp;&nbsp; 4: Firmware<br>
	The default if no value is specified will be all package types.

	##### RebootTypes  

	Must be a string of integers, separated by commas, representing the different boot types and surrounded by single quotes:<br>
	&nbsp;&nbsp; 0: No reboot required<br>
	&nbsp;&nbsp; 1: Forces a reboot (not recommended in a task sequence)<br>
	&nbsp;&nbsp; 3: Requires a reboot (but does not initiate it)<br>
	&nbsp;&nbsp; 4: Forces a shutdown (not used much anymore)<br>
	&nbsp;&nbsp; 5: Delayed forced reboot (used by many firmware updates)<br>
	The default if no value is specified will be all RebootTypes.

	##### RepositoryPath  

	Must be a fully qualified path to the folder where the local repository will be saved. Must be surrounded by single quotes.

	##### LogPath  

	Must be a fully qualified path. If not specified, ti-auto-repo.log will be  stored in the repository folder.
	Must be surrounded by single quotes.

	##### RT5toRT3  

	Specify this parameter if you want to convert Reboot Type 5 (Delayed Forced Reboot) packages to be Reboot Type 3 (Requires Reboot). Only do this in task sequence scenarios where a Restart can be performed after the Thin Installer task. Use the -noreboot parameter on the Thin Installer command line to suppress reboot to allow the task sequence to control the restart.

	!!! note
	    This parameter can only be used when Thin Installer will be processing the updates in the repository.

	##### ScanOnly  

	Specify this parameter to create a repository that only contains the package
	descriptor XML and external detection routine files to be used with Thin
	Installer's SCAN action.

	##### PackageList

	Specify a list of updates by their package IDs which can be obtained using Update
	Retriever. One or more updates can be specified, separated by a comma.

	#### Example

	```Get-LnvUpdatesRepo -RepositoryPath 'C:\Program Files (x86)\Lenovo\ThinInstaller\Repository'```
	``` -PackageTypes '1,2' -RebootTypes '0,3'```

	```Get-LnvUpdatesRepo -RepositoryPath 'Z:\21DD' -PackageTypes '1,2,3' -RebootTypes '0,3,5' -RT5toRT3```

		INPUTS:
		None

		OUTPUTS:
		System.Int32. 0 - success
		System.Int32. 1 - fail

### Show-LnvApplicableUpdate
:	
	#### Description

	Read an Update_ApplicabilityRulesTrace.txt from Thin Installer or ApplicabilityRulesTrace.txt from Lenovo System Update and show list of package IDs that are applicable.  This output string can be passed to the Get-LnvUpdatesRepo cmdlet in the -PackageList parameter to create a local repository of just the specified updates.

	| Parameter | Type | Mandatory |
	| --- | --- | --- |
	| Path | String | True |

	#### Example

	```Show-LnvApplicableUpdate -Path 'c:\Program Files (x86)\Lenovo\Thin Installer\logs\Update_ApplicabilityRulesTrace.txt'```
