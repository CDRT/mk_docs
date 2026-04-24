---
title: Dock Manager FAQ
description: Frequently asked questions about Dock Manager deployment, firmware updates, and supported hardware
---

# Dock Manager FAQ

!!! question "Why is Dock Manager not showing the firmware version of the connected dock?"
    This can occur right after Dock Manager is installed. For older docks, Dock Manager must first download the firmware update package for that dock so it can use the firmware update tool in the package to get the current firmware version on the attached dock. If Dock Manager is configured to pull from a local repository, make sure the appropriate packages are in the repository for your targeted docks.

!!! question "What happens if Dock Manager cannot reach the internet to download firmware?"
    Dock Manager can pull firmware from either an internet connection or a local repository created with Update Retriever. If internet access is not available, configure Dock Manager to use a local network repository. See the [Dock Manager Deployment Guide](dm.md) for repository configuration options.

!!! question "How do I check the current firmware version of an attached dock?"
    Dock Manager displays the current dock firmware version in the application UI once it has downloaded the appropriate firmware package for that dock model. You can also query the WMI data exposed by Dock Manager in root\Lenovo\Dock_Manager to retrieve firmware version information programmatically.

!!! question "Is Dock Manager supported on ARM-based devices?"
    Dock Manager currently runs on Windows 10/11 64-bit x86/x64 systems. ARM-based devices are not currently supported. Refer to the system requirements in the User Manual or Deployment Guide for the latest supported platforms. 
    For new docks released in 2021, Dock Manager can read the firmware version directly and does not have this limitation.

## Additional Questions

If your question is not answered here, visit the [Lenovo Community Forums](https://support.lenovo.com/en_US/forums) for additional support and to connect with other users.


