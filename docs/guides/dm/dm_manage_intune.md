# Managing Dock Manager with Intune

This section will present the policies found in the Dock Manager ADMX template, along with the OMA-URIs which can be used to configure the application on Intune managed clients.

!!! note ""
    If new policies have been introduced, you will need to ingest the updated ADMX file contained in the Commercial Vantage zip.

!!! note ""
    Introduced in the [2208](https://learn.microsoft.com/mem/intune/fundamentals/whats-new-archive#import-create-and-manage-custom-admx-and-adml-administrative-templates) Intune Service release, you can import, create, and manage custom ADMX and ADML administrative templates.

## ADMX Ingestion

Sign in to the Microsoft Intune [admin center](https://intune.microsoft.com)

Navigate to **Devices** > **Windows** > **Configuration Profiles**. Click **Create**

- Select **New Policy** > **Windows 10 and later** for the platform.
- Select **Templates** for **Profile Type** and choose **Custom** from the list and click **Create**

Enter the required information for the new profile, for example:

- **Name**: Lenovo Dock Manager Configuration

- **Description**: (Optional)

On the **Configuration Settings** screen, click **Add** and enter the following:

- **Name**: Dock Manager ADMX Ingest

- **Description**: (Optional)

- **OMA-URI**: ./Device/Vendor/MSFT/Policy/ConfigOperations/ADMXInstall/DockManager/Policy/DockManager

- **Data Type**: String

- **Value**: Copy the contents of the Dock Manager ADMX file into this field

!!! note ""
    The **Group Policy Template File** that contains the ADMX can be found under the Dock Manager section on [Lenovo Tools for Administrators](https://support.lenovo.com/solutions/ht037099) page.

## Command

If this setting is enabled, it will allow you to send supported commands to Dock Manager.

Supported commands:
1: Checking and updating software for the Dock Manager.

Note that if you want to send the same command as the previous one, just need to update the time in the second text box.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Command/CommandString
```

Values:

```xml
<enabled/>
<data id="CommandString_Prompt" value="1"/>
<data id="SendTime_Prompt" value="2024-06-01 03:12:05Z"/>
```

```xml
<disabled/>
```

## General

### Ask Before Firmware Update

This setting will configure to enable/disable a prompt to the user before executing the firmware update.

If this setting is enabled, prompt will ask the user to proceed executing update firmware.

If this setting is disabled, prompt will not be shown and will directly proceed executing firmware update.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/AskBeforeFirmwareUpdate
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Auto Update

This setting will configure whether to update Dock Manager software automatically.

If this setting is enabled, Dock Manager will check new version and update automatically.

If this setting is disabled, Dock Manager will not check and update software automatically.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/AutoUpdate
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Enable Notifications

This setting will configure whether to enable notifications during firmware download and update.

If this setting is enabled, notification will be enabled and shown.

If this setting is disabled, notification will not be shown.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/EnableNotifications
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Hide Update Software Button

This setting will configure whether to show update software button in the main window.

If this setting is enabled, will hide update software button in the main window.

If this setting is disabled, will show update software button in the main window.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/HideUpdateSoftwareButton
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Log File Age to Cleanup

If this setting is enabled, it will configure the number of elapsed days before deleting the outdated log files based on the number of days inputted inside the textbox in the options panel.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/LogfileAgeToCleanup
```

Values:

```xml
<enabled/>
<data id="LogfileAgeToCleanup_Prompt" value="30"/>
```

```xml
<disabled/>
```

### Log File Max Size

If this setting is enabled, it will specify the log max file size in kb before creating a new log file based on the inputted value inside the textbox in the options panel.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/LogfileMaxSize
```

Values:

```xml
<enabled/>
<data id="LogfileMaxSize_Prompt" value="1024"/>
```

```xml
<disabled/>
```

### MAC Address Clone Enabled

This setting will configure whether to enable mac address clone function.

If this setting is enabled, Dock Manager will turn on mac address clone function.

If this setting is disabled, Dock Manager will turn off mac address clone function.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/MacAddressCloneEnabled
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Port

If this setting is enabled, it will configure the specified the proxy port inside the textbox in the options panel.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/Port
```

Values:

```xml
<enabled/>
<data id="Port_Prompt" value="8080"/>
```

```xml
<disabled/>
```

### Proxy Server

If this setting is enabled, it will configure the specified the proxy address inside the textbox in the options panel.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/ProxyServer
```

```xml
<enabled/>
<data id="ProxyServer_Prompt" value="http://proxy-server-address"/>
```

```xml
<disabled/>
```

### Repository Location

Description: If this setting is enabled, it will configure the specified repository location for downloading the latest firmware updates based on the inputted path inside the textbox in the options panel.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/RepositoryLocation
```

Values:

```xml
<enabled/>
<data id="RepositoryLocation_Prompt" value="\\share\dock-firmware"/>
```

```xml
<enabled/>
<data id="RepositoryLocation_Prompt" value="C:\dock-firmware"/>
```

```xml
<disabled/>
```

### Update Firmware Without Disconnect

If this setting is enabled, it will configure the dock types (which complete firmware updating after disconnecting dock form the computer) to update firmware without disconnecting from the computer.

Do not turn this feature on until the dock has been upgraded to a supported firmware version!

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/UpdateFWWithoutDisconnect
```

Values:

!!! note ""
    Enter the dock type (four characters), which can be found on the label on the back of the dock. Multiple dock types must be specified as comma separated list.

```xml
<enabled/>
<data id="UpdateFWWithoutDisconnect_Prompt" value="40AN"/>
```

```xml
<enabled/>
<data id="UpdateFWWithoutDisconnect_Prompt" value="40AN,40B0"/>
```

```xml
<disabled/>
```

## Scheduler

### Frequency

If this settings is enabled, it will edit the frequency on how the next scheduled task's execute date should be updated.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/Frequency
```

Values:

!!! note ""
    Values include DAILY, WEEKLY, or MONTHLY which can be configured on the dropdown provided inside the options panel.

```xml
<enabled/>
<data id="Frequency_Dropdown" value="MONTHLY"/>
```

```xml
<disabled/>
```

### Run At

If this setting is enabled, it will edit the time upon when the next scheduled task's execute date should be updated.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunAt
```

Values:

!!! note ""
    Valid inputs includes any time of the day in `24:MM:SS` format which can be inputted inside the textbox in the options panel.

```xml
<enabled/>
<data id="RunAt_Prompt" value="20:30:00"/>
```

```xml
<disabled/>
```

### Run Days

If this setting is enabled, it will edit the day/s when the next scheduled task's execute date should be updated.

Valid inputs are 1-31 and can be separated by a comma (e.g. 1,2,31) which can be inputted inside the textbox in the options panel.

This configuration will be used when the Frequency policy is enabled and set to "MONTHLY".

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunDays
```

Values:

!!! note ""
    Enter dates when scheduled task should run. (1,2,etc.). Multiple dates must be specified as comma separated list.

```xml
<enabled/>
<data id="RunDays_Prompt" value="1,15"/>
```

```xml
<disabled/>
```

### Run Month

If this setting is enabled, it will edit the month/s when the next scheduled task's execute date should be updated.

Valid inputs are the full month names such as "January". Multiple months can be specified separated by a comma (e.g. "January,February,March") which can be inputted inside the textbox in the options panel.

This configuration will be used when the Frequency policy is enabled and set to "MONTHLY".

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunMonth
```

Values:

!!! note ""
    Enter months when scheduled task should run. (January,February,etc.). Multiple months must be specified as comma separated list.

```xml
<enabled/>
<data id="RunMonth_Prompt" value="January,March,May,July,September,November"/>
```

```xml
<disabled/>
```

### Run Monthly On

If this setting is enabled, it will edit the month/s when the next scheduled task's execute date should be updated.

Valid inputs include: First, Second, Third, Fourth, Last; and can be separated by a comma (e.g. First,Second,Last) which can be inputted inside the textbox in the options panel.

This configuration will be use when the Frequency policy is enabled and set to "MONTHLY".

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunMonthlyOn
```

Values:

!!! note ""
    Enter run monthly on when scheduled task should run. (First,Second,Third,Fourth,Last or combination of comma separated option). Executed in combination with **RunOn** value and is optional input.

```xml
<enabled/>
<data id="RunMonthlyOn_Prompt" value="First,Last"/>
```

```xml
<disabled/>
```

### Run On

If this setting is enabled, it will edit the day of the week when the next scheduled task's execute date should be updated.

Valid inputs are Sunday-Monday and can be separated by a comma (e.g. Monday,Tuesday) which can be inputted inside the textbox in the options panel.

This configuration will be used when the Frequency policy is enabled and set to "MONTHLY" or "WEEKLY".

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunOn
```

Values:

```xml
<enabled/>
<data id="RunOn_Prompt" value="Sunday,Friday"/>
```

```xml
<disabled/>
```
