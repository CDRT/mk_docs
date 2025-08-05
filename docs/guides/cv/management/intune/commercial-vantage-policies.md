# Policies

## Dashboard

### Turn off Dashboard

When this policy is enabled, the Dashboard feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~8EB4B7362B69050BFD52D7A0636C0562/26EB604F31FEA5A31B30EE1DA8B6774D
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Turn off Give Feedback

When this policy is enabled, the Give Feedback feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~8EB4B7362B69050BFD52D7A0636C0562~3DD3DE15E0C7A9EB9EF9D505E92E74B1/392FE587856B9D466DE27527614D5EE2
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## Device

### Turn off Device Settings

When this policy is enabled, the Device Settings feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB/AD7C83D4D02A207DE73A16DBA3E41299
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

---

### Turn off System Update

When this policy is enabled, the System Update feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB/47CE09B9482EAC9FD541B9E673E25EBC
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

---

### Turn off My Device

When this policy is enabled, the My Device feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB/536EE0FCEA046E2AE885243C193998DD
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Device Settings

#### Turn Off Smart Assist

When this policy is enabled, the Smart Assist feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD/48D766A8D16EA17A7C0BA73A8A8FD521
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Display and Camera

#### Turn off Camera

When this policy is enabled, the Camera features of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~253B0EFA38D70AA281E219F0608579F7/2E012166F382F702A96FACF6CB2AD9BF
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

---

#### Turn off Display

When this policy is enabled, the Display features of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~253B0EFA38D70AA281E219F0608579F7/7EFB17AA327FB4413D8CFBC79A7BC0DC
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Input and Accessories

#### Turn off Intelligent Keyboard

When this policy is enabled, the Intelligent Keyboard feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~8B4FEEBFA703E3CDB065A0BC9F60E2B8/C9E7C956C24B3611C29FF18FD27B5817
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Microphone

#### Turn off Microphone Settings

When this policy is enabled, the Microphone Settings features of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~BA6F60313310EFF34E59B7FAB53CF7B0/5FD85C9FE3983DEF5D98453B5A1A31BE
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Smart noise cancelling

This policy setting affects the Smart noise cancelling setting in the Microphone tab in the Commercial Vantage. It determines whether the setting is displayed and whether the users can utilize the features of AI noise suppression. By default, the setting is visible and can be updated by the end user of the device.

Enabled: Enabling this setting turns off and hides the Smart noise cancelling feature from the Commercial Vantage. In case the noise cancelling settings have been modified prior to enabling this policy, all the changes will be rolled back and the settings will be reset to default.

Disabled: If you disable this setting, the Smart noise cancelling feature will be visible and the users will be able to update the settings  through Commercial Vantage.

Not Configured: Leaving this setting unconfigured maintains the default behavior. Users can freely access and update the Smart noise cancelling section in the Microphone page in  the Commercial Vantage.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~BA6F60313310EFF34E59B7FAB53CF7B0/772EAFEFB12384522846346824FA2EF4
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Power

#### Turn off Battery health

!!! note ""
    Added in version 20.2506.39.0

When this policy is Enabled, the status of battery health of Commercial Vantage will be hidden.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/08BBF44CA2CC0873631A35AF193B452B
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off DPM Power Settings

!!! note ""
    Added in version 10.2104

When this policy is enabled, the Desktop Power Manager Power Settings of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/114BBBE0F57582EEBF1ACE595FDDFD92
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Global Power Management

!!! note ""
    Added in version 2407.66

When this policy is Enabled, the Global Power Management (Intelligent Cooling/Intelligent Cooling Engine) of Commercial Vantage will be hidden.

When this policy is Disabled, the Global Power Management (Intelligent Cooling/Intelligent Cooling Engine) of Commercial Vantage will be shown.

When this policy is Not Configured, the Global Power Management (Intelligent Cooling/Intelligent Cooling Engine) of Commercial Vantage will be shown.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/1A406616747B4AEEB4184F7408D8C182
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Battery Settings

!!! note ""
    Added in version 10.2104

