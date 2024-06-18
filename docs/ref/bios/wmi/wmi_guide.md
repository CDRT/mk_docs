# Lenovo BIOS WMI Interface Guide

## Introduction

IT administrators are always looking for easier ways to manage client computer BIOS settings, which include
passwords, settings, and the boot order. The Lenovo BIOS WMI interface provides a simplified way to change
these settings. Lenovo has developed a BIOS interface that can be manipulated through Windows Management
Instrumentation (WMI). The Lenovo BIOS WMI interface enables IT administrators to make queries on current
BIOS settings, restore settings to their factory defaults, change single settings, reset or change passwords, and
modify the boot order either at client computers or remotely.

If you have suggestions, comments, or questions, please talk to us on our forum! A team of deployment engineers
(including the author of this document) is standing by, ready to help with any deployment challenges you are facing:
<https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg>

### Using Windows Management Instrumentation

WMI is provided as a standard feature in most Windows® operating systems. It provides a powerful set of
functions, such as query-based information retrieval and event notification, which enables users to manage both
local and remote computers. The Lenovo BIOS WMI interface extends the capabilities of WMI to allow
management of BIOS settings.

### Key Benefits

The Lenovo BIOS WMI interface provides the following benefits:

**Functions**

+ Flexible BIOS configuration, including the ability to change a single BIOS setting or all BIOS settings
+ BIOS password management, including updating supervisor passwords, power-on passwords, and hard
disk drive (HDD) passwords
+ No dependency on a specific BIOS level

**Environment**

+ Remote or local capabilities
+ Support of unattended operations
+ No software installation, including managed object format (MOF), required
+ Replaces DOS-based BIOS configuration tools

**Interface**

+ Easy to adopt for various management solutions
+ Replaces current SMI interface
+ Common interface for different products

### Supported Computers

**ThinkPad**:
BIOS setup through WMI is supported on the following ThinkPad products:

+ All ThinkPad models from 2018 or newer
+ Selected ThinkPad models from 2017 or older:
  + ThinkPad L430, L530, L440, L540, L450, L460, L560, L470, L570
  + ThinkPad T430, T430s, T430u, T530, T440, T440p, T440s, T540p, T450, T450s, T550, W550s, T460, T460p, T460s, T560, T470, T470s, T470p, T570
  + ThinkPad X1 Carbon (all generations), X1 Yoga (all generations)
  + ThinkPad X1 Tablet (all generations)
  + ThinkPad X230, X230 Tablet, X240, X240s, X250, X260, X270
  + ThinkPad W530, W540, W541
  + ThinkPad P50, P50s, P70, P40 Yoga, P51, P51s, P71
  + ThinkPad Yoga 11e
  + ThinkPad 11e, 13e, 13
  + ThinkPad Helix (machine types: 20CG, 20CH)
  + ThinkPad 10 (all generations)
  + ThinkPad Yoga 260, Yoga 460, Yoga 370
  + ThinkPad E470, E570
  + ThinkPad S1, S2, S5

**ThinkCentre**:
BIOS setup through WMI described in this document is supported on ThinkCentre M-series products only starting with M700, M800, M900.

**ThinkStation**:
BIOS setup through WMI described in this document is supported on ThinkStation P-series products only starting with P300, P500, P700, P900.

## WMI Methods

The following interface details can be used to access Lenovo BIOS settings.

+ Namespace: ```"\root\WMI"```
+ Base Class: "Lenovo_BIOSElement"
+ Interface details (see Table 1 Interface Details.)

**ThinkPad**:

| Class Name | Type | Parameter / Return | Example |
|----------- |----- |------------------- |-------- |
| Lenovo_BiosSetting | Query | CurrentSetting: “Item,Value” | “WakeOnLAN,Enable” |
| Lenovo_GetBiosSelections | Method | “Item” | “WakeOnLAN” |
| Lenovo_SetBiosSetting | Method | “Item,Value" | “WakeOnLAN,Disable” |
| Lenovo_WmiOpcodeInterface | Method  | WmiOpcodePasswordAdmin:{value};<br>WmiOpcodePasswordType:{value};<br>WmiOpcodePasswordCurrent01:{value};<br>   WmiOpcodePasswordNew01:{value};<br>WmiOpcodePasswordSetUpdate; | WmiOpcodePasswordAdmin:MyPassword!;<br>WmiOpcodePasswordType:pap;<br>WmiOpcodePasswordCurrent01:123;<br>WmiOpcodePasswordNew01:456;<br>WmiOpcodePasswordSetUpdate; |
| Lenovo_SaveBiosSettings | Method  | none | *Also see Legacy Password Handling Section* |
| Lenovo_DiscardBiosSettings | Method  | “Password,Encoding,KbdLang;” | “pswd,ascii,us;” |
| Lenovo_LoadDefaultSettings | Method  | “Password,Encoding,KbdLang;” | “pswd,ascii,us;” |
| Lenovo_SetBiosPassword <br>***Deprecated - use Lenovo_WmiOpcodeInterface*** | Method | “PasswordType,CurrentPassword, <br>NewPassword,Encoding,KbdLang;” | “pop,oldpop,newpop, <br> ascii,us;” |

<div style="text-align:center;">

***Table 1.** ThinkPad Interface Details*
</div>

**ThinkCentre/ThinkStation**:

| Class Name | Type | Parameter / Return | Example |
|----------- | ---- | ---------------- | ---------------- |
| Lenovo_BiosSetting  | Query | CurrentSetting: "Item,Value" | “WakeonLAN,Automatic” |
| Lenovo_SetBiosSetting | Method  | “Item,Value” | “WakeonLAN,Disabled” |
| Lenovo_SaveBios Settings | Method | none |   |
| Lenovo_DiscardBios Settings  | Method  | none |  |
| Lenovo_LoadDefault Settings  | Method  | none |  |
| Lenovo_WmiOpcodeInterface | Method  | WmiOpcodePasswordAdmin:{value};<br>WmiOpcodePasswordType:{value};<br>WmiOpcodePasswordCurrent01:{value};<br>   WmiOpcodePasswordNew01:{value};<br>WmiOpcodePasswordSetUpdate; | WmiOpcodePasswordAdmin:MyPassword!;<br>WmiOpcodePasswordType:pap;<br>WmiOpcodePasswordCurrent01:123;<br>WmiOpcodePasswordNew01:456;<br>WmiOpcodePasswordSetUpdate; |
| Lenovo_SetBios Password <br>***Deprecated - use Lenovo_WmiOpcodeInterface*** | Method | "PasswordType,CurrentPassword, NewPassword, <br>Encoding,KbdLang;" | “pop,oldpop,<br>newpop,<br>ascii,us;” |
<!--| Lenovo_BiosPasswordSettings 	| Method 	| PasswordMode:”Value”<br>-0:Legacy Mode<br>-Others: Reserved PasswordState:”Value”<br>-BIT0=1: User password is installed<br>-BIT1=1:Admin password isinstalled<br>-BIT2=1:Hard disk passwords are installed <br>MinLength:”Value”<br>-1:always one byte MaxLength:”Value”<br>-64:always 64 byte SupportedKeyboard:”Value”<br>-BIT0=1:Support US keyboard<br>-BIT1=1:Support French keyboard<br>-BIT2=1:Support German keyboard <br>SupportedEncodings:”Value”<br>-BIT0=1: support ASCII password input<br>-BIT1=1:support scancode password input <br>Port0HardDiskPasswordState:”Value”<br>-BIT0=1:User hard disk password is installed<br>-BIT1=1:Master hard disk password is installed<br>   Port1HardDiskPasswordState:”Value”<br>   Port2HardDiskPasswordState:”Value”<br>   Port3HardDiskPasswordState:”Value”<br>   Port4HardDiskPasswordState:”Value”<br>   Port5HardDiskPasswordState:”Value” 	| PasswordMode:1 <br>PasswordState:0 <br>MinLength:1 <br>MaxLength:64 <br>SuportedKeyboard:7 <br>SupportedEncodings:3 <br>Port0HardDiskPasswordState:00 <br>Port1HardDiskPasswordState:00 <br>Port2HardDiskPasswordState:00 <br>Port3HardDiskPasswordState:00 <br>Port4HardDiskPasswordState:00 <br>Port5HardDiskPasswordState:00 	| -->
<div style="text-align:center;">

