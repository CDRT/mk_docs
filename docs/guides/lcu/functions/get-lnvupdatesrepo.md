---
title: Get-LnvUpdatesRepo
description: Create a local Lenovo Update Repository
---

# Get-LnvUpdatesRepo

Builds a local Lenovo update repository compatible with Update Retriever and Thin Installer.

## Synopsis

Downloads Lenovo update metadata and packages for specified machine types and builds a local repository suitable for offline distribution or automated deployments.

## Syntax

```powershell
Get-LnvUpdatesRepo -RepositoryPath <string> 
                   [-MachineTypes <string>] 
                   [-WindowsVersion <string>]
                   [-PackageTypes <string>]
                   [-RebootTypes <string>]
                   [-Severities <string>]
                   [-PackageList <string>]
                   [-RT5toRT3]
                   [-CloudRepo]
                   [-DeltaUpdate]
```

## Description

`Get-LnvUpdatesRepo` retrieves Lenovo update metadata and packages directly from Lenovo's public catalogs and stores them in an **Update Retriever–style repository**.

This cmdlet is intended for environments where:

- Update Retriever cannot be used
- Automated or scheduled repository creation is required
- Offline or controlled update distribution is needed
- Repository must be synchronized regularly with latest updates

The generated repository includes package folders, metadata catalogs, and detailed logs. It is compatible with Lenovo Update Retriever, Thin Installer, and custom deployment tools.

## Parameters

| Parameter | Type | Required | Description |
|-----------|------|----------|-------------|
| `-RepositoryPath` | string | Yes | Path where the local repository is created. Will be created if it doesn't exist. |
| `-MachineTypes` | string | No | Comma-separated 4-character Lenovo machine types (e.g., `"21DD,21DE"`). Defaults to local system machine type. |
| `-WindowsVersion` | string | No | Target OS: `"10"` or `"11"`. Defaults to current system OS. |
| `-PackageTypes` | string | No | Comma-separated package type codes (e.g., `"2,3,4"`). Defaults to all types. See reference below. |
| `-RebootTypes` | string | No | Comma-separated reboot type codes (e.g., `"3,5"`). Defaults to all types. See reference below. |
| `-Severities` | string | No | Comma-separated severity codes (e.g., `"1,2"`). Defaults to all severities. See reference below. |
| `-PackageList` | string | No | Limit repository to specific package IDs (semicolon or comma-separated). |
| `-RT5toRT3` | switch | No | Convert Reboot Type 5 (delayed forced) to Type 3 (requires reboot). For task sequence scenarios. Cannot use with `-CloudRepo`. |
| `-CloudRepo` | switch | No | Create metadata-only repository referencing Lenovo CDN packages instead of downloading. Cannot use with `-RT5toRT3`. |
| `-DeltaUpdate` | switch | No | Download only new/changed updates since last run. Requires prior full run with same `-RepositoryPath`. |

### Package Type Reference

Use comma-separated values with `-PackageTypes`:

- `1` – Application
- `2` – Driver  
- `3` – BIOS
- `4` – Firmware

### Reboot Type Reference

Use comma-separated values with `-RebootTypes`:

- `0` – No reboot required
- `1` – Forced reboot
- `3` – Requires reboot (user prompt/task sequence compatible)
- `4` – Forced shutdown
- `5` – Delayed forced reboot

**Common combinations:**
- `"3,5"` – Include updates that either require or delay reboot (standard deployment)
- `"3"` – Only updates requiring reboot (conservative for production)
- `"1,4,5"` – All forced reboot types (aggressive scheduling)

### Severity Reference

Use comma-separated values with `-Severities`:

- `0` – Default
- `1` – Critical (security-critical updates)
- `2` – Recommended (stability/feature improvements)
- `3` – Optional (convenience or cosmetic)

## Output

This cmdlet does not return objects to the pipeline. It creates a complete repository structure:

- **Package folders** – Organized by machine type, Windows version, and category (Driver, BIOS, Firmware, Application)
- **`database.xml`** – Master metadata catalog listing all packages, versions, dependencies, and file checksums
- **`database.xsd`** – XML schema defining database structure for validation
- **Execution log** – Detailed log file (`LnvUpdatesRepo_TIMESTAMP.log`) showing:
  - Packages downloaded/processed
  - Any conversions applied (e.g., RT5 to RT3)
  - Download errors or conflicts
  - Total size and package count

The repository is immediately usable by Update Retriever, Thin Installer, or custom deployment scripts.

## Examples

### Example 1: Create full repository for multiple machine types

```powershell
Get-LnvUpdatesRepo -RepositoryPath "C:\Repository" `
                   -MachineTypes "21DD,21DE,21DG" `
                   -PackageTypes "2,3,4" `
                   -RebootTypes "3,5"
```

Downloads drivers, BIOS, and firmware for three ThinkPad models, including updates that require or delay reboot.

### Example 2: Update existing repository (delta sync)

```powershell
Get-LnvUpdatesRepo -RepositoryPath "C:\Repository" `
                   -DeltaUpdate
```

Checks for new or changed updates and adds only those to the existing repository. Must match original repository parameters.

### Example 3: Create cloud-based repository (metadata only)

```powershell
Get-LnvUpdatesRepo -RepositoryPath "C:\Repository" `
                   -PackageTypes "2,3,4" `
                   -CloudRepo
```

Creates a minimal repository that references packages from Lenovo CDN instead of downloading. Metadata is local; packages are fetched from cloud during deployment.

### Example 4: Create repository for specific packages only

```powershell
Get-LnvUpdatesRepo -RepositoryPath "C:\Repository" `
                   -MachineTypes "21DD" `
                   -PackageList "LEN1234,LEN5678" `
                   -DeltaUpdate
```

Limits repository to two specific package IDs for targeted updates.

### Example 5: Critical updates only for standard deployments

```powershell
Get-LnvUpdatesRepo -RepositoryPath "C:\StandardRepo" `
                   -Severities "1" `
                   -RebootTypes "3"
```

Creates conservative repository with only critical-severity updates that require reboot (no forced reboots).

## Notes

### Initial Repository Creation

- First run should **always** use full download (no `-DeltaUpdate`)
- Disk space required varies; typically 5–50 GB depending on machine types and severity filters
- Initial download may take 30 minutes to several hours depending on bandwidth and package count
- Network interruptions are resumable; re-running with `-DeltaUpdate` after a failure continues cleanly

### Delta Updates

- `-DeltaUpdate` compares database timestamps to detect changes
- Subsequent runs should use identical parameters (same `-MachineTypes`, `-PackageTypes`, `-Severities`) for predictable results
- Delta runs complete much faster (minutes instead of hours) as only new packages are downloaded
- Recommended for scheduled/automated repository maintenance

### Repository Deployment

- Repository can be copied to offline media or distributed via file share
- Update Retriever and Thin Installer directly consume the `database.xml` and package folders
- For task sequences or custom tools, parse `database.xml` to enumerate available packages
- Apply version control or backups to `database.xml` if repository serves multiple teams

### CloudRepo Option

- `-CloudRepo` creates lightweight repository (metadata only, no large package downloads)
- Packages are fetched from Lenovo CDN at deployment time
- Useful for bandwidth-constrained environments or frequently-updated content
- Deployment machines must have internet connectivity to CDN
- Mutually exclusive with `-RT5toRT3` (cloud packages retain original reboot type)

### RT5toRT3 Conversion

- Use only for task sequence scenarios where delayed-reboot type cannot be honored
- Converts Reboot Type 5 → Type 3 (requires reboot, allows user deferral in task sequence context)
- Does not suppress reboot; only changes scheduling behavior
- Mutually exclusive with `-CloudRepo`

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Get-LnvDownload](get-lnvdownload.md)
- [Get-LnvUpdateSummary](get-lnvupdatesummary.md)
- [Install-LnvUpdate](install-lnvupdate.md)
