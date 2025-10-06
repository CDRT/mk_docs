# 3 General Usage

## 3.1 System Update

This section will provide an overview of how System Update can be used to install updates either manually using the application&#39;s interface or automatically based on a scheduled task. The various methods of configuring and launching System Update will be covered.

Once System Update has been installed, the tool is ready to run. When launching System Update for the first time, the Welcome tab information will appear, giving the user a brief overview of how the tool can be used. Once the user clicks  **Next** , in the bottom left hand corner on the welcome page, System Update will automatically start searching for updates on the system. Of course, the administrator can make changes in group policy to alter how system update searches for updates, this is just the generic way of how System Update will run. Once the tool has finished searching for updates, it will prompt the user with a License notice. The License agreement notice is for all future package downloads and will not be shown again. The user must agree to proceed with the download and installation. Once the tool searches for updates, the update packages will be displayed in three different severity categories; Critical, Recommended, and optional.

![System Update](https://cdrt.github.io/mk_docs/img/guides/su/img3-1.png)

_Figure 3-1. Systems Update Welcome Interface._

There are multiple functional tabs in System Update, located to the left-hand side of the tool, allowing the user to customize the way they want to update their machine. Designed to help keep systems up-to-date, the System Update tool provides the following functions:

1. **Get New Updates**
   + **Critical updates**
   + **Recommended updates**
   + **Optional updates**
2. **Install Deferred Updates**
3. **Schedule Updates**
4. **View Installation History**
5. **Restore Hidden Updates**

Following the numerical order above, the upcoming sections will explain each of the System Update functions in further detail.

!!! note
	If the user does not want to proceed with the System Update function they are currently on, the user must click  **Cancel**  before the tool will allow you to exit the function tab and move on to another one.

### 1. Get New Updates

System Update will automatically search for new updates from the Lenovo support site based on the machine type and operating system. Once the updates are found, the tool separates each update applicable to the machine, into critical updates, recommended updates, and optional updates. The critical updates will automatically be checked to download, unlike the recommended or optional updates. The user can check and uncheck any of the updates. The user must click on each individual update tab (critical, recommended, and optional updates) to select the desired update packages before continuing. There is an option to select all the updates or the user can individually select them one by one.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-2.png)

_Figure 3-2. Searching for new updates._

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-3.png)

_Figure 3-3. Agree to the License notice before proceeding with System Update._

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-4.png)

_Figure 3-4. Get New Updates Function, selecting critical updates._

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-5.png)

_Figure 3-5. Get New Updates, item details expanded._

Notice that there is a drop-down arrow by each checkbox for each individual package.  When clicked, the item details will expand. The user can either click the down arrow for each individual update package or they can press the &quot;Expand all&quot; red plus sign above the packages. The expanded view provides more information on each update package including the manufacturer, version, installed version, download size, disk space needed, and the option to defer the update. If the user would like to defer the update, the checkbox must be checked. Furthermore, there is a &quot;View details&quot; link, which displays the contents of the readme file for the update package which offers additional details such as supported models, supported operating systems, supported devices, what the package does, changes in the release, determining which version is installed, installation and uninstallation instructions and more.

When using System Update to search for update packages, System Update will display search results in four severity categories, as explained above: Critical, Recommended, and Optional. For a description and example of each category severity level, see the following:

**Critical update packages**  are considered mandatory for the system to function properly. Failure to install these packages could result in data loss, system malfunction, or hardware failure. The administrator can choose to have critical updates downloaded and installed automatically on a scheduled basis. A critical package can be, for example:

>- A hard disk drive firmware update that if not applied could result in hard disk drive failure.
>- A BIOS upgrade that if not applied will result in system lags.
>- A software patch to an application that if not applied could result in data loss a system.

**Recommended update packages**  are packages recommended by Lenovo to ensure the system working at optimal performance. This severity level should be the default for most drivers. A recommended package can be, for example:

>- A video driver that corrects an issue that may cause blue screen issues.
>- A BIOS update that contains minor fixes that may impact a small group of customers.
>- A power management driver that will allow a mobile system to get the most out of its battery life.

**Optional update packages**  will improve the computing experience but are not necessary. An optional package can be, for example:

>- An application or utility that is not needed for the system to operate but provides benefit if it is installed.
>- Any BIOS or driver upgrade that has been updated only to support newer systems and contains no fixes.

!!! note
	Some of updates may depend on certain Window components. Ensure that your Windows operating system is up to date by running Windows Update.

Once all the updates desired have been selected, press **Next**. A review of the updates selected will be displayed. This will also provide a second chance to select updates to defer installation or deselect a package before they are downloaded and installed on the machine. Once the &quot;Download&quot; button is clicked, if any of the packages require a reboot after installation, a message box will appear letting the user know which package(s) requires it. Wait for the machine to reboot and finish the installation before doing anything else. Do not manually shut off the machine or put it into sleep mode during this time.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-6.png)

_Figure 3-6. Reviewing Updates before downloading packages._

_![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-7.png)_

_Figure 3-7. Certain update packages require reboot before installation is complete. Do not manually shut off the machine at this time._

### 2. Install Deferred Updates

When selecting update packages to download, instead of installing them immediately, the user can defer the installation for a more convenient time. All the deferred updates will be stored in the &quot;Install deferred updates&quot; tab. To defer an update, the user will check the defer installation checkbox package in the &quot;Get new updates&quot; section. Make sure that each of the update packages have been expanded to check the &quot;defer installation&quot; checkbox.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-8.png)

_Figure 3-8. How to Defer an Update Package from Installing (Download Only)._

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-9.png)

_Figure 3-9. Installing Deferred Update Packages._

### 3. Scheduling Updates

System Update provides an option to schedule an automatic search for new updates on a weekly basis. The user can download and install updates automatically or receive notifications when updates are available.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-10.png)

_Figure 3-10. Scheduling Updates for installation._

**Configuring Automatic Search for Updates**

When configuring System Update to search for new updates automatically on a scheduled basis, the following options are available:

- **Schedule:**  Users can enable an automatic check for updates to occur weekly. The time is randomized. The package types can be filtered by severity with the possible choices of "Critical" or "Critical updates and recommended drivers". The day of the week can also be selected.
- **Notification:**  Users can configure the application to automatically download and install the updates or to notify them when updates are available, but not download or install them. If the option to automatically download and install the updates is chosen, the user can choose whether or not to include updates that would restart the system after being notified.

**Configuring the Notification Option for an Automatic Search**

If performing an automatic search, it is best practice to configure the application with one of the following notification options for critical, recommended, and optional updates:

- Provides notification when new updates are found so that the user can manually initiate the download and installation.
- Downloads and installs the new updates and provides notification when completed.
- Automatically downloads updates and notifies the user when the updates are ready to install.

The notification is in form of a toast message from the system tray of the Windows Task Bar.

If the application icon is right-clicked, two options are available:  **Launch**  and **Exit**. Selecting  **Launch**  will start System Update and display the new updates. Selecting  **Exit**  will remove the application icon and will no longer notify the user when new updates are found until the next scheduled search for new updates.

**Scheduling Automatic Searching for Downloading and Installing New Updates**

System Update can be configured to automatically search for, download, and install new updates available to system on a specified schedule. New updates will be found and automatically downloaded and installed to the system. When the installation is completed, the user will be notified with a toast message from the application icon in the notification area. If the balloon tooltip is clicked, System Update will be launched and show the updates that were installed and the results. System Update will also launch by double-clicking the application icon.

The user can right-click and select  **Launch**  or **Exit**. Selecting  **Launch**  will launch System Update and display the results screen. Selecting **Exit** will remove the application icon and will no longer notify the user when new updates were installed until the next scheduled search for new updates.

**Working with Updates that Force Reboot**

When installing multiple updates and one of the updates forces a reboot, System Update will automatically continue the installation of the next update after the reboot.

### 4. View Installation History

