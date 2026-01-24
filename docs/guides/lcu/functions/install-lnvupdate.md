# Install-LnvUpdate

## Synopsis

Installs a Lenovo update package. Downloads it if not previously downloaded.

## Syntax

```powershell
Install-LnvUpdate [-Package] <PSObject> [-Path <DirectoryInfo>]
                  [-SaveBIOSUpdateInfoToRegistry] [-VerifySignature] [-SkipSignatureCheck]
                  [-Proxy <Uri>] [-ProxyCredential <PSCredential>] [-ProxyUseDefaultCredentials]
```

## Description

Installs Lenovo update packages on the local computer. The function automatically downloads packages that have not been previously downloaded. Supports signature verification for security, and can save BIOS update information to the Windows registry for tracking and compliance.

## Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `-Package` | PSObject | Package(s) from Get-LnvUpdate (pipeline) |
| `-Path` | DirectoryInfo | Directory with cached packages |
| `-SaveBIOSUpdateInfoToRegistry` | switch |  Write BIOS info to registry |
| `-VerifySignature` | switch | **NEW**: Verify digital signatures |
| `-SkipSignatureCheck` | switch | **NEW**: Skip signature check |
| `-Proxy` | Uri | Proxy URL |
| `-ProxyCredential` | PSCredential | Proxy credentials |
| `-ProxyUseDefaultCredentials` | switch | Use current user for proxy |
| `-ExportToWMI` | switch | export the update information to WMI (ROOT\Lenovo\Lenovo_Updates class) |

## Examples

```powershell
# Install updates
$updates = Get-LnvUpdate
$updates | Install-LnvUpdate

# Install with signature verification
$updates | Install-LnvUpdate -VerifySignature

```

## Examples

### Example 1: Install Unattended Updates

```powershell
$updates = Get-LnvUpdate | Where-Object { $_.Installer.Unattended }
$updates | Install-LnvUpdate -Verbose
```

Finds and installs only packages that support silent/unattended installation.

### Example 2: Install with BIOS Registry Tracking

```powershell
$updates = Get-LnvUpdate
$updates | Install-LnvUpdate -SaveBIOSUpdateInfoToRegistry -Verbose
```

Installs updates and saves BIOS information to registry for tracking.



Verifies installer signatures before installation.

### Example 4: Complete Installation Pipeline

```powershell
# Get updates, download, and install in one pipeline
Get-LnvUpdate | `
  Where-Object { $_.Installer.Unattended } | `
  Save-LnvUpdate -Path "C:\Updates" | `
  Install-LnvUpdate -SaveBIOSUpdateInfoToRegistry -Verbose
```

## Output

Returns a `PackageInstallResult` object with installation outcome details.

## Important Notes

**Administrative Rights**: Installation of drivers and firmware updates requires administrative privileges.

**Unattended Deployment**: When deploying via SCCM, MDT, or remote PowerShell, always filter for unattended packages:

```powershell
$updates = Get-LnvUpdate | Where-Object { $_.Installer.Unattended }
```

Interactive installers may hang the deployment waiting for user input.

**Reboots**: Some packages may require reboots or system restarts. Check the result object for `ActionNeeded` property.

## BIOS Update Registry Keys

When `-SaveBIOSUpdateInfoToRegistry` is used, the following registry location is updated:

```
HKLM\Software\LenovoUpdate\BIOSUpdate
  - Version: BIOS version installed
  - InstallDate: Date/time of installation
  - ActionNeeded: Whether reboot/shutdown is required
```

## See Also

- [Get-LnvUpdate](get-lnvupdate.md)
- [Save-LnvUpdate](save-lnvupdate.md)
- [Test-LnvSignature](test-lnvsignature.md)
