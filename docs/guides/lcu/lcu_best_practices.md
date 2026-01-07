# Best Practices for LSUClient

## 1. Search for and install updates a few times in a loop
Some packages and updates depend on others already being installed, so they might not show up during the first search for updates. If you want to make sure **everything** has been installed and/or updated, it is best to re-run `Get-LSUpdate` and `Install-LSUpdate` a few times or until no more updates are found.

### Example
```powershell
# Repeat update search and installation until no updates remain
for ($i = 0; $i -lt 3; $i++) {
    $updates = Get-LSUpdate
    if ($updates.Count -eq 0) { break }
    $updates | Install-LSUpdate -Verbose
}
```

## 2. Download all packages before starting to install any
This ensures that all required files are available locally before installation begins, reducing dependency issues.

### Related Issue
GitHub issue #41: `Start-Transcript` in use by another process — just missing from Lenovo's servers.

*This Markdown was generated from the LSUClient Best Practices page.*
