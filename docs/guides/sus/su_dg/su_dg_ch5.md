# 5 Command Line Reference

## 5.1 System Update

System Update can be controlled via command line by leveraging the group policy control for the Administrator Command Line. A typical scenario would have System Update executed by a task in the Windows Task Scheduler set to run on a recurring basis to ensure the device stays current. That scheduled task would execute:

```CMD
C:\Program Files (x86)\Lenovo\System Update\tvsu.exe /CM
```

The rest of the command line parameters would be specified as a Policy in the registry using either Group Policy or by manipulating the registry directly at:

```Registry
HKLM\Software\Policies\Lenovo\System Update\UserSettings\General

Value: [REG\_SZ] AdminCommandLine

Example: /CM -search A -action INSTALL -includerebootpackages 3 -nolicense -exporttowmi
```

!!! note
    When using a custom scheduled task, a new task should be created, and the default task created when System Update is installed should be disabled. Additionally, the &quot;SchedulerAbility&quot; setting must be set to &quot;NO&quot; in the registry at ```HKLM:\SOFTWARE\WOW6432Node\Lenovo\System Update\Preferences\UserSettings\Scheduler```

This will prevent System Update from re-enabling the default tasks.

### Parameters

!!! note
	The parameter of -schtask should not be used in a custom command line.

#### /CM

Required. Identifies the running instance of System Update is executing by command line instead of being launched directly.

#### -search

Required. Specifies the updates to search for based on severity. Possible values are:

   - C = Critical only
   - R = Recommended and Critical
   - A = All (Optional, Recommended and Critical)

#### -action

Required. Specifies the action to take with the updates found. Only specify one action; cannot specify combination of actions

Possible values are:

   - **DOWNLOAD:** Updates for the system are automatically downloaded only; updates can be filtered using -includerebootpackages or -packagetypes parameters
   - **LIST:** User is notified with a list of available updates to choose from; updates can be filtered using -includerebootpackages or -packagetypes parameter
   - **INSTALL:** Updates are downloaded and installed; updates can be filtered using -includerebootpackages and -packagetypes parameters

#### -scheduler

Optional. Specifies that System Update is running from a scheduled task so the pick list license notice should not be displayed.

#### -includerebootpackages

Optional. Specifies by number the reboot types to include in the set of updates found. Possible values are 1, 3, 4, 5. If this parameter is not specified, only reboot type 0 packages will be included. The value 2 is never used. Multiple reboot types can be specified by separating with a comma. This filter will always be applied first.

   **0:** No reboot is required - no need to specify on command line

   **1:** Forced reboot (update itself initiates the reboot)

   **3:** Requires reboot (System Update initiates the reboot)

   **4:** Forces shutdown (update itself initiates shutdown)

   **5:** Delayed forced reboot (used for firmware, System Update will enforce reboot with dialog displaying count-down timer)

!!! note
	When used with -packagetypes, the resulting set of updates is the intersection of both filters.

#### -packagetypes

Optional. Specifies by number a filter for the package types to be applied. Multiple package types can be specified by separating with comma.

   **0** : _Reserved – unused at this time._<br/>
   **1** : Application<br/>
   **2** : Driver<br/>
   **3** : Bios<br/>
   **4** : Firmware<br/>

!!! note
	When used with -includerebootpackages, the resulting set of updates is the intersection of both filters. If -includerebootpackages is not specified, only reboot type 0 packages will be considered.

#### -noreboot

Optional. In normal operation, if System Update installs one or more Reboot Type 3 (Requires reboot) updates, it will initiate a reboot after the last installation completes. To suppress this reboot simply specify this parameter. This parameter only has an effect for Reboot Type 3 packages. For Reboot Type 1 and 4, the reboot or shutdown is orchestrated by the update itself and is not under the control of System Update. For Reboot Type 5 packages a reboot must be executed immediately after update and is forced by System Update.

#### -noicon

Optional. Suppresses the balloon tooltip from the notification area of the system tray.

#### -nolicense

Optional. Suppresses the license notice from System Update.

#### -rebootprompt

Optional. Forces the display of the reboot prompt dialog after installing updates that will require a restart. This parameter is only applicable when the -noicon parameter is used and the -noreboot parameter is NOT used. In this scenario, if the -rebootprompt parameter were not used, the system could be rebooted without any warning to the user.