The history of updates, that were downloaded and installed on each system, are available to view. For each update, the results of the download and installation are noted as either successful or failed. This section will display a list of the downloaded and installed update packages in order of the Name, Version, Date, and Status.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-11.png)

_Figure 3-11. Systems Update View Installation History._

### 5. Restore Hidden Updates

Updates can be hidden, which means those specific updates will not be displayed as applicable in the future. The user can hide specific versions of an update. One or more updates can be &quot;hidden&quot;, so they don&#39;t show up in subsequent searches.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-12.png)

_Figure 3-12. How to hide update packages._

However, the hidden updates can be restored. Go to the &quot;Restore Hidden Updates&quot; tab for restoring the hidden updates. If the user wants to hide an update, they must do so in the &quot;Get new updates tab.&quot; For each of the update packages displayed for download, there is a dropdown arrow. When the arrow is clicked, and the package information is expanded, click the &quot;Do not show this update.&quot; By doing so, the update will be removed from the list of applicable updates in the &quot;Get new updates&quot; tab and moved to the &quot;Restore hidden updates&quot; tab. The hidden updates will be displayed in the same way they are in the &quot;Get new updates&quot; tab, by critical, recommended and optional updates.

_![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-13.png)_

_Figure 3-13. Systems Update, Restore Hidden Updates, function._

**Keyboard Shortcuts**

The following table provides the keyboard shortcuts for the main functions of System Update:

| **Function**   | **Shortcut**   |
| --- | --- |
| Get new updates  | CTRL+U  |
| Install deferred updates  | CTRL+D  |
| Schedule updates  | CTRL+S  |
| View installation history  | CTRL+H  |
| Restore hidden updates  | CTRL+R  |
| Close  | CTRL+E  |
| Context Help  | F1  |

_Table 3-1. System Update keyboard shortcuts_

## 3.2 Thin Installer

This section will cover how to work with Thin Installer. Although the program is most often used in a scripted and unattended scenario, it can also be executed to install updates manually which will be described in this section.

To use Thin Installer, either run the self-extracting installation package or copy the programs source files to the targeted machine. The default repository that Thin Installer will pull from will be a subfolder within the working directory of Thin Installer. A different repository location can be specified by command line or configured in the Thin Installer configuration file which will described later in this document. Use Update Retriever to create the repository source folder. By default, the program searches for updates in a subdirectory under the Thin Installer folder and expects each update to reside in its own subdirectory.

_![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-14.png)_

_Figure 3-14. Default repository._

### Running Thin Installer Manually

In the following scenario, the repository used is local on the target machine. Launch Thin Installer to search for applicable updates based on the machine type and OS.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-15.png)

_Figure 3-15. Launching Thin Installer to search for applicable updates._

Once the search for updates is completed, the application will either display a window with &quot;No packages found,&quot; meaning your system is up-to-date, or a list of applicable update packages.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-16.png)

_Figure 3-16. Applicable updates listed in Thin Installer._

When updates are found in Thin Installer, they are displayed in one of three categories: Critical, Recommended, and Optional. For more information on each update package, click the Expand all button or the expander next to each update. The user may select one, all, or none of the update packages to download. A review of the updates selected is displayed before proceeding with installation.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-17.png)

_Figure 3-17. Review installation packages._

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-18.png)

_Figure 3-18. Installing updates._

If a reboot is necessary to complete the installation of a package, the following window will be displayed. Select **OK** to proceed with installation.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-19.png)

_Figure 3-19. Thin Installer reboot message._

!!! note
	BIOS installations require user's attention to ensure the update is not interrupted. They cannot be deployed in an unattended mode. <br> 2. Thin Installer installs the updates that force a reboot or shut down after all other updates to reduce the number of reboots.

### Windows 7 and Later OS Considerations

Some updates that Thin Installer will install may automatically reboot or shut down the sysem. If there are multiple updates like this that are applicable, Thin Installer will attempt to configure the system to run Thin Installer again after the system is rebooted.

