# SU Helper Reference

## Overview

The SU Helper utility is a companion to Lenovo Commercial Vantage that provides command-line control over the System Update process. This utility can be leveraged directly in a terminal window on a device or by sending a script containing the command line from a systems management solutions such as Configuration Manager or Intune. This reference guide will document the command line parameters and usage of this utility.

## Installation

SUHelper is provided by its own installer and is not included directly with Lenovo Commercial Vantage. Therefore, only customers that choose to deploy SUHelper to their devices will have it. The installer can be found in the [Lenovo Commercial Vanatage Application and Deployment Guide for Large Enterprise](https://support.lenovo.com/us/en/solutions/hf003321)

The utility can be installed on devices silently using the following command:

```[installer filename] /VERYSILENT```

The utility is designed to be installed in a fixed, secure location under Program Files so that it cannot be altered without Administrator privileges.

The utility can be uninstalled with the following command:

```C:\Program Files\Lenovo\SUHelper\unins000.exe /VERYSILENT```

## Intended Usage Scenarios

SUHelper is designed to support a few scenarios to provide IT administrators more control over the updating of their devices.

Trigger Auto Update
:  In this scenario, there may be cases where an admin wants to trigger an Auto Update session without waiting for the normal schedule to be triggered.

Trigger Auto Update for filtered updates
:  In this scenario, the admin may want to trigger an update session that only installs certain package types, reboot types or even specific updates specified by their package IDs.
    An example where this would be useful is if you leverage Windows Update for Business for driver and firmware updates; however, there is a particular update that is not offered through Windows Update which you need to have deployed immediately. Commercial Vantage can be deployed on devices with Auto Update disabled and SUHelper can be used on-demand to install specific updates just be sending the command to the clients.

Exclude an update from being installed
:  In some cases, a customer may find that a particular update has a compatibility issue with their environment when they apply the update to a set of test devices. To prevent that update from being applied to all production devices, SUHelper can be used to add the specific package ID(s) to an "exclude" list on the production devices. This will cause the specified update to be ignored when an Auto Update or a Manual Update is executed.

## Command-line Reference

SUHELPER [-autoupdate] [-include [string]] [-exclude [string]] [-packagetype [string]] [-reboottype [string]] [-allowdefer] [-help]

### -autoupdate

Required parameter. Triggers an Auto Update process by the System Update Addin. Additional parameters may be passed which will filter the updates to be applied. If used alone, any group policies that are set to filter the System Updates will be applied. Otherwise, the command line filters will take priority over the group policies.

### -include [string]

Optional. Specifies list of one or more package IDs, separated by comma (","). When this parameter is specified, these are the only packages that should be installed if they are applicable to this device.

You can easily find the package IDs for updates by either using Update Retriever or the [Driver & Software Matrix for IT Admins](https://download.lenovo.com/cdrt/tools/drivermatrix/dm_2.html). The latter has been updated to provide checkboxes in the list of search results so that one or more updates can be selected, then clicking the **Copy Package ID(s)** button will copy a string to the clipboard consisting of the selected Package IDs separated by a comma. This string can be used after the -include parameter in the command line.

### -exclude [string]

Optional. Specifies list of one or more package IDs, separated by comma (","). When this parameter is specified these updates will NOT be installed even if they are applicable. The **-include** and **-exclude** parameters cannot be used in the same command. This would trigger an error return code for bad parameters. Once a package ID has been added to the database file, subsequent scheduled auto update sessions of the System Update Addin will NOT install this update either. If a later command is executed with the **-include** parameter specifying a package ID that is in the exclude list, the package ID will be removed from the exclude list and will be installed if applicable.

### -packagetype [string]

Optional. Specifies a list of one or more numbers, separated by comma (","). When this parameter is specified, only updates that correspond to the specified package type number will be installed if applicable. Package type numbers must be from the following list:

    {0} : Others
    {1} : Application
    {2} : Driver
    {3} : Bios
    {4} : Firmware

### -reboottype [string]

Optional. Specifies a list of one or more numbers, separated by comma (","). When this parameter is specified, only updates that have the corresponding reboot type will be installed if applicable. Reboot type numbers must be from the following list:

    {0} : No reboot required
    {1} : Forced reboot by the update itself
    {3} : Requires reboot
    {4} : Forces shutdown by update itself
    {5} : Delayed forced reboot within 5 minutes

### -allowdefer

Optional. When this parameter is specified, then any group policy set allowing the end-user to defer the updates will be applied. Otherwise, the default operation is that the applicable updates will be installed without an option for the user to defer updating.

### -help or /?

Optional.  Displays this parameter reference text.

## Possible return codes

The following list shows the possible return codes from SUHelper.exe.

!!! note
    Keep in mind that the return code only represents the result of calling suhelper.exe and does not represent the result of the update session that is triggered.  The results of the udpate session can be found in the Lenovo_Updates WMI class.

0 = Success

1 = Error in parameters

2 = System Update Addin is busy

3 = Unexpected error occurred

## Examples of command line

    suhelper.exe -autoupdate -include n3uj12w, n3jcd08w
    suhelper.exe -autoupdate -exclude n3jrg03w
    suhelper.exe -autoupdate -packagetype 2,3 -reboottype 0,3 -allowdefer
    suhelper.exe -help

## Considerations

The **-packagetype** and **-reboottype** parameters can both be specified in the same command and will be **ANDed** together so the resulting set of updates applied will be the intersection of both filters.

The **-include** and **-exclude** parameters cannot be combined with **-packagetype** or **-reboottype** parameters. They should be specified by themselves on the command line after the **-autoupdate** parameter.

If a command line is executed on a device where the System Update Addin is already running an update session, then the command will terminate with a return code that specifies the System Update Addin is in use.

### How Commercial Vantage Policies apply

If the System Update policies for filtering updates have been configured, if you call `suhelper.exe -autoupdate` without any other parameters, the filtering policies will take effect.

If the System Update policies for filtering updates have NOT been configured, if you call `suhelper.exe -autoupdate` without any other parameters, there will be no filtering applied and all possible updates will be installed.

If the suhelper.exe is called with either the **-packagetype** or **-reboottype** paramters, any filtering policies configured on the device will be ignored. In other words, calling the suhelper.exe directly will take priority over the policies.
