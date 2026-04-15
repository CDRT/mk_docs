---
title: Overview
description: Deploy and manage Lenovo Dock Manager for automated dock firmware updates across your organization using ConfigMgr, Intune, and WMI integration
---

# Dock Manager Overview

Lenovo Dock Manager reduces the effort IT administrators spend on large-scale deployment of Lenovo dock firmware updates. This solution runs on your PC and maintains a cache of the current firmware versions for supported Lenovo docks. When a dock is attached that has down-level firmware, it is automatically updated by Dock Manager.

## Getting Started

<div class="grid cards" markdown>

- **:material-book: Deployment Guide**  
    Deploy Dock Manager with Microsoft Configuration Manager and Intune, including installation commands and detection rules.  
    [Read guide](dm.md)

- **:material-cog: Intune Management**  
    Configure Dock Manager policies in Intune using ADMX templates and OMA-URIs for advanced configuration control.  
    [Learn more](dm_manage_intune.md)

- **:material-tools: Troubleshooting**  
    Troubleshoot common Dock Manager issues, including scheduled task deployment failures.  
    [Troubleshoot](dm_troubleshooting.md)

- **:material-help-circle: FAQ**  
    Find answers to frequently asked questions about Dock Manager deployment and firmware updates.  
    [View FAQ](dock_manager_faq.md)

</div>

## Resources

Official resources and documentation:

- [Lenovo Dock Manager Overview video](https://support.lenovo.com/videos/nvid500262)
- [Firmware Updates and Information Queries video](https://support.lenovo.com/videos/nvid500261)
- [Configuration and Deployment video](https://support.lenovo.com/videos/nvid500260)
- [Dock Manager and User Guide download](https://support.lenovo.com/us/en/solutions/ht037099#dm)

## Key Features

Dock Manager can automatically download firmware updates from Lenovo Support directly over the Internet or from a local repository on your network (created and maintained using Update Retriever).

The application records dock data into WMI (`root\Lenovo\Dock_Manager`) for administrators to query remotely:

- Dock Machine Type
- Firmware Version
- MAC Address
- Connected Devices (Monitors, USB Devices)

The four-character "machine type" for supported docks can be used in Update Retriever when searching for the latest firmware packages.

## Supported Docks

| Dock Model | Machine Type |
|------------|--------------|
| ThinkPad Universal USB-C Dock v2 | [40B7](https://support.lenovo.com/solutions/acc500295) |
| ThinkPad Thunderbolt 4 Workstation Dock | [40B0](https://pcsupport.lenovo.com/accessories/pd500533) |
| ThinkPad Universal Thunderbolt 4 Dock | [40B0](https://support.lenovo.com/solutions/pd500503) |
| ThinkPad Universal USB-C Dock | [40AY](https://support.lenovo.com/solutions/pd500519) |
| ThinkPad Thunderbolt 3 Essential Dock | [40AV](https://support.lenovo.com/solutions/PD500373) |
| ThinkPad Thunderbolt 3 Dock Gen 1 | [40AC](https://support.lenovo.com/solutions/ACC100356) |
| ThinkPad Thunderbolt 3 Dock Gen 2 | [40AN](https://support.lenovo.com/solutions/PD500265) |
| ThinkPad Thunderbolt 3 Workstation Dock Gen 2 | [40AN](https://support.lenovo.com/solutions/PD500333) |
| ThinkPad USB-C Dock Gen 1 | [40A9](https://support.lenovo.com/solutions/ACC100348) |
| ThinkPad USB-C Dock Gen 2 | [40AS](https://support.lenovo.com/solutions/ACC500106) |
| ThinkPad USB-C with USB-A Dock | [40AF](https://support.lenovo.com/solutions/PD500180) |
| Lenovo USB-C Dock | [40B5](https://pcsupport.lenovo.com/accessories/acc500276) |

!!! note "Last Updated"
    This documentation reflects Dock Manager support as of 2024. For new dock models or updates, check the Lenovo Support page.
