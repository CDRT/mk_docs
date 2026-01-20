# Get-UpdatefromWMI

Queries Lenovo update information from WMI (local or remote computers).

## Syntax

```powershell
Get-UpdatefromWMI [-ComputerName <string>] [-Status <string>] [-Severity <string>] [-IncludeHistory]
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
Get-UpdatefromWMI

# Filter by status
Get-UpdatefromWMI -Status Applicable

# Remote with severity filter
Get-UpdatefromWMI -ComputerName SERVER01 -Severity Critical

# Include history
Get-UpdatefromWMI -IncludeHistory
```

## Output

Returns WMI objects with properties: Title, Version, Status, Size
Get-UpdatefromWMI gathers information from the className `Lenovo_Updates` different from the class Export-WMI writes to `LenovoUpdate_Updates`


## Key Features

- Queries `ROOT\Lenovo` namespace
- className = `Lenovo_Updates`
- Dynamically constructs WMI queries with filters
- History limited to 10 most recent entries

