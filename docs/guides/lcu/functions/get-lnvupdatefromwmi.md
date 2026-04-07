# Get-LnvUpdatefromWMI

Queries Lenovo update information from WMI using the root\Lenovo\Lenovo_Updates class.

## Syntax

```powershell
Get-LnvUpdatefromWMI [-ComputerName <string>] [-Status <string>] [-Severity <string>] [-IncludeHistory]
```

## Parameters

| Parameter | Type | Default | Values |
|-----------|------|---------|--------|
| **ComputerName** | string | $env:COMPUTERNAME | Computer name |
| **Status** | string | - | Applicable, Installed, NotApplicable |
| **Severity** | string | - | Critical, Recommended, Optional |
| **IncludeHistory** | switch | - | Last 10 installation records |

## Examples

```powershell
# Query local computer
Get-LnvUpdatefromWMI

# Filter by status
Get-LnvUpdatefromWMI -Status Applicable

# Remote with severity filter
Get-LnvUpdatefromWMI -ComputerName COMPUTER01 -Severity Critical

# Include history
Get-LnvUpdatefromWMI -IncludeHistory
```

## Output

- Returns WMI objects with properties: Title, Version, Status, Size
- Get-LnvUpdatefromWMI gathers information from the className `Lenovo_Updates`
- Console output is color-coded (Cyan: queries, Green: success, Yellow: headers, Gray: details)

## Key Features

- Queries `ROOT\Lenovo` namespace
- className = `Lenovo_Updates`
- Dynamically constructs WMI queries with filters
- Non-blocking error handling
- History limited to 10 most recent entries