***Table 2.** ThinkCentre/ThinkStation Interface Details*
</div>

### Return Values

You will receive one of the following return values after making changes to BIOS settings:

| Return Value | Description |
|------------- |------------ |
| Success | Operation completed successfully |
| Not Supported | The feature is not supported on this system. |
| Invalid Parameter | The item or value provided is not valid. |
| Access Denied | The change could not be made due to an authentication problem. If a supervisor password exists, the correct supervisor password must be provided. |
| System Busy | BIOS changes have already been made that need to be committed. Reboot the system and try again. |
| Item is show only, inaccessible | The item cannot be changed, can only show the status |

<div style="text-align:center;">

***Table 3.** Return Types*
</div>

## Password Handling

Recent models (2020 and newer ThinkPads, 2017 and newer ThinkCentre and ThinkStations) support complex BIOS passwords.
Acceptable characters for BIOS password are the following:

+ Alphabet (case sensitive) {‘A-Z‘, ‘a-z‘}
+ Number {‘0-9‘}
+ Space ! " # $ % & ' ( ) * + , - . / : ; < = > ? @ [ ¥ ] ^ _ ` { | } ~

To support these complex BIOS passwords, a new WMI class, Lenovo_WmiOpcodeInterface, is required. This new class supports legacy passwords as well as new complex passwords; therefore, it is recommended to use this method whenever possible.

### Current method to Set/Save a Setting

The supervisor password is specified using a new class, Lenovo_WmiOpcodeInterface.

The process is executed in the following order:

1. Lenovo_SetBiosSetting("Item,Value")
1. Lenovo_WmiOpcodeInterface("WmiOpcodePasswordAdmin:MyPassword!;")
1. Lenovo_SaveBiosSettings()

### Legacy method to Set/Save a Setting

In legacy models, it was required to specify the supervisor password in both Lenovo_SetBiosSetting and Lenovo_SaveBiosSettings.

The old process is executed in the following order:

1. Lenovo_SetBiosSetting("Item,Value,Password,Encoding,KbdLang")
1. Lenovo_SaveBiosSettings("Password,Encoding,KbdLang")

### Password Authentication

If an Administrator password is already set, you must specify that administrator password before you can change any BIOS settings. The format for password parameters are different for legacy computers as compared to newer computers (2020 and newer ThinkPads, 2017 and newer ThinkCentre and ThinkStations).

For the newer models, the password is specified using the Lenovo_WmiOpcodeInterface class. A single parameter in the format of “WmiOpcodePasswordAdmin:MyPassword” (where MyPassword is your actual password) is used.

For legacy models, if a supervisor password is already set, you must specify that supervisor password before you can change any BIOS settings. The format for password parameters is "abc,ascii,us" with descriptions in the following table. For Example, if the Current password is “abc”, Password encoding is “ascii”, Keyboard language is “us” then Lenovo_SaveBiosSettings should be called with parameters as “abc,ascii,us;”

**Table 4** describes the password parameters for older models.

**Table 5** describes the password parameters for newer models.

| Parameter | Description | Possible Selections |
|---------- |------------ |-------------------- |
| Parameter 1 | Current Password | “abc” - as raw ascii character<br>“1e302e” - as scancodes |
| Parameter 2 | Password encoding | “ascii”<br>“scancode”|
| Parameter 3 | Keyboard languages <br>(used only if encoding <br>is “ascii”)  | “us” - English US, English, UK,<br>Chinese-Traditional, Danish, Dutch, <br>  French, Canadian, Italian, Japanese, <br>  Korean, Norwegian, Polish, Portuguese, <br>  Spanish, European, Spanish-Latin American, <br>  Swiss, Turkish<br>“fr” - French-European, Belgian<br>“gr” - German, Cz |

