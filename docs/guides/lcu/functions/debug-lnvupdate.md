---
title: Debug-LnvUpdate
description: Explain why update packages are or are not being offered to a Lenovo system
---

# Debug-LnvUpdate

Diagnoses why specific update packages are not being offered to a Lenovo system.

## Synopsis

Runs a full detection pass with test tracing enabled and reports, per package, which applicability and install-detection tests the machine did or did not satisfy.

## Syntax

```powershell
Debug-LnvUpdate [[-PackageID] <string[]>]
                [-Proxy <Uri>] [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
                [-IncludePhantomDevices] [-ScratchDirectory <string>]
                [-Repository <string>] [-StatusMode <string>]
                [-FailUnsupportedDependencies] [-PassUnsupportedInstallTests] [-SkipSignatureCheck]
                [-LogFile] [-LogPath <string>]
```

## Description

`Debug-LnvUpdate` runs a detection pass with test tracing turned on and reports, per package, which applicability (Dependencies) and install-detection (DetectInstall) tests the machine did or did not satisfy — including the values that were compared. Use it when a customer expects an update to be offered and it is not, or when an update is reported as already installed and they believe it is not.

Without `-PackageID` the report covers every package that was not offered: every package that is already installed or not applicable. With `-PackageID` it covers only the packages asked for, whatever their result. Package objects from `Get-LnvUpdate` can also be piped in.

A full detection pass is always performed because packages in a repository can depend on each other (Coreq tests), and an accurate answer for one package requires evaluating all of them. Expect this to take as long as a normal `Get-LnvUpdate -All` run.

The report is written to the console. When `-LogFile` or `-LogPath` is used, the full detection log and the report are written to a single file together.

## Parameters

| Parameter | Type | Description |
| --- | --- | --- |
| `-PackageID` | string[] | One or more package IDs, names, or partial titles to report on. Accepts pipeline input from `Get-LnvUpdate`. Alias: `-ID` |
| `-Proxy` | Uri | Proxy server URL for repository access |
| `-ProxyCredential` | PSCredential | Credentials for proxy authentication |
| `-ProxyUseDefaultCredentials` | switch | Use current user's credentials for proxy |
| `-IncludePhantomDevices` | switch | Consider currently disconnected (phantom) devices when evaluating packages. Useful to determine whether a `_PnPID` test is being decided by hardware that is not currently attached |
| `-ScratchDirectory` | string | Directory for temporary files during processing (default: `$env:TEMP`) |
| `-Repository` | string | Path to a local or network repository (HTTP(S) URL or filesystem path) instead of the Lenovo online catalog |
| `-StatusMode` | string | Which package status to consider: `Active` (default), `Test`, or `All` |
| `-FailUnsupportedDependencies` | switch | Treat applicability tests that this module does not support as failed instead of passed. Useful to determine whether an unsupported test is the reason a package is being offered |
| `-PassUnsupportedInstallTests` | switch | Treat install-detection tests that this module does not support as passed instead of failed |
| `-SkipSignatureCheck` | switch | Skip digital signature verification (not recommended) |
| `-LogFile` | switch | Write the full detection log and report to a file in `$env:ProgramData\Lenovo\Lenovo.Client.Update\Logs` |
| `-LogPath` | string | Like `-LogFile`, but writes to the specified file or directory |

## Examples

### Example 1: Explain all packages not offered to this computer

```powershell
Debug-LnvUpdate -LogFile
```

Runs a full detection pass and reports on every package that was not offered (already installed or not applicable). Saves the report and full detection log to the default log directory.

### Example 2: Explain a specific package by ID

```powershell
Debug-LnvUpdate -PackageID r1jhh08w
```

Reports only on the package with ID `r1jhh08w`, showing which applicability and install-detection tests it did or did not pass.

### Example 3: Explain packages reported as already installed

```powershell
Get-LnvUpdate -All | Where-Object IsInstalled | Debug-LnvUpdate
```

Pipes all packages currently marked as installed into `Debug-LnvUpdate` to show which install-detection tests caused them to be evaluated that way.

### Example 4: Explain a package by partial title with a log file

```powershell
Debug-LnvUpdate -PackageID "ThinkPad Monitor" -LogPath "C:\Logs\debug.log"
```

Matches any package whose title contains "ThinkPad Monitor" and writes the report to a custom log path.

### Example 5: Debug using a local repository

```powershell
Debug-LnvUpdate -Repository "C:\local-repository" -LogFile
```

Runs the detection pass against a local repository instead of the Lenovo online catalog, and saves the report to the default log directory.

## Output

The report is written to the console (and optionally to a log file). The report header includes:

- Machine model and product name
- Operating system name and version
- Module version

For each package in scope, the report lists:

| Field | Description |
| --- | --- |
| `Verdict` | `Needed`, `AlreadyInstalled`, `NotApplicable`, or `Undetermined` |
| `Version` | Package version |
| `Type / Severity` | Package type and severity level |
| `Released` | Release date |
| `IsApplicable` | Whether the package is applicable to this system |
| `IsInstalled` | Whether the package is already installed |
| `Package XML` | URL of the package descriptor |
| `Tests recorded` | Count of dependency and install-detection tests evaluated |

Followed by the dependency tests that failed (for non-applicable packages) or passed (for applicable ones), and the install-detection tests that determined the installed state.

!!! note "Console output cap"
    On-screen output is capped at 20 lines per test section to keep the console readable. When a section exceeds this limit, the remaining lines are written in full to the log file. Run with `-LogFile` to capture all test details.

## Notes

### When to use Debug-LnvUpdate

- A user reports that an update is missing and it should be offered
- An update appears as already installed but the user believes it is not installed
- You want to understand which hardware or software condition is blocking a package

### Log file

When `-LogFile` or `-LogPath` is used, the detection log and the console report are combined into a single file. The log starts with a header recording the module version and the exact Windows version of the machine. This is the recommended file to request from a customer when troubleshooting update applicability.

### Performance

A full detection pass is always run, even when `-PackageID` is specified. This ensures that Coreq (co-requisite) dependencies between packages are evaluated correctly. Expect the run to take as long as `Get-LnvUpdate -All`.

### PackageID matching

The `-PackageID` parameter accepts an exact package ID (e.g. `r1jhh08w`), an exact package name, or any substring of a package title. Multiple values are accepted and each is matched independently.

### Signature verification

`-SkipSignatureCheck` should only be used when package descriptor XML has been modified locally. Not recommended for production deployments.

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Install-LnvUpdate](install-lnvupdate.md)
- [Get-LnvUpdateHist](get-lnvupdatehist.md)
- [Get-LnvUpdateConfiguration](get-lnvupdateconfiguration.md)
