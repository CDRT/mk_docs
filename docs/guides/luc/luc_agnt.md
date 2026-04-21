---
title: Lenovo Updates Catalog Agent
description: Overview of the Lenovo Updates Catalog Agent, its functionality, installation, and version history.
---

# Lenovo Updates Catalog Agent

## Overview

This page explains the functionality, installation, and operational impact of the Lenovo Updates Catalog Agent.

## Understanding the Agent

### Why is it Needed?

When installing driver updates, it is imperative to determine if the update is applicable to a managed endpoint.  The data required to determine applicability is located in many places, including but not limited to WMI, the file system, and the registry.  The Lenovo Updates Catalog Agent creates a centralized location in WMI for all driver data to be queried when determining update applicability.

### What Does it Do?

The Lenovo Updates Catalog Agent is a light weight service installed to each Lenovo ThinkCentre, ThinkPad, or ThinkStation managed endpoint.  When executed, the service creates the Root\Lenovo\drivers WMI namespace and creates the Win32_PNPSignedDriverEx WMI class under the Root\Lenovo\drivers namespace.  The WMI class gets populated with driver data pulled from different sources on the endpoint. The data in the WMI class is used during the scanning and evaluation of Lenovo updates from the WSUS server.

### How Do Updates Use the WMI Information?

All updates contain IsInstalled and IsInstallable rules to evaluate applicability.  The Lenovo Updates Catalog contains all the metadata in the form of queries to determine the applicability of the Driver and Software Utility updates.  The data aggregated by the Lenovo Updates Catalog Agent and placed into the WMI class is leveraged by the IsInstalled and IsInstallable applicability rules from the catalog.  All Lenovo Updates perform a check against the Manufacturer and BIOS versions to target the correct model.  For more specific targeting, Lenovo Updates can also leverage checks against PNPID/HardwareID information, driver versions, or driver dates, specific BIOS Versions, OS Versions, OS Build, and OS Architecture.  The checks against the PNPID/HardwareID information, driver versions, or driver dates use the data from the Win32_PNPSignedDriverEx class during evaluation.

### What Triggers the Agent to Run?

The 2 triggers that cause the Lenovo Updates Catalog Agent to run are the Software Updates Scan Cycle or Software Updates Deployment Evaluation Cycle.  These cycles can be initiated in multiple ways: by the Configuration Manager Client Settings schedule, manually starting from a device or collection from  within the Configuration Manager console, or manually running them from the Configuration Manager Client Actions on the local device.  These cycles ultimately cause the Windows Update Agent to start, which then causes the Lenovo Updates Catalog Agent to populate the WMI Class.

## Installation & Setup

### Finding the Agent in Configuration Manager

After subscribing and synchronizing the Lenovo Updates Catalog in Configuration Manager, in the console, navigate to Administration > Overview > Site Configuration > Sites. Click on the Site Server and, in the ribbon bar, click the Configure Site Components button and select Software Update Point. In the Software Update Point Component Properties dialog, click the Products tab. In the Products tree, check the box beside Lenovo, Lenovo Updates, and LUCAgent. Click OK.

![Software Update Point Component Properties – Products tab](https://cdrt.github.io/mk_docs/img/guides/luc/luc_luca_01.png)

Navigate back to the Software Library > Overview > Software Updates > All Software Updates workspace. Click the Synchronize Software Updates button in the ribbon bar. When the synchronization is complete, the Lenovo Updates Catalog Agent 1007 will display in the All Software Updates workspace as metadata only, as indicated by the blue arrow in the icon column.

![All Software Updates node showing LUCAgent1007 metadata](https://cdrt.github.io/mk_docs/img/guides/luc/luc_luca_02.png)

### Deploying the Agent

The Lenovo Updates Catalog Agent installs silently to devices and is deployed just like any other software update. Since the agent is a prerequisite to deploying Lenovo Update Catalog updates, it should only be installed on Lenovo ThinkCentre, ThinkPad, or ThinkStation devices.

## Operations

### Impact on Compliance Reporting

To report on compliance information for Lenovo Updates in Configuration Manager, the Lenovo Updates Catalog Agent must be installed on the managed endpoints and the updates of interest must be published to WSUS and synchronized to Configuration Manager.  Prior to the evaluation of Lenovo Updates, the 'Unknown' column (you may have to show this column) in the console under the All Software Updates node, will display a fairly high count of endpoints. After the updates are scanned or the updates are deployed, the results are fed back to the console and will show in other columns; 'Required', 'Installed', or 'Not Required' (you may have to show these columns).  These results can be slow to populate due to the frequency of Summarization in Configuration Manager.

## Version History

| Version | Changes |
|---------|----------|
| LUCAgent1007 (Current) | Resolves potential WMI errors, removes WMI Class on uninstall, resolves MOFComp detection errors |
| LUCAgent1006 | Improved resilience and functionality during upgrade scenarios |
| LUCAgent1005 | Resolves high CPU utilization during Software Updates Scan or Deployment Evaluation cycles |
| LUCAgent1003.1 | Initial release |

