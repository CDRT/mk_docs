---
title: Lenovo.BIOS.EventLog Module Reference
description: Complete reference for the Lenovo.BIOS.EventLog PowerShell module cmdlets and the BIOS Event Log Viewer interface.
---

# Lenovo.BIOS.EventLog PowerShell Module Reference

## Overview

CS26 commercial machines (ThinkPad, ThinkStation, ThinkCentre) introduced new WMI methods for retrieving events from the BIOS event log. The Lenovo.BIOS.EventLog PowerShell module retrieves the data returned by these methods and parses it, and includes a GUI viewer modeled after the event log viewer built into BIOS setup.

## Prerequisites

- Supported on CS26 commercial machines (ThinkPad, ThinkStation, ThinkCentre) that expose the BIOS event log WMI methods
- Machines that do not expose these WMI methods are not supported

---

## Module Structure

The module is organized as follows:

- `Specs\`
    - `Event0.json`
    - `Events_v1.json`
    - `Events_v2.json`
- `Launch-LnvEventLogViewer.ps1`
- `Lenovo.BIOS.EventLog.psd1`
- `Lenovo.BIOS.EventLog.psm1`

The `Specs` folder is required for the module to know how to parse the data returned by the WMI methods. `Event0.json` is used to determine which `Events_v*.json` file is needed for a given device. Future updates to the underlying WMI methods may require additional `Events_v*.json` files to be added.

---

## Exported Cmdlets

### Quick Reference

| Cmdlet | Purpose |
| --- | --- |
| [`Get-LnvBiosEventLog`](#get-lnvbioseventlog) | Retrieve and parse BIOS event log data |
| [`Write-LnvBiosEventLog`](#write-lnvbioseventlog) | Output parsed event log data, with optional filtering |
| [`Export-LnvBiosEventLog`](#export-lnvbioseventlog) | Export the current event log to a JSON file |
| [`Import-LnvBiosEventLog`](#import-lnvbioseventlog) | Import a previously exported event log file |

### Cmdlet Reference

<a id="get-lnvbioseventlog"></a>
??? note "Get-LnvBiosEventLog"

    **Synopsis:** Retrieves and parses the BIOS event log.

    **Description:** The main function of the module. Calls the BIOS event log WMI methods to retrieve the raw event data, then parses it using the matching spec file in the `Specs` folder.

    **Examples:**

    ```powershell
    Get-LnvBiosEventLog
    ```

<a id="write-lnvbioseventlog"></a>
??? note "Write-LnvBiosEventLog"

    **Synopsis:** Outputs the parsed BIOS event log data.

    **Description:** Outputs the parsed data retrieved by `Get-LnvBiosEventLog`. If no data has been retrieved yet, `Write-LnvBiosEventLog` calls `Get-LnvBiosEventLog` automatically before writing any output.

    **Parameters:**

    | Parameter | Type | Required | Description |
    | --- | --- | --- | --- |
    | Filter | String | No | One or more event names to filter on |
    | Include | Switch | No | Used with `-Filter` to show only the specified event names |
    | Exclude | Switch | No | Used with `-Filter` to show all events except the specified event names |

    **Examples:**

    ```powershell
    # Write all parsed events
    Write-LnvBiosEventLog

    # Only show "Power On" events
    Write-LnvBiosEventLog -Filter "Power On" -Include

    # Show all events except "Power On" events
    Write-LnvBiosEventLog -Filter "Power On" -Exclude
    ```

<a id="export-lnvbioseventlog"></a>
??? note "Export-LnvBiosEventLog"

    **Synopsis:** Exports the current event log to a JSON file.

    **Description:** Exports the current event log to a JSON file. Used mainly to produce a file that can be imported into the EventLogViewer interface with `Import-LnvBiosEventLog`.

    **Parameters:**

    | Parameter | Type | Required | Description |
    | --- | --- | --- | --- |
    | FilePath | String | No | Path to the output file or folder. If a folder path is given, a default file name is used |

    **Examples:**

    ```powershell
    # Export using the default file name and location
    Export-LnvBiosEventLog

    # Export to a specific file
    Export-LnvBiosEventLog -FilePath C:\path\to\filename.json

    # Export to a folder using the default file name
    Export-LnvBiosEventLog -FilePath C:\path\to\folder
    ```

<a id="import-lnvbioseventlog"></a>
??? note "Import-LnvBiosEventLog"

    **Synopsis:** Imports a previously exported event log.

    **Description:** Imports a previously exported event log into the machine. Used mainly by the EventLogViewer interface to load event log data exported with `Export-LnvBiosEventLog`.

    **Parameters:**

    | Parameter | Type | Required | Description |
    | --- | --- | --- | --- |
    | FilePath | String | Yes | Path to the exported event log JSON file |

    **Examples:**

    ```powershell
    Import-LnvBiosEventLog -FilePath C:\path\to\filename.json
    ```

---

## EventLogViewer

`Launch-LnvEventLogViewer.ps1` launches a GUI modeled after the event log viewer in BIOS setup. The viewer groups events together by boot, and each row in the grid can be expanded to show more detail.

<!-- TODO: add a screenshot of the EventLogViewer GUI here, e.g. ![EventLogViewer](../../img/guides/lbel/lbel-eventlogviewer-01.png) -->

```powershell
Launch-LnvEventLogViewer.ps1
```

---

## Support

For additional support or questions, please visit Lenovo's [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Management-Board/bd-p/sa01_eg).
