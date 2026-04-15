---
title: Managing Dock Manager with Intune
description: Configure Dock Manager policies in Microsoft Intune using ADMX templates and OMA-URIs for advanced deployment control
---

# Managing Dock Manager with Intune

This page covers advanced configuration of Dock Manager using Microsoft Intune ADMX policies and OMA-URIs. For basic deployment steps, see [Dock Manager Deployment Guide](dm.md).

## Prerequisites

Before configuring Dock Manager policies, you must:

1. **Download the ADMX file** – Available in the Dock Manager section on [Lenovo Tools for Administrators](https://support.lenovo.com/solutions/ht037099)
2. **Create a custom Intune profile** – Navigate to **Devices** > **Windows** > **Configuration Profiles** and create a new **Custom** profile
3. **Ingest the ADMX** – Import the template using the OMA-URI procedure in the [ADMX Ingestion](#admx-ingestion) section below
4. **Understand OMA-URI format** – Each policy is configured via an OMA-URI path and XML value

!!! note ""
    Introduced in the [2208](https://learn.microsoft.com/mem/intune/fundamentals/whats-new-archive#import-create-and-manage-custom-admx-and-adml-administrative-templates) Intune Service release, custom ADMX and ADML templates can be imported, created, and managed directly in Intune.

## Quick Reference

Use this table to quickly find the policy you need:

| Policy Name | Category | Type | Purpose |
|-------------|----------|------|---------|
| **Command** | System | Action | Send commands to Dock Manager (e.g., check for updates) |
| **Ask Before Firmware Update** | General | Boolean | Prompt user before firmware installation |
| **Auto Update** | General | Boolean | Enable automatic Dock Manager software updates |
| **Enable Notifications** | General | Boolean | Show notifications during firmware operations |
| **Firmware White List** | General | String | Restrict firmware updates to approved versions |
| **Hide Update Software Button** | General | Boolean | Remove update button from UI |
| **Log File Age to Cleanup** | General | Integer | Auto-delete log files older than N days |
| **Log File Max Size** | General | Integer | Rotate logs when size exceeds N KB |
| **MAC Address Clone Enabled** | General | Boolean | Enable MAC address cloning feature |
| **Port** | General | Integer | Proxy server port (default 8080) |
| **Proxy Server** | General | String | Proxy address for firmware downloads |
| **Repository Location** | General | String | UNC or local path to firmware repository |
| **Update Firmware on First Connection** | General | Boolean | Auto-update when dock first connects |
| **Update Firmware Without Disconnect** | General | Boolean | Update supported docks without unplugging |
| **Frequency** | Scheduler | Enum | Task schedule frequency (Daily/Weekly/Monthly) |
| **Run At** | Scheduler | Time | Time of day for scheduled task (24-hour format) |
| **Run On** | Scheduler | String | Days of week (Sunday–Friday) |
| **Run Days** | Scheduler | String | Days of month (1–31) for monthly tasks |
| **Run Month** | Scheduler | String | Months (January–December) for monthly tasks |
| **Run Monthly On** | Scheduler | String | Week pattern (First/Second/Last) for monthly tasks |

## Common Configurations

### Scenario 1: Enable Auto-Updates with Weekly Firmware Checks

Check for firmware updates every Sunday at 2:00 AM without user prompts:

**Policies to enable:**

```xml
<!-- Auto-update Dock Manager software -->
<enabled/>
<data id="AutoUpdate_Prompt" value="1"/>

<!-- Weekly firmware check at 2:00 AM Sundays -->
<enabled/>
<data id="Frequency_Dropdown" value="WEEKLY"/>

<enabled/>
<data id="RunAt_Prompt" value="02:00:00"/>

<enabled/>
<data id="RunOn_Prompt" value="Sunday"/>

<!-- Update firmware without user prompts -->
<enabled/>
```

**Apply to policies:** Auto Update, Frequency, Run At, Run On, Ask Before Firmware Update (disabled state)

---

### Scenario 2: Restrict Firmware Versions with White List

Only allow specific firmware versions for supported docks:

```xml
<!-- Whitelist firmware versions by dock model -->
<enabled/>
<data id="FWWhitelist_Prompt" value="40AY:3.0.85,3.0.92;40B0:4.2.15;40AN:2.8.10"/>
```

**Apply to policy:** Firmware White List

**Note:** Dock model codes are 4-character identifiers (see [Supported Docks](index.md#supported-docks))

---

### Scenario 3: Proxy-Based Firmware Download from Internal Repository

Configure Dock Manager to pull firmware from a local network share via proxy:

```xml
<!-- Network repository location -->
<enabled/>
<data id="RepositoryLocation_Prompt" value="\\internal-share\dock-firmware"/>

<!-- Proxy server settings -->
<enabled/>
<data id="ProxyServer_Prompt" value="http://proxy.company.com"/>

<enabled/>
<data id="Port_Prompt" value="3128"/>
```

**Apply to policies:** Repository Location, Proxy Server, Port

---

## ADMX Ingestion

Sign in to the Microsoft Intune [admin center](https://intune.microsoft.com)

Navigate to **Devices** > **Windows** > **Configuration Profiles**. Click **Create**

- Select **New Policy** > **Windows 10 and later** for the platform.
- Select **Templates** for **Profile Type** and choose **Custom** from the list and click **Create**

Enter the required information for the new profile, for example:

- **Name**: Lenovo Dock Manager Configuration

- **Description**: (Optional)

On the **Configuration Settings** screen, click **Add** and enter the following:

- **Name**: Dock Manager ADMX Ingest

- **Description**: (Optional)

- **OMA-URI**: ./Device/Vendor/MSFT/Policy/ConfigOperations/ADMXInstall/DockManager/Policy/DockManager

- **Data Type**: String

- **Value**: Copy the contents of the Dock Manager ADMX file into this field

!!! note
    The **Group Policy Template File** that contains the ADMX can be found under the Dock Manager section on [Lenovo Tools for Administrators](https://support.lenovo.com/solutions/ht037099) page.

## Command Policy

Send commands to Dock Manager for remote management. Currently supports:

- **1** – Check for Dock Manager software updates and install if available

To resend the same command, update the timestamp in `SendTime_Prompt`.

**OMA-URI:**
```
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Command/CommandString
```

**Example – Check for updates:**
```xml
<enabled/>
<data id="CommandString_Prompt" value="1"/>
<data id="SendTime_Prompt" value="2024-06-01 03:12:05Z"/>
```

**To disable:**
```xml
<disabled/>
```

---

## General Policies

### Update Firmware on First Connection

If this setting is enabled, dock will check and update firmware automatically when it connect to the computer for the first time after installing Dock Manager.

```oma-uri
./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/UpdateFWOnFirstConnection
```

Values:

```xml
<enabled/>
```

```xml
<disabled/>
```

## General Policies

### Ask Before Firmware Update

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/AskBeforeFirmwareUpdate`

**Purpose:** Prompt user before installing firmware updates on connected docks.

**Values:**
```xml
<enabled/>    <!-- Show prompt, user can decline -->
<!-- or -->
<disabled/>   <!-- Install firmware silently without prompting -->
```

---

### Auto Update

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/AutoUpdate`

**Purpose:** Enable automatic check for Dock Manager software updates.

**Values:**
```xml
<enabled/>    <!-- Auto-check and install Dock Manager updates -->
<!-- or -->
<disabled/>   <!-- Manual update only -->
```

---

### Enable Notifications

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/EnableNotifications`

**Purpose:** Show user notifications during firmware download and update operations.

**Values:**
```xml
<enabled/>    <!-- Display notifications -->
<!-- or -->
<disabled/>   <!-- Silent operation, no notifications -->
```

---

### Firmware White List

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/FWWhiteList`

**Purpose:** Restrict firmware updates to approved versions only. Devices can only upgrade to whitelisted versions.

**Format:** `DOCK_TYPE:VERSION1,VERSION2;OTHER_TYPE:VERSION3`

**Example:**
```xml
<enabled/>
<data id="FWWhitelist_Prompt" value="40AY:3.0.85,3.0.92;40B0:4.2.15;40AN:2.8.10"/>
```

!!! note ""
    Dock types are 4-character codes found on the dock label or in the [Supported Docks](index.md#supported-docks) list.

---

### Hide Update Software Button

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/HideUpdateSoftwareButton`

**Purpose:** Remove the update button from the Dock Manager UI.

**Values:**
```xml
<enabled/>    <!-- Hide button -->
<!-- or -->
<disabled/>   <!-- Show button -->
```

---

### Log File Age to Cleanup

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/LogfileAgeToCleanup`

**Purpose:** Automatically delete log files older than the specified number of days.

**Example – Delete logs older than 30 days:**
```xml
<enabled/>
<data id="LogfileAgeToCleanup_Prompt" value="30"/>
```

---

### Log File Max Size

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/LogfileMaxSize`

**Purpose:** Rotate log files when they exceed the specified size in KB.

**Example – Rotate when logs reach 1024 KB (1 MB):**
```xml
<enabled/>
<data id="LogfileMaxSize_Prompt" value="1024"/>
```

---

### MAC Address Clone Enabled

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/MacAddressCloneEnabled`

**Purpose:** Enable or disable MAC address cloning functionality on supported docks.

**Values:**
```xml
<enabled/>    <!-- Enable MAC cloning -->
<!-- or -->
<disabled/>   <!-- Disable MAC cloning -->
```

---

### Port

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/Port`

**Purpose:** Configure the proxy server port for firmware downloads.

**Example – Use port 3128:**
```xml
<enabled/>
<data id="Port_Prompt" value="3128"/>
```

---

### Proxy Server

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/ProxyServer`

**Purpose:** Configure a proxy server address for downloading firmware over a corporate proxy.

**Example:**
```xml
<enabled/>
<data id="ProxyServer_Prompt" value="http://proxy.company.com"/>
```

---

### Repository Location

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/RepositoryLocation`

**Purpose:** Specify where Dock Manager should download firmware (internet or local repository).

**Example – Network share:**
```xml
<enabled/>
<data id="RepositoryLocation_Prompt" value="\\internal-share\dock-firmware"/>
```

**Example – Local path:**
```xml
<enabled/>
<data id="RepositoryLocation_Prompt" value="C:\dock-firmware"/>
```

---

### Update Firmware on First Connection

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/UpdateFWOnFirstConnection`

**Purpose:** Automatically update dock firmware when a dock is connected for the first time after Dock Manager installation.

**Values:**
```xml
<enabled/>    <!-- Auto-update on first connection -->
<!-- or -->
<disabled/>   <!-- Manual update only -->
```

---

### Update Firmware Without Disconnect

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~General/UpdateFWWithoutDisconnect`

**Purpose:** Allow specified dock models to update firmware without disconnecting from the computer (if supported by dock firmware version).

!!! warning ""
    Only enable this after upgrading docks to a supported firmware version that handles live updates.

**Example – Enable for Thunderbolt 3 Dock Gen 2:**
```xml
<enabled/>
<data id="UpdateFWWithoutDisconnect_Prompt" value="40AN"/>
```

**Example – Multiple dock types:**
```xml
<enabled/>
<data id="UpdateFWWithoutDisconnect_Prompt" value="40AN,40B0,40B7"/>
```

---

## Scheduler Policies

!!! note ""
    Configure these policies together to define when Dock Manager checks for and updates firmware. These policies are interdependent based on the **Frequency** setting:
    
    - **DAILY** – Uses only **Run At**
    - **WEEKLY** – Uses **Run At** + **Run On** (days of week)
    - **MONTHLY** – Uses **Run At** + **Run Month** + **Run Days**, OR **Run At** + **Run Monthly On** + **Run On**

### Frequency

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/Frequency`

**Purpose:** Set how often the firmware check runs: Daily, Weekly, or Monthly.

**Values:**
```xml
<enabled/>
<data id="Frequency_Dropdown" value="WEEKLY"/>
<!-- Options: DAILY, WEEKLY, MONTHLY -->
```

---

### Run At

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunAt`

**Purpose:** Set the time of day (24-hour format) when the scheduled task runs.

**Example – 2:00 AM:**
```xml
<enabled/>
<data id="RunAt_Prompt" value="02:00:00"/>
```

---

### Run On

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunOn`

**Purpose:** Specify days of the week for the task (used with WEEKLY or MONTHLY frequency).

**Example – Sunday and Friday:**
```xml
<enabled/>
<data id="RunOn_Prompt" value="Sunday,Friday"/>
```

---

### Run Days

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunDays`

**Purpose:** Specify days of the month (1–31) when the task runs (MONTHLY frequency only).

**Example – 1st and 15th of each month:**
```xml
<enabled/>
<data id="RunDays_Prompt" value="1,15"/>
```

---

### Run Month

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunMonth`

**Purpose:** Specify which months the task runs (MONTHLY frequency only).

**Example – Every other month (Jan, Mar, May, Jul, Sep, Nov):**
```xml
<enabled/>
<data id="RunMonth_Prompt" value="January,March,May,July,September,November"/>
```

---

### Run Monthly On

**OMA-URI:** `./Device/Vendor/MSFT/Policy/Config/DockManager~Policy~LenovoCompany~DockManager~Scheduler/RunMonthlyOn`

**Purpose:** Specify week pattern for monthly tasks (e.g., "First Monday", "Last Friday"). Used with **Run On**.

**Example – First and Last day of the month:**
```xml
<enabled/>
<data id="RunMonthlyOn_Prompt" value="First,Last"/>
```

**Example – First and second Tuesday (used with `RunOn: Tuesday`):**
```xml
<enabled/>
<data id="RunMonthlyOn_Prompt" value="First,Second"/>
```

---

## Format Reference

| Setting | Format | Examples |
|---------|--------|----------|
| **Time** (Run At) | 24-hour HH:MM:SS | `02:00:00`, `14:30:00`, `23:59:59` |
| **Days of Week** (Run On) | Full day names, comma-separated | `Monday,Friday` / `Sunday` |
| **Days of Month** (Run Days) | Numbers 1–31, comma-separated | `1,15` / `5` |
| **Months** (Run Month) | Full month names, comma-separated | `January,March,May` / `December` |
| **Week Pattern** (Run Monthly On) | First/Second/Third/Fourth/Last, comma-separated | `First,Last` / `Second` |
| **Dock Types** | 4-character code (dock label) | `40AY`, `40B0`, `40AN,40B7` |
| **Dock Firmware** | Version numbers, comma-separated | `3.0.85,3.0.92` |
| **Frequency** | Enum: DAILY, WEEKLY, MONTHLY | `WEEKLY` |
| **Port** | Integer | `3128`, `8080`, `80` |
| **Path** | UNC or local | `\\share\path` / `C:\path` |
| **URL** | HTTP or HTTPS | `http://proxy.company.com` |
