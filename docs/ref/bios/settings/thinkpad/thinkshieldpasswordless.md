# ThinkShield Passwordless Power-On

![ThinkShield Passwordless Power-On](https://cdrt.github.io/mk_docs/ref/bios/settings/thinkpad/img/tp_thinkshieldpasswordless.png)

ThinkShield Passwordless Power-On
:  Whether to enable the ThinkShield Passwordless Power-On Authentication and Device Manager.

    Possible options:

    1. **On** – Default.
    2. Off

    | WMI Setting name | Values | Locked by SVP | AMD/Intel |
    |:---|:---|:---|:---|
    | ThinkShieldPasswordlessPowerOnAuthentication | Disable, Enable | Yes | Both |

This feature works as an alternative to password-based authentication to achieve passwordless authentication. This feature only works when a power-on password is set in UEFI BIOS and the FIDO2 USB device is registered in ThinkShield™ Passwordless Power-On Device Manager. With this feature, you can input the power-on password or use the registered FIDO2 USB device to power on your computer.

## Register your FIDO2 USB device in ThinkShield Passwordless Power-On Device Manager

1. Turn on the computer.

1. Press F12 during the power-on process.

1. If you set a power-on password, you are prompted to enter the correct password.

1. Select App Menu > ThinkShield Passwordless Power-On Device Manager and press Enter.

1. Insert the FIDO2 USB device to register the device by following steps:

    1. Select the available FIDO2 USB device that you want to register in the Discovered Devices field.

    1. Click Yes in the displayed window to confirm the device you selected.

    1. If you set a power-on password, you are prompted to enter the correct password.

    1. The User operation request window is displayed. You are prompted to press the button on the connected FIDO2 USB device, and then follow the on-screen instruction to close the window.

    1. Press ESC to exit and restart your computer.

!!! note ""
    * If you want to unregister your devices, click the available FIDO2 USB device that you want to unregister in the My Device field and enter the correct power-on password for verification.

    * If you use more than one FIDO2 USB device with a common identifier for registration, only one device is available.

## Log in to the System with Passwordless Power-On Authentication

1. Restart the computer.

1. ThinkShield Passwordless Power-On Authentication window is displayed.

1. Insert your registered FIDO2 USB device for detection.

1. Then follow the on-screen instruction to press the button on your FIDO2 USB device for verification.

1. After your device is verified, the power-on process continues.

!!! warning ""
    You should insert the FIDO2 USB device or enter the power-on password within 60 seconds. Otherwise, your computer will shut down automatically.

Here is a video walk-through of the process:

[ThinkShield Passwordless Power On](https://download.lenovo.com/cdrt/video/ThinkShieldPasswordlessPowerOn.mp4 ":include :type=video controls width=100%")
