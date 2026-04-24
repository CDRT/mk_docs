---
title: Dock Manager Troubleshooting
description: Troubleshoot Dock Manager scheduled task deployment issues and verification steps
---

# Dock Manager Troubleshooting

## Scheduled Task Does Not Launch

??? note "Background"

    Dock Manager checks for new firmware in the repository at a scheduled time. IT admins use Windows Group Policy to push scheduling settings to client PCs. Refer to the [User Manual](https://download.lenovo.com/consumer/options/dockmanager_user_manual.pdf), section 5.5.

    Sometimes scheduled firmware checking tasks fail to launch at the expected time. The issue is typically caused by improperly deployed group policy settings.

### What to Check

When troubleshooting scheduled task failures, verify settings at each level in this order:

1. [**Group Policy Management Editor**](#check-group-policy-settings) – on domain controller  
2. [**Registry**](#check-registry-settings) – on client PC  
3. [**Task Scheduler**](#check-task-scheduler) – on client PC

The following example uses a weekly firmware checking task set to run at **6:05 AM** on **every Monday and Tuesday**.

### Check Group Policy Settings

On the domain controller, verify these settings in Group Policy Management Editor:

1. **Frequency** should be **Enabled** and set to **Weekly**

	![Group Policy settings dialog showing Dock Manager scheduling frequency option](https://cdrt.github.io/mk_docs/img/guides/dm/ts1.PNG)

	![Group Policy dialog showing frequency set to Weekly](https://cdrt.github.io/mk_docs/img/guides/dm/ts2.PNG)

2. **RunOn** should be **Enabled** and set to **MONDAY, TUESDAY**

	![Group Policy dialog showing RunOn schedule set to Monday and Tuesday](https://cdrt.github.io/mk_docs/img/guides/dm/ts3.PNG)

3. **RunAt** should be **Enabled** and set to **06:05:00**

	![Group Policy dialog showing RunAt time set to 06:05:00](https://cdrt.github.io/mk_docs/img/guides/dm/ts4.PNG)

### Check Registry Settings

On the client PC where the issue occurs, check the registry for the Dock Manager policy settings. Verify that **Frequency**, **RunAt**, and **RunOn** exist with the correct values matching your Group Policy settings:

![Registry editor showing Dock Manager policy settings (Frequency, RunAt, RunOn) with values](https://cdrt.github.io/mk_docs/img/guides/dm/ts5.PNG)

### Check Task Scheduler

On the same client PC, verify the scheduled task in Task Scheduler:

1. Right-click **Task Scheduler** and select **Run as administrator** – elevated privileges are required to see all tasks

	![Task Scheduler Run as administrator context menu option](https://cdrt.github.io/mk_docs/img/guides/dm/ts6.PNG)

2. Verify that a task named **DockManager – Task Scheduler** exists in the expected folder

3. Check the **Triggers** tab to confirm the task is scheduled correctly (weekly on Monday and Tuesday in this example)

	![Task Scheduler showing DockManager task with weekly triggers for Monday and Tuesday](https://cdrt.github.io/mk_docs/img/guides/dm/ts7.PNG)

4. Review **Last Run Time** and **Last Run Result** for additional details and possible causes of failures

---

!!! summary "Troubleshooting Summary"
    Scheduled firmware checking task failures are usually caused by improperly deployed group policy settings. Always verify settings in order:

    - **Group Policy Management Editor** (domain controller) → **Registry** (client PC) → **Task Scheduler** (client PC)
