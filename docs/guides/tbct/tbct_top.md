# Think BIOS Config Tool

Think BIOS Config Tool from Lenovo is a free, lightweight HTML Application (HTA) tool designed to let IT view and update BIOS settings directly or remotely from a simple Graphic User Interface (GUI), allowing for the automation of BIOS configurations with a simple initialization file (INI).

## Why Think BIOS Config Tool?

- Build a consistent BIOS configuration across a diverse hardware environment.
- Reduce time required to ensure systems are deployed with the correct initial BIOS configuration.
- Consolidate control by centralizing visibility and management of the device BIOS.
- Eliminate the need for time-consuming, machine-by-machine BIOS configuration.
- Give IT a common GUI tool to consolidate configuration of any ThinkPad®, ThinkCentre®, or ThinkStation® PC

## It's so easy to get started

- Think BIOS Config Tool can be launched on a local machine. BIOS settings can be seen and updated.
- These changes can be saved to an .INI file.
- This .INI can then be passed by command line parameter to Think BIOS Config Tool by leveraging common industry solutions for software deployment such as Microsoft Endpoint Manager (Configuration Manager and Intune).
- Works in both standard and Unified Extensible Firmware Interface (UEFI) mode.

---

>Notice: This script is shared AS IS with no implied warranty or support.  If you have questions or suggestions please post a comment to the [Enterprise Client Management Forum](http://forums.lenovo.com/t5/Enterprise-Management-Board/bd-p/sa01_eg)

**Download link**

[https://download.lenovo.com/cdrt/tools/tbct141.zip](https://download.lenovo.com/cdrt/tools/tbct141.zip) 

---

??? note "Changes:"
    ```text
    1.40: Support complex passwords on ThinkPad

    1.35: Fix for handling 'show only' settings.

    1.34: Fix for condition to prevent popup if passwords don't match. Return Code 3 will represent passwords not matching.

    1.33: Fix for setting defaults via GUI and command line when password is present

    1.32: Fix for password validity check showing during unattended deployment; Fix for reserved WMI settings

    1.31: Updated to handle new ThinkCentre models

    1.30: Added command line option to disable log file creation

    1.28: Added password validity check; Added support for creating a System Deployment Mode password file

    1.26: Fixed issue applying config file to machine using plain text SVP

    1.25: Fixed bug on no supervisor password applying the first setting from a file.

    1.22: Logging. Automatic detection of the supervisor password

    1.21:  Fixed issue when running by command line and a duplicate setting is reported from BIOS

    1.20:  Bug fix for not showing settings correctly when connecting remotely from laptop to a desktop

    1.19:  Bug fix on alarm times; bug fix on password div not disappearing; removed auto-generated key and added button to generate a key; updated picture in guide

    1.17:  Bug fix on boot order export when the changes haven't been saved

    v1.16:  Added support to change the supervisor password. Added support to create a supervisor password change file

    1.15:  Fixed the export of Alarm Time and Date

    1.14:  Improved handling of boot order on certain ThinkStation/ThinkCentre models; added version to title

    1.11:  Added command line option to change back to default settings - Eg. ThinkBiosConfig.hta “default=true” 
    ```

</details>