---
title: ThinkVantage Repository Manager
description: GUI tool and PowerShell module for building and maintaining local Lenovo update repositories as a replacement for ThinkVantage Update Retriever.
---

# ThinkVantage Repository Manager

ThinkVantage Repository Manager (TVRM) is a WPF graphical interface and PowerShell module for building, maintaining, and publishing local Lenovo device update repositories. It replaces ThinkVantage Update Retriever with a modern, scriptable workflow that supports multiple repositories, per-model targeting, digital signature verification, and an audit trail.

The tool ships as a single PowerShell script (`ThinkVantageRepositoryManager.ps1`) that wraps the `Lenovo.Client.RepositoryManager` module. The GUI is the primary interface for day-to-day repository work; the module cmdlets are available for scripted or automated workflows.

## Requirements

- Windows 11
- PowerShell 5.1
- Internet access to Lenovo download servers (for catalog queries and package downloads)

## Installation and Launch

The script resolves the `Lenovo.Client.RepositoryManager` module automatically in this order:

1. Already installed on the system (newest version found via `Get-Module -ListAvailable`)
2. Installed from the PowerShell Gallery (requires internet access and NuGet provider)
3. Bundled copy in the same folder as the script

For local manual installation, download the [script and module from here](https://download.lenovo.com/cdrt/tools/Lenovo.Client.RepositoryManager_1.0.1.zip).

To install the module manually from the PowerShell Gallery:

```powershell
Install-Module -Name Lenovo.Client.RepositoryManager -Scope CurrentUser
```

To launch the GUI from an elevated PowerShell session:

```powershell
.\ThinkVantageRepositoryManager.ps1
```

The script re-launches itself in STA mode if needed - WPF requires a single-threaded apartment.

---

## Interface Overview

The window has three main areas: the header bar at the top, the tabbed content area in the center, and the status bar at the bottom.

![ThinkVantage Repository Manager launch screen](https://cdrt.github.io/mk_docs/img/guides/tvrm/tvrm_launch.png)

### Header Bar

The header shows the application title and two controls on the right:

- **Theme toggle** (sun/moon icon) - switches between light and dark themes
- **Settings** (gear icon) - opens the Settings dialog for managing models, repositories, and download preferences

The application detects the Windows light/dark preference on launch and applies the matching theme automatically.

### Status Bar

The status bar at the bottom displays:

- Active repository name and mode (Full or Hybrid)
- Number of configured models
- A ready or progress message
- A progress bar during active downloads

### Main Tabs

The two main tabs are **Search Updates** and **Repository**. The Repository tab header updates to show the active repository name once one is configured.

---

## First-Time Setup

Before searching or downloading, configure at least one repository and one model in Settings.

### Open Settings

Click the **Settings** gear icon in the header bar to open the Settings dialog. The dialog has two tabs: **Models** and **Repositories**.

### Add a Repository

1. Select the **Repositories** tab in Settings.
2. In the **ADD REPOSITORY** form, enter a friendly name and a local folder path, or click **...** to browse.
3. Select a mode:
    - **Full** - Downloads the complete update package (installer, descriptor XML, readme, and any external files). Use Full for repositories that serve as a local deployment source.
    - **Hybrid** - Downloads metadata only (descriptor XML and readme). Client devices fetch installers directly from the Lenovo CDN at install time. Use Hybrid to reduce repository storage while still controlling which updates are available.
4. Click **Create**.

To make a repository the active target for searches and downloads, select it in the list and click **Set Active**.

!!! note "Files on disk are not deleted when removing a repository"
    Clicking **Remove** on a repository unregisters it from the configuration. The folder and its contents on disk are not touched. Re-register the same path later with `New-LnvRMRepository` or by adding it again in Settings to pick it back up.

![Repository added](https://cdrt.github.io/mk_docs/img/guides/tvrm/tvrm_settings_repositories.png)

### Add Models

1. Select the **Models** tab in Settings.
2. In the **ADD MODEL** form, enter:
    - **Type** - The 4-character Lenovo Machine Type code (for example, `21NT` for ThinkPad X1 Carbon Gen 11). The field enforces uppercase and a 4-character limit.
    - **Name** - A friendly display name (for example, `ThinkPad X1 Carbon Gen 11`).
    - **OS** - `Win 11` or `Win 10` (Note: new systems no longer have a Win10 catalog so only select Win11)
3. Click **Add**.

![Models added](https://cdrt.github.io/mk_docs/img/guides/tvrm/tvrm_settings_models.png)

Repeat for each model family you want to track. Models appear in the MODEL filter dropdown on the Search Updates tab.

To find a Machine Type code, check the system label on the device and take the first four characters of the Type Number, run `(Get-WmiObject Win32_ComputerSystemProduct).Name.Substring(0,4)` on the device, or look it up on the Lenovo support site.

### Download Method

The **DOWNLOAD METHOD** toggle at the bottom of Settings controls how package files are transferred:

- **WebClient** (default) - Direct HTTP download. Faster in most environments with stable connectivity.
- **BITS** - Background Intelligent Transfer Service. Transfers resume after network interruptions and run at low priority in the background. Prefer BITS in environments where downloads may be interrupted or when bandwidth throttling is needed or when cacheing is implemented.

This setting persists across sessions.

---

## Search Updates

The **Search Updates** tab queries Lenovo's online catalogs and shows available updates for your configured models.

### Run a Search

1. In the **MODEL** dropdown, select a specific model or leave it on **(All Models)** to search all configured models at once.
2. Optionally enter a keyword in the **FILTER** text box, or use the **Severity** and **Type** dropdowns to narrow results before or after searching.
3. Click **Search**.

The tool fetches catalog XML files for each applicable model in parallel, then downloads and parses the individual package descriptor files. The result count appears in the lower-left corner of the tab.

### Search Results Grid

| Column | Description |
| -------- | ------------- |
| Title | Package display name. Hover for full text if truncated. |
| Version | Package version string |
| Type | Application, Driver, BIOS, or Firmware |
| Severity | Critical, Recommended, or Optional |
| Reboot | Reboot behavior: No Reboot, Requires Reboot, Forces Reboot, Delayed Reboot, or Shutdown After Install |
| Released | Package release date |
| Size | Download size in MB |
| Models | Machine types this update applies to. Hover for full list if truncated. |
| In Repo | **Yes** if the package is already in the active repository |

Rows where **In Repo** is **Yes** are highlighted green. These packages are already downloaded - selecting them for download will skip the download and instead sync any new model associations.

![Search results](https://cdrt.github.io/mk_docs/img/guides/tvrm/tvrm_search_results.png)

### Download Updates

1. Select one or more rows in the results grid. Use ++ctrl++ or ++shift++ to select multiple rows.
2. In the **STATUS** dropdown, choose **Test** or **Active** to set the initial status for downloaded packages. Most workflows start packages at **Test** for validation before promoting them to **Active**.
3. Click **Download Selected**.

The tool downloads each package sequentially, verifying the SHA-256 checksum and checking the Lenovo digital signature on the installer and descriptor XML. Packages that fail signature verification are rejected and not added to the repository. The status bar shows progress.

To cancel an in-progress download batch, click the **Cancel** button that appears during the download.

!!! note "Supported Systems sync on re-search"
    When a search runs and finds updates already in the repository (green rows), the tool automatically updates the supported systems list in `database.xml` for those packages to include any new model associations found in the current search. No re-download is needed. This keeps the repository metadata accurate as you add new models over time.

### View Readme

Select a single row and click **View Readme** to open the package readme in the default text editor. The readme file must be present in the repository or available from Lenovo's servers.

---

## Repository

The **Repository** tab shows the contents of the active repository and lets you manage update status, view readmes, and remove packages.

### Filter the Repository View

Use the toolbar at the top of the tab to filter the displayed packages:

- **Text box** - Filter by title keyword
- **Status** - All, Test, or Active
- **Severity** - All, Critical, Recommended, or Optional
- **Model** - Filter to packages compatible with a specific configured model

Click **Refresh** to reload the repository contents from disk.

### Repository Grid

| Column | Description |
| -------- | ------------- |
| Title | Package description. Hover for full text if truncated. |
| Package ID | Unique package identifier (used with cmdlets) |
| Version | Package version |
| Status | Test or Active |
| Severity | Critical, Recommended, or Optional |
| Released | Release date |
| Size | Installer size in MB |
| Models | Compatible machine types. Hover for full list. |
| Superseded | ID of the package that supersedes this one, if any |

Packages that have been superseded by a newer version appear dimmed and in italic. The **Superseded** column shows which package replaces them. Review and remove superseded packages periodically to keep the repository clean.

![Repository contents view](https://cdrt.github.io/mk_docs/img/guides/tvrm/tvrm_repository_view.png)

### Promote or Demote Update Status

Status controls which packages a client deployment tool (such as Lenovo Commercial Vantage or Thin Installer pointed at this repository) will install.

1. Select a single package row.
2. Use the **Test / Active** toggle slider in the action bar. When the toggle shows **Test** highlighted, the package is in Test status; when **Active** is highlighted, it is Active.
3. The toggle animates and writes the status change to `database.xml` immediately.

### Delete an Update

1. Select one or more packages.
2. Click **Delete**.
3. Confirm the prompt.

The tool moves the package folder to the Windows Recycle Bin and removes the entry from `database.xml`. If the Recycle Bin move fails (for example, on a network path), the operation is aborted and the database entry is preserved. Use the `Remove-LnvRMUpdate -Force` cmdlet to permanently delete in that case.

---

## Common Workflows

### Initial Repository Population

1. Add models in Settings.
2. Create a Full repository targeting a local or network share.
3. Run a Search for all models.
4. Filter by **Severity: Critical**, select all results, and download with **Status: Test**.
5. Review the Repository tab, promote tested packages to **Active**.

### Adding a New Model to an Existing Repository

1. Add the new model in Settings.
2. Run a Search. Green rows (already in repository) will have their supported systems updated automatically to include the new model.
3. For packages not yet in the repository, select and download them.

### Cleaning Up Superseded Packages

1. Open the **Repository** tab.
2. Sort or filter to review the **Superseded** column.
3. Select superseded packages and click **Delete**.

---

## See Also

- [Lenovo.Client.RepositoryManager Module Reference](./module_reference.md)

!!! question "Need Help?"
    Have questions? Visit the [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg).
