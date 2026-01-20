# Export-WMI

Share Lenovo update information with management tools like SCCM.

## What It Does

Exports available Lenovo updates to WMI (Windows Management Instrumentation) so that:

- SCCM can see what updates are available
- Remote management tools can query update status
- You can check updates on remote computers

!!! note
    Requires Administrator privileges to write to WMI.

## Quick Start
```powershell
# Export current updates to WMI
Get-LnvUpdate | Export-WMI
```

That's it! Now SCCM or other tools can see the updates.

## Common Examples

### Export updates for SCCM
```powershell
# Get updates and export to WMI
Get-LnvUpdate | Export-WMI
```

### Refresh WMI data
```powershell
# Clear old data and export fresh data
Export-WMI -Clear
Get-LnvUpdate | Export-WMI
```

### Export with history
```powershell
# Include installation history
Get-LnvUpdate | Export-WMI -IncludeHistory
```

## Checking the Exported Data

After exporting, view the data:
```powershell
# View all exported updates
Get-WmiObject -Namespace ROOT\Lenovo -Class LenovoUpdate_Updates
```
```powershell
# View as a table
Get-WmiObject -Namespace ROOT\Lenovo -Class LenovoUpdate_Updates | 
    Format-Table Title, UpdateType, Status, Severity
```
```powershell
# Show only BIOS updates
Get-WmiObject -Namespace ROOT\Lenovo -Class LenovoUpdate_Updates | 
    Where-Object { $_.UpdateType -eq 'BIOS' }
```

## Remote Queries

Check updates on another computer:
```powershell
# Query remote computer
Get-WmiObject -ComputerName PC-NAME -Namespace ROOT\Lenovo -Class LenovoUpdate_Updates
```

## Parameters

| Parameter | What It Does |
|-----------|--------------|
| `-Updates` | Update objects to export (usually from `Get-LnvUpdate`) |
| `-Clear` | Remove old WMI data before exporting new data |
| `-IncludeHistory` | Also export installation history |

## What Information Gets Exported

Each update in WMI includes:

- **PackageID** - Update identifier
- **Title** - Update name
- **Version** - Version number
- **UpdateType** - Type (BIOS, Driver, Firmware, Application)
- **Status** - Installed, Applicable, or NotApplicable
- **Severity** - Critical, Recommended, or Optional
- **Category** - Update category
- **Size** - Download size
- **RebootType** - Reboot requirement
- **ReleaseDate** - When Lenovo released it
- **LastUpdated** - When WMI data was refreshed

## SCCM Integration

### Step 1: Export updates to WMI
```powershell
Get-LnvUpdate | Export-WMI
```

### Step 2: Configure SCCM Hardware Inventory

Add the WMI class to SCCM hardware inventory:

- Namespace: `ROOT\Lenovo`
- Class: `LenovoUpdate_Updates`

### Step 3: View in SCCM

SCCM will now collect this data during hardware inventory cycles.

## Typical Workflow
```powershell
# 1. Check for updates
$updates = Get-LnvUpdate

# 2. Export to WMI for SCCM
$updates | Export-WMI

# 3. Verify export worked
Get-WmiObject -Namespace ROOT\Lenovo -Class LenovoUpdate_Updates | 
    Format-Table Title, Status
```

## Troubleshooting

### "Access Denied"

Run PowerShell as Administrator.

### "Namespace not found"

The command creates the namespace automatically. If you see this error, check that you're running as Administrator.

### Refreshing Data

To update WMI with new information:
```powershell
# Clear and re-export
Export-WMI -Clear
Get-LnvUpdate | Export-WMI
```

## Notes

- WMI data persists until cleared or refreshed
- Exported data does not auto-update - run Export-WMI again to refresh
- Safe to run multiple times - newer data overwrites older data

## Related Commands

- `Get-LnvUpdate` - Get updates to export
- `Get-UpdatefromWMI` - Query updates from WMI
- `Get-LnvUpdateHist` - View installation history

## Where Data Is Stored

WMI Location: `ROOT\Lenovo\LenovoUpdate_Updates`


