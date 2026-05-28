---
title: Lenovo.Client.RepositoryManager Module Reference
description: Complete reference for the Lenovo.Client.RepositoryManager PowerShell module cmdlets, parameters, and usage patterns.
---

# Lenovo.Client.RepositoryManager PowerShell Module Reference

## Overview

The `Lenovo.Client.RepositoryManager` module provides cmdlets for building and maintaining local Lenovo update repositories. It queries Lenovo's online catalogs, downloads update packages with SHA-256 checksum and digital signature verification, manages a `database.xml` repository manifest, and tracks all operations in a per-repository audit log.

The module is the backend used by `ThinkVantageRepositoryManager.ps1`. All GUI operations map directly to module cmdlets and can be scripted or automated independently.

## Prerequisites

- Windows 11
- PowerShell 5.1
- Administrator rights for repository write operations
- Internet access to Lenovo download servers for catalog queries and package downloads

---

## Exported Cmdlets

### Quick Reference

| Cmdlet | Purpose |
| ------ | --------- |
| `New-LnvRMRepository` | Create a new local update repository |
| `Get-LnvRMRepository` | List registered repositories |
| `Set-LnvRMRepository` | Modify repository settings or switch the active repository |
| `Remove-LnvRMRepository` | Unregister a repository from configuration |
| `Add-LnvRMModel` | Register a Lenovo model for update searches |
| `Get-LnvRMModel` | List configured models |
| `Remove-LnvRMModel` | Remove a model from the configuration |
| `Search-LnvRMUpdate` | Query Lenovo catalogs for available updates |
| `Save-LnvRMUpdate` | Download updates to the active repository |
| `Get-LnvRMRepoContent` | List packages currently in the repository |
| `Set-LnvRMUpdateStatus` | Promote or demote a package between Test and Active |
| `Remove-LnvRMUpdate` | Remove a package from the repository |
| `Sync-LnvRMSupportedSystem` | Add missing model associations to existing packages |
| `Get-LnvRMAuditLog` | Read repository audit log entries |
| `Get-LnvRMPreference` | Read an application preference value |
| `Set-LnvRMPreference` | Write an application preference value |

---

### Cmdlet Reference

#### Repository Management

??? note "New-LnvRMRepository"

    **Synopsis:** Creates a new local update repository.

    **Description:** Creates the folder structure, an empty `database.xml`, and the `database.xsd` schema file at the specified path. Registers the repository in the module configuration and optionally sets it as the active repository. If a `database.xml` already exists at the path, the existing packages are discovered and returned in the result object.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Path` | String | Yes | Root folder path for the new repository. Created if it does not exist. |
    | `-Name` | String | Yes | Friendly name for this repository. Used in the GUI tab header and audit log. |
    | `-Mode` | String | No | `Full` (default) or `Hybrid`. Full downloads installers and metadata; Hybrid downloads metadata only. |
    | `-SetActive` | Switch | No | Sets this repository as the active target for searches and downloads. |

    **Supports:** `-WhatIf`, `-Confirm`

    **Output:** A repository object with `Name`, `Path`, `Mode`, `PackageCount`, and `DiscoveredModels` properties.

    **Examples:**

    ```powershell
    # Create a Full repository and make it active
    New-LnvRMRepository -Path 'D:\LenovoUpdates\Production' -Name 'Production' -SetActive

    # Create a Hybrid repository for metadata-only storage
    New-LnvRMRepository -Path 'D:\lenovo\hybrid' -Name 'HybridRepo' -Mode 'Hybrid'

    # Preview what would be created without making changes
    New-LnvRMRepository -Path 'D:\TestRepo' -Name 'Test' -WhatIf
    ```

??? note "Get-LnvRMRepository"

    **Synopsis:** Lists registered repositories and indicates which is active.

    **Description:** Reads the module configuration and returns repository objects. Each returned object includes an `Active` property indicating whether that repository is the current active target.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Name` | String | No | Filter results to the repository with this name. |
    | `-ActiveOnly` | Switch | No | Return only the active repository. |

    **Output:** Repository objects with `Name`, `Path`, `Mode`, and `Active` properties.

    **Examples:**

    ```powershell
    # List all registered repositories
    Get-LnvRMRepository

    # Get the currently active repository
    Get-LnvRMRepository -ActiveOnly

    # Check whether a specific repo is active
    (Get-LnvRMRepository -Name 'Production').Active
    ```

