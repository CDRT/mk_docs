# Startup Menu

## Overview

When you power on a Lenovo ThinkPad, you will see this message:  "To interrupt normal startup, press Enter."  The message may appear very quickly so have to be ready for it. Also, on systems with Fast Startup enabled you may not see it at all. In this case, if you hold the Shift key while clicking on Shutdown in Windows, you will achieve a full power off. Then when you power on again, you will see the message.

When you press Enter at that point, the system will display a Startup Interrupt Menu as shown below.

![BIOS Startup Menu](https://cdrt.github.io/mk_docs/img/reference/bios/startup_menu.png)

There are several useful features available from here beyond just the usual BIOS Setup Utility or Boot menu. The following will describe each of the options. Notice that each option begins with the key to press to activate that option. Alternatively, you can also press these keys at the "To interrupt normal startup..." message to skip the menu and go directly to the feature.

!!! note
    Not all features listed here will be available on all models. The options may vary.

## ESC to resume normal startup

This option will close the menu and proceed to boot the system normally.

## F1 to enter the BIOS Setup Utility

This option will take you into the BIOS Setup Utility interface where you can adjust the BIOS settings.

## F4 to Lenovo Memory Self Repair

This initiates a process where the system will isolate bad memory cells to ensure proper operation.

## F5 to show Asset Information

This will display a page of asset information for the system with a QR code that makes it easy to capture and share. This can very useful during intial deployment or during support scenarios where the operating system is not available to boot.

![Asset Information](https://cdrt.github.io/mk_docs/img/reference/bios/asset_info.png)

!!! note
    In the image abvoe the serial number is blurred out and the QR code has been replaced with one that points to this website.

## F9 to show Regulatory Information

This will display a page depicting all of the regulatory compliance details for the system.

![Regulatroy Informaiton](https://cdrt.github.io/mk_docs/img/reference/bios/regulatory.png)

## F10 to diagnose hardware

This option will open the UEFI Diagnostics application that allows you to run various diagnostic tests on the system.

## F11 to recover your system

This option will boot into WinRE (Recovery Environment) and provide options for repairing the Windows installation on the system.

## F12 to choose a temporary startup device

This option will display a list of possible boot options such as USB HDD or Network. It will also provide the option to switch the the Apps Menu for other options.
