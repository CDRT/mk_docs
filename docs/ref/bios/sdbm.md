# System Deployment Boot Mode

## Overview

System Deployment Boot Mode (SDB) is a new feature added to the Whiskey Lake generation of ThinkPads.  This introduces the ability to programmatically configure key security BIOS settings during your operating system deployments.

Unlike previous generations, this boot mode will allow you to:

- **Set an initial Supervisor Password**

In the past, a supervisor password had to be set manually or from the factory. Once a supervisor password was set, it could be changed in an automated way leveraging the **Lenovo_SetBiosPassword** WMI class.

- **Disable the TPM Physical Presence for Clear requirement**

No longer requires user interaction if a call to clear the TPM was performed. In other words, no more pressing F9!

## Supported Systems

!!! note ""
    It is expected that this feature will continue to be included in follow-on models.

### ThinkPad

| L-Series | P-Series | T-Series | X-Series |
|----------|----------|----------|----------|
| L13 Gen 1/3 (Intel) | P1 Gen 2/3/4 | T14 Gen 1 (AMD) | X1 Carbon Gen 7/8/9/10 |
| L14 (AMD) | P14s Gen 1 | T14 Gen 1 (Intel) | X1 Extreme Gen 2/3/4/5 |
| L14 Gen 3 (Intel) | P15 Gen 1 | T14s Gen 1 (AMD/Intel) | X1 Nano Gen 1/2 |
| L15 (AMD) | P15s Gen 1 | T15 Gen 1 (Intel) | X1 Yoga Gen 4/5/6/7 |
| L15 Gen 3 (Intel) | P15v Gen 1/2 | T15p Gen 1/2 | X12 Detachable Gen 1 |
| | P16 | T490 | X13 (AMD/Intel) |
| | P17 | T490 (Comet Lake) | X13 Yoga Gen 2/3 |
| | P43s | T590 | X390 (Comet/Whiskey Lake) |
| | P53 | | X390 Yoga |
| | P53s | | |
| | P73 | | |

!!! note ""
   For L14/15 AMD Gen 1 models, be sure to update to the latest BIOS to ensure you have the System Deployment Boot Mode feature.

### ThinkCentre

All 2022 and later products

### ThinkStation

All 2022 and later products

## Activating System Deployment Boot Mode

- Boot the system and press F12 until the boot menu appears
- Press the Delete key. **System Deployment Boot Mode** will appear in the upper right side of the screen. The internal boot device(s) will be removed from the list. This is a security precaution.