??? note "Set-LnvRMRepository"

    **Synopsis:** Modifies repository settings or switches the active repository.

    **Description:** Identify the target repository by `-Name` or `-Path`, then apply one or more changes. You can set the repository active, change its mode, and rename it in a single call.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Path` | String | Conditional | Path of the repository to modify. Required if `-Name` is not specified. |
    | `-Name` | String | Conditional | Name of the repository to modify. Required if `-Path` is not specified. |
    | `-SetActive` | Switch | No | Make this the active repository. |
    | `-Mode` | String | No | Change the mode: `Full` or `Hybrid`. |
    | `-NewName` | String | No | Rename the repository. |

    **Supports:** `-WhatIf`, `-Confirm`

    **Output:** The updated repository object.

    **Examples:**

    ```powershell
    # Switch the active repository
    Set-LnvRMRepository -Name 'Production' -SetActive

    # Convert an existing repository to Hybrid mode
    Set-LnvRMRepository -Name 'Production' -Mode 'Hybrid'

    # Rename a repository
    Set-LnvRMRepository -Name 'OldName' -NewName 'Production-2026'

    # Combine multiple changes in one call
    Set-LnvRMRepository -Name 'Staging' -SetActive -Mode 'Full'
    ```

??? note "Remove-LnvRMRepository"

    **Synopsis:** Unregisters a repository from the module configuration.

    **Description:** Removes the repository entry from configuration. Files on disk are not deleted. If the removed repository was the active one, the first remaining registered repository (if any) is promoted to active automatically.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Path` | String | Conditional | Path of the repository to remove. Required if `-Name` is not specified. |
    | `-Name` | String | Conditional | Name of the repository to remove. Required if `-Path` is not specified. |

    **Supports:** `-WhatIf`, `-Confirm` (ConfirmImpact: High)

    !!! warning "Files are not deleted"
        This cmdlet only removes the configuration entry. The repository folder and all its contents remain on disk. Re-register the same path with `New-LnvRMRepository` to pick up an existing repository later.

    **Examples:**

    ```powershell
    # Remove by name
    Remove-LnvRMRepository -Name 'Test Lab'

    # Remove by path
    Remove-LnvRMRepository -Path 'D:\LenovoUpdates\Staging'

    # Preview without making changes
    Remove-LnvRMRepository -Name 'OldRepo' -WhatIf
    ```

---

#### Model Management

??? note "Add-LnvRMModel"

    **Synopsis:** Registers a Lenovo model for update searches.

    **Description:** Adds a model entry to the configuration by Machine Type code, friendly name, and target OS. Configured models are searched when running `Search-LnvRMUpdate` without a `-MachineType` override.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-MachineType` | String | Yes | 4-character Lenovo Machine Type code. Case-insensitive; stored as uppercase. Example: `21NT`. |
    | `-FriendlyName` | String | Yes | Human-readable model name. Example: `ThinkPad X1 Carbon Gen 11`. |
    | `-OS` | String | Yes | Target operating system: `Windows 10` or `Windows 11`. |

    **Output:** The new model object with `MachineType`, `FriendlyName`, and `OS` properties.

    **Examples:**

    ```powershell
    # Add a ThinkPad for Windows 11
    Add-LnvRMModel -MachineType '21NT' -FriendlyName 'ThinkPad X1 Carbon Gen 11' -OS 'Windows 11'

    # Add the same model for both OS versions
    Add-LnvRMModel -MachineType '21NT' -FriendlyName 'ThinkPad X1 Carbon Gen 11' -OS 'Windows 10'
    Add-LnvRMModel -MachineType '21NT' -FriendlyName 'ThinkPad X1 Carbon Gen 11' -OS 'Windows 11'

    # Add a ThinkCentre
    Add-LnvRMModel -MachineType '11SX' -FriendlyName 'ThinkCentre M75q Gen 2' -OS 'Windows 11'
    ```

??? note "Get-LnvRMModel"

    **Synopsis:** Lists configured models.

    **Description:** Returns all models registered in the module configuration. Optionally filter by Machine Type code.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-MachineType` | String | No | Filter to entries matching this 4-character Machine Type code. |

    **Output:** Model objects with `MachineType`, `FriendlyName`, and `OS` properties.

    **Examples:**

    ```powershell
    # List all configured models
    Get-LnvRMModel

    # Check whether a specific machine type is registered
    Get-LnvRMModel -MachineType '21NT'
    ```