With considerations for Windows 7 and later operating systems, after you log in to the Windows desktop, the UAC might stop the program from continuing to install the remaining update packages. To install the remaining update packages, you need to manually click the **Windows has blocked some startup programs** message on the system tray and select **Run blocked program** to run Thin Installer.

!!! warning
	If the **Windows has blocked some startup programs** message does not display on the system tray, you will need to manually run Thin Installer, search for the remaining updates, and install them.

## 3.3 Update Retriever

### 3.3.1 Update Retriever First Time Setup

When launching Update Retriever the first time, some initial configuration items will need to be set. If launching Update Retriever for the first time, do the following:

   1. Launch Update Retriever.

	!!! note
		Update Retriever requires elevated privileges to run. Therefore, a UAC prompt may be displayed when launching the program.

   2. Choose between a **Local repository** or a **Lenovo cloud repository** by clicking the appropriate radio button. The **Local repository** option will host packages in a local directory or network share. The **Lenovo cloud repository** will host the actual packages on Lenovo&#39;s global Content Delivery Network and only the repository database and package descriptors will be stored in the local directory or network share. System Update, Commercial Vantage, and Thin Installer support the **Lenovo cloud repository** feature.

    !!! info
        The statement regarding Thin Installer not supporting the cloud repository feature will be removed in a future version of Update Retriever

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-20.png)

	_Figure 3-20. Update Retriever first time setup._

   3. Specify a repository folder and set the login information by doing the following:

	- Type or browse to an existing folder path to use as the share repository in the **Repository path** field. This can be a local folder path or a network share path.
	- Type a **User name** and **Password** for the share drive used as the network share repository in the user name and password fields.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-21.png)

	_Figure 3-21. Setting the repository path in Update Retriever, first time setup._

   4. Select a default license and status. The License can either be set to **Default** , **Display** , or **Do not display**. The status can either be set to **Test** or **Active**. If it is set to **Test** the packages will only be visible to clients configured to look for Test packages. This allows updates to be tested on a controlled set of devices before changing the status to Active so that all devices in the production environment can see them.

   5. An Advanced Option is available that allows the administrator to control how changes to local package descriptor XML files are handled. Normally Update Retriever will show packages in new search results if it detects that the XML descriptor file on Lenovo&#39;s servers is different than the file in the local repository. If this is not the desired behavior, check the box and the modified items will be recognized as the same updates and will not be offered for download in the search results.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-22.png)

	_Figure 3-22. Update default status and Advanced Options in Update Retriever first time setup._

!!! note
	After the initial settings are complete, the Welcome screen will not open the next time Update Retriever is launched. To change the repository path and update's default status, click Modify settings.

### 3.3.2 Searching for and Downloading Updates

After initial setup is complete, Update Retriever can be used to search for and download updates. The following will describe these steps.

1. In the **Get new updates** panel, click **Add**.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-23.png)

	_Figure 3-23. Getting new updates with Update Retriever, first time setup._

2. In the **Manage systems list** window, set the triplet information for a system by doing the following:
	- a) Type the applicable machine type. You can find the machine type on the bottom of a notebook computer or on the rear of a desktop computer. You can also find it by pressing Windows key + R and typing &quot;msinfo32&quot; then OK. Look at the system name, and the first 4 numbers and letters are the machine type. For example, 20HQ.
	- b) Enter a description, which will appear as the name of the machine, like ThinkPad T490. This field is optional.
	- c) Select the applicable operating system.
	- d) Click **Add** and then click **Save**. You can do this for multiple model + operating system combinations. Once the systems list is saved, check the box next to the systems to search for and click **Next**. Update Retriever will connect to the Lenovo CDN and search for updates applicable to the selected systems.
	- e) **Accept** the License agreement to continue. There is a check box available to agree to all future license notices to avoid this dialog for future searches.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-24.png)

	_Figure 3-24. Searching for updates._

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-25.png)

	_Figure 3-25. Accept the License agreement._

