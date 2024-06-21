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

ThinkShield Secure Wipe is a feature in the BIOS that reliably deletes all data from a drive without the need for external tools.

Any hard drive (HD) password will be deleted by this process.

### How to use ThinkShield Secure Wipe?

Secure Wipe sub menu is located at the bottom of the Security page (BIOS Setup Option).  By default, it is enabled and is protected by SVP.  It is supported by WMI and SRSETUP; WMI item name is “ThinkShieldsecurewipe.”

Please use “ThinkShield Secure Wipe” feature for ThinkPad 2019 or later models by following below steps:

1. Reboot the system
2. Press F12 key to load BIOS boot menu
3. Press tab to switch to App Menu
4. Select "ThinkShield Secure Wipe" from the list
5. Follow on-screen instructions to wipe the disk

### What Methods are Supported by ThinkShield Secure Wipe?

ThinkShield Secure Wipe supports several different methods to delete data from the drive:

- ATA Secure Erase (recommended method)
- ATA Cryptographic Key Reset (recommended method)
- US DoD 5520.22-M
- Single Pass Zeros
- US Navy & Air Force
- CSE Canada ITSG-06
- British HMB Infosec Standard 5, Enhanced
- German VSITR
- Russian GOST P50739-95 Level 1
- Russian GOST P50739-95 Level 4
- RCMP TSSIT OPS-II

### Is this Tool Compliant with NIST SP 800-88?

It depends on which algorithm is used, but if the recommended methods are used – the feature meets the NIST SP800-88 requirements.

!!! warning ""
    NIST SP800-88 defines “sanitization” as “a process that renders access to target data on the media infeasible for a given level of effort.”

### What ThinkPad Models Include ThinkShield Secure Wipe Feature?

ThinkShield Secure Wipe is available on 2019 and newer ThinkPads models.

For specific questions on skus, please contact your Lenovo rep.

### Are There Any Upcoming Changes and Enhancements?

ThinkShield Secure Wipe 2.0 will include logging to allow users to export proof that the SDD/HDD was wipe successfully.  

Users will be able to scan a QR code to retrieve the Secure Wipe Certificate that includes:

- Hardware information
- Storage Device information
- Erase information

![QR Code](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/thinkshieldsecurewipeEx.png)