!!! info ""
    If this policy is enabled, the Battery Settings section in the GUI will disappear.

When this policy is enabled, the Battery Settings features of Commercial Vantage will be turned off.

Battery percentage for starting and stopping charge threshold can only be set in increments of 5. Any value input will be rolled to next increment of 5.

If an IT Admin sets a "Start Charging" greater than "Stop Charging", Vantage will ignore "Start Charging" set by Admin and will "Start Charging" at 5% less than "Stop Charging".
Ex: IT Admin sets "Start Charging" = 60 and "Stop Charging" = 50. Then, Vantage will "Start Charging" at 45 since "Stop Charging" = 50

If checkbox to "Automatically set the start charging" is checked by IT Admin, Vantage will ignore "Start Charging" set by Admin and will "Start Charging" at "Stop Charging" minus 5.
Ex: If checkbox selected and "Stop Charging" is set to 90, then "Start Charging" is set to 85.

When the toggle to "Automatically Set Threshold" is on, then Battery Threshold "Start" cannot be set.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/1B92BAC1630DE2689D54D68B7EC60A78
```

!!! info "GUID Reference"
    30B3EB897294AF0A770737E004CCE7B0 = Enable custom battery threshold settings<br>
    4B9DE8D61B215393ED7255D0719FA5FA = Threshold Start<br>
    2FE339B04615BBA5C913F45FB6A1B34D = Threshold Stop<br>
    51A1765894644A2F58B9AF5EE7F65922 = Auto Start Charging

Values:

```xml
<enabled/>
<data id="30B3EB897294AF0A770737E004CCE7B0" value="true"/>
<data id="4B9DE8D61B215393ED7255D0719FA5FA" value="60"/>
<data id="2FE339B04615BBA5C913F45FB6A1B34D" value="80"/>
<data id="51A1765894644A2F58B9AF5EE7F65922" value="false"/>
```

```xml
<disabled/>
```

#### Turn off Battery temperature

!!! note ""
    Added in version 20.2506.39.0

When this policy is Enabled, the battery temperature section of Commercial Vantage will be hidden.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/3EAD4546EEBB230B32DFBB487C7E5EA0
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Write battery information to WMI

!!! note ""
    Added in version 10.2109

This policy setting allows Commercial Vantage to write the computer battery information into the Lenovo Namespace WMI table. If you enable it, the battery information will be written to WMI. The information written will appear as follows:

![battery info](https://cdrt.github.io/mk_docs/img/cv/battery_info.png)

This policy setting allows the Administrator to configure the schedule type, schedule day, and schedule time for writing the computer battery information to WMI.
The Schedule type value should be a number (0-2), where 0 means daily, 1 means weekly, 2 means monthly.

If the Schedule type value is set to 0, the Schedule day value should be set to 0 (and this value will be ignored). If the Schedule type is set to 1, the Schedule day value should be a number (0-6), where 0 means Sunday, 1 means Monday, 2 means Tuesday...

If the Schedule type is set to 2, the Schedule day value should be a number (-1 or 1-31), where -1 means the last day of the month, 1 means the first day of the month, 2 means the second day of the month...

The Schedule time value format should be HH: mm:ss. For example, 18: 30:00 represents 6:30PM.

If you disable or do not configure this policy setting, the battery information will not be written to WMI.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/B01A9475F26627063E7913B9D74C9658
```

!!! info "GUID Reference"
    ADE41242A9F8CE596481FE945E5FE5D8 = Schedule Type <br>
    F04F922293A120999D4EB95012CA0C64 = Schedule Day <br>
    AC72B4BC066D807C760A11748C39F451 = Schedule Time

Values:

```xml
<enabled/>
<data id="ADE41242A9F8CE596481FE945E5FE5D8" value="1"/>
<data id="F04F922293A120999D4EB95012CA0C64" value="1"/>
<data id="AC72B4BC066D807C760A11748C39F451" value="10:00:00"/>
```

```xml
<disabled/>
```

#### Turn off Standby Settings

!!! note ""
    Added in version 10.2104

