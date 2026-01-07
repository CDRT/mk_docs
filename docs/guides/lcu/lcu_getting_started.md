# Getting Started with LSUClient

LSUClient has two main cmdlets:

- **Get-LSUpdate**
- **Install-LSUpdate**

They basically do what their name implies! These are some examples to get started with.

To see all available parameters of each cmdlet and guidance on how to use them, either:
- See the online Cmdlet Reference in the navigation bar on the left, or
- Install the module and use `Get-Help -Detailed` or tab-completion to explore the cmdlets.

## Examples

### Get available updates for the system
```powershell
Get-LSUpdate
```

### Get and install available updates
```powershell
$updates = Get-LSUpdate
$updates | Install-LSUpdate -Verbose
```

### Filter updates for unattended installer
```powershell
$updates = Get-LSUpdate | Where-Object { $_.Installer -eq 'Unattended' }
$updates | Save-LSUpdate -Verbose
$updates | Install-LSUpdate -Verbose
```

### Loop through updates and install
```powershell
$i = 1
foreach ($update in $updates) {
    Write-Host "Installing update $i of $($updates.Count): $($update.Title)"
    Install-LSUpdate -Package $update -Verbose
    $i++
}
```

### Get all updates or filter by model
```powershell
Get-LSUpdate -All
Get-LSUpdate -Model '20LS' -All
Save-LSUpdate -Path 'C:\Drivers\20LS' -ShowProgress
```

*This Markdown was generated from the LSUClient Getting Started page.*