3. On the next screen, select the check box next to the applicable updates to be downloaded. The results can be filtered using the filters available above the list of updates.

	!!! note
		If you want to select all the update packages found, simply select the **Select all** check box.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-26.png)

	_Figure 3-26. Selecting update packages from search results._

	!!! note
		There is also an option to Hide updates in the Search Results. If there are some updates you will never need, you can choose to hide them so they do not appear in the Search Results. Either select to hide just the specific version being shown or this version and all future versions. Hidden updates can be restored using the **Restore hidden updates** selection under **Options**.

4. Click **Next**. A confirmation summary of the selected updates per system is shown. Click **Finish** to begin downloading the selected updates. Update Retriever will place the updates in the repository folder and update the database file that associates the updates to the systems they support. A completion summary will be displayed at the end.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-27.png)

	_Figure 3-27. Completed download list displayed._

### 3.3.3 Manage Repository

To view updates that have been downloaded into the local repository, click on the **Manage repository** tab and then select **Update view**.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-28.png)

_Figure 3-28. Viewing updates and managing the repository in Update Retriever._

The updates displayed can be by filtered by Operating system, System, Severity, Status and Type. In the Update view panel, the administrator can sort the list of updates by Update ID, Title, Type, Version, Reboot type, Severity, License, or Status by clicking the column header. Double-clicking the Update ID of an item will display the details from the package descriptor. It is recommended that the values displayed are not altered unless directed to do so by Lenovo support personnel. Altering any of the values will invalidate the signature on the package descriptor file which will cause System Update to no longer apply the update. Only Thin Installer can work with modified updates.

#### Modify an Update Package

The Administrator can modify the reboot type, severity, license, and status of one or more update packages in the repository. Select one or more packages by clicking the check box next to the item.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-29.png)

_Figure 3-29. Modifying updates._

The following table provides the values that an administrator can set for the selected update package(s).

|     Option         |     Possible Value                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|--------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
|     Reboot type    |     • (Blank)<br />      • No reboot: reboot type 0<br />      • Forces a reboot: reboot type 1<br />      • Reserved<br />      • Requires a reboot: reboot type 3<br />      • Shut down: reboot type 4<br />     • Forced reboot delayed:    reboot type 5<br /><br />     **NOTE:**  Changing this value   does not change how the update is designed to function.  This only alters the flag used to inform   System Update or Thin Installer how the package will function. For example,   changing an update that automatically reboots the system to reboot type 3   will not prevent it from rebooting the system.    |
|     Severity       |     • (Blank)<br />      • Critical<br />      • Recommended<br />      • Optional                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
|     License        |     • (Blank)<br />      • Display<br />      • No display                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|     Status         |     • (Blank)<br /> • Active<br /> • Archive<br /> • Test<br /> • Hidden<br /><br />      **Attention:** By default, System Update and Thin Installer will only see packages marked as **Active**. The default value was set in the first-time setup of Update Retriever. You can change the default value by using the **Modify settings** option in the Update Retriever navigation pane. <br><br>Selecting **Hidden** will hide the selected update for the **Updates view** and can be restored by using the **Restore hidden updates** selection under **Options**. <br><br>Selecting **Archive** will leave the update in the view; however, the update will not be offered to any clients. |

_Table 3-2. Configurable values for an update package_

#### Create Report

Update Retriever can generate a report, which is a list of active updates, archived updates, hidden updates, and test updates. This list is saved in a TXT file that you can use in most spreadsheet applications.

To create a report, do the following:

1. Click **Manage repository** in the left pane. The menu expands to show several options for managing the repository.
2. Click **Create report** in the left pane. The Create report window opens.
3. Type a directory to save the TXT file or click **Browse** to find a location.
4. Type a name for the TXT file.
5. Select the separator type.
6. Select the types of updates to include in the report:

	- **Active updates** : These are updates that have been downloaded to the repository and are available for deployment.
	- **Archived updates** : These are updates that have been downloaded and archived to a separate location. These updates cannot be deployed until they are restored to the active updates list.
	- **Hidden updates** : These are updates that have not been downloaded and are hidden from the list of available updates when searching the Lenovo(R) Help Center.
	- **Test updates** : These are updates that have been downloaded and for test.

	!!! note
		The report does not contain available updates that have not been downloaded.