When this policy is enabled, the Standby Settings feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/BFDBD5BBEE7822675EC26177C62820D6
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off At a glance

!!! note ""
    Added in version 20.2506.39.0

When this policy is Enabled, the At a glance section of Commercial Vantage will be hidden.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/D8B285396E09B47C7853FC260DA26E49
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Power Settings

When this policy is enabled, the Power Settings of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/DAFCD675AF1BF429DDE3C7DBA278F84D
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Energy Star

!!! note ""
    Added in version 10.2104

When this policy is enabled, the Energy Star features of Commercial Vantage will be turned off

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~E8B51492FF5A8AA72FD9593E19D9B8FF/EC7DDEAF97A500A0EE95864114E7CD52
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Smart Assist

#### Turn off Active Protection System Settings

!!! note ""
    Added in version 10.2104

When this policy is enabled, the Active Protection System Settings features of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~CBAB71D9A1E135A0FA3A6EA2DA0C9904/506259864F9C994767F6530DE643B36E
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Intelligent Screen

!!! note ""
    Added in version 2407.66

When this policy is enabled, the Intelligent Screen features of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~CBAB71D9A1E135A0FA3A6EA2DA0C9904/EEF7C410105EFB7805171740190C6965
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Intelligent Security Settings

!!! note ""
    Added in version 2407.66

When this policy is enabled, the  Intelligent Security Settings features of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~CBAB71D9A1E135A0FA3A6EA2DA0C9904/F849A86B6C88FB37AFB14BAB268A8E2A
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Dolby Access

#### Turn off Dolby Access

When this policy is enabled, Dolby Access page will be hidden. Then, the Advanced microphone effects section on Microphone page should be hidden as well.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7F1A82A306BBA4A0AE1E88DACC971B98/5893778C126AECE6153BAC92D216D439
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Modes

#### Turn off Modes

!!! note ""
    Added in version 10.2407.66.0

This policy setting prevents the end-users of the device from using the the Modes page in My Device page. It determines whether the Modes functionality is available in the Commercial Vantage or not, and whether the users will be able to use Lenovo Desktop Widget. By default, the page is displayed and can be accessed by the end user of the device.

If you enable this setting, the Modes page will be hidden from the Commercial Vantage. The end user will not be able to see the Modes tab in the Device Settings and will not be able to use Lenovo Desktop Widget on the device.

If you disable or do not configure this setting, the Modes will be displayed and the user will be able to use the Lenovo Desktop Widget.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~7951944913DEC79205443E57168B1CBD~DA73FA95EE6D6962459DAFAE9957BA01/6950037C7735BA43482EEC668D0C45DA
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### My Software

#### Turn off My Software

When this policy is enabled, My Software page will be hidden.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~C5F2E398EC7B34FE44B522453172955A/93F1E6046DD02C5953747188D106EDC8
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### System Update

#### Company Name

!!! note ""
    Added in version 2501.15

Defines the Company Name to be displayed on the System Update dialogs. Excessively long names may be truncated.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/1B712E2FAB2CBBC36596C1D66EEDDFED
```

Values:

```xml
<enabled/>
<data id="2E380F5F44ADD0C3911D0528A5A35CB6" value="Commercial Deployment Readiness Team"/>
```

```xml
<disabled/>
```

#### System Update Configuration

This policy setting provides the ability for the Administrator to configure the filter of searching updates. If you enable this policy setting, Commercial Vantage will search for updates based on this filter. This policy affects manual update, but if 'Configure Auto System Update' is not configured, it affects both manual and auto update.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/5456F227323F901F6CAF5C2F3F1AC9A5
```

Values:

```xml
<enabled/>
<data id="602015B22CFEA08C53FEC8C3E81356BF" value="true"/>
<data id="CE7D1526B3D8674705FF75DFF52B4416" value="true"/>
<data id="7C75C7AA6FF288235BCA3886FA9A4176" value="true"/>
<data id="94803C37291A574BB4CAF4DFAE682CC2" value="true"/>
<data id="7326616EB323392D1BB0E6436A4A02AF" value="false"/>
<data id="6564E6607DD79991C0A56F009A4102FA" value="true"/>
<data id="B78D824B47B0EC632B7EDEF30B63E2D9" value="true"/>
<data id="A0DEF98CD96C592582382A3453CB78BA" value="true"/>
<data id="8E6885D7C10107B5CD98053B7D8B2A6E" value="true"/>
<data id="A45D902F95DDD3B8597B21175A66A804" value="true"/>
<data id="46302403B9C32072305518FE20DC6720" value="false"/>
<data id="FDC13AFD3BA418958D122D78105C2F90" value="false"/>
<data id="3297105136FCEC5D3432C0FA2FDB73BB" value="false"/>
<data id="C62002C924CF75712313AC1CF94525AB" value="false"/>
<data id="9A82A62C3EF3BA2FCC142413A1FAC951" value="false"/>
```

```xml
`<disabled/>`
```

!!! note ""
    All elements must be specified with a value of either True or False.  Reference the legend below for Boolean id elements to string match.

!!! info "GUID Reference"
    602015B22CFEA08C53FEC8C3E81356BF = Critical Applications<br>
    CE7D1526B3D8674705FF75DFF52B4416 = Critical Drivers<br>
    7C75C7AA6FF288235BCA3886FA9A4176 = Critical BIOS<br>
    94803C37291A574BB4CAF4DFAE682CC2 = Critical Firmware<br>
    7326616EB323392D1BB0E6436A4A02AF = Critical Others<br>
    6564E6607DD79991C0A56F009A4102FA = Recommended Applications<br>
    B78D824B47B0EC632B7EDEF30B63E2D9 = Recommended Drivers<br>
    A0DEF98CD96C592582382A3453CB78BA = Recommended BIOS<br>
    8E6885D7C10107B5CD98053B7D8B2A6E = Recommended Firmware<br>
    A45D902F95DDD3B8597B21175A66A804 = Recommended Others<br>
    46302403B9C32072305518FE20DC6720 = Optional Applications<br>
    FDC13AFD3BA418958D122D78105C2F90 = Optional Drivers<br>
    3297105136FCEC5D3432C0FA2FDB73BB = Optional BIOS<br>
    C62002C924CF75712313AC1CF94525AB = Optional Firmware<br>
    9A82A62C3EF3BA2FCC142413A1FAC951 = Optional Others

#### System Update Repository

Defines the location of where System Update will pickup available content.

!!! note ""
    Supports UNC paths or a local drive only

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/7D125BC7E172D57BBD95107ECECB6C0D
```

Values:

```xml
<enabled/>
<data id="7D125BC7E172D57BBD95107ECECB6C0D" value="\\your_repository"/>
```

```xml
<disabled/>
```

#### Test Content Mode

!!! note ""
    Added in version 2501.15

When enabled, this policy will cause System Update to only process packages that have a Status of "Test" in the local repository. This policy only takes effect if a local repository is configured by the System Update Repository policy. If this policy is not configured or disabled, then only packages with a Status of "Active" will be processed from the local repository.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089/C6A61B1F0CCC910157C4FD733BBFBA69
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Auto Update

#### Schedule the Day for Auto Update

!!! note ""
    This policy will be combined with the configuration of Schedule the Month for Auto Update to determine the exact schedule of Auto Update.

This policy setting provides the ability for the Administrator to configure the day(s) on which the Auto Update will occur.

Either specify specific day(s) of the month or specify a frequency and day of the week.

If both "Day(s)" and "Frequency/Day of the Week" are specified,"Day(s)" will take precedence and "Frequency/Day of the Week" will be ignored.

If "Day(s)" is configured, Auto Update will only occur on the specified days. The desired days can be specified by the number of the day in the month or by specifying "Last Day" for the last day of the month or "All" for all days of the month. Multiple days can be specified by separating with semi-colon ( ; ).

Example for Day(s) input:

- All  -->  Auto Update will occur on all days of the month
- 1;7;13;25  --> will only occur on the days: 1, 7, 13, and 25
- All;1;13;25  --> will only occur on the days:  1, 13, 25 and "All" is ignored
- LastDay  --> will only occur on the last day of the month
- LastDay;1;13;25  --> will only occur on the days: 1, 13, 25 and the last day of the month

When Frequency and Days of the Week are configured, a selection must be set for both or else the policy will be ignored.

Example for Frequency/Days of the Week:

- If "All" is checked under Frequency and "Friday" is checked under Day of the Week, then Auto Update will occur every Friday.
- If "First" and "Third" are checked under Frequency and "Tuesday" is checked under Day of the Week, then Auto Update will occur on the first and third Tuesday of each month.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/21E270BB2BEDC888DE041CA38981726B
```

