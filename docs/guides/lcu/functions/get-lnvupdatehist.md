# Get-LnvUpdateHist

View the history of updates installed by the Install-LnvUpdate cmdlet.

## Synopsis

Retrieves the update history for Lenovo packages installed on the system. This information is stored in a .json file found in C:\ProgramData\Lenovo\Lenovo.Client.Update\History folder. A new file is created for each session with a timestamp in the filename.

## Description

Displays a history of Lenovo updates that have been installed, including installation dates and results.

## Examples

```powershell
# View all update history
Get-LnvUpdateHist | Format-Table -Property InstallDate, Title, Result

# View recent updates
Get-LnvUpdateHist | Where-Object { $_.InstallDate -gt (Get-Date).AddDays(-30) }
```
## Output

Returns an array of installation history objects with the following properties:

- `Timestamp` - Installation date and time
- `Status` - Installation result (Success, Failed, Skipped)
- `Title` - Update package title
- `Version` - Package version
- `Category` - Update category
- `Type` - Package type
- `Severity` - Update severity level
- `ExitCode` - Installation exit code
- `RebootRequired` - Whether reboot is required
- `ComputerName` - System where update was installed
- `UserName` - User who performed installation
- `Message` - Additional information or error message
- `UpdateID` - Package identifier

## History Storage

Installation history is stored at:
```
$env:ProgramData\Lenovo\Lenovo.Client.Update\History\InstallHistory-<timestamp>.json
```

This file is created automatically after each update installation session.

## Examples

### Example 1: View failed installations
```powershell
Get-LnvUpdateHist -Status Failed
```

Displays only installations that failed.

### Example 2: View BIOS update history
```powershell
Get-LnvUpdateHist -Category BIOS
```

## See Also

- [Add-LnvUpdateHist](add-lnvupdatehist.md)
- [Get-LnvUpdateSummary](get-lnvupdatesummary.md)