<div style="text-align:center;">

***Table 4.** Password parameters format, legacy password authentication*
</div>

For newer computers, you must first call Lenovo_WmiOpcodeInterface with below parameters before changing any BIOS settings, and the password only supports ascii encoding.

| Parameters | Description | Possible Selections |
|----------- |------------ |-------------------- |
| Parameter 1 | Current password, need begin <br> with the key words:<br> WmiOpcodePasswordAdmin: | For example, if BIOS password is set with “abc”: <br> "WmiOpcodePasswordAdmin:abc;" |

<div style="text-align:center;">

***Table 5.** Password parameters format, modern password authentication*
</div>

## Typical Usage

Through WMI, you can work with BIOS settings in the following ways:

+ List BIOS settings
+ Change BIOS settings
+ Load default BIOS settings
+ Change a BIOS password

This section will describe how to perform various actions using PowerShell to interact with the WMI BIOS Interface. These examples can be used as-is or modified for your particular environment or requirements.

!!! info ""
    1. BIOS settings and values are case sensitive. </br> 2. Settings may vary between models; list settings first to identify the BIOS setting you want to change. </br> 3. After making changes to the BIOS settings, you must reboot the computer before the changes will take effect.

### Get all Current BIOS Settings

Use the following command to display all current BIOS settings:

```PowerShell 5.1
gwmi -class Lenovo_BiosSetting -namespace root\wmi | ForEach-Object `
{ if ($_.CurrentSetting -ne "") { Write-Host $_.CurrentSetting.replace(",", " = ") } }
```

```PowerShell 7.x
gcim -Namespace root/WMI -class Lenovo_BiosSetting | ForEach-Object `
{ if ($_.CurrentSetting -ne "") { Write-Host $_.CurrentSetting.replace(",", " = ") } }
```

### Get a Particular BIOS Setting

Use the following command as a template to display a particular BIOS setting:

```PowerShell 5.1
gwmi -class Lenovo_BiosSetting -namespace root\wmi | Where-Object `
{ $_.CurrentSetting.split(",", [StringSplitOptions]::RemoveEmptyEntries) -eq "SecureBoot" } | Format-List CurrentSetting
```

```PowerShell 7.x
gcim -Namespace root/WMI -class Lenovo_BiosSetting | Where-Object `
{ $_.CurrentSetting.split(",", [StringSplitOptions]::RemoveEmptyEntries) -eq "SecureBoot" } | Format-List CurrentSetting
```

### Get all Possible Values for a Particular BIOS Setting

Use the following command as a template to display all possible values for a particular BIOS setting:

```PowerShell 5.1
(gwmi –class Lenovo_GetBiosSelections –namespace root\wmi).GetBiosSelections("BootOrder") | Format-List Selections
```

```PowerShell 7.x
$cimLenovoGetBiosSelections = gcim -namespace root/WMI -class Lenovo_GetBiosSelections
# Replace $SettingName with the appropriate string, i.e. BootOrder
(icim $cimLenovoGetBiosSelections -MethodName "GetBiosSelections" -Arguments @{ Item = "$SettingName" }).Selections
```

### Set and Save a BIOS Setting on newer models

Use the following commands to set the value of a BIOS setting. This is a multi-step process:

**1**. Change the setting

```PowerShell 5.1
(gwmi -class Lenovo_SetBiosSetting –namespace root\wmi).SetBiosSetting("WakeOnLANDock,Disable")
```

```PowerShell 7.x
$cimSetBiosSetting = gcim -namespace root/WMI -class Lenovo_SetBiosSetting
icim $cimSetBiosSetting -MethodName SetBiosSetting -Arguments @{ parameter = "WakeOnLANDock,Disable" }
```

**2**. If a supervisor password is set, specify the supervisor password, otherwise skip this step.

```PowerShell 5.1
(gwmi -class Lenovo_WmiOpcodeInterface -namespace root\wmi).WmiOpcodeInterface("WmiOpcodePasswordAdmin:MyPassword")
```