| id | valueName |
| :--- | :--- |
| `8954B312E3ABB22A17F7E50723750B80` | All Weeks |
| `001C72322736D14CFC56E1F4653019F6` | First Week |
| `806D1BC85455150F0DCD44BDFC9839FA` | Second Week |
| `0E8030803EB7BFD27581D3A2BEFE771E` | Third Week |
| `E68FFD0829E277997C8972276A02E92B` | Fourth Week |
| `AFA05A1BB42D873987FFD971D4B1B6A2` | Last Week |
| `4BBE69DF32A6A22FDA4FF162C53C7154` | Sunday |
| `A48090544BD0587769808CA01B8D1670` | Monday |
| `159A93568F287E05F64F599B64034E2F` | Tuesday |
| `B2CF1DA1B0B639B6B14ED2CCC1E26B80` | Wednesday |
| `24E625869762ABC41BA468897B581394` | Thursday |
| `606C484482FDC09861E8DCFD5EFFBB2A` | Friday |
| `C6F63436FC3A9ECA03116BB2624763E3` | Saturday |

Values:

```xml
<enabled/>
<data id="9B56ECD989102ABD1C7FEAF701B20490" value="1"/>
<data id="8954B312E3ABB22A17F7E50723750B80" value="false"/>
<data id="001C72322736D14CFC56E1F4653019F6" value="true"/>
<data id="806D1BC85455150F0DCD44BDFC9839FA" value="false"/>
<data id="0E8030803EB7BFD27581D3A2BEFE771E" value="true"/>
<data id="E68FFD0829E277997C8972276A02E92B" value="false"/>
<data id="AFA05A1BB42D873987FFD971D4B1B6A2" value="false"/>
<data id="4BBE69DF32A6A22FDA4FF162C53C7154" value="false"/>
<data id="A48090544BD0587769808CA01B8D1670" value="false"/>
<data id="159A93568F287E05F64F599B64034E2F" value="true"/>
<data id="B2CF1DA1B0B639B6B14ED2CCC1E26B80" value="false"/>
<data id="24E625869762ABC41BA468897B581394" value="false"/>
<data id="606C484482FDC09861E8DCFD5EFFBB2A" value="false"/>
<data id="C6F63436FC3A9ECA03116BB2624763E3" value="false"/>
```

```xml
<disabled/>
```

#### Turn off Dock Auto Update

!!! note ""
    Added in version 2407.66

Dock Auto Update is a separate feature from Auto Update for the system and does not follow the filtering or scheduling configuration of the System Update policies.

This feature focuses only on updating the firmware of docks that are attached to the system.

When this policy is Enabled, the Dock Auto Update feature is turned off. Also, if the policy is Not Configured or not present, the Dock Auto Update feature is turned off.

If Dock Auto Update feature needs to be turned on, then set this policy to Disabled. This will cause Commercial Vantage to check for an available Dock firmware update for the specific Dock when it is attached to the system.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/3D58DE8904B4C497EB9181BEDC868A50
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Turn off Run-Once Task

!!! note ""
    Added in version 10.2104 v2

When this policy is enabled, the initial check for updates by Commercial Vantage is turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/41055A4D350BB08B7B35250ABCD2A4B1
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Schedule the Month for Auto Update

!!! note ""
    This policy will be combined with the configuration of Schedule the Day for Auto Update to determine the exact schedule of Auto Update.