7. Select the columns that you want to include the related information in the report:

	- **Update ID**
	- **Title**
	- **Version**
	- **Reboot type**
	- **Severity**
	- **License**
	- **Status**
	- **System**
	- **Silent install command**
	- **Extract command**

8. Click **Create Report**. The Report created successfully window opens. Click **View** to view the file. You also can navigate to the folder where you saved the TXT file and open the file in the folder.

	!!! note
		If the file name already exists in the designated folder, a warning window will be displayed. Click **Yes** to overwrite the old report or click **No** to decline overwriting.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-30.png)

	_Figure 3-30. Create report with Update Retriever._

#### Import Updates

!!! info
    This feature has been deprecated in version **5.08.02.33**

Update Retriever enables you to import updates to your repository from a local location or network share. Once the updates are in the repository, you can assign them to specific systems and deploy them to multiple computers.

!!! note
	Update packages cannot be deployed until they are assigned to one or more systems. For more information, see section 3.3.3.3.1 Assigning Systems.

To import updates, do the following:

   1. Click **Manage repository** in the left pane. The menu expands to show several options for managing the repository.
   2. Click **Import updates** in the left pane. The Import updates window opens.
   3. Click **Browse** to navigate to the folder that stores your updates, and then click **OK**.

	!!! note
		Each update must be in its own subfolder. If you are importing one update, specify the directory that contains that update. If you are importing multiple updates, put each update subfolder under the same parent directory and specify that parent directory.

   4. Select **Search subfolders** if you want Update Retriever to search through all subfolders located in the specified directory.
   5. Click **Next**. Update Retriever searches the folder that you specified for updates. When the search completes, the Review updates to import window opens. You can double-click the title of an update to view its additional details.
   6. Select updates that you want to import or select **Select all** to include all updates displayed. Then click **Import**. The import process begins. When the import process completes, the Import completed window opens and the updates that you have selected are imported into your repository folder.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-31.png)

_Figure 3-31. Import Updates with Update Retriever_

#### Assigning Systems

When updates are imported the will initially have no supported systems associated with them. You can assign and unassign systems to updates in the repository, where system stands for the combination of machine type and operating system. When assigning systems to updates, you can choose one or more systems from the available System/Operating system list.

To assign or unassign systems to updates, do the following:

   1. Click **Manage repository & Update view** in the left pane to view the updates.
   2. Select one or more updates in the list that have been imported. The **Assign systems** button is activated.
   3. Click **Assign systems**. The Assign system window opens, displaying the updates you selected and the System/Operating system list. By default, all the updates are selected and the checkbox before the System/Operating system list is in one of the following statuses:
     - Selected: Indicates that the system is assigned to all the updates selected
     - Deselected: Indicates that the system is not assigned to all the updates selected
     - Intermediate: Indicates that the system is assigned to some of the updates selected
   4. Select systems from the System/Operating system list to assign systems to the updates selected, or clear systems to unassign them to the updates selected. You can add new systems to the list by clicking **Add new system**.
   5. Click **Save**. The updates are assigned to the systems selected.

!!! note
	There is an icon next to the **Update ID** for each update that is originated from the Lenovo Help Center Web site. You cannot modify the systems assigned to these updates. You can modify the systems assigned to custom updates that were created or imported by the user.

#### Export Updates

Update Retriever enables you to export driver updates in your repository to a designated target folder. During the export process, Update Retriever will extract each driver update to a subfolder. Then, these extracted driver updates can be easily imported into common operating system deployment tools such as Microsoft System Center Configuration Manager or LANDesk Management Suite for easy integration and deployment.

!!! note
	Before exporting updates, make sure you have downloaded the relevant driver updates for target systems from the Lenovo Help Center to your repository.