??? note "Remove-LnvRMModel"

    **Synopsis:** Removes a model from the configuration.

    **Description:** Deletes model entries by Machine Type. If `-OS` is omitted, all entries for that Machine Type (across all OS versions) are removed. If `-OS` is specified, only the matching Machine Type plus OS combination is removed.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-MachineType` | String | Yes | 4-character Machine Type code to remove. |
    | `-OS` | String | No | If specified, removes only the entry for this OS (`Windows 10` or `Windows 11`). If omitted, all OS entries for the Machine Type are removed. |

    **Supports:** `-WhatIf`, `-Confirm`

    **Examples:**

    ```powershell
    # Remove all OS entries for a machine type
    Remove-LnvRMModel -MachineType '20FU'

    # Remove only the Windows 10 entry
    Remove-LnvRMModel -MachineType '20FU' -OS 'Windows 10'
    ```

---

#### Update Operations

??? note "Search-LnvRMUpdate"

    **Synopsis:** Queries Lenovo online catalogs for available updates.

    **Description:** Fetches catalog XML files for each configured model in parallel, parses the individual package descriptor XMLs, deduplicates packages that appear in multiple model catalogs, and returns structured update objects. By default, all configured models are searched. Use `-MachineType` and `-OS` together to search a single model without registering it.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-MachineType` | String | No | Override - search this specific Machine Type instead of all configured models. Requires `-OS`. |
    | `-OS` | String | Conditional | Required when `-MachineType` is used. `Windows 10` or `Windows 11`. |
    | `-MaxConcurrent` | Int | No | Maximum parallel HTTP requests. Default: `8`. |

    **Output:** Array of `LnvRM.CatalogUpdate` objects with the following properties:

    | Property | Description |
    |----------|-------------|
    | `PackageID` | Unique package identifier |
    | `PackageName` | Short package name |
    | `Title` | Full package display name |
    | `Version` | Package version string |
    | `Category` | Update category from the catalog |
    | `Severity` | `Critical`, `Recommended`, or `Optional` |
    | `RebootType` | `No Reboot`, `Requires Reboot`, `Forces Reboot`, `Delayed Reboot`, or `Shutdown After Install` |
    | `PackageType` | `Application`, `Driver`, `BIOS`, or `Firmware` |
    | `ReleaseDate` | Package release date |
    | `InstallerFileName` | Installer file name |
    | `InstallerSize` | Installer size in bytes |
    | `InstallerSHA256` | Expected SHA-256 hash of the installer |
    | `DownloadURL` | Full download URL for the installer |
    | `ReadmeURL` | Full URL for the readme file |
    | `DescriptorURL` | Full URL for the descriptor XML |
    | `DescriptorSHA256` | Expected SHA-256 hash of the descriptor |
    | `ApplicableModels` | Array of machine type and OS objects this package applies to |

    **Examples:**

    ```powershell
    # Search all configured models
    $updates = Search-LnvRMUpdate

    # Search a single model without adding it to configuration
    $updates = Search-LnvRMUpdate -MachineType '21NT' -OS 'Windows 11'

    # Show only Critical updates
    Search-LnvRMUpdate | Where-Object { $_.Severity -eq 'Critical' }

    # Show a summary by package type
    Search-LnvRMUpdate | Group-Object PackageType | Select-Object Name, Count
    ```