#### -repository

Optional. Specifies the full path to the local repository location. This must be a local folder path, a UNC file share path, or a URL to a web-hosted repository.

#### -exporttowmi

Optional. Causes System Update to store update history data in a WMI table:

```WMI
Root\Lenovo\Lenovo_Updates\
```

### 5.1.1 User Prompt Handling

When System Update finds updates that will cause a restart of the system, it will display a warning dialog to the end user to allow them to save their work before proceeding with the updates. There are limited ways of controlling this behavior depending on which updates are found applicable and which command line parameters are used.

   - If **-noreboot** and **-noicon** are used and only Reboot Type 0 or 3 updates are found, then System Update will install the updates with no prompting and the system will not be restarted.
   - If only **-noicon** is used and only Reboot Type 0 or 3 updates are found, then the updates will be installed and the system will be restarted with no prompting.
   - If **-noicon** and **-rebootprompt** are used and Reboot Type 0 or 3 updates are found, then the user is prompted before installation to ensure they save their work.
   - If Reboot Type 1, 4 or 5 updates are found then System Update will always prompt the user before proceeding to install the updates. With Reboot Type 1 and 4 updates, the system will be restarted or shutdown respectively by the update itself. With Reboot Type 5 updates, a reboot timer will be displayed and the system will be restarted within 5 minutes.


## 5.2 Thin Installer

Thin Installer must be executed with administrative privileges in order to function properly and it can be controlled by command line. Since Thin Installer does not require installation it can be executed from the folder it resides in, such as:

```CMD
C:\\<source folder>\ThinInstaller.exe /CM -search R -action INSTALL -includerebootpackages 3 -noreboot -noicon -repository <path> -exporttowmi
```

### Parameters

#### /CM

Required. Identifies the running instance of Thin Installer is executed with command line parameters instead of being launched directly.

#### -search

Required. Specifies the updates to search for based on severity. Possible values are:

   - **C** = Critical only
   - **R** = Recommended and Critical
   - **A** = All (Optional, Recommended and Critical)

#### -action

Required. Specifies the action to take with the updates found. It can only specify one action; cannot specify combination of actions. Possible values are:

   - **DOWNLOAD** : Applicable updates for the system are automatically downloaded only; updates can be filtered using -includerebootpackages and -packagetypes parameters
   - **LIST** : User is notified with a list of available updates to choose from; as of version 1.3.0041 the updates can be filtered using -includerebootpackages and -packagetypes parameters
   - **INSTALL** : Updates are downloaded and installed; updates can be filtered using -includerebootpackages and -packagetypes parameters
   - **SCAN** : Assesses applicability of updates available in the repository; generates an Update\_ApplicabilityRulesTrace.txt file automatically; as of version 1.3.0041 updates can be filtered using -includerebootpackages and -packagetypes parameters
   - **INSTALLDEFERRED** : install the updates which were previously downloaded using the DOWNLOAD parameter; any filtering parameters on the command line are **ignored**

!!! note
	The return codes used by Thin Installer will vary by the action performed. See section 5.2.1 Thin Installer Return Codes

#### -includerebootpackages

Optional. Specifies by number the reboot types to include in the set of updates found to be downloaded and/or installed. Possible values are 1, 3, 4, 5. If this parameter is not specified, only reboot type 0 packages will be included. The value 2 is never used. Multiple reboot types can be specified by separating with a comma. This filter will always be applied first.

   **0:** No reboot is required - no need to specify on command line

   **1** : Forced reboot (update itself initiates the reboot)
   
   **3** : Requires reboot (Thin Installer initiates the reboot)
   
   **4** : Forces shutdown (update itself initiates shutdown)
   
   **5** : Delayed forced reboot (used for firmware, Thin Installer will enforce reboot with dialog displaying count-down timer)

!!! note
	When used with -packagetypes, the resulting set of updates is the intersection of both filters.

#### -packagetypes

Optional. Specifies by number a filter for the package types to be applied. Multiple package types can be specified by separating with comma.

   **0** : _Reserved – unused at this time._
   
   **1** : Application
   
   **2** : Driver
   
   **3** : Bios
   
   **4** : Firmware