To export the driver updates, do the following:

   1. Click **Manage repository** in the left pane of the main window. The menu expands to show several options for managing the repository.
   2. Click **Export updates** to begin the process of exporting driver updates in the right pane of the main window.
   3. Type the directory of the target folder in the **Folder** field or click **Browse** to locate the target folder. You can create the target folder if it does not exist.
   4. Click **Next**. Select a system from the Machine type/Operating system/Language list, and then select the driver update(s) assigned to the system you selected or select **Select all** to include all the updates displayed.
   5. Repeat step 4 for other systems if desired.
   6. Click **Finish**. The export starts, and you can view the export progress in the right pane.
   7. When the export completes, the results and the location link of the target folder are displayed. You can click the results link to view the export history and click the location link to open the target folder that contains the extracted driver updates.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-32.png)

_Figure 3-32. Export Updates with Update Retriever._

!!! note
	When exporting updates from a repository located on the network instead of a repository on a local drive, an Open File - Security Warning dialog will be displayed for each update that is to be extracted during the export process. To prevent the dialog from being displayed, you can change the Local intranet settings in the Microsoft Internet Explorer Web browser, either temporarily or permanently as you need.

To change the Local intranet settings in the Microsoft Internet Explorer Web browser, do the following:

   1. Open the Microsoft Internet Explorer Web browser.
   2. Click **Tools** and select **Internet Options**.
   3. Click the **Security** tab.
   4. Click the **Local intranet** icon and click **Sites**.
   5. The Local intranet dialog box is displayed. If the **Automatically detect intranet network** check box is selected, clear it and then select **Include all network paths (UNCs)**. It is recommended that you also select **Include all local (intranet) sites not listed in other zones** and **Include all sites that bypass the proxy server** unless otherwise instructed by your system administrator.
   6. Click **OK** to save the Local intranet settings.
   7. On the **Security** tab, click **Default level** to view the default security level. If the security level is set to **Medium-low** or **Low** , no other changes are necessary. Otherwise, go to step 8.
   8. If the security level is set to **High, Medium-high, Medium,** or **Custom** , change the security level to **Medium-low** (the default setting) by moving the security level slider. However, you can keep the security level higher than **Medium-low** yet still be able to prevent the Open File - Security Warning dialog from being displayed by customizing the security setting. To customize the security setting, do the following:
     - a) Click **Custom level**. The Security Settings-Internet Zone dialog is displayed.
     - b) Locate the **Launching applications and unsafe files** option.
     - c) Select **Enable**.
     - d) Click **OK**. A dialog box for confirmation is displayed.
     - e) Click **Yes** to confirm your selection.
     - f) Click **OK** to exit the Internet Options dialog box.

### 3.3.4 Manage Driver Packs

This feature allows an admin to create a collection of the hardware drivers for a specified model in a format that can be imported into Microsoft System Center Configuration Manager (SCCM) or Microsoft Deployment Toolkit (MDT) to support OS deployment.

This feature displays a list of only hardware drivers for a specified model based on what is currently available on the Lenovo Support web site instead of basing search results on content ready for use with System Update or Thin Installer.

Follow these steps to use the Manage Driver Pack option in Update Retriever:

   1. Click the Manage Driver packs tab, in Update Retriever.
   2. Specify a parent folder to hold &quot;driver packs&quot; generated by Update Retriever. Select a specific model using brand, series, model, and operating system values that are available in the drop-down lists.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-33.png)

	_Figure 3-33. Managing Driver Packs in Update Retriever._

   3. Select specific drivers. Where available, the specific build(s) of Windows 10 / 11 supported drivers are listed in the driver title.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-34.png)

	_Figure 3-34. Managing Driver Pack selections in Update Retriever._

   4. Update Retriever downloads and extracts selected drivers. As Update Retriever executes each package to extract the files, users may notice application focus change. It is recommended to let Update Retriever finish before doing other work.

	![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-35.png)

	_Figure 3-35. Downloading and extracting selected Drivers in Update Retriever._