??? note "Save-LnvRMUpdate"

    **Synopsis:** Downloads updates to the active repository.

    **Description:** Accepts pipeline input from `Search-LnvRMUpdate`. For each update, creates a subfolder under the repository root named after the Package ID, then downloads the installer (Full mode only), descriptor XML, readme, and any external files referenced by the descriptor. Verifies SHA-256 checksums on all files and checks Lenovo digital signatures on the installer and descriptor XML. Packages that fail signature verification are removed and logged. All database writes are protected by a file lock to prevent concurrent modification.

    In Hybrid mode, only the descriptor XML and readme are downloaded. Installer files are omitted - client devices must have internet access to retrieve installers from the Lenovo CDN.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Update` | Object[] | Yes | One or more `LnvRM.CatalogUpdate` objects from `Search-LnvRMUpdate`. Accepts pipeline input. |
    | `-Repository` | String | No | Override the active repository path. |
    | `-Status` | String | No | Initial status for downloaded packages: `Test` (default) or `Active`. |

    **Supports:** `-WhatIf`, `-Confirm`

    **Output:** A `LnvRM.SaveResult` object with:

    | Property | Description |
    |----------|-------------|
    | `Downloaded` | Array of packages successfully written to the repository |
    | `SignatureSkipped` | Array of `LnvRM.SignatureFailure` objects for packages rejected due to signature failure |
    | `ExternalFileFailures` | Array of `LnvRM.ExternalFileFailure` objects for packages where a required external file could not be downloaded |

    **Examples:**

    ```powershell
    # Download all Critical updates to the active repository at Test status
    Search-LnvRMUpdate | Where-Object { $_.Severity -eq 'Critical' } | Save-LnvRMUpdate

    # Download and immediately promote to Active
    Search-LnvRMUpdate | Where-Object { $_.PackageType -eq 'BIOS' } | Save-LnvRMUpdate -Status 'Active'

    # Download to a specific repository path
    $updates = Search-LnvRMUpdate
    Save-LnvRMUpdate -Update $updates -Repository 'D:\LenovoUpdates\Staging'

    # Check results for failures
    $result = Search-LnvRMUpdate | Save-LnvRMUpdate
    if ($result.SignatureSkipped.Count -gt 0) {
        $result.SignatureSkipped | Format-Table PackageID, Title, Reason
    }
    ```

??? note "Get-LnvRMRepoContent"

    **Synopsis:** Lists all packages currently in the repository.

    **Description:** Reads `database.xml` from the active (or specified) repository and returns structured package objects. By default, also checks for superseded packages within the repository and adds `IsSuperseded` and `SupersededBy` properties to each result.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Repository` | String | No | Override the active repository path. |
    | `-Status` | String | No | Filter by status: `Test` or `Active`. |
    | `-MachineType` | String | No | Filter to packages that include this Machine Type in their supported systems list. |
    | `-SkipSuperseded` | Switch | No | Skip superseded package detection for faster results when only package identity is needed. |

    **Output:** Package objects from `database.xml`, with `IsSuperseded` (bool) and `SupersededBy` (string) properties added unless `-SkipSuperseded` is used.

    **Examples:**

    ```powershell
    # List all packages in the active repository
    Get-LnvRMRepoContent

    # List only Active packages for a specific model
    Get-LnvRMRepoContent -Status 'Active' -MachineType '21NT'

    # Find superseded packages for cleanup
    Get-LnvRMRepoContent | Where-Object { $_.IsSuperseded } | Select-Object PackageID, Description, SupersededBy

    # Quick count without superseded detection overhead
    (Get-LnvRMRepoContent -SkipSuperseded).Count
    ```

