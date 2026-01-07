# Versioning

**LSUClient** uses a three-part version number:  
`MAJOR.MINOR.PATCH` and follows **SemVer 2.0.0**.

This means you can generally expect all your scripts and integrations to keep working with any one major version (such as `1.x.x`).  
There is only ever **one current release** of LSUClient; there is no parallel maintenance of older releases or prior versions.  
As soon as a new release is out, the prior one is **obsoleted**.

---

## What is and isn’t covered by the semantic versioning promise

Semantic versioning communicates changes in a software’s **public API**.  
For the purpose of a PowerShell Module, the public API is:

- Exported functions (cmdlets)
- Classes
- Returned objects

---

### Example Scripts

#### Pretend-script written for LSUClient 1.2.5:

```powershell
$OneUpdate = Get-LSUpdate -All | Select-Object -First 1
if ($OneUpdate.URL.Host -like "*.com") {
    Write-Output "Hey! This update was sourced from a .com domain!"
} else {
    Write-Output "Some other domain!"
}
```

#### Pretend-script updated for LSUClient 1.3.0+:

```powershell
$OneUpdate = Get-LSUpdate -All | Select-Object -First 1
if ($OneUpdate.Uri.Host -like "*.com") {
    Write-Output "Hey! This update was sourced from a .com domain!"
} else {
    Write-Output "Some other domain!"
}
```

---

### File Path Formats

Examples:

```
.\file.ext
./file.ext
file.ext
C:file.ext
D:file.ext
\file.ext
/file.ext
```

Reference: [File Path Formats](https://learn.microsoft.com/dotnet/standard/io/file-path-formats)

---

### Example Package Snippet:

```xml
<Package ... >
    ...
    <LocalPath>\r0zav10w\r0zav10w_2_.xml</LocalPath>
</Package>
```