This policy setting provides the ability for the Administrator to configure the months in which Auto Update will occur.

You can mark the checkbox that corresponds to the desired month(s). If you click "All" plus other individual months, the individual months will take precedence over "All".  If you do not select any months, the policy will be ignored.

If this policy is enabled, the Run Once task will be disabled automatically.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/5352EE76841C80672B56A0CEDF41837E
```

| id | valueName |
|:---|:---|
| `B2DD6109EA2E207C836383CECF4A9BEC` | All Months |
| `ED5C30B56EF8F5365D9C42831CF04BD8` | January |
| `BF9C2D60C64BF8F3B5099FE91F9B5089` | February |
| `43C6E71EE827630A483FA7FD7ED57CCF` | March |
| `9438FDA7478EC6BFD7FAF9C71FE1152B` | April |
| `7D438E61733F014AD996B137C6250657` | May |
| `3205471F2D479A66D2E74BD31E8CACCE` | June |
| `2AA4C9F2C503F923457D404EA7EB6064` | July |
| `66676FED4BBAFA451F2300EF10644292` | August |
| `D7FFEA0FD35DA18D6BD5853D1D5D6207` | September |
| `328D5A4F3EF98FC4FCEE4776C1A2F716` | October |
| `5EB2B35C9240F82A600E5E6CC701FA89` | November |
| `DBEC478AFADA88DC29C9BBC5A4AD2A97` | December |

Values:

```xml
<enabled/>
<data id="B2DD6109EA2E207C836383CECF4A9BEC" value="true"/>
<data id="ED5C30B56EF8F5365D9C42831CF04BD8" value="false"/>
<data id="BF9C2D60C64BF8F3B5099FE91F9B5089" value="false"/>
<data id="43C6E71EE827630A483FA7FD7ED57CCF" value="false"/>
<data id="9438FDA7478EC6BFD7FAF9C71FE1152B" value="false"/>
<data id="7D438E61733F014AD996B137C6250657" value="false"/>
<data id="3205471F2D479A66D2E74BD31E8CACCE" value="false"/>
<data id="2AA4C9F2C503F923457D404EA7EB6064" value="false"/>
<data id="66676FED4BBAFA451F2300EF10644292" value="false"/>
<data id="D7FFEA0FD35DA18D6BD5853D1D5D6207" value="false"/>
<data id="328D5A4F3EF98FC4FCEE4776C1A2F716" value="false"/>
<data id="5EB2B35C9240F82A600E5E6CC701FA89" value="false"/>
<data id="DBEC478AFADA88DC29C9BBC5A4AD2A97" value="false"/>
```

```xml
<disabled/>
```

#### Schedule the Time for Auto Update

This policy setting provides the ability for the Administrator to configure the time for auto updates.

!!! note ""
    For example, 18: 30:00 for 6:30 PM

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/5D601BAD50217031B2F5939DF58ED0CE
```

Values:

```xml
<enabled/>
<data id="5D601BAD50217031B2F5939DF58ED0CE" value="10:00:00"/>
```

```xml
<disabled/>
```

#### Defer Update

!!! note ""
    Added in version 10.2104 v2

This policy setting provides the ability for the Administrator to control how updates can be deferred.

If you enable this policy, then you may configure the number of times the end-user is allowed to defer updates (DeferLimit) and the amount of time for each deferral (DeferTime). If these options are not configured, then the end-user may defer unlimited times for 60 minutes each deferral.