A collection of source files for the driver packages are generated, along with a CSV report text file.

!!! note
	This new feature is intended to support the OS deployment process of new drivers which only works with INF installable hardware drivers. Application updates and firmware updates cannot be included. The feature only supports ThinkPad, ThinkCentre and ThinkStation PCs.

### 3.3.5 Scheduling the Search for Updates

The administrator can configure Update Retriever to search for new updates automatically on a scheduled basis. The administrator is notified depending on how Update Retriever was configured, in the form of an e-mail or a balloon tooltip from the application icon in the notification area.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-36.png)

_Figure 3-36. Scheduling updates in Update Retriever._

The administrator can configure Update Retriever to search for new updates automatically on a scheduled basis by checking the box to **Enable automatic search for new updates**. The following options are available:

- **Schedule:**

    - **Select update type:** Choose between Critical, Recommended or Critical &amp; Recommended.
    - **Frequency:** Choose to search for new updates weekly or monthly.
    - **Run on:** For weekly checks, a day of the week must be selected. For monthly checks, a date in the month must be selected.
    - **Run at:** Specify the time of day the search should occur.

- **When to notify me:** Two options are available; click the radio button to select the appropriate one.

    - Notify if there are new updates available but do not download them
    - Download the new updates and notify when complete

- **How to notify me:** Update Retriever can notify by sending an email or by popping up a toast message from the application icon in the system tray. If the email option is selected, click the Propertiesbutton to provide additional details. The email option may only work with certain configurations. The e-mail notification includes the date and time of the check, the number of packages found, and a list of updates.

### 3.3.6 Restore Hidden Updates

Administrators can hide updates, which means that the hidden updates including the current and future versions will not be displayed as relevant (from the Lenovo Help Center) in the future. There are two options:

- Hide just a specific version of an update
- Hide all future versions of an update

If in the future, if the administrator wants to have those updates displayed again, they can unhide them. To unhide an update package, do the following:

   1. Go to the Restore hidden updates menu tab.
   2. Check the box next to the update package(s) to unhide it or check the select all updates checkbox to unhide all the update packages in the list.
   3. There may be multiple models that use the same package ID. If the administrator only wants to unhide a package for a certain model type, they need to double click on the package ID and select from the system model type displayed. Once the model type is selected, click OK.

	 ![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-37.png)

	_Figure 3-37. Unhide specific packages in Update Retriever._

   4. Click the **Unhide** button in the bottom right corner of the tool. The update package will then be displayed in the **Update View**.

### 3.3.7 Modify Settings

The **Modify settings** option allows the administrator to make changes to any of the settings that were configured during the first-time setup process. For details on the settings that can be configured, please refer to section 3.3.1 **Update Retriever First Time Setup**.

### 3.3.8 Viewing History

The **View history** function enables you to view the detailed information about the download history and export history.

![image](https://cdrt.github.io/mk_docs/img/guides/su/img3-38.png)

_Figure 3-38. View download history in Update Retriever._

The download history provides detailed information about all updates that the Update Retriever has downloaded to the update repository, as well as updates that are hidden.

To view the download history, do the following:

1. Click **View history** in the left pane of the main window. The View History window opens.
2. Click the View download history link to view the following information:

	- **Title:** The title of the update.
	- **Version:** The version number of the update.
	- **Name:** The name of the update.
	- **Downloaded Time:** The date and time when the update was downloaded (not displayed for current results).

The export history provides detailed information about updates that have been exported to the target folder.

To view the export history, do the following:

1. Click **View history** in the left pane of the main window.
2. Click the **View export** history link to view the following information:

	- **Exported Time:** The date and time when the update was exported.
	- **Status:** Successful or Failed (followed by the cause of failure).
	- **Source Location:** The directory where the driver update is saved in the repository.
	- **Target Location:** The directory where the exported driver update is saved.
	- **Subfolder Name:** The name of subfolder where the exported driver update is saved. For the driver update that fails to be exported, the subfolder name just indicates its title and version number.