```PowerShell 7.x
$cimOpInt = gcim -namespace root/WMI -class Lenovo_WmiOpcodeInterface
icim $cimOpInt -MethodName WmiOpcodeInterface -Arguments @{ Parameter = "WmiOpcodePasswordAdmin:MyPassword"}
```

**3**. Save the new setting

```PowerShell 5.1
(gwmi -class Lenovo_SaveBiosSettings -namespace root\wmi).SaveBiosSettings()
```

```PowerShell 7.x
$cimSaveBiosSettings = gcim -namespace root/WMI -class Lenovo_SaveBiosSettings
icim $cimSaveBiosSettings -MethodName SaveBiosSettings
```

!!! info ""
   The setting string is case sensitive and should be in the format ```<item>,<value>```.

### Set a BIOS Setting When a Supervisor Password Exists on legacy models

Use the following command as a template to set the value of a setting when a supervisor password exists on older models (ThinkPad prior to 2020 and ThinkCentre/ThinkStation prior to 2017). This is a two-step process: set and then save.

!!! info ""
   The setting string is case sensitive and should be in the format
```<item>, <value>, <password + encoding>```.

```PowerShell 5.1
(gwmi -class Lenovo_SetBiosSetting –namespace root\wmi).SetBiosSetting("WakeOnLAN,Disable,password,ascii,us")
```

```PowerShell 7.x
$cimSetBiosSetting = gcim -Namespace root/WMI -class Lenovo_SetBiosSetting
icim $cimSetBiosSetting -MethodName SetBiosSetting -Arguments @{ parameter = "WakeOnLANDock,Disable,password,ascii,us" }
```

```PowerShell 5.1
(gwmi -class Lenovo_SaveBiosSettings -namespace root\wmi).SaveBiosSettings("password,ascii,us”)
```

```PowerShell 7.x
$cimSaveBiosSettings = gcim -Namespace root/WMI -class Lenovo_SaveBiosSettings
icim $cimSaveBiosSettings -MethodName SaveBiosSettings -Arguments @{ parameter = "password,ascii,us" }
```

### Change a BIOS Password

Use the following commands to change the BIOS supervisor password. Note that you cannot use this method to
set an initial password; it can only be used to change an existing password. This is a multi-step process:

**1**. Specify the password type

```PowerShell 5.1
(gwmi -class Lenovo_WmiOpcodeInterface -namespace root\wmi).WmiOpcodeInterface("WmiOpcodePasswordType:pap")
```

```PowerShell 7.x
$cimOpInt = gcim -namespace root/WMI -class Lenovo_WmiOpcodeInterface
icim $cimOpInt -MethodName WmiOpcodeInterface -Arguments @{ Parameter = "WmiOpcodePasswordType:pap" }
```

**2**. Specify the current password

```PowerShell 5.1
(gwmi -class Lenovo_WmiOpcodeInterface -namespace root\wmi).WmiOpcodeInterface("WmiOpcodePasswordCurrent01:MyCurrentPassword")
```

```PowerShell 7.x
icim $cimOpInt -MethodName WmiOpcodeInterface -Arguments @{ Parameter = "WmiOpcodePasswordCurrent01:MyCurrentPassword" }
```

**3**. Specify the new password

```PowerShell 5.1
(gwmi -class Lenovo_WmiOpcodeInterface -namespace root\wmi).WmiOpcodeInterface("WmiOpcodePasswordNew01:MyNewPassword")
```

```PowerShell 7.x
icim $cimOpInt -MethodName WmiOpcodeInterface -Arguments @{ Parameter = "WmiOpcodePasswordNew01:MyNewPassword" }
```

**4**. Save the new password

```PowerShell 5.1
(gwmi -class Lenovo_WmiOpcodeInterface -namespace root\wmi).WmiOpcodeInterface("WmiOpcodePasswordSetUpdate")
```

```PowerShell 7.x
icim $cimOpInt -MethodName WmiOpcodeInterface -Arguments @{ Parameter = "WmiOpcodePasswordSetUpdate" }
```

The password type can be one of the following values:

+ WmiOpcodePasswordType:pap = Supervisor
+ WmiOpcodePasswordType:pop = Power-on
+ WmiOpcodePasswordType:smp = System Management
+ WmiOpcodePasswordType:uhdp1 = User HDP 1
+ WmiOpcodePasswordType:mhdp1 = Master HDP 1
+ WmiOpcodePasswordType:uhdp2 = User HDP 2
+ WmiOpcodePasswordType:mhdp2 = Master HDP 2
+ WmiOpcodePasswordType:adrp1 = (NVMe only) Single Password or Dual Password Admin 1
+ WmiOpcodePasswordType:udrp1 = (NVMe only) Dual Password User 1
+ WmiOpcodePasswordType:adrp2 = (NVMe only) Single Password or Dual Password Admin 2
+ WmiOpcodePasswordType:udrp2 = (NVMe only) Dual Password User 2

### Changing the Boot Order

**ThinkPad**:

To change the boot order, complete the following steps:

+ Determine the current setting for “BootOrder” by using the Lenovo_BiosSetting class.
+ Determine the available boot devices by using the Lenovo_GetBiosSelections class.
+ To set a new boot order, use the Lenovo_SetBiosSetting class, then use the Lenovo_SaveBiosSetting class to save the settings. In the following example, the CD drive 0 is the first boot device and hard disk drive 0 is the second startup device.

```ATAPICD0:HDD0```

**ThinkCentre | ThinkStation**:

To change the boot order, complete the following steps:

+ Determine the current setting for “BootOrder” by using the Lenovo_BiosSetting class.
+ To set a new boot order, use the Lenovo_SetBiosSettingclass, then use the Lenovo_SaveBiosSetting class to save the settings. Specify a new boot order by listing the boot devices in order, separated by colons. Devices that are not specified are excluded from the boot order. In the following example, the Network Card drive is the first boot device and SATA drive 1 is the second boot device and so on.

Example: Change primary boot sequence,
```"Primary Boot Sequence" "Network 1:SATA 1:USB HDD:SATA 2:USB CDROM:USB Key"```

!!! info ""
     **1**. "Boot Order" settings are case sensitive.<br>
**2**. Settings may different from projects, recommend List all settings first to identify the BIOS setting wants to change, and put all the listed device to the script parameters, just sequence could be changed. <br>
**3**. After making changes to the BIOS settings, you must reboot the computer before the changes will take effect.

### Restoring Default Settings

To restore default BIOS settings, use the Lenovo_LoadDefaultSettings class, then use the Lenovo_SaveBiosSettings class to save the BIOS changes.

### Limitations and Notes

**1**. When setting multiple BIOS settings during the same session prior to restarting, only call the SaveBiosSettings method once at the end instead of after each call to SetBiosSetting. This will prevent possible issues with overloading the WMI handler. All settings that have been changed will be saved with one call to SaveBiosSettings.

**2**. A password cannot be set using this method when one does not already exist. Passwords can only be changed or cleared.

**3**. To remove the power-on password when a supervisor password is set, it must be done in three steps total:
<ol type="a">
<li> Change the supervisor password. It’s OK to specify the same password as both the current and the new, in case you don’t really want to change it. But you must do this step.</li>
<li> Change the power-on password by specifying the current password and a NULL string as the new password</li>
<li> Reboot (do not reboot between steps A and B) </li>
</ol>

**4**. Some security-related settings can only be disabled when a Supervisor password exists. For example, the following BIOS settings cannot be changed from Enable to Disable unless you have a Supervisor password:
<ol type="a">
<li> SecureBoot</li>
<li> SecureRollbackPrevention</li>
<li> PhysicalPresenceForTpmClear</li>
<li> PhysicalPresenceForTpmProvision</li>
</ol>

## Security over Remote Connections

WMI-based administration scripts operating over a remote connection send data over the network in clear text by default. You can enhance security by modifying WMI-based administration scripts to establish an encrypted remote connection as follows:

 1. Set an impersonation level of "impersonate"
 2. Set an authentication level of "pktPrivacy"
