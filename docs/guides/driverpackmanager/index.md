---
title: Overview
description: GUI wizard for building SCCM-ready driver packs for Lenovo commercial PCs running Windows 11, with verified downloads and silent extraction into category folders.
---

# Driver Pack Manager Overview

Driver Pack Manager is a graphical wizard that builds driver packs for Lenovo commercial PCs running Windows 11. It downloads the Lenovo driver catalog, lets you pick a model by family, series, and name, and lists the Windows 11 drivers Lenovo currently offers for it. The drivers you select are downloaded, verified, and silently extracted into one folder per component category, ready to import into Microsoft Configuration Manager (SCCM) or MDT.

The tool ships as a single PowerShell script (`DriverPackManager.ps1`).
<!-- TODO: Add the download link (or Install-Script command) for DriverPackManager.ps1. -->
<!-- TODO: Add a short Driver Pack Manager section under "Other PowerShell Tools" in ../thinkvantage/index.md, in the same format as the Commercial Vantage Policy Manager entry (description, Install-Script block, and a "Read the guide" link to ../driverpackmanager/index.md). Still need the Install-Script name. -->

## Getting Started

<div class="grid cards" markdown>

- **:material-play-circle: Walkthrough**  
    Follow the wizard from choosing a model and drivers to a finished driver pack, and see the folder structure and CSV report it creates.  
    [Read walkthrough](walkthrough.md)

- **:material-tools: Troubleshooting**  
    Find the cause and fix for launch, catalog, download, verification, and extraction problems.  
    [Troubleshoot](troubleshooting.md)

</div>

## How It Works

Each driver in a pack goes through the same sequence:

1. **Download** from Lenovo. Up to three packages download at the same time.
2. **Verify** the download against the SHA256 checksum published in the Lenovo driver catalog and confirm it carries a valid Lenovo digital signature.
3. **Extract** the package silently, without installing anything on the computer running the tool.
4. **Clean up** by deleting the package executable after extraction to save disk space.

When the build finishes, a CSV report listing every selected driver and its result is written to the root of the pack folder.

The catalog itself is also verified. The tool only accepts a catalog that carries a valid Lenovo signature, including the cached copy it falls back to, and shows that confirmation on the first screen.

## Requirements

- Windows with a desktop session (the tool is a graphical application). The packs it builds are for Windows 11.
- Windows PowerShell 5.1 or PowerShell 7
- Local administrator rights. The tool needs them so packages extract without a UAC prompt for each one. If you start it without them, it asks for elevation and relaunches itself.
- Internet access to Lenovo download servers (`download.lenovo.com`) over HTTPS. The tool uses your system proxy settings with your current Windows credentials.
- Free disk space for the drivers you select, in the pack folder and on the system drive. Installers download to a work folder under `%ProgramData%\DriverPackManager` (up to three at a time) and are deleted after extraction. The driver selection page shows the total download size for your selection.

!!! note "Offline use"
    The tool keeps a verified copy of the last catalog it downloaded. If the Lenovo catalog can't be reached, it falls back to that copy and shows a warning with its date. Driver packages can't be downloaded without internet access.

## Launch Driver Pack Manager

Run the script from a PowerShell session:

```powershell
.\DriverPackManager.ps1
```

![Driver Pack Manager launch screen while the driver catalog downloads](../../img/guides/driverpackmanager/step1-loading-catalog.png)

If the session is not elevated, a UAC prompt appears and the tool relaunches itself with administrator rights. Approve the prompt to continue. Even in an elevated session, the tool may restart itself once without showing a prompt.

When it restarts, the tool runs from a copy of the script in `%ProgramData%\DriverPackManager`, a folder only administrators can change, so the file can't be altered between the prompt and the launch. The same folder holds the catalog cache and temporary download files.

!!! warning "Execution policy is not bypassed"
    The relaunch keeps the PowerShell execution policy your session was using, so a policy that blocks scripts must be resolved before the tool will start.

## Security Checks

Driver Pack Manager protects the drivers on their way from Lenovo to your deployment tools:

- **Signed catalog** - The catalog must carry a valid Lenovo signature. A catalog that fails the check is rejected.
- **Checksum and signature on every package** - A package is extracted only if its SHA256 checksum matches the catalog and it carries a valid Lenovo digital signature.
- **Protected launch** - When the tool restarts with administrator rights, it runs a protected copy of the script after checking that the file didn't change since you started it.
- **Protected work folders** - Downloads and extraction use a work folder under `%ProgramData%\DriverPackManager` that only administrators can write to. Each build's work folder is deleted when the build ends.
- **Protected pack folders** - Packs built on a local drive are locked to administrators (read access for users) so nobody can change the drivers before they are used. Packs built to a network share keep the permissions set on that share, so make sure only trusted administrators can write to it.
- **No links** - The tool refuses to build into a folder that is a junction or symbolic link.

## See Also

<!-- TODO: Confirm the TVRM link is wanted here, and add any other related links (blog post, Lenovo support pages). -->
- [ThinkVantage Repository Manager](../tvrm/index.md)

!!! question "Need Help?"
    Have questions? Visit the [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg).