If you disable this policy or the policy is not configured, then the end-user may only continue with the updates or cancel the updates. If cancelled, the updates will be presented again by the next scheduled scan for updates.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/6E62038B159F1CC622C1E80F3BD3D1E8
```

| id | valueName |
|:---|:---|
| 311D60F57C54D2DD03394368BDFCED99 | DeferLimit |
| 95E579A1A0BABCEDAC4AF1BC81B042F4 | DeferTime |

Values:

```xml
<enabled/>
<data id="311D60F57C54D2DD03394368BDFCED99" value="4"/>
<data id="95E579A1A0BABCEDAC4AF1BC81B042F4" value="30"/>
```

```xml
<disabled/>
```

#### Auto Update

This policy setting provides the ability for the Administrator to control auto update.  If you enable this policy setting, the auto update will be enabled. If you disable this policy setting, the auto update will be disabled.  If you do not configure this policy setting, it will keep the last status and can be controlled by the end user.  By default, auto update will install critical updates and recommended drivers.  If you want customization, please change the setting "Configure System Update".

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/DE2E5946D5FC36D6F175D99C651F8408
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

#### Configure Auto System Update

!!! note ""
    Added in version 2407.66

This policy setting provides the ability for the Administrator to config the filter of searching updates.

If you enable this policy setting, Commercial Vantage will searching for updates base on this filter.

If you disable this policy setting, Commercial Vantage will searching for all available updates.

Not configured follows the settings of 'Configure System Update'.

This policy affects auto update.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~92B4DA2E264226B58EC3D92D3DF5B089~5AD2D9925FD5177E61D39F61B3B4F37E/F3E50D676ED09F059CDA62D68516F80D
```

Values:

```xml
<enabled/>
<data id="602015B22CFEA08C53FEC8C3E81356BF" value="true"/>
<data id="CE7D1526B3D8674705FF75DFF52B4416" value="true"/>
<data id="7C75C7AA6FF288235BCA3886FA9A4176" value="true"/>
<data id="94803C37291A574BB4CAF4DFAE682CC2" value="true"/>
<data id="7326616EB323392D1BB0E6436A4A02AF" value="false"/>
<data id="6564E6607DD79991C0A56F009A4102FA" value="true"/>
<data id="B78D824B47B0EC632B7EDEF30B63E2D9" value="true"/>
<data id="A0DEF98CD96C592582382A3453CB78BA" value="true"/>
<data id="8E6885D7C10107B5CD98053B7D8B2A6E" value="true"/>
<data id="A45D902F95DDD3B8597B21175A66A804" value="true"/>
<data id="46302403B9C32072305518FE20DC6720" value="false"/>
<data id="FDC13AFD3BA418958D122D78105C2F90" value="false"/>
<data id="3297105136FCEC5D3432C0FA2FDB73BB" value="false"/>
<data id="C62002C924CF75712313AC1CF94525AB" value="false"/>
<data id="9A82A62C3EF3BA2FCC142413A1FAC951" value="false"/>
```

```xml
`<disabled/>`
```

!!! note ""
    All elements must be specified with a value of either True or False. Reference the legend below for Boolean id elements to string match.

!!! info "GUID Reference"
    602015B22CFEA08C53FEC8C3E81356BF = Critical Applications<br>
    CE7D1526B3D8674705FF75DFF52B4416 = Critical Drivers<br>
    7C75C7AA6FF288235BCA3886FA9A4176 = Critical BIOS<br>
    94803C37291A574BB4CAF4DFAE682CC2 = Critical Firmware<br>
    7326616EB323392D1BB0E6436A4A02AF = Critical Others<br>
    6564E6607DD79991C0A56F009A4102FA = Recommended Applications<br>
    B78D824B47B0EC632B7EDEF30B63E2D9 = Recommended Drivers<br>
    A0DEF98CD96C592582382A3453CB78BA = Recommended BIOS<br>
    8E6885D7C10107B5CD98053B7D8B2A6E = Recommended Firmware<br>
    A45D902F95DDD3B8597B21175A66A804 = Recommended Others<br>
    46302403B9C32072305518FE20DC6720 = Optional Applications<br>
    FDC13AFD3BA418958D122D78105C2F90 = Optional Drivers<br>
    3297105136FCEC5D3432C0FA2FDB73BB = Optional BIOS<br>
    C62002C924CF75712313AC1CF94525AB = Optional Firmware<br>
    9A82A62C3EF3BA2FCC142413A1FAC951 = Optional Others

### Warranty

#### Hide Warranty Information

!!! note ""
    Added in version 10.2104

