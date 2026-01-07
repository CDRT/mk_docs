# Lenovo Client Update Module

## Overview

**This module is based on the LSU Client project on Github which is the work of _Jantari_ and is used under the MIT License (see LICENSE file in code source).** [Github](https://github.com/jantari/LSUClient)

This module has been created to include some additional features beyond LSU Client to add some additonal security to the solution.

- All scripts are digitally signed by Lenovo
- Solution can verify the content packages (exe) and package descriptors (XML) have also been signed by Lenovo

This module also provides the standard features of the LSU Client, such as:

- Install driver, BIOS/UEFI, firmware and utility updates from the Lenovo System Update catalogs
- Can perform fully silent and unattended update sessions depending on the content selected
- Work with updates and even their results as PowerShell objects to build any custom logic imaginable
- Fetch the latest updates directly from Lenovo or use an internal repository of your own for more control
- Full Web-Proxy support including authentication

## Installation

The module can be installed from the Powershell Gallery.

```powershell
Install-Module -Name 'Lenovo.Client.Update'
```

## Examples and tips

**See available updates:**

```powershell
Get-LnvUpdate
```

**Find and install available updates:**

```powershell
$updates = Get-LnvUpdate
$updates | Install-LnvUpdate -Verbose
```

**Install only packages that can be installed silently and non-interactively:**

```powershell
$updates = Get-LnvUpdate | Where-Object { $_.Installer.Unattended }
$updates | Save-LnvUpdate -Verbose
$updates | Install-LnvUpdate -Verbose
```

Filtering out non-unattended packages like this is strongly recommended when using this module in MDT, SCCM, PDQ,
remote execution via PowerShell Remoting, ssh or any other situation in which you run these commands remotely
or as part of an automated process. Packages with installers that are not unattended may force reboots or
attempt to start a GUI setup on the machine and, if successful, halt until someone clicks through the dialogs.

**To get all available packages:**

```powershell
$updates = Get-LnvUpdate -All
```

By default, `Get-LnvUpdate` only returns "needed" updates. Needed updates are those that are applicable to
the system and not yet installed. If you want to retrieve all available packages instead, use `Get-LnvUpdate -All`.
To filter out unneeded packages later, just look at the `IsApplicable` and `IsInstalled` properties.
The default logic is equivalent to:
`Get-LnvUpdate -All | Where-Object { $_.IsApplicable -and -not $_.IsInstalled }`

**Download drivers for another computer:**

```powershell
Get-LnvUpdate -Model 20LS -All | Save-LnvUpdate -Path 'C:\20LS_Drivers' -ShowProgress
```

Using the `-Model` parameter of `Get-LnvUpdate` you can retrieve packages for another computer model.
In this case you almost always want to use `-All` too so that the packages found are not filtered against your computer and all packages are downloaded.

---

For further documentation please run `Get-Help -Detailed` on the functions in this module.

## Miscellaneous

- Only Windows 11 is supported
- This module does not clean up downloaded packages and installers at any point. The default download location is `$env:TEMP\LSUPackages` - you may delete it yourself
- By default this module reaches out to https://download.lenovo.com and must be able to download `.xml`, `.exe` and `.inf` files from that domain for successful operation. Alternatively, a custom package repository can be set up for completely internal or offline operation.