![Boot Menu](https://cdrt.github.io/mk_docs/img/reference/sdbm/image1.jpg)

- Select a boot device.
- System Deployment Boot Mode is now active.
- System will exit System Deployment Boot Mode upon the next reboot.

## WMI in System Deployment Boot Mode

PXE boot a system to WinPE, F8 to a command prompt, and start PowerShell. Verify there is no supervisor password set on the system by running the following command:

```powershell
Get-CimInstance -Namespace root/WMI -ClassName Lenovo_BiosPasswordSettings
```

Confirm the **PasswordState** property value is 0

![PasswordState](https://cdrt.github.io/mk_docs/img/reference/sdbm/image2.jpg)

### Setting the Supervisor Password

Run the following commands to set an initial Supervisor Password. Replace *secretpassword* with a password of your choice.

```powershell
$setPw = Get-WmiObject -Namespace root/wmi -Class Lenovo_setBiosPassword
$setPw.SetBiosPassword("pap,secretpassword,secretpassword,ascii,us")
```

![Set Password](https://cdrt.github.io/mk_docs/img/reference/sdbm/image3.jpg)

- **CIM Example**

```powershell
Get-CimInstance -Namespace root/WMI -ClassName Lenovo_SetBiosPassword | Invoke-CimMethod -MethodName SetBiosPassword -Arguments @{ parameter = "pap,secretpassword,secretpassword,ascii,us" }
Get-CimInstance -Namespace root/WMI -ClassName Lenovo_SaveBiosSettings | Invoke-CimMethod -MethodName SaveBiosSettings -Arguments @{ parameter = "secretpassword,ascii,us" }
```

### Check TPM Physical Presence for Clear Status

By default, the TPM Physical Presence for Clear setting is always going to be enabled from the factory. You can verify by running these commands:

```powershell
Get-CimInstance -Namespace root/WMI -ClassName Lenovo_BiosSetting | Where-Object {$_.CurrentSetting -match "PhysicalPresence"} | fl
```

![TPM Physical Presence](https://cdrt.github.io/mk_docs/img/reference/sdbm/image4.jpg)

### Disable TPM Physical Presence for Clear

To disable Physical Presence, run the following commands:

```powershell
$tpmClear = Get-WmiObject -Namespace root\wmi -Class Lenovo_SetBiosSetting
$tpmClear.SetBiosSetting("PhysicalPresenceForTpmClear,Disable")
```

Save the settings using the new Supervisor Password

```powershell
$saveBios = Get-WmiObject -Namespace root\wmi -Class Lenovo_SaveBiosSettings
$saveBios.SaveBiosSettings("secretpassword,ascii,us")
```

![Save Settings](https://cdrt.github.io/mk_docs/img/reference/sdbm/image5.jpg)

### Query SDBM Status

Run the following PowerShell command to verify the **Lenovo_SystemDeploymentBootMode** WMI class is present

```powershell
Get-CimInstance -Namespace root/WMI -Class Lenovo_SystemDeploymentBootMode
```

!!! note
    This particular class was added to 2023 models.

If you want to perform specific actions that require a supervisor password in a ConfigMgr Task Sequence, you can add the following WMI query condition against a step or group that will only execute if the system is in SDBM.

- Namespace: **root\WMI**

```wql
SELECT * FROM Lenovo_SystemDeploymentBootMode WHERE CurrentSetting = 'Enable'
```

## Use With Think Bios Config Tool

### Preparing the Configuration File

You can also use the [Think BIOS Config Tool](https://docs.lenovocdrt.com/guides/tbct/tbct_top/) or higher to apply these changes in your operating system deployment task sequence.  

!!! note ""
   Supported on version 1.28 or higher of the TBCT

On a test system, PXE boot (or USB boot) to WinPE and perform the following:

- Navigate to the directory containing the TBCT and launch it to present the GUI.
- Scroll through the list of available BIOS settings and make any changes to be applied. In this example, we're going to set the PhysicalPresenceForTpmClear setting to Disable

![TBCT-Disable TPM Physical Presence](https://cdrt.github.io/mk_docs/img/reference/sdbm/image6.jpg)

- Scroll back to the top and click the **Export Settings** button.
  - This will output a text file containing the BIOS setting(s) to be changed
- Tick the **Supervisor password set on the target machine** box
  - Leave the password field blank since there's currently no Supervisor Password set
  - Enter an encrypting key (or generate one)
- Tick the **Change Supervisor** password box
  - Enter a Supervisor Password.  (This will be the initial Supervisor Password)
  -Confirm the same password
- A prompt will appear to create a password file for System Deploy Mode. This will only be presented if the Supervisor Password field (above the encrypting key field) is blank.  Click **Yes**.
- A new password file will be output

![TBCT-Export](https://cdrt.github.io/mk_docs/img/reference/sdbm/image7.jpg)

### Applying the Configuration File

To apply the new Supervisor Password and other BIOS settings, perform the following:

- Navigate to the directory containing the TBCT, password .INI, and config .INI.
- Run the first command to set the Supervisor Password

```cmd
ThinkBiosConfig.hta "file=yourpassword.ini" "key=yourencryptingkey"
```

- The second command will apply the BIOS settings using the new Supervisor Password

```cmd
ThinkBiosConfig.hta "file=config.ini"
```

If you open the log you'll see the password change was successful, the config file has been validated using the new Supervisor Password, and the BIOS setting to disable **PhysicalPresenceForTpmClear** was successfully set.

![TBCT-Applied Settings](https://cdrt.github.io/mk_docs/img/reference/sdbm/image8.jpg)

## Confirm the Updated BIOS Configuration

Reboot the system and **F1** to get to the BIOS.  You should be prompted to enter your new Supervisor Password. Navigate to **Security > Password**

The Supervisor Password should now show as Enabled

![BIOS-SVP](https://cdrt.github.io/mk_docs/img/reference/sdbm/image9.jpg)

Now navigate to **Security > Security Chip** and verify the Physical Presence for Clear setting has been toggled to Off.

![BIOS-TPM](https://cdrt.github.io/mk_docs/img/reference/sdbm/image10.jpg)

!!! note ""
   If you're configuring other BIOS settings via WMI on top of what's described above, you should be able to do so in the same WinPE session.  There should be no need to set an initial Supervisor Password, reboot, activate SDB mode again, PXE boot back to WinPE and configure other settings.
