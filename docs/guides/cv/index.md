# Commercial Vantage

[Jump to What's New](#whats-new)

**Commercial Vantage** simplifies the PC experience, making it easy for users to personalize settings and automate updates. The following software components are required to take full advantage of the Commercial Vantage features:

- **The Application: Commercial Vantage**

    This UWP application provides the user interface. You can install the application from the Microsoft Store, or you can side-load it using the MSIXBUNDLE files that we provide. Note that any previous version of Lenovo Vantage, Lenovo Companion, or Lenovo Settings must be uninstalled before installing Commercial Vantage.

- **The Add-ins**

    With a UWP application, it is necessary to have additional middleware components that can perform various operations on the system such as performing diagnostics or updating drivers and firmware. These add-ins are automatically updated by Lenovo to fix bugs and provide new features.

- **Lenovo Vantage Service**

    This software component helps to orchestrate the functionality between the UI and the Add-ins. It will also ensure that the application and add-ins are kept up to date and in working order.

- **SU Helper**

    SUHelper.exe is a companion utility introduced in 2024 that works in conjunction with the System Update Addin of Commercial Vantage. This utility finally brings a command-line interface to Commercial Vantage for controlling the System Update process. For more information, please review the [SUHelper Reference](https://docs.lenovocdrt.com/guides/cv/suhelper).  It is also provided in the Enterprise package and is an optional install that can be enabled in the setup script.

The latest version of the Enterprise package for sideloading can always be found at [https://support.lenovo.com/solutions/hf003321-lenovo-vantage-for-enterprise](https://support.lenovo.com/solutions/hf003321-lenovo-vantage-for-enterprise). Additional resources such as deployment guide, ADMX template, install and uninstall scripts are also included.

## What's New

### v10.2407.66.0 - August 2024

**Main Application**

- Improved the Power page by adding Power Controller and Display Brightness Control
- Changed section name from Power Smart settings to System Total Power Management
- Improved the description of Intelligent Cooling for new products shipping in 2024
- Add a tip for Windows 11 touch screen devices for the Clean My Device feature

**System Update Feature**

- **Separate filtering policies for Manual versus Auto Update**:  Previously, the policies for System Update provided one set of filtering options for package types and severity levels and these applied to both the Auto Update scenario and the manual Check for Updates. Now it is possible to specify filtering for the manual Check for Updates scenario separately from the Auto Update scenario. This policy is added under Administrative Templates - Commercial Vantage - Device - System Update - Auto Update.  The policy name is **Configure Auto System Update**. If this policy is not configured, then the **Configure System Update** policy in the System Update folder will take affect if configured.

- **Improved handling of some Reboot Type 3 (reboot required) updates**:  Previously, there were some updates that would cause Commercial Vantage to display a failure status after installing; however, the updates would be installed properly after a simple reboot. Now, Commercial Vantage will display a status of "Pending restart" instead. There were also some Reboot Type 3 updates that were successfully installed without the reboot; however, Commercial Vantage would still present a reboot prompt. Now, if no other updates that were installed require a reboot, there will be no reboot prompt presented.

- **Improved messaging when updates have been installed that requires Commercial Vantage to force a reboot (Reboot type 5)**:  Previously, after installing such updates a dialog would be presented stating that the system will need to reboot with Yes and No buttons. Clicking Yes would allow the system to go ahead and reboot.  Clicking No would close the dialog and the system would automatically reboot within 5 minutes. Now, a more clear message is presented stating the time at which the system will reboot, with a single button that go ahead and proceed with the reboot without waiting. This allows users time to save their work and then initiate the reboot if they are ready before the time expires.

- **Remove XML Schema Check**:  Previously, the System Update Add-in would check each XML Package Descriptor for each update against an XML Schema. Since the System Update Add-in is already validating the digital signature of the XML file, this schema check is redundant and has been removed to improve performance.

**New Group Policies**

- **Device - System Update - Auto Update - Configure Auto System Update**: Separate filter for Manual vs Auto Update. See above.