??? note "Set-LnvRMUpdateStatus"

    **Synopsis:** Changes a package's status between Test and Active.

    **Description:** Updates the `Status` field for the specified package in `database.xml`. The previous status is preserved in `PreviousStatus` to allow tracking. The database lock is held during the read-modify-write operation.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-PackageID` | String | Yes | The Package ID of the update to modify. |
    | `-Status` | String | Yes | The new status: `Test` or `Active`. |
    | `-Repository` | String | No | Override the active repository path. |

    **Supports:** `-WhatIf`, `-Confirm`

    **Output:** The updated package object.

    **Examples:**

    ```powershell
    # Promote a single package to Active
    Set-LnvRMUpdateStatus -PackageID 'n4bce08w' -Status 'Active'

    # Promote all Test packages to Active
    Get-LnvRMRepoContent -Status 'Test' |
        ForEach-Object { Set-LnvRMUpdateStatus -PackageID $_.PackageID -Status 'Active' }

    # Demote a package back to Test
    Set-LnvRMUpdateStatus -PackageID 'n4bce08w' -Status 'Test'
    ```

??? note "Remove-LnvRMUpdate"

    **Synopsis:** Removes a package from the repository.

    **Description:** Moves the package folder to the Windows Recycle Bin and removes its entry from `database.xml`. If the Recycle Bin move fails (for example, on a network path that does not support the Recycle Bin), the operation aborts and the database entry is preserved. Use `-Force` to permanently delete instead when the Recycle Bin is unavailable.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-PackageID` | String | Yes | The Package ID of the update to remove. |
    | `-Repository` | String | No | Override the active repository path. |
    | `-Force` | Switch | No | If the Recycle Bin move fails, permanently delete the package folder instead of aborting. |

    **Supports:** `-WhatIf`, `-Confirm` (ConfirmImpact: High)

    **Examples:**

    ```powershell
    # Remove a single package (moves to Recycle Bin)
    Remove-LnvRMUpdate -PackageID 'n4bce08w'

    # Remove from a network share where Recycle Bin is unavailable
    Remove-LnvRMUpdate -PackageID 'n4bce08w' -Force

    # Remove all superseded packages
    Get-LnvRMRepoContent | Where-Object { $_.IsSuperseded } |
        ForEach-Object { Remove-LnvRMUpdate -PackageID $_.PackageID }
    ```

??? note "Sync-LnvRMSupportedSystem"

    **Synopsis:** Adds missing model associations to packages already in the repository.

    **Description:** Compares the `ApplicableModels` on each update object (from `Search-LnvRMUpdate`) against the existing `<SystemCompatibility>` entries in `database.xml`. For each Machine Type and OS combination not already recorded, adds a new `<System>` entry. Only packages whose Package ID already exists in the repository are processed.

    This cmdlet is called automatically by `Save-LnvRMUpdate` (for packages that were skipped as duplicates) and by the GUI after each search. You generally do not need to call it directly unless scripting a custom workflow.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-RepositoryPath` | String | Yes | Path to the repository root. |
    | `-Updates` | Object[] | Yes | Array of update objects from `Search-LnvRMUpdate`. Only updates whose Package ID is already in the repository are processed. |

    **Examples:**

    ```powershell
    # Manually sync after adding a new model
    $updates = Search-LnvRMUpdate
    Sync-LnvRMSupportedSystem -RepositoryPath (Get-LnvRMRepository -ActiveOnly).Path -Updates $updates
    ```

---

#### Audit and Preferences

??? note "Get-LnvRMAuditLog"

    **Synopsis:** Reads audit log entries from the repository.

    **Description:** Reads daily audit log files (`audit_YYYY-MM-DD.log`) from the `logs` subfolder of the specified (or active) repository. Parses each line into structured objects. All significant operations - repository creation, downloads, deletions, status changes, and signature failures - are recorded here.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Repository` | String | No | Override the active repository path. |
    | `-Date` | String | No | Read only the log file for this date in `YYYY-MM-DD` format. If omitted, all available log files are read. |
    | `-Last` | Int | No | Return only the last N entries across all matched log files. |

    **Output:** `LnvRM.AuditEntry` objects with the following properties:

    | Property | Description |
    |----------|-------------|
    | `Timestamp` | Date and time of the operation |
    | `User` | Windows username that performed the operation |
    | `Action` | Operation code (see table below) |
    | `Message` | Human-readable description |
    | `LogFile` | Source log filename |

    **Action codes:**

    | Code | Description |
    |------|-------------|
    | `REPO_CREATE` | A new repository was created |
    | `REPO_CONFIG` | Repository settings were modified (set active, renamed, mode changed) |
    | `DOWNLOAD` | A package was downloaded to the repository |
    | `DELETE` | A package was removed from the repository |
    | `STATUS_CHANGE` | A package status was changed between Test and Active |
    | `SIGNATURE_FAIL` | A package was rejected because signature verification failed |
    | `EXTERNAL_FAIL` | A package was rejected because a required external file could not be downloaded |
    | `SYNC` | Supported systems were added to an existing package |

    **Examples:**

    ```powershell
    # Show all audit entries for the active repository
    Get-LnvRMAuditLog

    # Show the 20 most recent entries
    Get-LnvRMAuditLog -Last 20

    # Review today's activity
    Get-LnvRMAuditLog -Date (Get-Date -Format 'yyyy-MM-dd')

    # Find all signature failures
    Get-LnvRMAuditLog | Where-Object { $_.Action -eq 'SIGNATURE_FAIL' }

    # Show audit entries formatted as a table
    Get-LnvRMAuditLog -Last 50 | Format-Table Timestamp, User, Action, Message -AutoSize
    ```

