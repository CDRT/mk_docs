# Test-LnvSignature

Verify digital signatures of Lenovo packages and files.

## Synopsis

Verifies whether a file or set of files is digitally signed by Lenovo.

## Description

`Test-LnvSignature` validates the digital signature of files or folders to ensure they originate from Lenovo and have not been tampered with.

The cmdlet supports multiple signature validation mechanisms:

- **Authenticode signatures** (EXE, DLL, SYS, MSI, CAB, CAT, INF)
- **XML Digital Signatures (XML-DSig)** for Lenovo XML payloads
- **Catalog (.cat) signatures** for driver-related files
- Optional use of Lenovo’s internal certificate validation APIs when available, with automatic fallback to Windows-native validation

When a folder path is provided, all supported signable files are discovered and evaluated. Results can be returned as a simple Boolean value or as detailed signature metadata.

This cmdlet is intended for **integrity verification of Lenovo update content** prior to installation or execution.

## Supported File Types

The following file extensions are evaluated:

- Executables and binaries: `.exe`, `.dll`, `.sys`, 
- Driver metadata: `.inf`, `.cat`
- XML payloads: `.xml`

Non-supported file types return `False` (or a detailed result indicating `Unsupported`).

## Parameters

### `-Path`
**(Required)**  
Path to a file or folder to validate.

- Accepts files or directories
- Accepts pipeline input
- If a folder is provided, all signable files within it are tested

```powershell
-Path "C:\Temp\update.exe"
-Path "C:\Drivers"
```

### `-IncludeCatalog`
When specified, checks for **catalog-based signatures** if a file does not contain a direct signature.

Useful for driver-related files such as `.sys` and `.inf`.

```powershell
-IncludeCatalog
```

### `-Detailed`
Returns detailed signature metadata instead of a simple Boolean result.

```powershell
-Detailed
```

### `-Recurse`
When `-Path` is a folder, searches all subdirectories for signable files.

```powershell
-Recurse
```

## Outputs

### Default Output

`System.Boolean`

- `True` – File is signed by Lenovo
- `False` – File is not Lenovo-signed or validation failed

### Detailed Output (`-Detailed`)

Returns a `PSCustomObject` with the following properties:

| Property | Description |
|--------|------------|
| `FileName` | Name of the file |
| `FilePath` | Full file path |
| `IsLnvSigned` | Indicates Lenovo signature trust |
| `SignatureType` | Validation method used |
| `TrustStatus` | Trust result from validator |
| `Publisher` | Certificate subject |
| `Thumbprint` | Certificate thumbprint |
| `ValidFrom` | Certificate validity start |
| `ValidUntil` | Certificate validity end |
| `IsOldCertificate` | Indicates legacy Lenovo certificate |
| `WinVerifyTrustStatus` | Raw WinVerifyTrust result |
| `CatalogFiles` | Associated catalog files |
| `CatalogCount` | Number of catalogs evaluated |
| `FileSize` | File size in bytes |
| `TestDuration` | Validation time (ms) |
| `TestTime` | Timestamp of validation |
| `Success` | Indicates execution success |
| `ErrorMessage` | Error details (if any) |

## Examples

### Verify a single file

```powershell
Test-LnvSignature -Path "C:\Temp\update.exe"
```

Returns `True` if the file is signed by Lenovo.

### Verify a file with detailed output

```powershell
Test-LnvSignature -Path "C:\Temp\update.exe" -Detailed
```

### Verify all signable files in a folder

```powershell
Test-LnvSignature -Path "C:\Updates"
```

### Recursively verify a driver folder including catalog signatures

```powershell
Test-LnvSignature -Path "C:\Drivers" -Recurse -IncludeCatalog -Detailed
```

### Pipeline usage

```powershell
Get-ChildItem "C:\Updates" -File | Test-LnvSignature -Detailed
```






