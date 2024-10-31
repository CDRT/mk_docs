# ThinkShield Secure Wipe Settings

![Secure Wipe](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_thinkshieldsecurewipe.png)

ThinkShield Secure Wipe in AppMenu
:  Whether to enable the ThinkShield secure wipe in the App Menu Invoked by F12.

    Possible options:

    1. **On** – Default.
    2. Off

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | ThinkShieldsecurewipe | Disable, Enable | Yes | Both |

## FAQ

### What is ThinkShield Secure Wipe?

ThinkShield Secure Wipe is a utility program integrated into the BIOS. It off ers the functionality to erase all contents stored on drives attached to the system internally. Users can select an erase algorithm from the list, depending on their needs. **ThinkShield
Secure Wipe complies with NIST SP 800-88 Revision 1 - Guidelines for Media Sanitization.**

Any hard drive (HD) password will be deleted by this process.

### How to use ThinkShield Secure Wipe?

Secure Wipe sub menu is located at the bottom of the Security page (BIOS Setup Option).  By default, it is enabled and is protected by SVP.  It is supported by WMI and SRSETUP; WMI item name is “ThinkShieldsecurewipe.”

Please use “ThinkShield Secure Wipe” feature for ThinkPad 2019 or later models by following below steps:

1. Press the [Enter] key rapidly when the Lenovo logo appears on the screen at startup to launch the Startup Interrupt Menu.
2. Press the [F12] key at the Startup Interrupt Menu to make the Boot Menu / App Menu appear.
3. Click [App Menu] from left column and choose [ThinkShield Secure Wipe] from the right column.

	!!! note
		If the ‘ThinkShield Secure Wipe’ selection does not appear in the App menu, confirm whether ThinkShield Secure Wipe is enabled in the Security options within the BIOS Setup Utility. The default setting is ‘On’ (enabled).
	 
4. Select the storage device to be erased. Please note that the selection is based on the  entire storage unit, not on a partition basis. After confirming the storage device to be erased, click [NEXT >] at the bottom.
5.  Select an erase method and click [NEXT >]. You can choose from erasure methods(*),  including those commonly used for data deletion - ATA Secure Erase (Secure Erase) and  Enhanced Secure Erase. The erase methods available for selection may vary depending on the type and condition of the installed storage.
6. If the hard disk password has been set, you will be prompted to enter the password. If you enter the wrong password three times, ThinkShield Secure Wipe will be terminated.
7. Once you choose the wipe-out method, the following warning message is displayed before proceeding to wipe out. Please carefully read it and ensure that power loss will not occur during the wipe-out process.
8. If everything is OK, the ThinkShield Secure Wipe starts with the progress indication as below. Do not power off the system during the wipe. The time required to complete the secure wipe varies depending on the storage type, size, and wipe method.
9. When the wipeout completes successfully, the following message appears with some information such as drive information, start time, and end time.

!!! note
    To proceed with the ThinkShield Secure Wipe, the remaining battery capacity must be greater than 25%. Otherwise, an error will be displayed.

### What Wipe Methods are Supported by ThinkShield Secure Wipe?

ThinkShield Secure Wipe supports several different methods to delete data from the drive:

| Wipe Method | Target storage device | Command used | Sanitization method <br>defined in the <br>NIST SP 800-88 Rev.1 |
|---|---|---|---|
| TCG Opal Revert to Factory Default | Opal SSD | TCG Opal Revert command on the Admin SP | Purge |
| TCG Opal PSID Revert | Opal SSD | TCG Opal Revert command with the PSID<br>(Physical Presence SID) | Purge |
| Erase NVMe Cryptographic Keys | NVMe SSD | NVMe Format NVM command<br>(Cryptographic Erase) | Purge |
| Erase all NVMe User Space | NVMe SSD | NVMe Format NVM command<br>(User Data Erase) | Purge |
| ATA SECURE ERASE | ATA SSD | ATA SECURITY ERASE UNIT<br>(normal erase mode) | Clear |
| ATA Cryptographic Key Reset | ATA SSD | ATA SECURITY ERASE UNIT<br>(enhanced erase mode) | Clear |
| ATA Cryptographic Key Reset | ATA HDD | ATA SECURITY ERASE UNIT<br>(enhanced erase mode) | Purge |

### Can users View and Clear the Wipe Log?

In some series of products, it is possible to accumulate logs of wipe results and display detailed information. To view the log, select [View Wipe Log] on the storage selection screen after launching the ThinkShield Secure Wipe, or on the wipe completion screen. From the [Wipe Log] screen, you can view information such as the device’s MTM (Machine Type and Model), serial number, storage device information, erase details including the erase method, and time. Additionally, in some product series, the log can be exported through a displayed QR code.

Click the [Clear Wipe Log] button to clear the stored wipe logs. If a Supervisor Password or System Management Password is set, entering the password is required to clear the wipe log.

### What ThinkPad Models Include ThinkShield Secure Wipe Feature?

ThinkShield Secure Wipe is available on 2019 and newer ThinkPads models.

For specific questions on skus, please contact your Lenovo rep.

### How to find more information on ThinkShield Secure Wipe?

[ThinkShield Secure Wipe Technical Whitepaper](../../../../static/Secure%20Wipe%20280324.pdf){:download}

[ThinkShield Secure Wipe blog article](https://blog.lenovocdrt.com/thinkshield-secure-wipe/)