This policy setting allows the Administrator to hide the warranty information in Commercial Vantage.  If you enable it, the warranty information will be removed from the Commercial Vantage GUI.  If you disable or not configure it, the warranty information will be shown.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~4D633640E5CF3443867C0771CE6106B0/29310C221BB9070F63950B4D1EF6E2FD
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

---

#### Write Warranty Information to WMI

!!! note ""
    Added in version 10.2104

This policy setting allows the Administrator to enable Commercial Vantage to writing the warranty information of the system into the Lenovo Namespace WMI table.  If you enable it, the warranty information will be written to the WMI table.  If you disable or not configure it, the warranty information will not be written to WMI table.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~7D8BB8A33C8A8577FC2188C5539DFDBB~4D633640E5CF3443867C0771CE6106B0/8431B9B72EC21BF09C22F293D7E3F2D5
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## EULA

### Accept EULA Automatically

This policy disables the Lenovo End User License Agreement (EULA) and the Lenovo privacy statement pop up displayed at the first time Commercial Vantage is launched.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~261C3D29FFEB46D46D29941DC7D22786/01A7464C3D337F1E15D54CA31D7FF83B
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## Hardware Scan

### Turn Off Hardware Scan

!!! note ""
    Added in version 10.2201

When this policy is enabled, Hardware Scan feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~3BB252355E5322463EC33426BF919239/5A6D93CCF9612C47FFF7FE6C13293CAF
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## Metrics

### Turn off Metrics Collection

This policy prevents Data Collection by Commercial Vantage. If this policy is enabled, the Lenovo Commercial Vantage will not report any metrics information for example the EULA acceptance.

If this policy is disabled or not configured, the Lenovo Commercial Vantage will send a report to Lenovo.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~856C8C55266137062827DD27AEDB1FA5/CB15F021F0DF07589CBAE6214CDA5C02
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## Network

### Turn Off Network

!!! ""
    Previously named Wifi Security

When this policy is enabled, Network feature of Commercial Vantage will be turned off.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~D5E41712EF76F886457EC1401FAEEF01/F11439A9B68301F4EC7AF579B71B30DF
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## Preference Settings

### Turn off Preference Settings

This policy setting provides the ability for the Administrator to control show/hide action of the page.

If you enable this policy, Commercial Vantage will hide Preference settings page, and settings on the page won't change.

If you disable this policy, Commercial Vantage will show Preference settings page and user can change the settings on the page.

Not config is default value of this policy and it works as same as disabled.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~A3295309178C5F1CEC24529B03C24C6E/1E4CBA1B408B04FD46F365871B89A237
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

### Lenovo Service Bridge Integration Settings

This policy setting provides the ability for the Administrator to control Commercial Vantage integration with Lenovo Service Bridge (LSB). LSB integration will provide users better experience while visiting Lenovo support site.

If you enable this policy setting, LSB integration will be enabled and end user will not be able to modify it.

If you disable this policy setting, LSB integration will be disabled and end user will not be able to modify it.

If you do not configure this policy setting,  end user will be able to control it from the UI.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~A3295309178C5F1CEC24529B03C24C6E~57BCEFF7C7874F4EC6423F75E5CF84B9/FAD50692743BADEBB3D3B7905708B767
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## Smart Care

### Turn off Smart Care

!!! note ""
    Added in version 10.2407.66.0

This policy determines whether the Smart Care is available in the Commercial Vantage or not.

If you enable this setting, the Smart Care page will not be displayed and the user will not be able to access the Smart Care support service via Commercial Vantage.

If you disable or do not configure this setting, the Smart Care will be shown in the Commercial Vantage if the device is connected to the internet. The end user will be able to see the Smart Care support service.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~BD3A80EB0DDAB86A9E706C6CF8F64037/8E9D639B4B94B49D617C636DDC19B42F
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## Toast Message

### Turn off Toast Messages

When this policy is enabled, toast messages will not be displayed to end-users.

```xml
./Device/Vendor/MSFT/Policy/Config/CommercialVantage~Policy~03E445D7B5956335BEDEF9340AC7E092~827FE50BF937C098237E83855BDE934A/12EA5BA045FD172E4FE8593904E47A4A
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```