??? note "Get-LnvRMPreference"

    **Synopsis:** Reads an application preference value from the configuration.

    **Description:** Returns the value of a named preference from the module configuration. Returns `$null` if the preference has not been set.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Name` | String | Yes | The preference name to retrieve. |

    **Known preferences:**

    | Name | Valid Values | Description |
    |------|-------------|-------------|
    | `DownloadMethod` | `BITS`, `WebClient` | Controls how files are transferred during `Save-LnvRMUpdate` |

    **Examples:**

    ```powershell
    # Check the current download method
    Get-LnvRMPreference -Name 'DownloadMethod'
    ```

??? note "Set-LnvRMPreference"

    **Synopsis:** Writes an application preference value to the configuration.

    **Description:** Sets a named preference value. The `DownloadMethod` preference is validated against `BITS` and `WebClient`. Other names are accepted without validation for forward compatibility. The reserved names `ActiveRepository`, `Repositories`, and `Models` are rejected - use the appropriate cmdlets for those.

    **Parameters:**

    | Parameter | Type | Required | Description |
    |-----------|------|----------|-------------|
    | `-Name` | String | Yes | The preference name to set. |
    | `-Value` | String | Yes | The value to assign. |

    **Supports:** `-WhatIf`, `-Confirm` (ConfirmImpact: Low)

    **Examples:**

    ```powershell
    # Switch to BITS for download transfers
    Set-LnvRMPreference -Name 'DownloadMethod' -Value 'BITS'

    # Switch back to WebClient
    Set-LnvRMPreference -Name 'DownloadMethod' -Value 'WebClient'
    ```

---

## Common Usage Patterns

### Quick Reference

| Pattern | Use Case | Key Cmdlets |
| --------- | ---------- | ------------- |
| Initial population | Seed a new repository with Critical updates for all models | `Search-LnvRMUpdate`, `Save-LnvRMUpdate` |
| Status promotion | Move validated packages from Test to Active | `Get-LnvRMRepoContent`, `Set-LnvRMUpdateStatus` |
| Model expansion | Add a new model and sync existing packages | `Add-LnvRMModel`, `Search-LnvRMUpdate`, `Sync-LnvRMSupportedSystem` |
| Repository cleanup | Remove superseded packages | `Get-LnvRMRepoContent`, `Remove-LnvRMUpdate` |
| Audit review | Review download and failure history | `Get-LnvRMAuditLog` |

??? note "Initial Repository Population"

    **Scenario:** Seed a new repository with all Critical and Recommended updates for a set of configured models.

    ```powershell
    # Create the repository
    New-LnvRMRepository -Path 'D:\LenovoUpdates\Production' -Name 'Production' -SetActive

    # Add models
    Add-LnvRMModel -MachineType '21NT' -FriendlyName 'ThinkPad X1 Carbon Gen 13' -OS 'Windows 11'
    Add-LnvRMModel -MachineType '21AH' -FriendlyName 'ThinkPad T14s Gen 3' -OS 'Windows 11'

    # Search and download Critical and Recommended updates at Test status
    $updates = Search-LnvRMUpdate | Where-Object { $_.Severity -in 'Critical', 'Recommended' }
    $result = Save-LnvRMUpdate -Update $updates -Status 'Test'

    Write-Host "Downloaded: $($result.Downloaded.Count)"
    Write-Host "Signature failures: $($result.SignatureSkipped.Count)"
    ```

??? note "Status Promotion Workflow"

    **Scenario:** After validating a set of Test packages, promote them all to Active.

    ```powershell
    # Review what is currently at Test status
    Get-LnvRMRepoContent -Status 'Test' | Format-Table PackageID, Description, Severity, ReleaseDate

    # Promote all Test packages to Active
    Get-LnvRMRepoContent -Status 'Test' | ForEach-Object {
        Set-LnvRMUpdateStatus -PackageID $_.PackageID -Status 'Active'
        Write-Host "Promoted: $($_.PackageID) - $($_.Description)"
    }

    # Verify
    Get-LnvRMRepoContent -Status 'Active' | Measure-Object
    ```

??? note "Adding a New Model to an Existing Repository"

    **Scenario:** The fleet has grown to include a new ThinkPad model. Add it and ensure existing repository packages are associated with it.

    ```powershell
    # Register the new model
    Add-LnvRMModel -MachineType '21CQ' -FriendlyName 'ThinkPad T14s Gen 3 AMD' -OS 'Windows 11'

    # Search - updates already in the repo will be identified
    $updates = Search-LnvRMUpdate

    # Download genuinely new packages (Save-LnvRMUpdate calls Sync-LnvRMSupportedSystem
    # automatically for already-in-repo packages)
    $result = Save-LnvRMUpdate -Update $updates

    Write-Host "New packages downloaded: $($result.Downloaded.Count)"
    ```

??? note "Repository Cleanup - Removing Superseded Packages"

    **Scenario:** Clean up the repository by removing packages that have been superseded by newer versions.

    ```powershell
    # Find superseded packages
    $superseded = Get-LnvRMRepoContent | Where-Object { $_.IsSuperseded }

    Write-Host "Found $($superseded.Count) superseded package(s):"
    $superseded | Format-Table PackageID, Description, SupersededBy

    # Remove them
    foreach ($pkg in $superseded) {
        Write-Host "Removing $($pkg.PackageID) - $($pkg.Description)..."
        Remove-LnvRMUpdate -PackageID $pkg.PackageID
    }
    ```

??? note "Audit Log Review"

    **Scenario:** Review repository activity for the past week and highlight any failures.

    ```powershell
    # Get all entries from the last 7 days
    $startDate = (Get-Date).AddDays(-7)
    $entries = Get-LnvRMAuditLog | Where-Object {
        [datetime]$_.Timestamp -ge $startDate
    }

    # Summary by action type
    $entries | Group-Object Action | Select-Object Name, Count | Sort-Object Count -Descending

    # Show any failures
    $failures = $entries | Where-Object { $_.Action -in 'SIGNATURE_FAIL', 'EXTERNAL_FAIL' }
    if ($failures) {
        Write-Warning "$($failures.Count) failure(s) found:"
        $failures | Format-Table Timestamp, Action, Message
    }
    else {
        Write-Host 'No failures found.'
    }
    ```

---

## See Also

- [ThinkVantage Repository Manager GUI Guide](./index.md)

!!! question "Need Help?"
    Have questions? Visit the [Enterprise Client Management Forum](https://forums.lenovo.com/t5/Enterprise-Client-Management/bd-p/sa01_eg).
