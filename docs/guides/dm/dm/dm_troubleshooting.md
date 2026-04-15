---
title: Dock Manager Troubleshooting
description: Troubleshoot Dock Manager scheduled task deployment issues and verification steps
---

# Dock Manager Troubleshooting

## Scheduled Task Does Not Launch

### Background & Problem

Dock Manager checks the new firmware in the repository at a scheduled time. IT admins can use Windows Group Policy to push scheduling settings to client's PCs.​

- Refer to [User Manual](https://download.lenovo.com/consumer/options/dockmanager_user_manual.pdf) , section 5.5.​

Sometimes customer's may encounter an issue that the scheduled firmware checking task does not launch at an expected time.​ This document will explain how to troubleshoot the issue.

### Critical Steps for Troubleshooting

1. On a domain controller, check Group Policy Management Editor to make sure group policy settings are properly configured.
2. On a client PC, check registry to make sure group policy settings are properly deployed.
3. On a client PC, check Task Scheduler to make sure scheduled task exists.   

#### Troubleshooting

The following example is based on a weekly firmware checking task is set to run at **6:05 am** on **every Monday and Tuesday**.

#### Check Group Policy

1. IT admins should first check Group Policy settings on domain controller.

	![Group Policy settings dialog showing Dock Manager scheduling frequency option](https://cdrt.github.io/mk_docs/img/guides/dm/ts1.PNG)

2. Make sure **Frequency** is set to **Enabled** and configured as Weekly.

	![Group Policy dialog showing frequency set to Weekly](https://cdrt.github.io/mk_docs/img/guides/dm/ts2.PNG)

3. Make sure **RunOn** is set to **Enabled** and configured as **MONDAY, TUESDAY**.

	![Group Policy dialog showing RunOn schedule set to Monday and Tuesday](https://cdrt.github.io/mk_docs/img/guides/dm/ts3.PNG)

4. Make sure **RunAt** is set to **Enabled** and configured as **06: 05:00**.

	![Group Policy dialog showing RunAt time set to 06:05:00](https://cdrt.github.io/mk_docs/img/guides/dm/ts4.PNG)

#### Check the Registry

IT admins should then check the registry on a client PC where the issue can be replicated. In the illustrated path, make sure **Frequency**, **RunAt** and **RunOn** exists with correct values. Refer to the screenshot below:

![Registry editor showing Dock Manager policy settings (Frequency, RunAt, RunOn) with values](https://cdrt.github.io/mk_docs/img/guides/dm/ts5.PNG)

#### Check Task Scheduler

As the last steps, IT admins should check Task Scheduler on the same client PC.

1. Right click **Run as administrator** to launch Task Scheduler.

	- Task Scheduler should be launched with elevated privileges otherwise some tasks may not be shown.

	![Task Scheduler Run as administrator context menu option](https://cdrt.github.io/mk_docs/img/guides/dm/ts6.PNG)

2. Make sure a task named **DockManager – Task Scheduler** is under the illustrated folder.

3. Make sure **Triggers** is configured correctly. Refer to the screenshot:

	![Task Scheduler showing DockManager task with weekly triggers for Monday and Tuesday](https://cdrt.github.io/mk_docs/img/guides/dm/ts7.PNG)

4. Check **Last Run Time** and **Last Run Result** to find more details and possible cause.

---

!!! summary "Troubleshooting Approach"
    In Dock Manager, scheduled firmware checking task failing to run is normally caused by improperly deployed group policy settings. When the issue happens, verify settings at each level:

    - **Group Policy Management Editor** – on domain controller  
    - **Registry** – on client PC  
    - **Task Scheduler** – on client PC