!!! note
	When used with -includerebootpackages, the resulting set of updates is the intersection of both filters. If -includerebootpackages is not specified, only reboot type 0 packages will be considered.

#### -noreboot

Optional. In normal operation, if Thin Installer installs one or more Reboot Type 3 (Requires reboot) updates, it will initiate a reboot after the last installation completes. To suppress this reboot simply specify this parameter. This parameter only has an effect for Reboot Type 3 packages. For Reboot Type 1 and 4, the reboot or shutdown is orchestrated by the update itself and is not under the control of Thin Installer. For Reboot Type 5 updates a reboot must be executed immediately after the update and is forced by Thin Installer.

#### -noicon

Optional. Suppresses the balloon tooltip from the notification area of the system tray.

#### -nocancel

Optional. Hides the Cancel button so that user cannot interrupt scheduled task to update the system using Thin Installer while displaying GUI to notify user that updates are being applied.

#### -nocontinueafterreboot

Optional. By default, if there are multiple Reboot Type 1 or 4 updates that are applicable, Thin Installer will create a Run Once key to continue installation of updates after the first update reboots or shuts down the system. Unless the next logged-on user is an Administrator level user, Thin Installer will not be able to run. In this scenario, use -nocontinueafterreboot to prevent Thin Installer from creating the registry key. Thin Installer will need to be executed again with administrator level privileges in order to install the remaining updates.

#### -debug

Optional. Enables debug mode without having to specify it in the _ThinInstaller.exe.configuration_ file. This causes Thin Installer to generate the _Update\_ApplicabilityRulesTrace.txt_ file in the log file location.

#### -showprogress

Optional. Displays the progress of downloading and installing updates. Not recommended when using Thin Installer in a task sequence as it will interrupt the execution of the task sequence.

#### -scheduler

Optional. If -action is specified as INSTALL or INSTALLDEFERRED and the ThinInstaller.exe.configuration file specifies YES for \&lt;DisplayLicenseNotice\&gt;, then this parameter will cause Thin Installer to ignore the configuration file and will not display the license notice before displaying the list of available updates.

#### -repository

Optional. Specifies the full path to the local repository location. This can be a local folder path, a UNC file share path, or a URL to a web-hosted repository.

#### -exporttowmi

Optional. Causes Thin Installer to store update history data in a WMI table:

```WMI
root\Lenovo\Lenovo_Updates\
```

#### -log

Optional. Specifies fully qualified path for storing the log file

### 5.2.1 Thin Installer Return Codes

There are specific return codes used by Thin Installer based on which -action parameter is used.

<center>

 |     INSTALL     |              |                                                                                                                                         |
|-----------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------|
|                 | 3010         |     Indicates a reboot is required because one or more Reboot Type 3   updates were installed with the -noreboot parameter specified    |
|                 |              |                                                                                                                                         |
|     SCAN        |              |                                                                                                                                         |
|                 | 10000        |     No applicable updates found                                                                                                         |
|                 | 10001        |     Applicable updates found                                                                                                            |
|                 |              |                                                                                                                                         |
|     DOWNLOAD    |              |                                                                                                                                         |
|                 |     20000    |     All applicable packages were downloaded                                                                                             |
|                 |     20001    |     Some applicable packages failed to download while others   succeeded                                                                |
|                 |     20002    |     Applicable packages were found but none were downloaded   successfully                                                              |
|                 |     20003    |     No applicable updates were found to download                                                                                        |                                                                                  |

</center>

## 5.3 Update Retriever

Update Retriever can be launched from its default installation location at

```CMD
C:\Program Files (x86)\Lenovo\Update Retriever\UpdateRetriever.exe
```

It does require Administrator privileges to run.

#### /SCHEDULER

Optional. Used to launch Update Retriever to perform the automatic search actions specified under &quot;Schedule updates&quot;.

#### /GUI

Optional. Launches Update Retriever to the &quot;Get new updates&quot; screen.

#### /CATALOGSCAN

Optional. Launches Update Retriever silently to automatically search for new content since the last search in the catalogs of all the model + OS pairs that have been specified. If there has been no new content released, Update Retriever exits. If new content is found, Update Retriever UI will appear to display the search results.
